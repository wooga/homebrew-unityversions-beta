cask 'unity-facebook-games-support-for-editor@2019.3.0a6' do
  version '2019.3.0a6,8709ed9302b4'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/8709ed9302b4/MacEditorTargetInstaller/UnitySetup-Facebook-Games-Support-for-Editor-2019.3.0a6.pkg"
  name 'Facebook Gameroom Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Facebook-Games-Support-for-Editor-2019.3.0a6.pkg'

  depends_on cask: 'unity@2019.3.0a6'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2019.3.0a6"
      FileUtils.move "/Applications/Unity-2019.3.0a6", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2019.3.0a6"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2019.3.0a6/PlaybackEngines/Facebook'
end
