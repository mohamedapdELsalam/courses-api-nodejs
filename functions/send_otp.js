const nodemailer = require("nodemailer");
const app_errors = require("../utls/app_errors");

const generateOTP = () => Math.floor(100000 + Math.random() * 900000);

const sendOtp = async  (email,req,res,next) => {

 
  const otp = generateOTP();

  const transporter = nodemailer.createTransport({
    host: "smtp.gmail.com",
    port: 587,
    secure: false, // مهم جدًا
    auth: {
      user: "moalgouker@gmail.com",
      pass: "xkui mzqt vbii jfqu"
    },
    tls: {
      rejectUnauthorized: false // الحل للمشكلة
    }
  });

  const mailOptions = {
    from: '"دورات المنارة" <moalgouker@gmail.com>',
    to: email,
    subject: "Your OTP Code",
    text: `Your verification code is: ${otp}`,
    html: `<h2>Your OTP Code \n لا تشاركه مع احد وصلي علي النبي يا ملك"</h2><p><b>${otp}</b></p>`
  };

  try {
    await transporter.sendMail(mailOptions);
    console.log(`✅ OTP: (${otp}) sent to:`, email);
    return otp;
  } catch (err) {
    console.error("❌ Error sending OTP:", err);
   const error =  app_errors.create(err,200,"fail");
   next(error);
    return null;
  }
};

module.exports = { sendOtp };
