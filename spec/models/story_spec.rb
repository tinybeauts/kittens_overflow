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
  pending "add some examples to (or delete) #{__FILE__}"
end
