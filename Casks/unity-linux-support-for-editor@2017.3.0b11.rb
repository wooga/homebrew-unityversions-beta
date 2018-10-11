cask 'unity-linux-support-for-editor@2017.3.0b11' do
  version '2017.3.0b11,8e840c60cd77'
  sha256 :no_check

  url "http://beta.unity3d.com/download/8e840c60cd77/MacEditorTargetInstaller/UnitySetup-Linux-Support-for-Editor-2017.3.0b11.pkg"
  name 'Linux Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Linux-Support-for-Editor-2017.3.0b11.pkg'

  depends_on cask: 'unity@2017.3.0b11'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2017.3.0b11"
      FileUtils.move "/Applications/Unity-2017.3.0b11", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2017.3.0b11"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2017.3.0b11/PlaybackEngines/LinuxStandaloneSupport'
end
