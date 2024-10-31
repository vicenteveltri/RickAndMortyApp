# Rick and Morty Character App

This iOS application showcases a list of characters from the popular TV show "Rick and Morty," utilizing the public Rick and Morty API. The app is built using SwiftUI and follows modern iOS app development practices, with an emphasis on clean architecture and responsive design. 

## Features

- **Character Listing**: Displays a list of characters, each entry showing the character's name, image, and status.
- **Load More**: Users can load additional characters in increments of 10 through a "Load More" button at the bottom of the list.
- **Detail View**: Tapping on a character reveals a detailed view showing more extensive information, including species, gender, and locations.
- **Adaptive Layout**: The layout adapts to various iOS devices, including both iPhone and iPad, ensuring usability across device types.
- **Search Functionality**: Includes a search function to filter characters by name. (Not implemented, just for testing purposes)

## Technical Decisions

- **SwiftUI**: Chosen for its modern declarative syntax and integration with the latest iOS features.
- **MVVM Architecture**: Helps separate the UI from the logic, making the codebase more maintainable and testable.
- **Pagination**: Implemented to enhance performance and user experience by loading data in manageable chunks.
- **Adaptive UI**: Ensures that the app looks good on both iPhones and iPads, using `StackNavigationViewStyle()` on iPads to maintain list visibility in portrait mode.

## Requirements

- **iOS 14.0+**
- **Xcode 12.0+**
- **Swift 5.3+**

## Setup

To run this project, clone the repo, and open the `.xcodeproj` file in Xcode:

```bash
git clone https://github.com/vicenteveltri/RickAndMortyApp.git
cd RickAndMortyApp
open RickAndMortyApp.xcodeproj
```

## Screenshots

Home | Detail
-|-
![Home](https://github.com/user-attachments/assets/11d0b5ec-1107-4da4-a645-1bc732b22466)|![Detail](https://github.com/user-attachments/assets/034485b7-889a-4ead-99c6-45bc87ab9df5)
