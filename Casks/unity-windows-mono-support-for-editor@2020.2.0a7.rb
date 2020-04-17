cask 'unity-windows-mono-support-for-editor@2020.2.0a7' do
  version '2020.2.0a7,cea774d83c47'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/cea774d83c47/MacEditorTargetInstaller/UnitySetup-Windows-Mono-Support-for-Editor-2020.2.0a7.pkg"
  name 'Windows Build Support (Mono)'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Windows-Mono-Support-for-Editor-2020.2.0a7.pkg'

  depends_on cask: 'unity@2020.2.0a7'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2020.2.0a7"
      FileUtils.move "/Applications/Unity-2020.2.0a7", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2020.2.0a7"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2020.2.0a7/PlaybackEngines/WindowsStandaloneSupport'
end
