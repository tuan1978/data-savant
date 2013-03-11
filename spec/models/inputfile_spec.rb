require 'spec_helper'

describe Inputfile do
  before(:each) do
    @a = Inputfile.create
    @a.contents = "value,brand,region
34,brand1,region1
45,brand2,region2
45,brand3,region3"
  end

  it "can show the loaded content" do

    expect(@a.content_to_hash).to eq([
        {
            value: 34.0,
            brand: "brand1",
            region: "region1"
        },
        {
            value: 45.0,
            brand: "brand2",
            region: "region2"
        },
        {
            value: 45.0,
            brand: "brand3",
            region: "region3"
        }])
  end

  it "creates columns with the correct names" do
    @a.input_columns.map{|c| c[:name]}.should eq(["value", "brand", "region"])
  end

  it "creates columns with the correct types" do
    @a.input_columns.map{|c| c[:type]}.should eq(["numeric", "string", "string"])
  end
end