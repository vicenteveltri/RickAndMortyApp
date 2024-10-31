
import Foundation
import Combine

class CharacterViewModel: ObservableObject {
    @Published var characters = [Character]()
    @Published var allCharacters = [Character]()
    @Published var isLoading = false
    @Published var canLoadMore = true

    private var currentPage = 0
    private var pageSize = 10
    private var cancellables = Set<AnyCancellable>()

    func fetchCharacters() {
        guard canLoadMore, !isLoading else { return }
        isLoading = true
        let pageToLoad = currentPage + 1
        let urlString = "https://rickandmortyapi.com/api/character?page=\(pageToLoad)"
        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Response.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                self.isLoading = false
                if case let .failure(error) = completion {
                    print(error.localizedDescription)
                    self.canLoadMore = false
                }
            }, receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.allCharacters.append(contentsOf: response.results)
                self.updateVisibleCharacters()
            })
            .store(in: &cancellables)
    }

    private func updateVisibleCharacters() {
        let newCount = min(allCharacters.count, (currentPage + 1) * pageSize)
        characters = Array(allCharacters.prefix(newCount))
        currentPage += 1
        canLoadMore = allCharacters.count > newCount
        isLoading = false
    }

    func filterCharacters(by name: String) {
        if name.isEmpty {
            characters = allCharacters
        } else {
            characters = allCharacters.filter { $0.name.lowercased().contains(name.lowercased()) }
        }
    }
}

struct Response: Decodable {
    let results: [Character]
}
