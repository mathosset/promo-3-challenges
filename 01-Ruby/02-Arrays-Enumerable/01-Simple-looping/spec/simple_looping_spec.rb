# Encoding: utf-8
require "spec_helper"
require "simple_looping"

describe "#sum_with_while" do

  it "should return the correct sum" do
    response = sum_with_while(1, 100)
    response.must_equal 5050
  end

end

describe "#sum_with_for" do

  it "should return the correct sum" do
    response = sum_with_for(1, 100)
    response.must_equal 5050
  end

end

describe "#sum_recursive" do

  it "should return the correct sum" do
    response = sum_recursive(1, 100)
    response.must_equal 5050
  end

  it "should handle gracefully the case where min > max" do
    lambda { sum_recursive(101, 100) }.must_raise ArgumentError
  end

end