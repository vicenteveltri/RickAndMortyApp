
import SwiftUI

struct CharacterDetailView: View {
    var character: Character

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: character.image)) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray.opacity(0.4)
                }
                .frame(maxWidth: 400)
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 5)
                .padding()

                VStack(alignment: .leading, spacing: 10) {
                    Text(character.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.vertical)

                    DetailRow(label: "Status:", value: character.status)
                    DetailRow(label: "Species:", value: character.species)
                    DetailRow(label: "Gender:", value: character.gender)
                    DetailRow(label: "Current Location:", value: character.location.name)
                    DetailRow(label: "Origin:", value: character.origin.name)
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
        }
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailRow: View {
    var label: String
    var value: String

    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
            Text(value)
                .foregroundColor(.primary)
        }
        .font(.body)
    }
}
