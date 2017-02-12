class User < ActiveRecord::Base
  has_secure_password

  has_one :profile, dependent: :destroy
  has_many :todo_lists, dependent: :destroy
  has_many :todo_items, through: :todo_lists, source: :todo_items

  validates :username, presence: true

  def get_completed_count
    list = TodoList.where(user_id: id)
    list.inject(0) do |sum, l|
      sum + TodoItem.where(todo_list_id: l.id, completed: true).count
    end
  end
end
