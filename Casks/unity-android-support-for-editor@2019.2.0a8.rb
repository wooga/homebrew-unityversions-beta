cask 'unity-android-support-for-editor@2019.2.0a8' do
  version '2019.2.0a8,18a4512f903f'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/18a4512f903f/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-2019.2.0a8.pkg"
  name 'Android Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Android-Support-for-Editor-2019.2.0a8.pkg'

  depends_on cask: 'unity@2019.2.0a8'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2019.2.0a8"
      FileUtils.move "/Applications/Unity-2019.2.0a8", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2019.2.0a8"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2019.2.0a8/PlaybackEngines/AndroidPlayer'
end
