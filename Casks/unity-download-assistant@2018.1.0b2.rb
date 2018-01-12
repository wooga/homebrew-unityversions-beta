cask 'unity-download-assistant@2018.1.0b2' do
  version '2018.1.0b2,79c3bdce0980'
  sha256 '301b9d55dd4c371811710fd24cf04521b23d566a09466b5524d1d5c1fe62b3c7'

  url "http://beta.unity3d.com/download/#{version.after_comma}/UnityDownloadAssistant-#{version.before_comma}.dmg"
  name 'Unity'
  homepage 'https://unity3d.com/unity/'

  installer manual: 'Unity Download Assistant.app'

  uninstall pkgutil: 'com.unity3d.*'
end
