class User < ApplicationRecord
  belongs_to :organisation
  has_many :contact_list_users
  has_many :contact_lists, through: :contact_list_users
  has_many :contacts, through: :contact_lists
  has_many :tasks, dependent: :destroy
  has_many :assigned_contacts, through: :tasks, source: :contact
  has_many :completed_tasks, -> { completed }, class_name: 'Task'
  has_many :uncompleted_tasks, -> { uncompleted }, class_name: 'Task'
  has_many :uncompleted_contacts, through: :uncompleted_tasks, source: :contact
  has_many :completed_contacts, through: :completed_tasks, source: :contact

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  def self.omniauth(auth)
    User.find_by!(email: auth.info.email)
  end
end
