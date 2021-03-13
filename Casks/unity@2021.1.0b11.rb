cask 'unity@2021.1.0b11' do
  version '2021.1.0b11,ddf8e7a924bd'
  sha256 :no_check

  url "http://beta.unity3d.com/download/ddf8e7a924bd/MacEditorInstaller/Unity.pkg"
  name 'Unity 2021.1.0b11'
  homepage 'https://unity3d.com/unity/'

  pkg 'Unity.pkg'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2021.1.0b11"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2021.1.0b11'
end
