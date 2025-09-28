# 🌤 WeatherApp – Une application météo moderne

![Flutter](https://img.shields.io/badge/Flutter-3.7.2+-blue)
![Dart](https://img.shields.io/badge/Dart-2.19+-blue)
![BLoC](https://img.shields.io/badge/State%20Management-BLoC-purple)
![License](https://img.shields.io/badge/License-MIT-green)

**WeatherApp** est une application mobile élégante développée avec **Flutter** qui permet de consulter en temps réel la météo de n'importe quelle ville dans le monde.

Au-delà d'un simple projet météo, cette application démontre une maîtrise des concepts avancés de développement Flutter avec une architecture solide et scalable.

---

##  Fonctionnalités

-  **Recherche intelligente** - Suggestions de villes en temps réel
-  **Météo détaillée** - Température, humidité, vitesse du vent, pression
-  **UI/UX moderne** - Interface Material Design responsive
-  **Performances optimisées** - Chargement rapide, states bien gérés
-  **Architecture clean** - Code maintenable et testable

## Plateformes supportées

- Android  
- iOS  

---

## Installation

1. Installer le **Flutter SDK** : [Guide officiel](https://flutter.dev/docs/get-started/install)  
2. Cloner le dépôt :  
```bash
git clone https://github.com/Serhat6863/WeatherApp.git
```
3. Accéder au dossier du projet et installer les dépendances :
```bash
cd myapp
flutter pub get
```
4. Générer le code nécessaire (Retrofit, JSON, etc.)
```bash
 flutter pub run build_runner build --delete-conflicting-outputs
```
6. Run the app on your desired platform:
```bash
flutter run
```


## Prérquis 
- Flutter SDK version 3.7.2 ou supérieure
- Android Studio / Xcode pour émulateurs ou appareils réels

## Exécuter un test
-Pour executer un test 
```bash
flutter test
```


## Usage

Cette section vous guide à travers les fonctionnalités principales de WeatherApp.

### Premier lancement
Après l'installation de l'application, vous verrez un écran principal avec une barre de recherche pour trouver la météo de n'importe quelle ville.  

1. Tapez sur la barre de recherche.

### Écran principal
<img src="screenshots/home_screen.png" width="400" />

2. Tapez le nom de la ville.

### Recherche d'une ville
<img src="screenshots/home_screen_sugest.png" width="400" />

3. La météo s'affiche.

### Prévisions météo
<img src="screenshots/home_screen_result.png" width="400" />

### Démonstration vidéo
<img src="screenshots/home_screen_video_gif.gif" width="400" />









