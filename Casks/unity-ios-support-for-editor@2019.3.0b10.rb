cask 'unity-ios-support-for-editor@2019.3.0b10' do
  version '2019.3.0b10,7955ac590a97'
  sha256 :no_check

  url "http://beta.unity3d.com/download/7955ac590a97/MacEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-2019.3.0b10.pkg"
  name 'iOS Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-iOS-Support-for-Editor-2019.3.0b10.pkg'

  depends_on cask: 'unity@2019.3.0b10'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2019.3.0b10"
      FileUtils.move "/Applications/Unity-2019.3.0b10", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2019.3.0b10"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2019.3.0b10/PlaybackEngines/iOSSupport'
end
