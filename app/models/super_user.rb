class SuperUser < ApplicationRecord
  has_secure_token :twitter
end
