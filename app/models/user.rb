class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :nickname,  presence: true,
                        length: {maximum: 40}
  validates :email,     presence: true,
                        length: {maximum: 255},
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: {case_sensitive: false}
  validates :password,  presence:true
  # validates :role,      null: false #0:一般、1:ショップ、2:管理者

end
