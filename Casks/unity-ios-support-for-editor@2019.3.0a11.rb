cask 'unity-ios-support-for-editor@2019.3.0a11' do
  version '2019.3.0a11,6fa9444d8a5d'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/6fa9444d8a5d/MacEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-2019.3.0a11.pkg"
  name 'iOS Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-iOS-Support-for-Editor-2019.3.0a11.pkg'

  depends_on cask: 'unity@2019.3.0a11'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2019.3.0a11"
      FileUtils.move "/Applications/Unity-2019.3.0a11", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2019.3.0a11"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2019.3.0a11/PlaybackEngines/iOSSupport'
end
