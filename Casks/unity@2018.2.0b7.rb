cask 'unity@2018.2.0b7' do
  version '2018.2.0b7,8ce15a37a3ae'
  sha256 :no_check

  url "http://beta.unity3d.com/download/8ce15a37a3ae/MacEditorInstaller/Unity.pkg"
  name 'Unity 2018.2.0b7'
  homepage 'https://unity3d.com/unity/'

  pkg 'Unity.pkg'

  

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2018.2.0b7"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2018.2.0b7'
end
