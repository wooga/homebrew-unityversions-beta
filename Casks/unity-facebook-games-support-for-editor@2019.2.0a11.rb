cask 'unity-facebook-games-support-for-editor@2019.2.0a11' do
  version '2019.2.0a11,50bfd5f1a2f4'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/50bfd5f1a2f4/MacEditorTargetInstaller/UnitySetup-Facebook-Games-Support-for-Editor-2019.2.0a11.pkg"
  name 'Facebook Gameroom Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Facebook-Games-Support-for-Editor-2019.2.0a11.pkg'

  depends_on cask: 'unity@2019.2.0a11'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2019.2.0a11"
      FileUtils.move "/Applications/Unity-2019.2.0a11", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2019.2.0a11"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2019.2.0a11/PlaybackEngines/Facebook'
end
