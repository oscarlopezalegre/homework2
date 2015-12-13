class Friend < ActiveRecord::Base
	belongs_to :friend1, :foreign_key => :friend1_id, class_name: 'User'
    belongs_to :friend2, :foreign_key => :friend2_id, class_name: 'User'


  scope :friends, -> (friend1_in, friend2_in) do
    where("(friends.friend1_id = ? AND friends.friend2_id =?) OR (friends.friend2_id = ? AND friends.friend1_id =?)",friend1_in, friend2_in, friend1_in, friend2_in )
  end

  scope :myfriends, -> (friend1_in) do
    where("(friends.friend1_id = ? OR friends.friend2_id =?)",friend1_in, friend1_in)
  end


end
