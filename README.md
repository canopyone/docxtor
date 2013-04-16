# Doctxor

`Docxtor` is a Ruby library for generating `docx` documents from `html` templates.

`master` branch works with Ruby **1.8.7**. For **1.9** compatible version checkout `1.9` branch.

## Usage

    generator = Docxtor::Generator.new <options>
    generator.from_html <template>, <docx path>

### Options

To define document options and additional elements like page numbers you can pass parameters hash to constructor.

    generator = Docxtor::Generator.new {:footer => {:content => :pagenum, :align => :center}}

### List of available options

#### `footer` and `header`

**Attributes**:

- `content` - defines content of the footer/header.

  **Values**:

  - `:pagenum` - Insert page number

  - `<text>` - Insert text

  **Examples**:

  * Create header with text "Foo"

        generator = Docxtor::Generator.new {:header => {:content => "Foo"}}

  * Create footer with page numbers on all pages, aligned by left by default.

        generator = Docxtor::Generator.new {:footer => {:content => :pagenum}}


- `align` - `:left`, `:right` or `:center`. Align footer or header content horizontally. If no `:align` options provided, content aligned by left.

  **Examples**:

  * Create footer with text "Foo" for all pages, left aligned.

        generator = Docxtor::Generator.new {:footer => {:content => "Foo", :align => :left}}

  * Create header with page numbers, center aligned.

        generator = Docxtor::Generator.new {:header => {:content => :pagenum, :align => :center}}

## What works now

Resulting `.docx`s have been tested on LibreOffice and Google Docs. LibreOffice doesn't apply styles defined in `styles.xml` to paragraphs and recognizes only properties defined in the body of a document. Google Docs doesn't open generated files at all.


## TODO

- More document meta-info to insert into headers/footers, like author or chapter(?).
- Generate tables.
- Custom styles for headings and other elements.
- HTML tags as footer/header content
- Different footers/headers for first, odd and even pages. (Note that this option is implemented, but works weird with some consumers like LibreOffice. Take a look at the tests, if interested.)

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
