cask 'unity-download-assistant@2017.3.0b3' do
  version '2017.3.0b3,28dc7ce05bb9'
  sha256 '136fdfbab4951b2683d14fb6264991d806ab284144ec0493b8258ba6ed0da223'

  url "http://beta.unity3d.com/download/#{version.after_comma}/UnityDownloadAssistant-#{version.before_comma}.dmg"
  name 'Unity'
  homepage 'https://unity3d.com/unity/'

  installer manual: 'Unity Download Assistant.app'

  uninstall pkgutil: 'com.unity3d.*'
end
