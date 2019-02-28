cask 'unity-mac-il2cpp-support-for-editor@2019.2.0a6' do
  version '2019.2.0a6,770171a847a0'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/770171a847a0/MacEditorTargetInstaller/UnitySetup-Mac-IL2CPP-Support-for-Editor-2019.2.0a6.pkg"
  name 'Mac Build Support (IL2CPP)'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Mac-IL2CPP-Support-for-Editor-2019.2.0a6.pkg'

  depends_on cask: 'unity@2019.2.0a6'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2019.2.0a6"
      FileUtils.move "/Applications/Unity-2019.2.0a6", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2019.2.0a6"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2019.2.0a6/Unity.app/Contents/PlaybackEngines/MacStandaloneSupport'
end
