cask 'unity-facebook-games-support-for-editor@2018.1.0b13' do
  version '2018.1.0b13,43de91b8ac41'
  sha256 :no_check

  url "http://beta.unity3d.com/download/43de91b8ac41/MacEditorTargetInstaller/UnitySetup-Facebook-Games-Support-for-Editor-2018.1.0b13.pkg"
  name 'Facebook Gameroom Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Facebook-Games-Support-for-Editor-2018.1.0b13.pkg'

  depends_on cask: 'unity@2018.1.0b13'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2018.1.0b13"
      FileUtils.move "/Applications/Unity-2018.1.0b13", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2018.1.0b13"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2018.1.0b13/PlaybackEngines/Facebook'
end
