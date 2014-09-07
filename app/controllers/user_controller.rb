class UserController < UIViewController

  attr_accessor :user

  def initWithUser(user)
    initWithNibName(nil, bundle:nil)
    self.user = user 
    self
  end

  def viewDidLoad
    super
    self.title = "#{self.user.first_name} #{self.user.last_name}"

  end

end
