Pod::Spec.new do |s|
  s.name     = 'LN_Label'
  s.version  = '1.0.3'
  s.ios.deployment_target = '8.0'
  s.license= { :type => "MIT", :file => "LICENSE" }
  s.summary  = 'a simple label make by LionNeo'
  s.homepage = 'https://github.com/LionNeo/LN_Label.git'
  s.authors   = { 'Lion_Neo' => '123624331@qq.com'}
  s.description  = <<-DESC 
                          LN_Label 可以一行代码搞定富文本点击,项目需要Masonry库
                   DESC
  s.source   = { :git => 'https://github.com/LionNeo/LN_Label.git', :tag => s.version.to_s }
  s.source_files = 'Demo/LNLabel/*.{h,m}'
  s.resources = 'Demo/LNLabel/*.{png}'
  s.dependency 'Masonry', '~> 1.0.2'
  s.dependency 'TTTAttributedLabel'
  s.requires_arc = true


end