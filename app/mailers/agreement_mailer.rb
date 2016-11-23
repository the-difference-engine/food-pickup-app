class AgreementMailer < ApplicationMailer
  def send_agreement(pdf, current_donor)
    attachments["Agreement_#{current_donor.business_name}_#{Date.today.iso8601}.pdf"] = {
      mime_type: 'application/pdf',
      content: pdf
    }
    mail(
    to: [current_donor.email, 'tde.rescue.leftover.cuisine@gmail.com'], 
    subject: "RLC_Agreement_#{current_donor.business_name}_#{Date.today.iso8601}"
    )
  end
end
