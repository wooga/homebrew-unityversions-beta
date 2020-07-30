cask 'unity-webgl-support-for-editor@2020.2.0a19' do
  version '2020.2.0a19,8037ac78137e'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/8037ac78137e/MacEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2020.2.0a19.pkg"
  name 'WebGL Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-WebGL-Support-for-Editor-2020.2.0a19.pkg'

  depends_on cask: 'unity@2020.2.0a19'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2020.2.0a19"
      FileUtils.move "/Applications/Unity-2020.2.0a19", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2020.2.0a19"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2020.2.0a19/PlaybackEngines/WebGLSupport'
end
