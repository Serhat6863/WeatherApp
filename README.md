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

## ⚙️ Installation

1. Installer le **Flutter SDK** : [Guide officiel](https://flutter.dev/docs/get-started/install)  
2. Cloner le dépôt :  
&nbsp;&nbsp;```bash
&nbsp;&nbsp;git https://github.com/Serhat6863/WeatherApp.git
&nbsp;&nbsp;```
3. Accéder au dossier du projet et installer les dépendances :
&nbsp;&nbsp;```bash
&nbsp;&nbsp;cd myapp
&nbsp;&nbsp;flutter pub get
&nbsp;&nbsp;```
4. Générer le code nécessaire (Retrofit, JSON, etc.)
&nbsp;&nbsp;```bash
&nbsp;&nbsp; flutter pub run build_runner build --delete-conflicting-outputs
&nbsp;&nbsp;```
6. Run the app on your desired platform:
&nbsp;&nbsp;```bash
&nbsp;&nbsp;flutter run
&nbsp;&nbsp;```
