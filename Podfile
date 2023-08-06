target 'examenDigipro' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for examenDigipro
 pod 'FirebaseFirestore'
 pod 'FirebaseCore'
 pod 'lottie-ios'
  
  post_install do |installer|
      installer.generated_projects.each do |project|
            project.targets.each do |target|
                target.build_configurations.each do |config|
                    config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
                 end
            end
     end
  end

end