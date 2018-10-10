cask 'unity@2018.3.0b2' do
  version '2018.3.0b2,21e0e8a5466d'
  sha256 :no_check

  url "http://beta.unity3d.com/download/21e0e8a5466d/MacEditorInstaller/Unity.pkg"
  name 'Unity 2018.3.0b2'
  homepage 'https://unity3d.com/unity/'

  pkg 'Unity.pkg'

  

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2018.3.0b2"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2018.3.0b2'
end
