cask 'unity-download-assistant@2017.3.0b2' do
  version '2017.3.0b2,ec6e8c8c3015'
  sha256 '247152b8656c29847a1d50fe67f75c693ea86ff55ed2236d973adec839e7dc51'

  url "http://beta.unity3d.com/download/#{version.after_comma}/UnityDownloadAssistant-#{version.before_comma}.dmg"
  name 'Unity'
  homepage 'https://unity3d.com/unity/'

  installer manual: 'Unity Download Assistant.app'

  uninstall pkgutil: 'com.unity3d.*'
end
