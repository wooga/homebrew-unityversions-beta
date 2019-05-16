cask 'unity-webgl-support-for-editor@2019.3.0a2' do
  version '2019.3.0a2,fa7740529556'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/fa7740529556/MacEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2019.3.0a2.pkg"
  name 'WebGL Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-WebGL-Support-for-Editor-2019.3.0a2.pkg'

  depends_on cask: 'unity@2019.3.0a2'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2019.3.0a2"
      FileUtils.move "/Applications/Unity-2019.3.0a2", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2019.3.0a2"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2019.3.0a2/PlaybackEngines/WebGLSupport'
end
