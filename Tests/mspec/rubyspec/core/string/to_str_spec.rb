require File.dirname(__FILE__) + '/../../spec_helper'
require File.dirname(__FILE__) + '/fixtures/classes.rb'
require File.dirname(__FILE__) + '/shared/to_s.rb'

describe "String#to_str" do
  it_behaves_like(:string_to_s, :to_str)
end