class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # Callback
  after_create :set_statistic


  # Validations
  validates :first_name, presence: true, length: {minimum:3}, on: :update, unless: :reset_password_token_present?
  validates :last_name, presence: :true, length: {minimum:3}, on: :update, unless: :reset_password_token_present?

  has_one :user_profile

  accepts_nested_attributes_for :user_profile, reject_if: :all_blank

  #Virtual Attributte
  def full_name
    [self.first_name, self.last_name].join(' ') if self.first_name && self.last_name
  end

  private

  def set_statistic
    AdminStatistic.set_event(AdminStatistic::EVENTS[:total_users])
  end

  def reset_password_token_present?
    !!$global_params[:user][:reset_password_token]
  end

end
