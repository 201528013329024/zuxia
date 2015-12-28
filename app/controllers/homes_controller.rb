# encoding: UTF-8
class HomesController < ApplicationController
  def index
   @m = Route.all
   # @is_order = params[:is_o]
   if  params[:order_info] == nil
     @is_order = -1
     params[:order_info] =nil
   elsif params[:order_info].to_i == 1
     @is_order = 1
     params[:order_info] = nil
   elsif params[:order_info].to_i == 0
     @is_order = 0
     params[:order_info] = nil
   end

   # if params[:user]!=nil
   #    session[:u] = params[:user]
   # end
  end


  def book_ticket
     #@m = Route.all.where start_end :params[:id]
     #@m.ticket_num = @m.ticket_num - 1
     # @is_order = Order.where :route_id => params[:format].to_i, :user=> session[:user]['name']
     @o = Order.find_by_route_id_and_user(params[:format],session[:user]['name'])
     # @is_order = @is_order1.find_by_user(session[:user]['name'])
     if @o != nil
      # if @is_order.user= session[:user]['name']
         @order_state = 1
       else
       @x =Route.find(params[:format])
       if @x.ticket_num <= 0
         @x.ticket_num =0
         @x.save!
       else
         # 票数目减1
         @x.ticket_num = @x.ticket_num - 1
         # @x.ticket_num = 2
         @x.save!

         # 产生订单
         @o = Order.new()
         @o.user = session[:user]['name']
         @o.route_id = @x.id
         @o.ticket_id = 'T-'+Time.new.strftime('%Y%m%d%H%M%S')
         @o.save!
         @order_state = 0
       end
      end
     # puts @x
     redirect_to homes_index_path(:order_info=>@order_state)
  end

  def login
     if (params[:email]!=nil) && (params[:pwd]!=nil)
        @e = params[:email][:email]
        @p = params[:pwd]
        # @u = User.all.where name:@n,password:@p
        @u = User.find_by_email(@e)
        if @u!=nil
          if(@u.password==@p)
            @t='登录成功'
            # session[:user] = params[:name][:name]
            session[:user] = @u
            redirect_to homes_index_path()
          else  @t='账号或密码错误'
          end
        end

     end
  end

  def logout
    session[:user] = nil
    redirect_to homes_index_path()
  end

  def register
      if (params[:name]!=nil) && (params[:pwd]!=nil) && (params[:email]!=nil) && (params[:tel]!=nil)
        @register_name = params[:name][:name]
        @register_pwd = params[:pwd]
        @register_email = params[:email][:email]
        @register_tel = params[:tel][0]
        # @register_role = params[:role]

        if @register_name == ''
          @name_info = '(用户名不能为空！)'
        end

        if @register_pwd == ''
          @pwd_info = '(密码不能为空!)'
        end

        if @register_email == ''
          @email_info = '(邮箱不能为空!)'
        end

        if @register_tel == ''
          @tel_info = '(电话不能为空!)'
        end

        if  (@register_name != '') &&
            (@register_pwd != '') &&
            (@register_email != '') &&
            (@register_tel != '')
            if User.find_by_email(@register_email)!=nil
              @info = '该邮箱已注册，请更换邮箱！'
            elsif
              @u=User.new();
              @u.name = @register_name
              @u.email = @register_email
              @u.password = @register_pwd
              @u.role = 'student'
              @u.telephone_number = @register_tel
              @u.save!
              session[:user] = @u
              redirect_to homes_index_path
            end
        end
      end
  end

  def edit_userinfo

  end

  def editing_userinfo

       # if params[:need_edit]
        @u = User.find(session[:user]['id'])
        @u.name= params[:name]
        @u.password = params[:pwd]
        @u.telephone_number = params[:tel]
        @u.save!
        session[:user] = @u
        redirect_to homes_userinfo_path
       # end
  end

  def edit_userinfo

  end

  def future_order
    if session[:user]!=nil
      @order = Order.all.where user:(session[:user]['name'])
    end
  end

  def last_order
    if session[:user]!=nil
      @order = Order.all.where user:(session[:user]['name'])
    end
  end

  def return_ticket
    @order = Order.find(params[:return_id])
    @order.destroy
    redirect_to homes_future_order_path
  end
end
