lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pr_cleaner/version'

Gem::Specification.new do |spec|
  spec.name          = 'pr_cleaner'
  spec.version       = PrCleaner::VERSION
  spec.authors       = ['Michał Siwek']
  spec.email         = ['mike21@aol.pl']

  spec.summary       = 'Bulk-delete comments from given user on a Github pull request'
  spec.homepage      = 'https://github.com/skycocker/pr_cleaner'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w(lib)

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake',    '~> 10.0'
  spec.add_development_dependency 'rspec',   '~> 3.0'

  spec.add_runtime_dependency 'octokit', '~> 4.0'
end
