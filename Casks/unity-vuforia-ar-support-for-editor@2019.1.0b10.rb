cask 'unity-vuforia-ar-support-for-editor@2019.1.0b10' do
  version '2019.1.0b10,dbf1e96a8b63'
  sha256 :no_check

  url "http://beta.unity3d.com/download/dbf1e96a8b63/MacEditorTargetInstaller/UnitySetup-Vuforia-AR-Support-for-Editor-2019.1.0b10.pkg"
  name 'Vuforia Augmented Reality Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Vuforia-AR-Support-for-Editor-2019.1.0b10.pkg'

  depends_on cask: 'unity@2019.1.0b10'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2019.1.0b10"
      FileUtils.move "/Applications/Unity-2019.1.0b10", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2019.1.0b10"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2019.1.0b10/PlaybackEngines/VuforiaSupport'
end
