<<<<<<< HEAD
class Reservation < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  belongs_to :group, foreign_key: 'group_id'
end
=======
class Reservation < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :group, foreign_key: 'group_id'
end
>>>>>>> develop
