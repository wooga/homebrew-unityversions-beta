cask 'unity@2017.1.0b10' do
  version '2017.1.0b10,94eaa37e21dd'
  sha256 :no_check

  url "http://beta.unity3d.com/download/94eaa37e21dd/MacEditorInstaller/Unity.pkg"
  name 'Unity 2017.1.0b10'
  homepage 'https://unity3d.com/unity/'

  pkg 'Unity.pkg'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2017.1.0b10"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2017.1.0b10'
end
