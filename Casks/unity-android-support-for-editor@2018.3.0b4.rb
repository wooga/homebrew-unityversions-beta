cask 'unity-android-support-for-editor@2018.3.0b4' do
  version '2018.3.0b4,44012bad7987'
  sha256 :no_check

  url "http://beta.unity3d.com/download/44012bad7987/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-2018.3.0b4.pkg"
  name 'Android Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Android-Support-for-Editor-2018.3.0b4.pkg'

  depends_on cask: 'unity@2018.3.0b4'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2018.3.0b4"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2018.3.0b4'
end
