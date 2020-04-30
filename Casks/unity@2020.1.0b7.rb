cask 'unity@2020.1.0b7' do
  version '2020.1.0b7,6cfebb967dcd'
  sha256 :no_check

  url "http://beta.unity3d.com/download/6cfebb967dcd/MacEditorInstaller/Unity.pkg"
  name 'Unity 2020.1.0b7'
  homepage 'https://unity3d.com/unity/'

  pkg 'Unity.pkg'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2020.1.0b7"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2020.1.0b7'
end
