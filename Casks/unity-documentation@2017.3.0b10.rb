cask 'unity-documentation@2017.3.0b10' do
  version '2017.3.0b10,d1367129888f'
  sha256 :no_check

  url "http://beta.unity3d.com/download/d1367129888f/MacDocumentationInstaller/Documentation.pkg"
  name 'Documentation'
  homepage 'https://unity3d.com/unity/'

  pkg 'Documentation.pkg'

  depends_on cask: 'unity@2017.3.0b10'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2017.3.0b10"
      FileUtils.move "/Applications/Unity-2017.3.0b10", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2017.3.0b10"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2017.3.0b10'
end
