platform :ios, '13.0'
inhibit_all_warnings!

source 'https://github.com/cocoapods/specs.git'

target 'BinaryFrameworkExample' do
  
  use_frameworks!

  pod 'RealmSwift'
  pod 'Alamofire'
  
end

post_install do |installer|

    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
        end
    end

end