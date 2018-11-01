cask 'unity-appletv-support-for-editor@2018.3.0b8' do
  version '2018.3.0b8,fa755def4b97'
  sha256 :no_check

  url "http://beta.unity3d.com/download/fa755def4b97/MacEditorTargetInstaller/UnitySetup-AppleTV-Support-for-Editor-2018.3.0b8.pkg"
  name 'tvOS Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-AppleTV-Support-for-Editor-2018.3.0b8.pkg'

  depends_on cask: 'unity@2018.3.0b8'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2018.3.0b8"
      FileUtils.move "/Applications/Unity-2018.3.0b8", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2018.3.0b8"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2018.3.0b8/PlaybackEngines/AppleTVSupport'
end
