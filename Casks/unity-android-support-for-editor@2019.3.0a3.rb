cask 'unity-android-support-for-editor@2019.3.0a3' do
  version '2019.3.0a3,91c086393aab'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/91c086393aab/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-2019.3.0a3.pkg"
  name 'Android Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Android-Support-for-Editor-2019.3.0a3.pkg'

  depends_on cask: 'unity@2019.3.0a3'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2019.3.0a3"
      FileUtils.move "/Applications/Unity-2019.3.0a3", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2019.3.0a3"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2019.3.0a3/PlaybackEngines/AndroidPlayer'
end
