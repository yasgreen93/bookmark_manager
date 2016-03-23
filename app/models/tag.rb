require "data_mapper"
require "dm-postgres-adapter"


class Tag
  include DataMapper::Resource
  
  property
