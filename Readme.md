# SolrMapper

An ORM for Solr documents.

[![Build Status](https://secure.travis-ci.org/nz/solrmapper.png)](http://travis-ci.org/nz/solrmapper)

## Installation & Configuration

Currently, SolrMapper is under active development, and is not ready even for beta use. That said, if you're interested in living on the bleeding edge, you can install the gem from source.

##### Gemfile

```ruby
gem 'solrmapper', :git => 'git://github.com/nz/solrmapper.git'
```

## Indexing documents

You can use the `SolrMapper::Document` class directly…

```ruby
doc = SolrMapper::Document.new(
  :title => "Hello world!",
  :content => "My name is Frederick."
)
doc.save
```

`SolrMapper::Document` feels a lot like ActiveRecord. And, indeed, it is build on many of the same fundamentals provided by `ActiveModel` and `ActiveSupport`.

### Use your own classes

```ruby
class Document < SolrMapper::Document
end

doc = Document.create(
  :title => "TPS Report #3423"
)
```

### Solr field names

The attribute names given to your documents are expected to match the definitions in your Solr `schema.xml`.

## Coming soon...

### Searching for documents

#### Simple search

Just give your query to the `search` class method.

```ruby
@search = Document.search('hello world')
```

#### Filter queries and other Solr paramters

You can also provide the `search` class method with a hash that will be serialized into Solr parameters. If you're familiar with Solr, then this is just the method you're looking for.

```ruby
@search = Document.search(
  :q => 'hello world',
  :fq => { :category => 'Cheerful' }
)
```

#### Chainable search methods

```ruby
@search = Document.search('hello world').
                   where(category: 'Cheerful').
                   facet(field: 'category').
                   mm(1)
```

### First-class facets

```ruby
@search = Document.facet(fields: %w(category author))

@search.facets.each do |facet|
  puts facet.field
  facet.terms.each do |term, count|
    puts "  #{term}: #{count}"
  end
  puts
end
```

The above would print something like the following...

```
Category
  Cheerful: 23
  Gloomy: 12
Author
  e.e. cummings: 14
  T.S. Eliot: 10
```
