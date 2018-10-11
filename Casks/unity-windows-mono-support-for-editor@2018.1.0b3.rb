cask 'unity-windows-mono-support-for-editor@2018.1.0b3' do
  version '2018.1.0b3,e1ef60e69006'
  sha256 :no_check

  url "http://beta.unity3d.com/download/e1ef60e69006/MacEditorTargetInstaller/UnitySetup-Windows-Mono-Support-for-Editor-2018.1.0b3.pkg"
  name 'Windows Mono Scripting Backend'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Windows-Mono-Support-for-Editor-2018.1.0b3.pkg'

  depends_on cask: 'unity@2018.1.0b3'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2018.1.0b3"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2018.1.0b3'
end
