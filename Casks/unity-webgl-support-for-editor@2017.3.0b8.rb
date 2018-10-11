cask 'unity-webgl-support-for-editor@2017.3.0b8' do
  version '2017.3.0b8,d2b3b1ff7201'
  sha256 :no_check

  url "http://beta.unity3d.com/download/d2b3b1ff7201/MacEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2017.3.0b8.pkg"
  name 'WebGL Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-WebGL-Support-for-Editor-2017.3.0b8.pkg'

  depends_on cask: 'unity@2017.3.0b8'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2017.3.0b8"
      FileUtils.move "/Applications/Unity-2017.3.0b8", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2017.3.0b8"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2017.3.0b8'
end