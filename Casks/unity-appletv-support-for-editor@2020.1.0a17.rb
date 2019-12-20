cask 'unity-appletv-support-for-editor@2020.1.0a17' do
  version '2020.1.0a17,ccc6f9131a63'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/ccc6f9131a63/MacEditorTargetInstaller/UnitySetup-AppleTV-Support-for-Editor-2020.1.0a17.pkg"
  name 'tvOS Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-AppleTV-Support-for-Editor-2020.1.0a17.pkg'

  depends_on cask: 'unity@2020.1.0a17'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2020.1.0a17"
      FileUtils.move "/Applications/Unity-2020.1.0a17", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2020.1.0a17"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2020.1.0a17/PlaybackEngines/AppleTVSupport'
end
