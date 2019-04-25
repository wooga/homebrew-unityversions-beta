cask 'unity-appletv-support-for-editor@2019.2.0a13' do
  version '2019.2.0a13,7d71eaf2acca'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/7d71eaf2acca/MacEditorTargetInstaller/UnitySetup-AppleTV-Support-for-Editor-2019.2.0a13.pkg"
  name 'tvOS Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-AppleTV-Support-for-Editor-2019.2.0a13.pkg'

  depends_on cask: 'unity@2019.2.0a13'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2019.2.0a13"
      FileUtils.move "/Applications/Unity-2019.2.0a13", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2019.2.0a13"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2019.2.0a13/PlaybackEngines/AppleTVSupport'
end
