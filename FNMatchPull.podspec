Pod::Spec.new do |s|

  s.name = 'FNMatchPull'
  s.summary = 'FNMatchPull'
  s.homepage = 'https://github.com/Fnoz/FNMatchPull'
  s.author = { 'Fnoz' => 'fnoz@sina.com' }
  s.source = { :git => 'ssh://git@github.com:Fnoz/FNMatchPull.git'}
  s.description = 'Swift实现的火柴图案&火柴文字下拉刷新动效（超炫酷下拉刷新），Swift&加强版本CBStoreHouseRefreshControl.'
  s.platform     = :ios, '7.0'
  s.license      = "MIT"
  s.requires_arc = true
  s.source_files = 'FNMatchPull/FNMatchPull/*.swift'

end
