# A dog's app

With this app, you will be able to browse dogs' breeds. For each breed, you will see their sub breeds and a random image!

## Table of Contents

- [A dog's app](#a-dogs-app)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Technologies Used](#technologies-used)
  - [Architecture](#architecture)
    - [Folder structure](#folder-structure)
    - [Tests folder structure](#tests-folder-structure)
  - [Testing](#testing)
    - [All tests:](#all-tests)
    - [Integration tests:](#integration-tests)
    - [Unit tests:](#unit-tests)

## Overview

This project is a mobile app application challenge, related to a Full-Stack Engineer job offer from Barkibu. It can be run in a phone device or in a web browser.

The details of the challenge are [here](https://public.3.basecamp.com/p/TJZ2w99rpzoxyxhwHWLfmFkD).

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
