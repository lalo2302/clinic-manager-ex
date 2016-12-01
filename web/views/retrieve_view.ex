defmodule ClinicApp.RetrieveView do
  use ClinicApp.Web, :view

  def render("show_drugs.json", %{drugs: drugs}) do
    %{drugs: render_many(drugs, ClinicApp.RetrieveView, "drug.json")}
  end

  def render("existent_appointments.json", %{dates: dates}) do
    %{appointments: render_many(dates, ClinicApp.RetrieveView, "appointment_hour.json")}
  end

  def render("appointment_hour.json", %{retrieve: date}) do
    [myDate, hour] = String.split(Ecto.DateTime.to_string(date))
    %{hour: hour}
  end

  def render("appointment_day.json", %{appointments: appointments}) do
    %{appointments: render_many(appointments, ClinicApp.RetrieveView, "appointment_day.json")}
  end

  def render("drug.json", %{retrieve: drug}) do
    %{id: drug.id, 
     name: drug.name, 
     quantity: drug.quantity, 
     price: drug.sell_price }
  end

  def render("appointment_day.json", %{retrieve: appointment}) do
    patient = appointment.patient
    %{appointment_id: appointment.id,
      patient_id: patient.id,
      patient_name: patient.name}
  end

  def render("appointment.json", %{appointment: appointment}) do
    patient = appointment.patient
    doctor = appointment.employee
    %{date: appointment.date,
     patients_name: patient.name,
     doctors_name: doctor.name}
  end

  def render("patients.json", %{patients: patients}) do
    %{patients: render_many(patients, ClinicApp.RetrieveView, "basic_patient.json")} 
  end

  def render("patient.json", %{patient: patient}) do
    %{patient: render_one(patient, ClinicApp.RetrieveView, "patient.json")}
  end

  def render("patient.json", %{retrieve: patient}) do
    %{name: patient.name,
     last_name: patient.last_name,
     date_of_birth: patient.date_of_birth,
     address: patient.address,
     phone: patient.phone,
     gender: patient.gender,
     curp: patient.curp,
     rfc: patient.rfc,
     email: patient.email,
     clinical_history_id: patient.clinical_history.id}
  end

  def render("basic_patient.json", %{retrieve: patient}) do
    clinical_history = patient.clinical_history
    %{id: patient.id,
     name: patient.name,
     id_clinic_history: clinical_history.id}
  end

  def render("patient_appointments.json", %{appointments: appointments}) do
    %{ appointments: render_many(appointments, ClinicApp.RetrieveView, "patient_appointment.json") }
  end

  def render("patient_appointment.json", %{retrieve: appointment}) do
    doctor = appointment.employee
    %{id: appointment.id,
     date: appointment.date,
     type: appointment.type,
     satisfaction: appointment.satisfaction,
     status: appointment.status,
     doctors_name: doctor.name}
  end

  def render("specialties.json", %{specialties: specialties}) do
    %{specialties: render_many(specialties, ClinicApp.RetrieveView, "specialty.json")}
  end

  def render("specialty.json", %{retrieve: specialty}) do
    %{id: specialty.id,
     name: specialty.name,
     description: specialty.description,
     opening_time: specialty.opening_time,
     closing_time: specialty.closing_time,
     extension: specialty.extension,
     cost: specialty.cost}
  end

  def render("clinical_history.json", %{ailments: ailments, antecedents: antecedents, last_exploration: last_exploration}) do
    %{ailments: render_many(ailments, ClinicApp.RetrieveView, "ailment.json"),
     antecedents: render_many(antecedents, ClinicApp.RetrieveView, "antecedent.json"),
     last_exploration: render_one(last_exploration, ClinicApp.RetrieveView, "physical_exploration.json")}
  end

  def render("ailment.json", %{retrieve: ailment}) do
    %{main_symptom: ailment.main_symptom,
     date_of_detection: ailment.date_of_detection,
     symptom_location: ailment.symptom_location,
     colateral_symptom: ailment.colateral_symptom,
     end_date: ailment.end_date} 
  end

  def render("antecedent.json", %{retrieve: antecedent}) do
    %{name: antecedent.name,
     description: antecedent.description,
     type: antecedent.type}
  end

  def render("physical_exploration.json", %{retrieve: exploration}) do
    %{temperature: exploration.temperature,
     blood_pressure: exploration.blood_pressure,
     heart_rate: exploration.heart_rate,
     breathing_frec: exploration.breathing_frec,
     observations: exploration.observations}
  end

  def render("study.json", %{study: study}) do
    s = hd(study)
    %{id: s.id,
     date: s.date,
     diagosis: s.diagnosis,
     result: s.result,
     indications: s.indications,
     treatment: s.treatment}
  end
   def render("clinics.json", %{clinics: clinics}) do
    %{clinics: render_many(clinics, ClinicApp.RetrieveView, "clinic.json")}
    end

    def render("clinic.json", %{retrieve: clinic}) do
      %{id: clinic.id,
       name: clinic.name,
       address: clinic.address,
       phone: clinic.phone,
       manager: clinic.manager,
       email: clinic.email,
       opening_time: clinic.open_time,
       closing_time: clinic.close_time,
       open_days: clinic.open_days}
    end

    def render("study_list.json", %{studies: studies}) do
      %{studies: render_many(studies, ClinicApp.RetrieveView, "basic_study.json")}
    end

    #TODO: make type
    def render("basic_study.json", %{retrieve: study}) do
      %{id: study.id,
       date: study.date,
       diagnosis: study.diagnosis}
    end

    def render("doctors.json", %{doctors: doctors}) do
      %{doctors: render_many(doctors, ClinicApp.RetrieveView, "doctor.json")}
    end

    def render("doctor.json", %{retrieve: doctor}) do
      specialty = doctor.specialty
      %{id: doctor.id,
       specialty: specialty.name,
       name: doctor.name}
    end
end
