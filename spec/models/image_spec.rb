# == Schema Information
#
# Table name: images
#
#  id          :integer          not null, primary key
#  source_url  :string(255)
#  owner       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  votes_count :integer          default(0), not null
#

require 'spec_helper'

describe Image do
  let(:image) { Image.new(source_url: "http://something.com/image.jpg", owner: "Johny" ) }

  context 'associations' do
    it { should have_many(:stories) }
    it { should have_many(:votes) }
  end

  context 'mass assignment' do
    it { should allow_mass_assignment_of(:owner) }
    it { should allow_mass_assignment_of(:source_url) }
    it { should_not allow_mass_assignment_of(:votes_count) }
  end

  context 'validations' do
    describe "without a source_url" do
      before(:each) { image.source_url = "" }
      it { should_not be_valid }
    end

    describe "without a owner" do
      ###PROBLEM... the above before block set source_url to be blank but it doesnt reset it
      before { image.owner = "" }
      it { should be_valid }
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
