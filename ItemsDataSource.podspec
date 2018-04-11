Pod::Spec.new do |s|
  s.name         = "ItemsDataSource"
  s.version      = "0.1.0"
  s.summary      = "Generic CollectionView Data Source"
  s.description  = "Generic CollectionView Data Source for iOS"
  s.homepage     = "https://github.com/minikin/ItemsDataSource"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Sasha Prokhorenko" => "djminikin@gmail.com" }
  s.social_media_url   = "https://twitter.com/minikin"
  s.ios.deployment_target = "10.0"
  s.source       = { :git => "https://github.com/minikin/ItemsDataSource.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
end
