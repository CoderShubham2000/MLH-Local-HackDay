# Garbage-Disposal-Locations-App 
## Team Members
- Sagnik Mitra
- Manish Kr Barnwal
- Shubham Tribedi
- Kushal Chowdhury

## Summary of Project
This project aims to help users find all the garbage disposal locations near them. They would open the app on their phones to see on the maps to find the nearest one.
We plan on having every user have an account for this application.

## Functional Goals
- Have every user be able to sign in to an account
  - Each account would have some form of stats of how much they either threw away, or recycled.
- Each user could navigate around the map and see for any garbage disposal locations near them in realtime.

## How to Run Program
1. Install Flutter on Computer or PC by going to this website [Flutter.dev](https://flutter.dev/docs/get-started/install)
2. To run this project, you must be in the flutter channel dev, not in the beta, nor master, nor stable channels.
3. To check your flutter channel, type in your terminal: "flutter channel"
4. To switch over channels, type in your terminal: "flutter channel dev"
  - If your computer fails to switch due to error code 1 or git aborting issues, check out this link: [Fix Flutter Channel Switching Here](https://stackoverflow.com/questions/61659910/flutter-error-unable-to-create-dart-snapshot-for-flutter-tool/62140885#62140885?newreg=deb25020c7d1466b8370c7017491bda3)
5. We used Visual Studio Code to run this. Download VScode here if you don't have it: [Visual Studio Code](https://code.visualstudio.com/download)
  - Open this folder in your VS code editor, and follow the next steps.
6. Open terminal, and cd to the "Garbage-Disposal-Locations-App" folder, then cd to "recycleapp" folder, which is the root folder.
7. Type in cmd, "flutter pub get" to get necessary build and packages.
  - If you have errors here still with the files, chances are you are not in the flutter channel dev.
8. Next, connect your Android phone to your computer and type, "flutter devices" to see if its connected. If not, you have to go to settings to enable that action to have your computer to recognize your phone. If you do not have an android, try using android studio, or an android emulator through VS Code. 
9. Then Start debugging, or if Android phone connected, type, "flutter run". 

# Issues
- Auto Layout could be an issue
- Doesn't have the desktop embedding


# Things to do
- Add sign-in authentication (Next Steps)
- Have it deployed somewhere?
