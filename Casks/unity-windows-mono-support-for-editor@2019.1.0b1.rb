cask 'unity-windows-mono-support-for-editor@2019.1.0b1' do
  version '2019.1.0b1,83b3ba1f99df'
  sha256 :no_check

  url "http://beta.unity3d.com/download/83b3ba1f99df/MacEditorTargetInstaller/UnitySetup-Windows-Mono-Support-for-Editor-2019.1.0b1.pkg"
  name 'Windows Build Support (Mono)'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Windows-Mono-Support-for-Editor-2019.1.0b1.pkg'

  depends_on cask: 'unity@2019.1.0b1'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2019.1.0b1"
      FileUtils.move "/Applications/Unity-2019.1.0b1", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2019.1.0b1"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2019.1.0b1/PlaybackEngines/WindowsStandaloneSupport'
end
