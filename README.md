<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <h3 align="center">Lesson Manangement Dashboard</h3>

  <p align="center">
    An Android application used to retrieve chapters and lessons from a Parse server whose database can be managed by the <a href="https://github.com/cosmin-bianu/lmdashboard"> Lesson Management Dashboard </a>. This allows for lessons to be displayed in byte-sized chunks in the form of cards. This project has been developed to aid schools in delivering lessons during the COVID-19 pandemic.
    <br />
    <br />
    <a href="https://github.com/cosmin-bianu/lmandroid/issues">Report a bug</a>
    .
    <a href="https://github.com/cosmin-bianu/lmandroid/issues">Request Feature</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

### Built With

* [Flutter](https://flutter.dev/)

<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

* An Android device with [USB debugging](https://developer.android.com/studio/debug/dev-options) enabled
* [Android Studio](https://developer.android.com/studio)
* [Flutter](https://flutter.dev)
* A Parse server with 3rd party hosting using a provider of your choice or on a [self-hosted platform](https://appwrite.io/). You can modify the application to use your own backend [here](https://github.com/cosmin-bianu/lmandroid/blob/68e473d6b024e58a4180242fe9b165f97f36d504/lib/services/app_client.dart#L5) (Lines 5-7)
* (OPTIONAL) [Lesson Management Dashboard](https://github.com/cosmin-bianu/lmdashboard)

### Installation


#### Android
1. Clone the Lesson Management App
   ```sh
   git clone https://github.com/cosmin-bianu/lmandroid.git lmandroid
   ```
2. Open it in Android Studio
3. Configure the project to point to your Parse/backend server
4. Connect your device to your desktop and wait for it to appear in the available devices menu
5. Click "Run" and wait for it to install

#### iOS (soon)

TODO

<!-- USAGE EXAMPLES -->
## Usage

1. Populate the backend with content
2. Open the app and your content should appear.

<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/cosmin-bianu/lmandroid/issues) for a list of proposed features (and known issues).

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the Apache 2.0 License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Cosmin Bianu - kitsune.cosmin@gmail.com

Project Link: [https://github.com/cosmin-bianu/lmandroid](https://github.com/cosmin-bianu/lmandroid)


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/cosmin-bianu/lmandroid.svg?style=for-the-badge
[contributors-url]: https://github.com/cosmin-bianu/lmandroid/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/cosmin-bianu/lmandroid.svg?style=for-the-badge
[forks-url]: https://github.com/cosmin-bianu/lmandroid/network/members
[stars-shield]: https://img.shields.io/github/stars/cosmin-bianu/lmandroid.svg?style=for-the-badge
[stars-url]: https://github.com/cosmin-bianu/lmandroid/stargazers
[issues-shield]: https://img.shields.io/github/issues/cosmin-bianu/lmandroid.svg?style=for-the-badge
[issues-url]: https://github.com/cosmin-bianu/lmandroid/issues
[license-shield]: https://img.shields.io/github/license/cosmin-bianu/lmandroid.svg?style=for-the-badge
[license-url]: https://github.com/cosmin-bianu/lmandroid/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/cosmin-bianu
