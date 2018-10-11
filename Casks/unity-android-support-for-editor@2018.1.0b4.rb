cask 'unity-android-support-for-editor@2018.1.0b4' do
  version '2018.1.0b4,003615bcffde'
  sha256 :no_check

  url "http://beta.unity3d.com/download/003615bcffde/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-2018.1.0b4.pkg"
  name 'Android Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Android-Support-for-Editor-2018.1.0b4.pkg'

  depends_on cask: 'unity@2018.1.0b4'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2018.1.0b4"
      FileUtils.move "/Applications/Unity-2018.1.0b4", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2018.1.0b4"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2018.1.0b4/PlaybackEngines/AndroidPlayer'
end
