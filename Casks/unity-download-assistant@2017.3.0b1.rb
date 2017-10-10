cask 'unity-download-assistant@2017.3.0b1' do
  version '2017.3.0b1,bc2668834c45'
  sha256 'a44b9966731a60b9288116b21d9ba85035a2192c7fdbd7bfb0eb73b88bc2eaad'

  url "http://beta.unity3d.com/download/#{version.after_comma}/UnityDownloadAssistant-#{version.before_comma}.dmg"
  name 'Unity'
  homepage 'https://unity3d.com/unity/'

  installer manual: 'Unity Download Assistant.app'

  uninstall pkgutil: 'com.unity3d.*'
end
