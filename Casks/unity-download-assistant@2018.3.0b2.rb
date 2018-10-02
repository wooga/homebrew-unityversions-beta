cask 'unity-download-assistant@2018.3.0b2' do
  version '2018.3.0b2,cc0086a8e10c'
  sha256 'f6ea52d37521d11963874d1de698717b293d8628a4034bfe5363367ae49e8f2d'

  url "http://beta.unity3d.com/download/#{version.after_comma}/UnityDownloadAssistant-#{version.before_comma}.dmg"
  name 'Unity'
  homepage 'https://unity3d.com/unity/'

  installer manual: 'Unity Download Assistant.app'

  uninstall pkgutil: 'com.unity3d.*'
end
