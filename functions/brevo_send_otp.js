require("dotenv").config();
const SibApiV3Sdk = require("@sendinblue/client");

// دالة لتوليد كود عشوائي (OTP)
const generateOTP = () => Math.floor(100000 + Math.random() * 900000);

const brevoSendOtp = async (email) => {
  const otp = generateOTP();

  // إعداد الاتصال بخدمة Brevo
  const client = new SibApiV3Sdk.TransactionalEmailsApi();
  client.setApiKey(SibApiV3Sdk.TransactionalEmailsApiApiKeys.apiKey, process.env.brevoApiKey);

  // إعداد الرسالة
  const sendSmtpEmail = {
    to: [{ email }],
    sender: { email: "moalgouker@gmail.com", name: "دورات المنارة" },
    subject: "رمز التحقق (OTP)",
    htmlContent: `
      <div style="direction:rtl;font-family:Tahoma;">
        <h2>رمز التحقق الخاص بك</h2>
        <p style="font-size:20px;"><b>${otp}</b></p>
        <p>لا تشاركه مع أحد وصلي على النبي يا ملك 🌹</p>
      </div>
    `,
  };

  try {
    await client.sendTransacEmail(sendSmtpEmail);
    console.log(`✅ OTP (${otp}) sent to ${email}`);
    return otp;
  } catch (err) {
    console.error("❌ Error sending OTP:", err);
    return null;
  }
};

module.exports = {brevoSendOtp} ;
