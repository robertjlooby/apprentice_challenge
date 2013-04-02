require "spec_helper"
require_relative "../lib/ruby_api.rb"

describe "Strings" do

  it "reverses a string" do
    expect("Reverse me").to eq("em esreveR")
  end

end

describe "Arrays" do

  it "returns a sorted list of products by name" do
    original = ["pants", "pants", "socks", "apple"]
    expected = ["apple", "pants", "socks"]
    expect(original.uniquely_sorted).to eq(expected)
  end

end

describe "Equality" do

  it "should be comparable" do
    fish1 = Fish.new("Red")
    fish2 = Fish.new("Blue")
    fish3 = Fish.new("Red")
    expect(fish1).not_to eq(fish2)
    expect(fish1).to eq(fish3)
  end

end
