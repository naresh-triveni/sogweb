class HomeController < ApplicationController
  def index
  end

  def new_vm

  end

  def create_vm
    errors = {}
    hostName = ''
    inputPassword = ''
    if params[:hostName].nil? || params[:hostName].blank?
      errors[:hostName] = 'Please enter Host Name'
    else
      hostName = params[:hostName]
    end
    if params[:inputPassword].nil? || params[:inputPassword].blank?
      errors[:inputPassword] = 'Please enter Root Password'
    else
      inputPassword = params[:inputPassword]
    end

    if errors.blank?
      execute('/var/www/html/rails/script/one.py', [hostName, inputPassword])
    end
    redirect_to new_vm_path
  end

  def execute(p_file, args)
    # args_str = args.join(' ')
    # dt = system("/usr/bin/python #{p_file} #{args_str}")
    IO.popen(["/usr/bin/python", p_file]).read
  end

  def testing()
    script_path = "#{Rails.root}/../scripts/prototype-1.0/scripts/listing_domains.py"
    # script_path = "#{Rails.root}/../script/test.py"
    dt = execute(script_path, [])
    p "IN RAILS"
    dt = JSON.parse(dt)
    render text: "Thanks"
  end
end
