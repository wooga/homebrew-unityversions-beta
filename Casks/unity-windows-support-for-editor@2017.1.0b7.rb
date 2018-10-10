cask 'unity-windows-support-for-editor@2017.1.0b7' do
  version '2017.1.0b7,8a1ad67dc191'
  sha256 :no_check

  url "http://beta.unity3d.com/download/8a1ad67dc191/MacEditorTargetInstaller/UnitySetup-Windows-Support-for-Editor-2017.1.0b7.pkg"
  name 'Windows Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Windows-Support-for-Editor-2017.1.0b7.pkg'

  depends_on cask: 'unity@2017.1.0b7'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2017.1.0b7"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2017.1.0b7'
end
