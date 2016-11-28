defmodule ClinicApp.LevelType do
  @types %{patient: "paciente", doctor: "doctor", administrative: "adm"}

  def patient do
    @types.patient
  end

  def doctor do
    @types.patient
  end

  def administrative do
    @types.administrative
  end

  def random do
    Enum.take_random(@types, 1)
  end

  def types do
    @types
  end
end
