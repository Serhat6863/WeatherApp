# WeatherApp – Une application météo simple

**WeatherApp** est une application mobile développée avec **Flutter** qui permet de consulter en temps réel la météo d’une ville choisie.  

Au-delà d’un simple projet météo, cette application m’a permis de mettre en pratique plusieurs concepts clés avec Flutter :  

-  **Intégration d’API externes** avec **Retrofit**  
-  **Gestion d’état** avec **BLoC**  
-  **Clean Architecture** et structuration du code avec **build_runner** & **json_serializable**  

---

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
Cette section vous guide à travers les fonctionnalités principales de WeatherApp

**Premier lancement**
Après l'installation de l'application, vous verrez un écran principale avec une barre de recherche pour trouver la méteo de n'importe qu'elle ville
1. Tapez sur la barre de recherche
2. Tapez le nom de la ville
3. Selectionnez dans la liste d'autocomplétion
4. la météo s'affiche

## Captures d'écran et démonstration

### Écran principal*
![Écran principal](<img width="585" height="1267" alt="home_screen" src="https://github.com/user-attachments/assets/1cee6482-077f-421c-b45f-0ca85a54cc0b" />)

### Recherche d"une ville
![Recherche d'une ville](<img width="590" height="1262" alt="home_screen_sugest" src="https://github.com/user-attachments/assets/d0be5396-ea76-49b2-9a2b-76ef1ce5288e" />)

### Prévisions météo
![Prévision météo](<img width="596" height="1265" alt="home_screen_result" src="https://github.com/user-attachments/assets/77058d68-513e-4337-a7b1-f758dbae0ea5" />)

### Démonstration Video
![Démo WeatherApp](https://github.com/user-attachments/assets/09263c58-6352-44c7-b5c0-2f860161bc09)








