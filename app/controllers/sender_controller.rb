class SenderController < ApplicationController
  require 'mailgun-ruby'
  @taskos = @taskos = Taskin.all

# olha o elemento, se o elemento tiver com o done em 0 entao ele reseta o  tempo de cooldown
  def ass_list(taskos, obj, done)
    if done == 0 or done == '0' then 
      @taskos[:done] = taskos[:cooldown]
      @taskos.save
      return obj
    else
      aj = @taskos[:done].to_i - 1
      @taskos = aj.to_s
      return nil

    end
  end



  def index
    mg_client = Mailgun::Client.new 'your-api-key'
    message_params = Mailgun::MessageBuilder.new
    

    @taskas = Taskin.all
    
    task_list = []
    task_str = ''
   

    # iterate over our taskin model
    i = 1
    loop do
      begin
        @taskos = Taskin.find(i)
      rescue
        @taskos = Taskin.find(i-1)
        break
      end
      task_list[i-1] = ass_list(@taskos, @taskos[:obj], @taskos[:done])

      if task_list[i-1] == nil 
      else 
        task_str += task_list[i-1] + ' , '
      end

      puts(task_list[i-1])
      i += 1
      if i == 20
        break
      end  
    end





	# Define your message parameters
    message_params =  { from: 'you@domain.com',
                    to:   'dionisiocod@gmail.com',
                    subject: 'teste gmail',
                    text: task_str
                    
                  }
                  
    
    if message_params[:text] == '' then
      puts('ta repitido')
    else
      mg_client.send_message 'your_domain', message_params
    end

	end
end
