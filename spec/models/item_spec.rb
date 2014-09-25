require 'rails_helper'

RSpec.describe Item, :type => :model do
  it "validates presence of name" do
    item = Item.new
    expect(item.valid?).to eq(false)

    item.name = "some name"
    expect(item.valid?).to eq(true)
  end

  it "validates uniqueness of of name" do
    name = "some name"
    item = Item.create!(:name => name)
    same_name = Item.new(:name => name)
    expect(same_name.valid?).to eq(false)
  end

  it "belongs to a list" do
    list = List.create!(:name => "a name")
    item = list.items.new(:name => "item")
    expect(item.list).to eq(list)
  end
end
