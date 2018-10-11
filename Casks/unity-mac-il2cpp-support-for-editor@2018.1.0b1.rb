cask 'unity-mac-il2cpp-support-for-editor@2018.1.0b1' do
  version '2018.1.0b1,bcd94551ef32'
  sha256 :no_check

  url "http://beta.unity3d.com/download/bcd94551ef32/MacEditorTargetInstaller/UnitySetup-Mac-IL2CPP-Support-for-Editor-2018.1.0b1.pkg"
  name 'Mac IL2CPP Scripting Backend'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Mac-IL2CPP-Support-for-Editor-2018.1.0b1.pkg'

  depends_on cask: 'unity@2018.1.0b1'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2018.1.0b1"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2018.1.0b1'
end
