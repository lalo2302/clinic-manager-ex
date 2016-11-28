defmodule ClinicApp.AppointmentType do
  @types %{first_time: "primera vez", routine: "rutina", following: "seguimiento"}

  def first_time do
    @types.first_time
  end

  def routine do
    @types.routine
  end

  def following do
    @types.following
  end

  def types do
    @types
  end

  def random do
    Enum.take_random(@types, 1)
  end
end
