cask 'unity-windows-mono-support-for-editor@2019.1.0b9' do
  version '2019.1.0b9,f1481f10a935'
  sha256 :no_check

  url "http://beta.unity3d.com/download/f1481f10a935/MacEditorTargetInstaller/UnitySetup-Windows-Mono-Support-for-Editor-2019.1.0b9.pkg"
  name 'Windows Build Support (Mono)'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Windows-Mono-Support-for-Editor-2019.1.0b9.pkg'

  depends_on cask: 'unity@2019.1.0b9'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2019.1.0b9"
      FileUtils.move "/Applications/Unity-2019.1.0b9", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2019.1.0b9"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2019.1.0b9/PlaybackEngines/WindowsStandaloneSupport'
end
