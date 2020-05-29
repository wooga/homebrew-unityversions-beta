cask 'unity@2020.2.0a12' do
  version '2020.2.0a12,a331b04b65b8'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/a331b04b65b8/MacEditorInstaller/Unity.pkg"
  name 'Unity 2020.2.0a12'
  homepage 'https://unity3d.com/unity/'

  pkg 'Unity.pkg'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2020.2.0a12"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2020.2.0a12'
end
