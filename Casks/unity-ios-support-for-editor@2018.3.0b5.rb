cask 'unity-ios-support-for-editor@2018.3.0b5' do
  version '2018.3.0b5,01088ee0a3a8'
  sha256 :no_check

  url "http://beta.unity3d.com/download/01088ee0a3a8/MacEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-2018.3.0b5.pkg"
  name 'iOS Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-iOS-Support-for-Editor-2018.3.0b5.pkg'

  depends_on cask: 'unity@2018.3.0b5'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2018.3.0b5"
      FileUtils.move "/Applications/Unity-2018.3.0b5", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2018.3.0b5"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2018.3.0b5/PlaybackEngines/iOSSupport'
end
