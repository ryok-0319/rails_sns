ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
address: 'smtp.gmail.com',
domain: 'gmail.com',
port: 587,
user_name: 'ryo.k.0319.tan2@gmail.com',
password: 'utut0319',
authentication: 'plain',
enable_starttls_auto: true
}
