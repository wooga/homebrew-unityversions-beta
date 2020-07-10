cask 'unity-windows-mono-support-for-editor@2020.1.0b15' do
  version '2020.1.0b15,40d9420e7de8'
  sha256 :no_check

  url "http://beta.unity3d.com/download/40d9420e7de8/MacEditorTargetInstaller/UnitySetup-Windows-Mono-Support-for-Editor-2020.1.0b15.pkg"
  name 'Windows Build Support (Mono)'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Windows-Mono-Support-for-Editor-2020.1.0b15.pkg'

  depends_on cask: 'unity@2020.1.0b15'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2020.1.0b15"
      FileUtils.move "/Applications/Unity-2020.1.0b15", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2020.1.0b15"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2020.1.0b15/PlaybackEngines/WindowsStandaloneSupport'
end
