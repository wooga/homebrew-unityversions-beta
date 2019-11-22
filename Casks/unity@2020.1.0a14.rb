cask 'unity@2020.1.0a14' do
  version '2020.1.0a14,2a3307d3869b'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/2a3307d3869b/MacEditorInstaller/Unity.pkg"
  name 'Unity 2020.1.0a14'
  homepage 'https://unity3d.com/unity/'

  pkg 'Unity.pkg'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2020.1.0a14"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2020.1.0a14'
end
