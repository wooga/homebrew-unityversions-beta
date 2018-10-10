cask 'unity-appletv-support-for-editor@2018.3.0b3' do
  version '2018.3.0b3,cc0086a8e10c'
  sha256 :no_check

  url "http://beta.unity3d.com/download/cc0086a8e10c/MacEditorTargetInstaller/UnitySetup-AppleTV-Support-for-Editor-2018.3.0b3.pkg"
  name 'tvOS Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-AppleTV-Support-for-Editor-2018.3.0b3.pkg'

  depends_on cask: 'unity@2018.3.0b3'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2018.3.0b3"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2018.3.0b3'
end
