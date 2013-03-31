# Doctxor

`Docxtor` is a Ruby library for generating `docx` documents from `html` templates.

## Usage

    generator = Docxtor::Generator.new <options>
    generator.from_html <template>, <docx path>

### Options

To define document options and additional elements like page numbers you can pass parameters hash to constructor or use attribute accessors.

    generator = Docxtor::Generator.new {:footer => {:content => {:odd => :pagenum}, :align => :center}}

or

    generator.footer.content = {:odd => :pagenum}
    generator.footer.align = :center


### List of available options

#### `footer` and `header`

**Attributes**:

All attributes for header/footer can be symbols, strings or hashes. In the hash you can define to which pages the option will be applied: `:odd`, `:even` or `:first`. If a string or a symbol is passed it will be used in all document pages by default.

- `content` - defines content of the footer/header.

  **Values**:

  - `:pagenum` - Insert page number

  - `<tag name>` - Insert content of the html tag

  - `<text>` - Insert text

  **Examples**:

  * Create header for odd pages with text "Foo"

        generator = Docxtor::Generator.new {:header => {:content => {:odd => "Foo"}}}

    or

        generator = Docxtor::Generator.new
        generator.header.content = {:odd => "Foo"}

  * Create footer with page numbers on all pages, centered by default.

        generator = Docxtor::Generator.new {:footer => {:content => :pagenum}}

    or

        generator = Docxtor::Generator.new
        generator.footer.content = :pagenum


- `align` - `:left`, `:right` or `:center`. Align footer or header content horizontally. Default value: `:center`.

  **Examples**:

  * Create footer with text "Foo" for all pages, left aligned.

        generator = Docxtor::Generator.new {:footer => {:content => "Foo", :align => :left}}

    or

        generator = Docxtor::Generator.new
        generator.footer.content = "Foo"
        generator.footer.align = left

  * Create header with contents of the `#myheader` html tag on all pages left aligned on odd pages, center (default) aligned on even pages.

        generator = Docxtor::Generator.new {:header => {:content => "#myheader", :align => {:odd => :left}}}

    or

        generator = Docxtor::Generator.new
        generator.footer.content = "#myheader"
        generator.footer.align = {:odd => :left}

## TODO

- More document meta-info to insert into headers/footers, like author or chapter(?).
- Generate tables.
- Custom styles for headings and other elements.

## Contributing to docxtor

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2013 jafrog. See LICENSE.txt for
further details.
