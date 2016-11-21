module Controllers
  module SessionHelpers
    def login(email, password)
      post :create, params: {session: {
        email: email,
        password: password
      } }
    end
  end
end