cask 'unity@2020.1.0a5' do
  version '2020.1.0a5,8af4c0145d29'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/8af4c0145d29/MacEditorInstaller/Unity.pkg"
  name 'Unity 2020.1.0a5'
  homepage 'https://unity3d.com/unity/'

  pkg 'Unity.pkg'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2020.1.0a5"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2020.1.0a5'
end
