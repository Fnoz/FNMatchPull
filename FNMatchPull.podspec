Pod::Spec.new do |s|
	s.name         = "FNMatchPull"
	s.version      = "0.2"
	s.summary      = "A match character and pattern refresh control by Swift."

	s.description  = <<-DESC
	# Features
    - Animation can be created by points.
    - Animation can be created by English letters.
	DESC

	s.homepage     = "https://github.com/Fnoz/FNMatchPull"
	s.license      = { :type => "MIT", :file => "LICENSE" }
	s.author             = { "Lu WJ and Meng Li" => "lm2343635@126.com" }
	s.social_media_url   = "https://github.com/Fnoz"

	s.platform     = :ios
    s.ios.deployment_target = "8.0"
	s.source       = { :git => "https://github.com/Fnoz/FNMatchPull.git", :tag => "0.2" }

	s.source_files  = "FNMatchPull/FNMatchPull/*.{swift}"

	s.requires_arc = true
end
