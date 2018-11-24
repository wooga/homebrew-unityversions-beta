cask 'unity-android-support-for-editor@2019.1.0a10' do
  version '2019.1.0a10,84f9b5a9b69f'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/84f9b5a9b69f/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-2019.1.0a10.pkg"
  name 'Android Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Android-Support-for-Editor-2019.1.0a10.pkg'

  depends_on cask: 'unity@2019.1.0a10'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2019.1.0a10"
      FileUtils.move "/Applications/Unity-2019.1.0a10", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2019.1.0a10"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2019.1.0a10/PlaybackEngines/AndroidPlayer'
end
