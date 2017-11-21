class Auth < Motion::Authentication
  strategy DeviseTokenAuth
  sign_in_url "http://localhost:3000/users/sign_in"

  def self.signed_in?
    Store["token"]
  end


  def self.sign_out(&block)
    Store.delete("token")
    block.call
  end
end
