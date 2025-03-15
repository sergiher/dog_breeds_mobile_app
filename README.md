# A dog's app

With this app, you will be able to browse dogs' breeds. For each breed, you will see their sub breeds and a random image!

## Table of Contents

- [A dog's app](#a-dogs-app)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Install and running of the app](#install-and-running-of-the-app)
  - [Technologies Used](#technologies-used)
  - [Architecture](#architecture)
    - [Folder structure](#folder-structure)
    - [Tests folder structure](#tests-folder-structure)
  - [Testing](#testing)
    - [All tests:](#all-tests)
    - [Integration tests:](#integration-tests)
    - [Unit tests:](#unit-tests)
  - [Notes](#notes)

## Overview

This project is a mobile app application challenge, related to a Full-Stack Engineer job offer from Barkibu. It can be run in a phone device or in a web browser.

The details of the challenge are [here](https://public.3.basecamp.com/p/TJZ2w99rpzoxyxhwHWLfmFkD).

## Install and running of the app

1. **Clone the repository**:

   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Select a device in your IDE (for instance, in VSC)**:

![choose_device](/docs/choose_device.png)

3. **Run the app**:

   ```
   flutter run
   ```

   If you choose to run it in your computer (for example, in linux), you can choose between these two options:

   - Linux (linux)
   - Chrome (chrome)

If you choose Chrome, the app will be visible in that browser. I've choosed that option to develop the app and, for the final tests, I've run the app in a Medium phone API 36 device simulator.

## Technologies Used

- **Flutter**: It is an open-source UI software development kit created by Google. It can be used to develop cross platform applications from a single codebase.

## Architecture

I'm following an MVVM architectural pattern (Model-View-ViewModel).

![MVVM](/docs/MVVM.png)

### Folder structure

![folder_structure_v2](/docs/folder_structure_v2.png)

### Tests folder structure

![tests_folder_structure_v2](/docs/tests_folder_structure_v2.png)

## Testing

### All tests:

- **Generate the mock file**: This has to be done for any unit test run.

  ```
  flutter pub run build_runner build
  ```

- **Run all the tests**:
  ```
  flutter test
  ```

### Integration tests:

- **Run the integration tests**:
  ```
  flutter test test/integration_test/
  ```

### Unit tests:

- **Run the unit tests**:
  ```
  flutter test test/unit/
  ```
- **Run one unit test**:
  ```
  flutter test test/unit/services/breeds_api_client_test.dart
  ```

## Notes

- **Logging**: I couldn't connect to the dev tools to see the logs that the app writes.
- **ChangeNotifier**: first, I used StatefulWidget in the view model, but then I changed to ChangeNotifier and the use of notifiers to make the code easier and more understandable.

- **Docker**: I wanted to encapsulate a web server with docker, to present my version inside a docker container. But I couldn't do it because of the following error:

  RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback python3

- **Scroll error in the device simulation**: when scrolling in a device simulation (for instance, in a "medium phone Android device", it gives the following error, but I've read that that error won't be present in a real device:

  E/libEGL ( 7932): called unimplemented OpenGL ES API
