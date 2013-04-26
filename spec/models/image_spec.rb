require 'spec_helper'

describe Image do
  let(:image) { Image.new(source_url: "http://something.com/image.jpg" ) }

  context 'associations' do
    it { should have_many(:stories) }
    it { should have_many(:votes) }
  end

  context 'validations' do
    describe "without a source_url" do
      before { image.source_url = "" }
      it { should_not be_valid }
    end
  end

  describe "should return the images" do
    before(:each) do
      image.save
    end

    it "created in descending order" do
      image_created_later = Image.create(source_url: "http://something.com/image2.jpg")
      images = Image.all
      images[0].should == image_created_later
      images[1].should == image
    end
  end

end
