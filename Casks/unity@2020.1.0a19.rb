cask 'unity@2020.1.0a19' do
  version '2020.1.0a19,6995b659db2e'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/6995b659db2e/MacEditorInstaller/Unity.pkg"
  name 'Unity 2020.1.0a19'
  homepage 'https://unity3d.com/unity/'

  pkg 'Unity.pkg'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2020.1.0a19"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2020.1.0a19'
end
