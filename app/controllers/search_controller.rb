class SearchController < UIViewController
  def viewDidLoad
    super

    self.title = "Search"

    self.view.backgroundColor = UIColor.whiteColor

    @text_field = UITextField.alloc.initWithFrame [[0,0], [160, 26]]
    @text_field.placeholder = "User ID"
    @text_field.textAlignment = UITextAlignmentCenter
    @text_field.autocapitalizationType = UITextAutocapitalizationTypeNone
    @text_field.borderStyle = UITextBorderStyleRoundedRect
    @text_field.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 100)
    self.view.addSubview @text_field

    @search = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @search.setTitle("Search", forState:UIControlStateNormal)
    @search.setTitle("Loading", forState:UIControlStateDisabled)
    @search.setTitleColor(UIColor.lightGrayColor, forState:UIControlStateDisabled)
    @search.sizeToFit
    @search.center = CGPointMake(self.view.frame.size.width / 2, @text_field.center.y + 40)
    self.view.addSubview @search

    @search.when(UIControlEventTouchUpInside) do
      @search.enabled = false
      @text_field.enabled = false

      user_id = @text_field.text

      User.find(user_id) do |user|
        if user.nil?
          @search.setTitle("None :(", forState: UIControlStateNormal)
        else
          @search.setTitle("Search", forState: UIControlStateNormal)
          self.open_user(user)
        end

        @search.enabled = true
        @text_field.enabled = true
      end
    end
  end

  def open_user(user)
    puts "open_user #{user.inspect}"
    self.navigationController.pushViewController(UserController.alloc.initWithUser(user), animated:true)
  end
end
