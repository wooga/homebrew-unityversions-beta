cask 'unity-ios-support-for-editor@2017.2.0b3' do
  version '2017.2.0b3,4c2ac554540c'
  sha256 :no_check

  url "http://beta.unity3d.com/download/4c2ac554540c/MacEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-2017.2.0b3.pkg"
  name 'iOS Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-iOS-Support-for-Editor-2017.2.0b3.pkg'

  depends_on cask: 'unity@2017.2.0b3'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2017.2.0b3"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2017.2.0b3'
end
