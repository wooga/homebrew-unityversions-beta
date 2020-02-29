cask 'unity-mac-il2cpp-support-for-editor@2020.1.0a25' do
  version '2020.1.0a25,301553012d38'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/301553012d38/MacEditorTargetInstaller/UnitySetup-Mac-IL2CPP-Support-for-Editor-2020.1.0a25.pkg"
  name 'Mac Build Support (IL2CPP)'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Mac-IL2CPP-Support-for-Editor-2020.1.0a25.pkg'

  depends_on cask: 'unity@2020.1.0a25'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2020.1.0a25"
      FileUtils.move "/Applications/Unity-2020.1.0a25", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2020.1.0a25"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2020.1.0a25/Unity.app/Contents/PlaybackEngines/MacStandaloneSupport'
end
