require_relative "helper_spec"

describe Label do
  before :each do
    @label = Label.new("Title", "red")
  end

  it "The label should be an instance of the Label class" do
    expect(@label).to be_an_instance_of Label
  end

  it "The label should be able to be mapped" do
    expect(@label.map_label).to be_a Hash
  end
end
