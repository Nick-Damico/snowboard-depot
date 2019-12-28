class User < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, presence: true
  has_secure_password

  after_destroy :ensure_an_admin_remains
  class Error < StandardError
  end

  private
  def ensure_an_admin_remains
    raise Error.new "Cannot delete last User" if User.count.zero?
  end
end
