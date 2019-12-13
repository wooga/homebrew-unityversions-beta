cask 'unity-windows-mono-support-for-editor@2020.1.0a16' do
  version '2020.1.0a16,196f78887a11'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/196f78887a11/MacEditorTargetInstaller/UnitySetup-Windows-Mono-Support-for-Editor-2020.1.0a16.pkg"
  name 'Windows Build Support (Mono)'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Windows-Mono-Support-for-Editor-2020.1.0a16.pkg'

  depends_on cask: 'unity@2020.1.0a16'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2020.1.0a16"
      FileUtils.move "/Applications/Unity-2020.1.0a16", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2020.1.0a16"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2020.1.0a16/PlaybackEngines/WindowsStandaloneSupport'
end
