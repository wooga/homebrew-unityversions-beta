cask 'unity-mac-il2cpp-support-for-editor@2020.1.0a12' do
  version '2020.1.0a12,40e46701fee5'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/40e46701fee5/MacEditorTargetInstaller/UnitySetup-Mac-IL2CPP-Support-for-Editor-2020.1.0a12.pkg"
  name 'Mac Build Support (IL2CPP)'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Mac-IL2CPP-Support-for-Editor-2020.1.0a12.pkg'

  depends_on cask: 'unity@2020.1.0a12'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2020.1.0a12"
      FileUtils.move "/Applications/Unity-2020.1.0a12", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2020.1.0a12"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2020.1.0a12/Unity.app/Contents/PlaybackEngines/MacStandaloneSupport'
end
