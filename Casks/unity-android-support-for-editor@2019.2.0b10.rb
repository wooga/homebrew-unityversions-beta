cask 'unity-android-support-for-editor@2019.2.0b10' do
  version '2019.2.0b10,54f9b0ad4ba4'
  sha256 :no_check

  url "http://beta.unity3d.com/download/54f9b0ad4ba4/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-2019.2.0b10.pkg"
  name 'Android Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Android-Support-for-Editor-2019.2.0b10.pkg'

  depends_on cask: 'unity@2019.2.0b10'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2019.2.0b10"
      FileUtils.move "/Applications/Unity-2019.2.0b10", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2019.2.0b10"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2019.2.0b10/PlaybackEngines/AndroidPlayer'
end
