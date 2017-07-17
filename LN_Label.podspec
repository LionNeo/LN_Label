Pod::Spec.new do |s|
  s.name     = 'LN_Label'
  s.version  = '1.0.0'
  s.ios.deployment_target = '8.0'
  s.license  =  'MIT'
  s.summary  = '一行代码搞定协议文本点击'
  s.homepage = 'https://github.com/LionNeo/LN_Label.git'
  s.authors   = { 'Lion_Neo' => '123624331@qq.com'}
  s.source   = { :git => 'https://github.com/LionNeo/LN_Label.git', :tag => s.version.to_s }
  s.description = 'LN_Tools is a tools about develop on iOS'

  s.source_files = 'LN_Label/demo/LN_Label/*.{h,m}'
  s.resources = 'LN_Label/demo/LN_Label/*.{png} 
  s.framework = 'Masonry'
  s.requires_arc = true
end