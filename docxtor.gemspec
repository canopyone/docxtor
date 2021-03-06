# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{docxtor}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["jafrog"]
  s.date = %q{2013-04-17}
  s.description = %q{Ruby docx generator}
  s.email = %q{howeveririna@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "docxtor.gemspec",
    "lib/docxtor.rb",
    "lib/docxtor/builder.rb",
    "lib/docxtor/document/footer.rb",
    "lib/docxtor/document/header.rb",
    "lib/docxtor/document/header_footer.rb",
    "lib/docxtor/document/page_options.rb",
    "lib/docxtor/document/paragraph.rb",
    "lib/docxtor/generator.rb",
    "lib/docxtor/parser/html.rb",
    "lib/docxtor/parser/node.rb",
    "lib/nokogiri/xml/element.rb",
    "lib/templates/_rels/.rels.builder",
    "lib/templates/word/_rels/document.xml.rels.builder",
    "lib/templates/word/document.xml.builder",
    "lib/templates/word/footer.xml.builder",
    "lib/templates/word/header.xml.builder",
    "lib/templates/word/styles.xml.builder",
    "test/helper.rb",
    "test/support/default_footer.xml.builder",
    "test/support/document.xml.builder",
    "test/support/document_with_first_footer.xml.builder",
    "test/support/document_with_footer.xml.builder",
    "test/support/document_with_many_footers.xml.builder",
    "test/support/pagenum_footer.xml.builder",
    "test/support/template.html",
    "test/test_docxtor_builder.rb",
    "test/test_docxtor_document_footer.rb",
    "test/test_docxtor_document_page_options.rb",
    "test/test_docxtor_document_paragraph.rb",
    "test/test_docxtor_generator.rb",
    "test/test_docxtor_html_parser.rb",
    "test/test_nokogiri_xml_element.rb"
  ]
  s.homepage = %q{http://github.com/jafrog/docxtor}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Ruby docx generator}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<builder>, [">= 0"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
      s.add_runtime_dependency(%q<rubytree>, [">= 0"])
      s.add_runtime_dependency(%q<rubyzip>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
    else
      s.add_dependency(%q<builder>, [">= 0"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<rubytree>, [">= 0"])
      s.add_dependency(%q<rubyzip>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
    end
  else
    s.add_dependency(%q<builder>, [">= 0"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<rubytree>, [">= 0"])
    s.add_dependency(%q<rubyzip>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
  end
end

