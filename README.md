homebrew-unityversions-beta
===========================

[![Build Status](https://travis-ci.org/wooga/homebrew-unityversions-beta.svg?branch=master)](https://travis-ci.org/wooga/homebrew-unityversions-beta)
Unity beta version Brew Cask 

Usage
-----

To install unity versions form this cask simply tap this repository

```bash
brew tap wooga/unityversions-beta
```

Now you can install any version hosted as cask with

```bash
brew cask install unity@2019.1.0b1
```

-or-

```bash
brew cask install unity-android-support-for-editor@2019.1.0b1
```

Unity will be install under `/Applications/Unity-$VERSION`. You can install multiple versions at the same time. All support packages will be installed in the parent Unity directory. Means:

`unity-android-support-for-editor@2019.1.0b1` --> `/Applications/Unity-2019.1.0b1/PlaybackEngines/`

If you have a unity version installed under `/Applications/Unity/` it will be moved to
`/Applications/Unity.temp` for the time of the installation.

Unity Versions available
------------------------

| Version    |
| ---------: |
| 2017.1.0b10 |
| 2017.1.0b1 |
| 2017.1.0b2 |
| 2017.1.0b3 |
| 2017.1.0b4 |
| 2017.1.0b5 |
| 2017.1.0b6 |
| 2017.1.0b7 |
| 2017.1.0b8 |
| 2017.1.0b9 |
| 2017.2.0b10 |
| 2017.2.0b11 |
| 2017.2.0b1 |
| 2017.2.0b2 |
| 2017.2.0b3 |
| 2017.2.0b4 |
| 2017.2.0b5 |
| 2017.2.0b6 |
| 2017.2.0b7 |
| 2017.2.0b8 |
| 2017.2.0b9 |
| 2017.3.0b10 |
| 2017.3.0b11 |
| 2017.3.0b1 |
| 2017.3.0b2 |
| 2017.3.0b3 |
| 2017.3.0b4 |
| 2017.3.0b5 |
| 2017.3.0b6 |
| 2017.3.0b7 |
| 2017.3.0b8 |
| 2017.3.0b9 |
| 2018.1.0b10 |
| 2018.1.0b11 |
| 2018.1.0b12 |
| 2018.1.0b13 |
| 2018.1.0b1 |
| 2018.1.0b2 |
| 2018.1.0b3 |
| 2018.1.0b4 |
| 2018.1.0b5 |
| 2018.1.0b6 |
| 2018.1.0b7 |
| 2018.1.0b8 |
| 2018.1.0b9 |
| 2018.2.0b10 |
| 2018.2.0b11 |
| 2018.2.0b2 |
| 2018.2.0b3 |
| 2018.2.0b4 |
| 2018.2.0b5 |
| 2018.2.0b6 |
| 2018.2.0b7 |
| 2018.2.0b8 |
| 2018.2.0b9 |
| 2018.3.0b1 |
| 2018.3.0b2 |
| 2018.3.0b3 |
| 2018.3.0b4 |
| 2018.3.0b5 |
| 2018.3.0b6 |
| 2018.3.0b7 |
| 2018.3.0b8 |
| 2019.1.0a7 |
| 2018.3.0b9 |
| 2019.1.0a8 |
| 2019.1.0a9 |
| 2018.3.0b10 |
| 2018.3.0b11 |
| 2019.1.0a10 |
| 2018.3.0b12 |
| 2019.1.0a11 |
| 2018.3.0f1 |
| 2019.1.0a12 |
| 2019.1.0a13 |
| 2019.1.0a14 |
| 2019.1.0b1 |


Adding a new Version
--------------------


License
-------
[MIT License](LICENSE) Copyright (C) 2017 Wooga