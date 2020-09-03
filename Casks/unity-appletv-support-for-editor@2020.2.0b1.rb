cask 'unity-appletv-support-for-editor@2020.2.0b1' do
  version '2020.2.0b1,4ae7c5e87f33'
  sha256 :no_check

  url "http://beta.unity3d.com/download/4ae7c5e87f33/MacEditorTargetInstaller/UnitySetup-AppleTV-Support-for-Editor-2020.2.0b1.pkg"
  name 'tvOS Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-AppleTV-Support-for-Editor-2020.2.0b1.pkg'

  depends_on cask: 'unity@2020.2.0b1'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2020.2.0b1"
      FileUtils.move "/Applications/Unity-2020.2.0b1", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2020.2.0b1"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2020.2.0b1/PlaybackEngines/AppleTVSupport'
end
