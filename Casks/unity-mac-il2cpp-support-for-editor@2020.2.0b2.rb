cask 'unity-mac-il2cpp-support-for-editor@2020.2.0b2' do
  version '2020.2.0b2,90b2443a8df1'
  sha256 :no_check

  url "http://beta.unity3d.com/download/90b2443a8df1/MacEditorTargetInstaller/UnitySetup-Mac-IL2CPP-Support-for-Editor-2020.2.0b2.pkg"
  name 'Mac Build Support (IL2CPP)'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Mac-IL2CPP-Support-for-Editor-2020.2.0b2.pkg'

  depends_on cask: 'unity@2020.2.0b2'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2020.2.0b2"
      FileUtils.move "/Applications/Unity-2020.2.0b2", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2020.2.0b2"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2020.2.0b2/Unity.app/Contents/PlaybackEngines/MacStandaloneSupport'
end
