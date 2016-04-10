class User < ActiveRecord::Base
  has_secure_password

  # associations
  has_many :ownerships
  has_many :projects, through: :ownerships

  # validations
  validates :name, presence: :true
  validates :name, uniqueness: true

  def has_ownership?(project)
    ownerships.map(&:project_id).include?(project.id) ? true : false
  end

  def has_scrum_role?(project)
    ownerships.where(project_id: project.id).first.role.name == 'Developer' ? true : false
  end

  def includes_scrum_role?(project, role)
    project.ownerships.pluck(:role_id).include?(role.id) ? true : false
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver_now
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
