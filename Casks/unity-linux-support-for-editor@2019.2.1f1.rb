cask 'unity-linux-support-for-editor@2019.2.1f1' do
  version '2019.2.1f1,ca4d5af0be6f'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/ca4d5af0be6f/MacEditorTargetInstaller/UnitySetup-Linux-Support-for-Editor-2019.2.1f1.pkg"
  name 'Linux Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Linux-Support-for-Editor-2019.2.1f1.pkg'

  depends_on cask: 'unity@2019.2.1f1'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2019.2.1f1"
      FileUtils.move "/Applications/Unity-2019.2.1f1", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2019.2.1f1"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2019.2.1f1/PlaybackEngines/LinuxStandaloneSupport'
end
