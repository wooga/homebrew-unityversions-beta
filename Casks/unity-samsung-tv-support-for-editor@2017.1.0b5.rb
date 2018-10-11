cask 'unity-samsung-tv-support-for-editor@2017.1.0b5' do
  version '2017.1.0b5,e2f219641e2c'
  sha256 :no_check

  url "http://beta.unity3d.com/download/e2f219641e2c/MacEditorTargetInstaller/UnitySetup-Samsung-TV-Support-for-Editor-2017.1.0b5.pkg"
  name 'SamsungTV Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Samsung-TV-Support-for-Editor-2017.1.0b5.pkg'

  depends_on cask: 'unity@2017.1.0b5'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2017.1.0b5"
      FileUtils.move "/Applications/Unity-2017.1.0b5", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2017.1.0b5"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2017.1.0b5'
end
