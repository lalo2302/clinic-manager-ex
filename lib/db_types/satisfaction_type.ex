defmodule ClinicApp.SatisfactionType do

  def valid?(number) when number > 0 and number < 6, do: true

  def valid?(_number), do: false
end
