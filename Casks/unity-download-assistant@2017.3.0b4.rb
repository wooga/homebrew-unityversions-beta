cask 'unity-download-assistant@2017.3.0b4' do
  version '2017.3.0b4,4c1b6e48c9c9'
  sha256 '8f0bb73ecbef0a51c75c9723362963a5c21609c902dd2107c6de5a83ef82fd2d'

  url "http://beta.unity3d.com/download/#{version.after_comma}/UnityDownloadAssistant-#{version.before_comma}.dmg"
  name 'Unity'
  homepage 'https://unity3d.com/unity/'

  installer manual: 'Unity Download Assistant.app'

  uninstall pkgutil: 'com.unity3d.*'
end
