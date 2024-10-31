
import SwiftUI

struct CharacterListView: View {
    @ObservedObject var viewModel = CharacterViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.characters) { character in
                    NavigationLink(destination: CharacterDetailView(character: character)) {
                        CharacterRow(character: character)
                    }
                }
                if viewModel.canLoadMore {
                    loadMoreButton
                }
            }
            .navigationTitle("Rick and Morty Characters")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle()) // This forces the navigation view to always stack, preventing the split view on iPad
        .onAppear {
            if viewModel.characters.isEmpty {
                viewModel.fetchCharacters()
            }
        }
    }

    var loadMoreButton: some View {
        Button("Cargar más...") {
            viewModel.fetchCharacters()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blue)
        .foregroundColor(Color.white)
        .clipShape(Capsule())
        .padding(.vertical, 10)
    }
}

struct CharacterRow: View {
    var character: Character

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: character.image)) { image in
                image.resizable()
            } placeholder: {
                Color.gray.opacity(0.4)
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 1))

            VStack(alignment: .leading) {
                Text(character.name).bold()
                Text("\(character.status) - \(character.species)")
            }
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView(viewModel: CharacterViewModel())
    }
}
