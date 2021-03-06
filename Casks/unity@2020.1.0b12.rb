cask 'unity@2020.1.0b12' do
  version '2020.1.0b12,9e6726e6ce12'
  sha256 :no_check

  url "http://beta.unity3d.com/download/9e6726e6ce12/MacEditorInstaller/Unity.pkg"
  name 'Unity 2020.1.0b12'
  homepage 'https://unity3d.com/unity/'

  pkg 'Unity.pkg'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2020.1.0b12"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2020.1.0b12'
end
