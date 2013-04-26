# == Schema Information
#
# Table name: stories
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  image_id    :integer          not null
#  body        :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  votes_count :integer          default(0), not null
#

require 'spec_helper'

describe Story do
  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:image) }
    it { should have_many(:votes) }
  end

  context 'mass assignment' do
    it { should_not allow_mass_assignment_of(:user_id) }
    it { should_not allow_mass_assignment_of(:image_id) }
    it { should_not allow_mass_assignment_of(:votes_count) }
    it { should allow_mass_assignment_of(:body) }
  end

  describe "when retrieving images" do
    it "should return images in desccending order based on created_at"
  end

end
