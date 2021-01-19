#
# Be sure to run `pod lib lint Vipect.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Vipect'
  s.version          = '0.1.0'
  s.summary          = 'Viper Framework for iOS using Swinject as dependency injection framework.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/asam139/Vipect'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Saul Moreno Abril' => '93sauu@gmail.com' }
  s.source           = { :git => 'git@github.com:asam139/Vipect.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'
  
  s.source_files = 'Vipect/Classes/**/*.swift'
  s.weak_framework = 'SwiftUI'

  s.pod_target_xcconfig = {
    'OTHER_SWIFT_FLAGS[config=Debug]' => '-Xfrontend -warn-long-function-bodies=200 -Xfrontend -warn-long-expression-type-checking=200',
  }

end
