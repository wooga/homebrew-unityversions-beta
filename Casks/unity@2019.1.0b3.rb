cask 'unity@2019.1.0b3' do
  version '2019.1.0b3,52be913b8b36'
  sha256 :no_check

  url "http://beta.unity3d.com/download/52be913b8b36/MacEditorInstaller/Unity.pkg"
  name 'Unity 2019.1.0b3'
  homepage 'https://unity3d.com/unity/'

  pkg 'Unity.pkg'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2019.1.0b3"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2019.1.0b3'
end
