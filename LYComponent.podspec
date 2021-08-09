#
# Be sure to run `pod lib lint LYExtension.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LYComponent'
  s.version          = '0.1.1'
  s.summary          = 'Swift 常用系统类扩展'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
        swift 系统类常用扩展
        swift 常用UI扩展
                       DESC

                       
  s.homepage         = 'https://github.com/luoyued/LYComponent'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'luoyued' => '554308841@qq.com' }
  s.source           = { :git => 'https://github.com/luoyued/LYComponent.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.platform     = :ios, "9.0"
#  s.ios.deployment_target = "8.0"

  s.subspec 'Extension' do |extension|
    extension.source_files = 'LYComponent/Pod/Extension/**/*'
    extension.dependency 'MJRefresh', '>=3.5.0'
  end
  
#  s.subspec 'Tool' do |tool|
#    tool.source_files = 'LYKit/Classes/Tool/**/*'
#  end
#  s.source_files = 'LYKit/Classes/**/*.swift'
  s.swift_versions = '4.2'
  # s.resource_bundles = {
  #   'LYExtension' => ['LYExtension/Assets/*.png']
  # }
  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit','Foundation'
#  s.dependency 'MJRefresh', '>=3.5.0'
end
