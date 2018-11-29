cask 'unity-windows-mono-support-for-editor@2018.3.0b12' do
  version '2018.3.0b12,77f6238a7ced'
  sha256 :no_check

  url "http://beta.unity3d.com/download/77f6238a7ced/MacEditorTargetInstaller/UnitySetup-Windows-Mono-Support-for-Editor-2018.3.0b12.pkg"
  name 'Windows Build Support (Mono)'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Windows-Mono-Support-for-Editor-2018.3.0b12.pkg'

  depends_on cask: 'unity@2018.3.0b12'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2018.3.0b12"
      FileUtils.move "/Applications/Unity-2018.3.0b12", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2018.3.0b12"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2018.3.0b12/PlaybackEngines/WindowsStandaloneSupport'
end
