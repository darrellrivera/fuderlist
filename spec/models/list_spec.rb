require 'rails_helper'

RSpec.describe List, :type => :model do
  it "validates presence of name" do
    list = List.new
    expect(list.valid?).to eq(false)

    list.name = "some name"
    expect(list.valid?).to eq(true)
  end

  it "validates uniqueness of of name" do
    name = "some name"
    list = List.create!(:name => name)
    same_name = List.new(:name => name)
    expect(same_name.valid?).to eq(false)
  end

  it "has many items" do
    list = List.create!(:name => "a name")
    expect(list.items).to eq([])
  end
end
