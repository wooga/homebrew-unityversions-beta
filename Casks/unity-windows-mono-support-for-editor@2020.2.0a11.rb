cask 'unity-windows-mono-support-for-editor@2020.2.0a11' do
  version '2020.2.0a11,d00a9d9791a8'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/d00a9d9791a8/MacEditorTargetInstaller/UnitySetup-Windows-Mono-Support-for-Editor-2020.2.0a11.pkg"
  name 'Windows Build Support (Mono)'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Windows-Mono-Support-for-Editor-2020.2.0a11.pkg'

  depends_on cask: 'unity@2020.2.0a11'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2020.2.0a11"
      FileUtils.move "/Applications/Unity-2020.2.0a11", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2020.2.0a11"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2020.2.0a11/PlaybackEngines/WindowsStandaloneSupport'
end
