cask 'unity-ios-support-for-editor@2020.2.0a21' do
  version '2020.2.0a21,3e0d5f775006'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/3e0d5f775006/MacEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-2020.2.0a21.pkg"
  name 'iOS Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-iOS-Support-for-Editor-2020.2.0a21.pkg'

  depends_on cask: 'unity@2020.2.0a21'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2020.2.0a21"
      FileUtils.move "/Applications/Unity-2020.2.0a21", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2020.2.0a21"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2020.2.0a21/PlaybackEngines/iOSSupport'
end
