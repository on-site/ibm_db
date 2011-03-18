# +----------------------------------------------------------------------+
# |  Licensed Materials - Property of IBM                                |
# |                                                                      |
# | (C) Copyright IBM Corporation 2006, 2007,2008,2009,2010              |
# +----------------------------------------------------------------------+

Gem::Specification.new do |s|
  s.name = %q{ibm_db}
  s.version = "2.5.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["IBM"]
  s.date = %q{2011-02-08}
  s.email = %q{rubyibm-developers@rubyforge.org}
  s.extensions = ["ext/extconf.rb"]

  s.files         = `git ls-files`.split("\n").reject { |e| e =~ /.gemspec/ }
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.homepage = %q{http://rubyforge.org/projects/rubyibm/}
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.6")
  s.requirements = ["ActiveRecord, at least 1.15.1"]
  s.rubyforge_project = %q{rubyibm}
  s.rubygems_version = %q{1.6.0}
  s.summary = %q{Rails Driver and Adapter for IBM Data Servers: {DB2 on Linux/Unix/Windows, DB2 on zOS, DB2 on i5/OS, Informix (IDS)}}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 1.15.1"])
    else
      s.add_dependency(%q<activerecord>, [">= 1.15.1"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 1.15.1"])
  end
end
