cask 'unity@2018.1.0b3' do
  version '2018.1.0b3,e1ef60e69006'
  sha256 :no_check

  url "http://beta.unity3d.com/download/e1ef60e69006/MacEditorInstaller/Unity.pkg"
  name 'Unity 2018.1.0b3'
  homepage 'https://unity3d.com/unity/'

  pkg 'Unity.pkg'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2018.1.0b3"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2018.1.0b3'
end
