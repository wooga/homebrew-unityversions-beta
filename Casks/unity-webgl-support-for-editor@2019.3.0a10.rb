cask 'unity-webgl-support-for-editor@2019.3.0a10' do
  version '2019.3.0a10,d046aa12c0d7'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/d046aa12c0d7/MacEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2019.3.0a10.pkg"
  name 'WebGL Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-WebGL-Support-for-Editor-2019.3.0a10.pkg'

  depends_on cask: 'unity@2019.3.0a10'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2019.3.0a10"
      FileUtils.move "/Applications/Unity-2019.3.0a10", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2019.3.0a10"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2019.3.0a10/PlaybackEngines/WebGLSupport'
end
