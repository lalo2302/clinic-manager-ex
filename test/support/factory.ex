defmodule ClinicApp.Factory do
  use ExMachina.Ecto #, repo: ClinicApp.Repo

  def patient_factory do
    %ClinicApp.User{
      username: Faker.Internet.user_name
      password: Faker.Lorem.characters(9)
    }
  end 
end
