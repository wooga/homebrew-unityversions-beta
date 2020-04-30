cask 'unity-webgl-support-for-editor@2020.2.0a9' do
  version '2020.2.0a9,31beeaab9d72'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/31beeaab9d72/MacEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2020.2.0a9.pkg"
  name 'WebGL Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-WebGL-Support-for-Editor-2020.2.0a9.pkg'

  depends_on cask: 'unity@2020.2.0a9'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2020.2.0a9"
      FileUtils.move "/Applications/Unity-2020.2.0a9", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2020.2.0a9"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2020.2.0a9/PlaybackEngines/WebGLSupport'
end
