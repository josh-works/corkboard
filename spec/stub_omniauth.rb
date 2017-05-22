

def stub_omniauth

  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
               {"provider"=>"facebook",
                "uid"=>"1446022172087896",
                "info"=>
                 {"email"=>"rileyt_111@hotmail.com", "name"=>"Riley Thompson", "image"=>"http://graph.facebook.com/v2.6/1446022172087896/picture"},
               "credentials"=>
                {"token"=>"EAAEIqnB7ZBaUBAMv6NF33UjsROKwqUTAxVlkjL8TZBCN2ZAIe5cD5opiOyEeNZATMRjfZBhTBTcudc16Lumi4wihtNSBAarhJNQLLPZBZBhQGZA1Thd960ZBi8FcvnyVEe6MN4wZBigxyD13WY1JEi1hgnHHVv1uIcpz8ZD",
               "expires_at"=>1500399754, "expires"=>true},
               "extra"=>
               {"raw_info"=>
                 {"name"=>"Riley Thompson", "email"=>"rileyt_111@hotmail.com", "id"=>"1446022172087896"}}})


end
