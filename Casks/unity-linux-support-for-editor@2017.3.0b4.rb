cask 'unity-linux-support-for-editor@2017.3.0b4' do
  version '2017.3.0b4,4c1b6e48c9c9'
  sha256 :no_check

  url "http://beta.unity3d.com/download/4c1b6e48c9c9/MacEditorTargetInstaller/UnitySetup-Linux-Support-for-Editor-2017.3.0b4.pkg"
  name 'Linux Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Linux-Support-for-Editor-2017.3.0b4.pkg'

  depends_on cask: 'unity@2017.3.0b4'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2017.3.0b4"
      FileUtils.move "/Applications/Unity-2017.3.0b4", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2017.3.0b4"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2017.3.0b4'
end
