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
brew cask install unity@2017.3.0b6
```

-or-

```bash
brew cask install unity-android-support-for-editor@2017.3.0b6
```

Unity will be install under `/Applications/Unity-$VERSION`. You can install multiple versions at the same time. All support packages will be installed in the parent Unity directory. Means:

`unity-android-support-for-editor@2017.3.0b6` --> `/Applications/Unity-2017.3.0b6/PlaybackEngines/`

If you have a unity version installed under `/Applications/Unity/` it will be moved to
`/Applications/Unity.temp` for the time of the installation.

Unity Versions available
------------------------

| Version    |
| ---------: |
| 2017.1.0b7 |
| 2017.3.0b1 |
| 2017.3.0b2 |
| 2017.3.0b3 |
| 2017.3.0b4 |
| 2017.3.0b5 |
| 2017.3.0b6 |


Adding a new Version
--------------------


License
-------
[MIT License](LICENSE) Copyright (C) 2017 Wooga