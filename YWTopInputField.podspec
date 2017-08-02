Pod::Spec.new do |s|
    s.name         = "YWTopInputField"
    s.version      = "0.4"
    s.summary      = "YWTopInputField Generic Functionality String"
    s.description  = "Input Top Field with Generic input type, Updated version 0.4 for animation issue"
    s.requires_arc = true
    s.homepage     = "https://github.com/nsnull0/YWTopInputField"
    s.license      = { :type => "MIT", :file => "LICENSE" }
    s.author             = { "yoseph_wijaya" => "info@yoseph.ws" }
    s.platform     = :ios
    s.ios.deployment_target = "9.0"
    s.source       = { :git => "https://github.com/nsnull0/YWTopInputField.git", :tag => "#{s.version}" }
    s.source_files  = "YWTopInputField/Classes/*.{swift}"
    s.resources = "YWTopInputField/Resources/*.{png,jpeg,jpg,storyboard,xib}"
    s.framework  = "UIKit"





end
