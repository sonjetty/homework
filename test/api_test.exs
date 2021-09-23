defmodule ApiTestTest do
  use ExUnit.Case

  test "get single user test" do
      resp = HTTPoison.get!("https://reqres.in/api/users/2")
      assert resp.status_code == 200
      #converts the response body to something elixir can read and compares the data with what we are expecting
      bodydecoded =  JSON.decode!("#{resp.body}")
      comparison = %{"avatar" => "https://reqres.in/img/faces/2-image.jpg", "email" => "janet.weaver@reqres.in", "first_name" => "Janet", "id" => 2, "last_name" => "Weaver"}
      assert bodydecoded["data"] == comparison

  end
end
