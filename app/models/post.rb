class Post < ApplicationRecord
  before_action :require_login
  belongs_to :user

end
