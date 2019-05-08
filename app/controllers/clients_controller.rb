class ClientsController < ApplicationController
	def new
		@client = Client.new
	end

	def create
		@client = Client.new(client_params)

		if @client.valid?
			response = HTTParty.post(ENV['LEAD_API_URI']+'/api/v1/create', {  
		  body: request_body(@client), 
          headers: {
            'Content-Type' => 'application/x-www-form-urlencoded',
            'charset' => 'utf-8'
          }
      })

      interpret_response(response)

    else
      render 'new'


		end
	end

	private

     def request_body(client)
	  	body = "access_token=#{ENV['LEAD_API_ACCESS_TOKEN']}&pGUID=#{ENV['LEAD_API_PGUID']}" \
		        "&pAccName=#{ENV['LEAD_API_PACCNAME']}&pPartner=#{ENV['LEAD_API_PPARTNER']}" \
		        "&name=#{client.full_name}&business_name=#{client.business_name}" \
		        "&telephone_number=#{client.tel_num}&email=#{client.email}"
	 end

	 def interpret_response(response)
	    error_string = "Appologies, we couldn't accept your contact request" \
	                 " Please try again."
	    if response.code == 201
	      flash[:success] = "#{@client.full_name}, Thank you for your submission!" \
	                        " Make it cheaper executive will contact back soon"
	      redirect_to root_path 
	    elsif response.code == 400
	      flash[:danger] = "Bad Request (validation errors)"
	      render 'new'
	    elsif response.code == 401
	      flash[:danger] = "Unauthorized access_token"
	      render 'new'  
	    elsif response.code == 404
	      flash[:danger] = "The page you were looking for doesn't exist"
	      render 'new'   
	    elsif response.code == 500
	      flash[:danger] = "Internal server error"
	      render 'new'   
	    else
	      flash[:danger] = error_string
	      render 'new'
	    end

	  end


	def client_params
		params.require(:client).permit(:full_name,:business_name,:email,:tel_num)
	end
end
