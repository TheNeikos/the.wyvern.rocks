class User < ActiveRecord::Base
  has_secure_password
  has_paper_trail
end
