cask 'unity@2017.3.0b8' do
  version '2017.3.0b8,d2b3b1ff7201'
  sha256 :no_check

  url "http://beta.unity3d.com/download/d2b3b1ff7201/MacEditorInstaller/Unity.pkg"
  name 'Unity 2017.3.0b8'
  homepage 'https://unity3d.com/unity/'

  pkg 'Unity.pkg'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2017.3.0b8"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2017.3.0b8'
end
