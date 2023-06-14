# Swift Share

Swift Share is a Flutter application that allows users to share any files with ease. This application was created to familiarize myself with Flutter, the Dart programming language, and Firebase.

use the application live here [https://swift-share-app.web.app/](https://swift-share-app.web.app/)

## How to use
> Note: This application is still in development and will have a more user-friendly interface and a tutorial on how to use the application in the future.

### Uploading Files
1. Make sure you are on the upload tab in the bottom left of the screen
2. Click on the upload button in the bottom center of the screen 
3. If using an iPhone, click the upload button again to trigger the file picker
4. Select as many files as you want to upload
5. Give the session name (located at the top of the screen) to the person you want to share the files with
*Note: Files may take time to upload depending on your internet connection and the size of the files so you can monitor their progress using the percentage at the right of each file name.
iPhone requires 2 clicks because Apple requires that file pickers are triggered by user interaction and since the upload button also creates the session iOS doesn't count the first click as a user interaction. I will be looking into a fix for this in the future.

### Downloading Files
1. Make sure you are on the download tab in the bottom right of the screen
2. Press the join session button in the center of the screen
3. Enter the session name given to you by the person who uploaded the files (capitalization matters)
4. wait for list of files to be fetched
5. Click on the download button next to the files you want to download

