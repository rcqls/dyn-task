
require 'rubygems/package_task'

pkg_name='dyn-task'
pkg_version='0.1.0'

pkg_files=FileList[
    'bin/*',
    'lib/**/*.rb'
]

spec = Gem::Specification.new do |s|
    s.platform = Gem::Platform::RUBY
    s.summary = "Minimal dynamic task system"
    s.name = pkg_name
    s.version = pkg_version
    s.licenses = ['MIT', 'GPL-2.0']
    s.requirements << 'none'
    s.add_runtime_dependency "filewatcher",'~> 1.0', ">=1.0.1"
    s.require_path = 'lib'
    s.bindir = 'bin'
    s.executables <<  'dynTask'
    s.files = pkg_files.to_a
    s.description = <<-EOF
  Dynamic tasks system.
  EOF
    s.author = "RCqls"
    s.email= "rdrouilh@gmail.com"
    s.homepage = "http://cqls.upmf-grenoble.fr"
end
