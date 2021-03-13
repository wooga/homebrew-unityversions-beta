cask 'unity@2021.2.0a8' do
  version '2021.2.0a8,05e6d22b19f7'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/05e6d22b19f7/MacEditorInstaller/Unity.pkg"
  name 'Unity 2021.2.0a8'
  homepage 'https://unity3d.com/unity/'

  pkg 'Unity.pkg'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2021.2.0a8"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2021.2.0a8'
end
