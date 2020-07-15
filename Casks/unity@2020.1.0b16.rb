cask 'unity@2020.1.0b16' do
  version '2020.1.0b16,70ea0f8c4a3c'
  sha256 :no_check

  url "http://beta.unity3d.com/download/70ea0f8c4a3c/MacEditorInstaller/Unity.pkg"
  name 'Unity 2020.1.0b16'
  homepage 'https://unity3d.com/unity/'

  pkg 'Unity.pkg'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2020.1.0b16"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2020.1.0b16'
end
