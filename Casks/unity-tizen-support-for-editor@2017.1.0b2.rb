cask 'unity-tizen-support-for-editor@2017.1.0b2' do
  version '2017.1.0b2,5e138e18bf82'
  sha256 :no_check

  url "http://beta.unity3d.com/download/5e138e18bf82/MacEditorTargetInstaller/UnitySetup-Tizen-Support-for-Editor-2017.1.0b2.pkg"
  name 'Tizen Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Tizen-Support-for-Editor-2017.1.0b2.pkg'

  depends_on cask: 'unity@2017.1.0b2'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2017.1.0b2"
      FileUtils.move "/Applications/Unity-2017.1.0b2", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2017.1.0b2"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2017.1.0b2/PlaybackEngines/TizenPlayer'
end
