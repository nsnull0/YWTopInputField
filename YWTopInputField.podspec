Pod::Spec.new do |s|
    s.name         = "YWTopInputField"
    s.version      = "0.0.5"
    s.summary      = "Add Public Functionality + Protocol"
    s.description  = "This library could be used on version up to 0.1.0, currently still in progress build"
    s.requires_arc = true
    s.homepage     = "https://github.com/nsnull0/YWTopInputField"
    s.license      = { :type => "Apache License, Version 2.0", :file => "LICENSE" }
    s.author             = { "yoseph_wijaya" => "info@yoseph.ws" }
    s.platform     = :ios
    s.ios.deployment_target = "9.0"
    s.source       = { :git => "https://github.com/nsnull0/YWTopInputField.git", :tag => "#{s.version}" }
    s.source_files  = "YWTopInputField/Classes/*.{swift}"
    s.resources = "YWTopInputField/Resources/*.{png,jpeg,jpg,storyboard,xib}"
    s.framework  = "UIKit"
    s.dependency 'SnapKit'





end
