cask 'unity-android-support-for-editor@2020.1.0b9' do
  version '2020.1.0b9,9c0aec301c8d'
  sha256 :no_check

  url "http://beta.unity3d.com/download/9c0aec301c8d/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-2020.1.0b9.pkg"
  name 'Android Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Android-Support-for-Editor-2020.1.0b9.pkg'

  depends_on cask: 'unity@2020.1.0b9'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2020.1.0b9"
      FileUtils.move "/Applications/Unity-2020.1.0b9", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2020.1.0b9"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2020.1.0b9/PlaybackEngines/AndroidPlayer'
end
