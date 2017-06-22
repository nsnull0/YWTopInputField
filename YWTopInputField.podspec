#
#  Be sure to run `pod spec lint YWTopInputField.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|



  s.name         = "YWTopInputField"
  s.version      = "0.0.2"
  s.summary      = "Initial build with Blur Background"
    s.requires_arc = true

  s.homepage     = "https://github.com/nsnull0/YWTopInputField"


  s.license      = { :type => "Apache License, Version 2.0", :file => "LICENSE" }

  s.author             = { "yoseph_wijaya" => "info@yoseph.ws" }

    s.platform     = :ios

    s.ios.deployment_target = "10.0"

  s.source       = { :git => "https://github.com/nsnull0/YWTopInputField.git", :tag => "#{s.version}" }




  s.source_files  = "YWTopInputField/**/*.{swift}"


    s.resources = "YWTopInputField/**/*.{png,jpeg,jpg,storyboard,xib}"



    s.framework  = "UIKit"
    s.dependency 'SnapKit'





end
