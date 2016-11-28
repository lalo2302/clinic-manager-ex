defmodule ClinicApp.GenderType do
  @types %{female: "F", male: "M", other: "O"}
  def female do
    @types.female
  end

  def male do
    @types.male
  end

  def other do
    @types.other
  end

  def random do
    Enum.take_random(@types, 1)
  end

  def types do
    @types
  end
end
