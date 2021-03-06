cask 'unity-mac-il2cpp-support-for-editor@2018.1.0b9' do
  version '2018.1.0b9,36a41ae63f8e'
  sha256 :no_check

  url "http://beta.unity3d.com/download/36a41ae63f8e/MacEditorTargetInstaller/UnitySetup-Mac-IL2CPP-Support-for-Editor-2018.1.0b9.pkg"
  name 'Mac IL2CPP Scripting Backend'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Mac-IL2CPP-Support-for-Editor-2018.1.0b9.pkg'

  depends_on cask: 'unity@2018.1.0b9'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2018.1.0b9"
      FileUtils.move "/Applications/Unity-2018.1.0b9", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2018.1.0b9"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2018.1.0b9/Unity.app/Contents/PlaybackEngines/MacStandaloneSupport'
end
