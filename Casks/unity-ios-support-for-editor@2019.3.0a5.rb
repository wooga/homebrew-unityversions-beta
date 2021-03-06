cask 'unity-ios-support-for-editor@2019.3.0a5' do
  version '2019.3.0a5,9aff892fb75b'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/9aff892fb75b/MacEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-2019.3.0a5.pkg"
  name 'iOS Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-iOS-Support-for-Editor-2019.3.0a5.pkg'

  depends_on cask: 'unity@2019.3.0a5'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2019.3.0a5"
      FileUtils.move "/Applications/Unity-2019.3.0a5", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2019.3.0a5"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2019.3.0a5/PlaybackEngines/iOSSupport'
end
