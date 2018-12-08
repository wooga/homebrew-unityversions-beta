cask 'unity-android-support-for-editor@2018.3.0f1' do
  version '2018.3.0f1,f023c421e164'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/f023c421e164/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-2018.3.0f1.pkg"
  name 'Android Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Android-Support-for-Editor-2018.3.0f1.pkg'

  depends_on cask: 'unity@2018.3.0f1'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2018.3.0f1"
      FileUtils.move "/Applications/Unity-2018.3.0f1", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2018.3.0f1"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2018.3.0f1/PlaybackEngines/AndroidPlayer'
end
