cask 'unity-webgl-support-for-editor@2020.1.0a22' do
  version '2020.1.0a22,17d4c89d06f9'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/17d4c89d06f9/MacEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2020.1.0a22.pkg"
  name 'WebGL Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-WebGL-Support-for-Editor-2020.1.0a22.pkg'

  depends_on cask: 'unity@2020.1.0a22'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2020.1.0a22"
      FileUtils.move "/Applications/Unity-2020.1.0a22", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2020.1.0a22"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2020.1.0a22/PlaybackEngines/WebGLSupport'
end
