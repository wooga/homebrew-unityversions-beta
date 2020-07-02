cask 'unity-android-support-for-editor@2020.1.0b14' do
  version '2020.1.0b14,69bacbd35688'
  sha256 :no_check

  url "http://beta.unity3d.com/download/69bacbd35688/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-2020.1.0b14.pkg"
  name 'Android Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Android-Support-for-Editor-2020.1.0b14.pkg'

  depends_on cask: 'unity@2020.1.0b14'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2020.1.0b14"
      FileUtils.move "/Applications/Unity-2020.1.0b14", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2020.1.0b14"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2020.1.0b14/PlaybackEngines/AndroidPlayer'
end
