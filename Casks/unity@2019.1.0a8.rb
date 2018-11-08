cask 'unity@2019.1.0a8' do
  version '2019.1.0a8,7ae038d0fb32'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/7ae038d0fb32/MacEditorInstaller/Unity.pkg"
  name 'Unity 2019.1.0a8'
  homepage 'https://unity3d.com/unity/'

  pkg 'Unity.pkg'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2019.1.0a8"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2019.1.0a8'
end
