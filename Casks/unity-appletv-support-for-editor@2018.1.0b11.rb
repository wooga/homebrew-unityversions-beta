cask 'unity-appletv-support-for-editor@2018.1.0b11' do
  version '2018.1.0b11,c5bf62a40d4b'
  sha256 :no_check

  url "http://beta.unity3d.com/download/c5bf62a40d4b/MacEditorTargetInstaller/UnitySetup-AppleTV-Support-for-Editor-2018.1.0b11.pkg"
  name 'tvOS Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-AppleTV-Support-for-Editor-2018.1.0b11.pkg'

  depends_on cask: 'unity@2018.1.0b11'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2018.1.0b11"
      FileUtils.move "/Applications/Unity-2018.1.0b11", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2018.1.0b11"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2018.1.0b11/PlaybackEngines/AppleTVSupport'
end
