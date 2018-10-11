cask 'unity-linux-support-for-editor@2018.3.0b1' do
  version '2018.3.0b1,3f0ac31c6d6f'
  sha256 :no_check

  url "http://beta.unity3d.com/download/3f0ac31c6d6f/MacEditorTargetInstaller/UnitySetup-Linux-Support-for-Editor-2018.3.0b1.pkg"
  name 'Linux Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Linux-Support-for-Editor-2018.3.0b1.pkg'

  depends_on cask: 'unity@2018.3.0b1'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2018.3.0b1"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2018.3.0b1'
end
