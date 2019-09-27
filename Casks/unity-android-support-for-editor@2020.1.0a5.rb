cask 'unity-android-support-for-editor@2020.1.0a5' do
  version '2020.1.0a5,8af4c0145d29'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/8af4c0145d29/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-2020.1.0a5.pkg"
  name 'Android Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Android-Support-for-Editor-2020.1.0a5.pkg'

  depends_on cask: 'unity@2020.1.0a5'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2020.1.0a5"
      FileUtils.move "/Applications/Unity-2020.1.0a5", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2020.1.0a5"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2020.1.0a5/PlaybackEngines/AndroidPlayer'
end
