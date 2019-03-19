cask 'unity@2019.1.0b8' do
  version '2019.1.0b8,0862b00eb5a3'
  sha256 :no_check

  url "http://beta.unity3d.com/download/0862b00eb5a3/MacEditorInstaller/Unity.pkg"
  name 'Unity 2019.1.0b8'
  homepage 'https://unity3d.com/unity/'

  pkg 'Unity.pkg'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2019.1.0b8"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2019.1.0b8'
end
