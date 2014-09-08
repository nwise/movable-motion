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

    self.edgesForExtendedLayout = UIRectEdgeNone

    @info_container = UIView.alloc.initWithFrame [[0, 0], [self.view.frame.size.width, self.view.frame.size.height]]
    @info_container.backgroundColor = UIColor.whiteColor
    self.view.addSubview @info_container

    @email_label = UILabel.alloc.initWithFrame [[10, 30], [0, 0]]
    @email_label.text = "Email:"
    @email_label.sizeToFit
    self.view.addSubview @email_label

    @email_value = UILabel.alloc.initWithFrame [[70, 30], [0, 0]]
    @email_value.text = self.user.email
    @email_value.sizeToFit
    self.view.addSubview @email_value

    @dob_label = UILabel.alloc.initWithFrame [[10, 60], [0, 0]]
    @dob_label.text = "DOB:"
    @dob_label.sizeToFit
    self.view.addSubview @dob_label

    @dob_value = UILabel.alloc.initWithFrame [[70, 60], [0, 0]]
    @dob_value.text = self.user.date_of_birth
    @dob_value.sizeToFit
    self.view.addSubview @dob_value

    @id_label = UILabel.alloc.initWithFrame [[10, 90], [0, 0]]
    @id_label.text = "ID:"
    @id_label.sizeToFit
    self.view.addSubview @id_label

    @id_value = UILabel.alloc.initWithFrame [[70, 90], [0, 0]]
    @id_value.text = self.user.id.to_s
    @id_value.sizeToFit
    self.view.addSubview @id_value
    
    @height_label = UILabel.alloc.initWithFrame [[10, 120], [0, 0]]
    @height_label.text = "Height:"
    @height_label.sizeToFit
    self.view.addSubview @height_label

    @height_value = UILabel.alloc.initWithFrame [[70, 120], [0, 0]]
    @height_value.text = self.user.height.to_s + " in."
    @height_value.sizeToFit
    self.view.addSubview @height_value
  end

end
