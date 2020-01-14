cask 'unity-android-support-for-editor@2019.3.0f5' do
  version '2019.3.0f5,44796c9d3c2c'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/44796c9d3c2c/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-2019.3.0f5.pkg"
  name 'Android Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Android-Support-for-Editor-2019.3.0f5.pkg'

  depends_on cask: 'unity@2019.3.0f5'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2019.3.0f5"
      FileUtils.move "/Applications/Unity-2019.3.0f5", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2019.3.0f5"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2019.3.0f5/PlaybackEngines/AndroidPlayer'
end
