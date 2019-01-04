cask 'unity-vuforia-ar-support-for-editor@2019.1.0a13' do
  version '2019.1.0a13,3de2277bb0e6'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/3de2277bb0e6/MacEditorTargetInstaller/UnitySetup-Vuforia-AR-Support-for-Editor-2019.1.0a13.pkg"
  name 'Vuforia Augmented Reality Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Vuforia-AR-Support-for-Editor-2019.1.0a13.pkg'

  depends_on cask: 'unity@2019.1.0a13'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2019.1.0a13"
      FileUtils.move "/Applications/Unity-2019.1.0a13", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2019.1.0a13"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2019.1.0a13/PlaybackEngines/VuforiaSupport'
end
