class CompanyMailer < ActionMailer::Base
  default from: "francocaldas@gmail.com"

  def new_comment(job, comment)
    @job = job
    @comment = comment
    @company = job.company

    mail to: @company.email
  end
end
