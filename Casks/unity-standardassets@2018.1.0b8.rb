cask 'unity-standardassets@2018.1.0b8' do
  version '2018.1.0b8,0b50224845b9'
  sha256 :no_check

  url "http://beta.unity3d.com/download/0b50224845b9/MacStandardAssetsInstaller/StandardAssets.pkg"
  name 'Standard Assets'
  homepage 'https://unity3d.com/unity/'

  pkg 'StandardAssets.pkg'

  depends_on cask: 'unity@2018.1.0b8'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2018.1.0b8"
      FileUtils.move "/Applications/Unity-2018.1.0b8", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2018.1.0b8"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2018.1.0b8/Standard Assets'
end
