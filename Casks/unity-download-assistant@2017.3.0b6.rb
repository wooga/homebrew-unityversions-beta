cask 'unity-download-assistant@2017.3.0b6' do
  version '2017.3.0b6,57ec95547059'
  sha256 '5a716bab3e5808dd9a988de8d6914fa6fe90255925e47c76286b110c9432a4a1'

  url "http://beta.unity3d.com/download/#{version.after_comma}/UnityDownloadAssistant-#{version.before_comma}.dmg"
  name 'Unity'
  homepage 'https://unity3d.com/unity/'

  installer manual: 'Unity Download Assistant.app'

  uninstall pkgutil: 'com.unity3d.*'
end
