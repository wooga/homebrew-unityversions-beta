cask 'unity-ios-support-for-editor@2019.1.0a8' do
  version '2019.1.0a8,7ae038d0fb32'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/7ae038d0fb32/MacEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-2019.1.0a8.pkg"
  name 'iOS Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-iOS-Support-for-Editor-2019.1.0a8.pkg'

  depends_on cask: 'unity@2019.1.0a8'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2019.1.0a8"
      FileUtils.move "/Applications/Unity-2019.1.0a8", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2019.1.0a8"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2019.1.0a8/PlaybackEngines/iOSSupport'
end
