cask 'unity-ios-support-for-editor@2020.1.0b16' do
  version '2020.1.0b16,70ea0f8c4a3c'
  sha256 :no_check

  url "http://beta.unity3d.com/download/70ea0f8c4a3c/MacEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-2020.1.0b16.pkg"
  name 'iOS Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-iOS-Support-for-Editor-2020.1.0b16.pkg'

  depends_on cask: 'unity@2020.1.0b16'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2020.1.0b16"
      FileUtils.move "/Applications/Unity-2020.1.0b16", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2020.1.0b16"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2020.1.0b16/PlaybackEngines/iOSSupport'
end
