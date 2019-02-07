cask 'unity-windows-mono-support-for-editor@2019.2.0a4' do
  version '2019.2.0a4,2403bdbdd88b'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/2403bdbdd88b/MacEditorTargetInstaller/UnitySetup-Windows-Mono-Support-for-Editor-2019.2.0a4.pkg"
  name 'Windows Build Support (Mono)'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Windows-Mono-Support-for-Editor-2019.2.0a4.pkg'

  depends_on cask: 'unity@2019.2.0a4'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2019.2.0a4"
      FileUtils.move "/Applications/Unity-2019.2.0a4", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2019.2.0a4"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2019.2.0a4/PlaybackEngines/WindowsStandaloneSupport'
end
