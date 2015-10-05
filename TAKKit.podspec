Pod::Spec.new do |s|
  s.name         = "TAKKit"
  s.version      = "1.4.0"
  s.summary      = "Util"
  s.homepage     = "https://github.com/taka0125/TAKKit"
  s.license      = 'MIT'
  s.author       = { "Takahiro Ooishi" => "taka0125@gmail.com" }
  s.source       = { :git => "https://github.com/taka0125/TAKKit.git", :tag => s.version.to_s }
  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.requires_arc = true
  s.source_files = 'Classes'
  s.header_mappings_dir = 'Classes'
  s.social_media_url = 'https://twitter.com/taka0125'

  s.subspec 'Core' do |sp|
    sp.source_files = 'Classes/Core.h', 'Classes/Core'
  end

  s.subspec 'UserDefaults' do |sp|
    sp.dependency 'TAKKit/Core'
    sp.source_files = 'Classes/UserDefaults.h', 'Classes/UserDefaults'
    sp.resource_bundles = {
      'TAKUserDefaults' => ['Resources/TAKUserDefaults/*']
    }
  end
end
