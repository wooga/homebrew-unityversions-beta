cask 'unity-webgl-support-for-editor@2020.1.0b2' do
  version '2020.1.0b2,14d43bf8b596'
  sha256 :no_check

  url "http://beta.unity3d.com/download/14d43bf8b596/MacEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2020.1.0b2.pkg"
  name 'WebGL Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-WebGL-Support-for-Editor-2020.1.0b2.pkg'

  depends_on cask: 'unity@2020.1.0b2'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2020.1.0b2"
      FileUtils.move "/Applications/Unity-2020.1.0b2", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2020.1.0b2"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2020.1.0b2/PlaybackEngines/WebGLSupport'
end
