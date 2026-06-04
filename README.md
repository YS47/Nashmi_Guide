# Explore Jordan — Nashmi Guide 🇯🇴

A Flutter mobile application built as a final university project. The app helps users explore famous tourist destinations in Jordan, with rich historical descriptions, filtering, search, and navigation between screens.

---

## Features

- Browse 9 real Jordan tourist destinations
- View featured destinations on the home screen
- Search destinations by name, city, or category
- Filter destinations by category (Historical, Nature, Desert, Religious)
- Full details page for each destination with description, activities, tips, and ticket price
- Save destinations to favourites
- About screen explaining the app
- Real photos of Jordan's famous sites (from Wikimedia Commons)
- Google Fonts typography (Playfair Display + Inter)

---

## Screenshots

<img width="427" height="886" alt="image" src="https://github.com/user-attachments/assets/5c262ea9-a216-4b5b-9979-2dc7f3cad9e1" />

<img width="416" height="883" alt="image" src="https://github.com/user-attachments/assets/ef3d6ab2-468f-4d82-8a47-c2b2278bc9d3" />

---

## Technologies Used

- **Flutter 3.x** — cross-platform mobile framework
- **Dart** — programming language
- **Material Design 3** — UI component system
- **MVC Architecture** — Models / Controllers / Views folder structure
- **OOP Concepts** — Inheritance, Encapsulation, Polymorphism, Abstraction

---

## Packages Used

| Package | Version | Purpose |
|---|---|---|
| `google_fonts` | ^6.2.1 | Custom typography |
| `url_launcher` | ^6.3.1 | Open Google Maps links |
| `cupertino_icons` | ^1.0.8 | iOS icon set |

---

## Folder Structure

```
lib/
├── models/
│   ├── place_model.dart          ← Abstract base class (Abstraction)
│   ├── destination_model.dart    ← Extends PlaceModel (Inheritance)
│   └── category_model.dart       ← Category data model
├── controllers/
│   ├── destination_controller.dart  ← All destination data + filtering
│   └── favorite_controller.dart     ← Add/remove/check favourites
├── views/
│   ├── home_screen.dart              ← Home with featured places
│   ├── destinations_screen.dart      ← Full list with search + filter
│   ├── destination_details_screen.dart ← Full info for a destination
│   ├── categories_screen.dart        ← Browse by category grid
│   └── profile_screen.dart           ← About / developer info
├── widgets/
│   ├── destination_card.dart     ← Reusable destination card
│   ├── category_chip.dart        ← Animated filter chip
│   └── section_title.dart        ← Reusable section heading
└── main.dart                     ← App entry, navigation setup
```

---

## How to Run

```bash
# Clone the repo
git clone https://github.com/YS47/Nashmi_Guide.git
cd Nashmi_Guide

# Install dependencies
flutter pub get

# Run the app
flutter run
```

---

## Models Explanation

### `PlaceModel` (abstract)
The base class for any place in the app. Defines shared fields: `id`, `name`, `city`, `imageUrl`, `assetImage`. Declares the abstract method `getDisplayInfo()` which subclasses must implement.

### `DestinationModel` (extends PlaceModel)
The main model. Adds `category`, `shortDescription`, `fullDescription`, `ticketPrice`, `bestTimeToVisit`, `activities` (List), `tips` (List), `mapsUrl`, and `isFeatured`. Overrides `getDisplayInfo()` to return a formatted summary string.

### `CategoryModel`
Stores category data: `id`, `name`, `icon` (IconData), `description`, and `color`.

---

## Controller / Helper Classes

### `DestinationController`
The main data layer. Stores a private list of all 9 Jordan destinations. Provides:
- `getAllDestinations()` — returns all destinations
- `getFeaturedDestinations()` — returns only featured ones (shown on home)
- `getDestinationsByCategory(String category)` — filters by category
- `searchDestinations(String query)` — searches by name, city, or category
- `getAllCategories()` — returns all category objects

### `FavoriteController`
Manages the favourites list:
- `addFavorite(destination)` — adds if not already saved
- `removeFavorite(id)` — removes by ID
- `isFavorite(id)` — returns true/false
- `getFavorites()` — returns the full favourites list
- `toggleFavorite(destination)` — convenience method

---

## ListView.builder Usage

`ListView.builder` is used in **DestinationsScreen** to display the filtered list of destinations. It only builds widgets that are visible on screen, making it memory-efficient for large lists.

```dart
ListView.builder(
  itemCount: destinations.length,
  itemBuilder: (context, index) {
    return DestinationCard(
      destination: destinations[index],
      onTap: () => Navigator.push(...),
    );
  },
)
```

---

## Navigation and Data Passing

The app uses `Navigator.push` with `MaterialPageRoute` to navigate from the list screen to the details screen. The selected `DestinationModel` object is passed directly as a constructor parameter:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => DestinationDetailsScreen(
      destination: destinations[index],   // object passed here
      favoriteController: favoriteController,
    ),
  ),
);
```

The details screen receives the full object and displays all its fields without any additional data fetching.

---

## Search and Filter

**Search** is implemented using a `TextField` in `DestinationsScreen`. As the user types, `setState` is called with the updated query. The controller's `searchDestinations()` method checks if the name, city, category, or short description contains the query string (case-insensitive).

**Category filter** uses horizontal `ListView.builder` with custom `CategoryChip` widgets. Selecting a chip calls `getDestinationsByCategory()` on the controller. Searching clears the active category filter and vice versa.

---

## OOP Concepts

### Abstraction
`PlaceModel` is an abstract class — it defines the structure for all place types but cannot be instantiated directly. It forces subclasses to implement `getDisplayInfo()`.

### Inheritance
`DestinationModel extends PlaceModel` — it inherits the base fields and adds destination-specific ones like `category`, `ticketPrice`, `activities`, etc.

### Encapsulation
Destination data is stored in private (`_destinations`) lists inside the controller. External code accesses data only through public methods (`getAllDestinations()`, `searchDestinations()`, etc.), never directly.

### Polymorphism
The `getDisplayInfo()` method is declared abstract in `PlaceModel` and overridden in `DestinationModel` to return `'$name | $city | $category | $ticketPrice'`. Different subclasses could return different formats.

---

## Destinations Included

| # | Name | Category | City |
|---|---|---|---|
| 1 | Petra | Historical | Ma'an Governorate |
| 2 | Jerash | Historical | Jerash Governorate |
| 3 | Amman Citadel | Historical | Amman |
| 4 | As-Salt | Historical | Balqa Governorate |
| 5 | Wadi Rum | Desert | Aqaba Governorate |
| 6 | Dead Sea | Nature | Balqa / Madaba Governorate |
| 7 | Hammam Al-Ma'een | Nature | Madaba Governorate |
| 8 | Mount Nebo | Religious | Madaba Governorate |
| 9 | King Abdullah I Mosque | Religious | Amman |

---

## Member

- Name: Yousef Sami Safori 
- University: Middle East University (MEU)
- Major : Intelligent Systems Engineering (ISE)
- Course : Mobile Software development (FLutter Programing)
