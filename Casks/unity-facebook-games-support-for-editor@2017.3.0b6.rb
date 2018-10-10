cask 'unity-facebook-games-support-for-editor@2017.3.0b6' do
  version '2017.3.0b6,57ec95547059'
  sha256 :no_check

  url "http://beta.unity3d.com/download/57ec95547059/MacEditorTargetInstaller/UnitySetup-Facebook-Games-Support-for-Editor-2017.3.0b6.pkg"
  name 'Facebook Gameroom Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Facebook-Games-Support-for-Editor-2017.3.0b6.pkg'

  depends_on cask: 'unity@2017.3.0b6'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2017.3.0b6"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2017.3.0b6'
end
