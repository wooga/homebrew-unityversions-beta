cask 'unity-facebook-games-support-for-editor@2019.2.0a14' do
  version '2019.2.0a14,f7ca70490e38'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/f7ca70490e38/MacEditorTargetInstaller/UnitySetup-Facebook-Games-Support-for-Editor-2019.2.0a14.pkg"
  name 'Facebook Gameroom Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Facebook-Games-Support-for-Editor-2019.2.0a14.pkg'

  depends_on cask: 'unity@2019.2.0a14'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2019.2.0a14"
      FileUtils.move "/Applications/Unity-2019.2.0a14", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2019.2.0a14"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2019.2.0a14/PlaybackEngines/Facebook'
end
