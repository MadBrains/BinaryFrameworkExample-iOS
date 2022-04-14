platform :ios, '12.1'
inhibit_all_warnings!

source 'https://github.com/cocoapods/specs.git'

target 'BinaryFrameworkExample' do
  
  use_frameworks!

  pod 'RealmSwift', '10.25.0'
  pod 'Alamofire', '5.5.0'
  
end

post_install do |installer|

    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.1'
        end
    end

end