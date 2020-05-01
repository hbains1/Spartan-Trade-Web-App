package Helper;

import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @date 2020-3-6 16:41:57
 * @author Yi Qiu
 */
public class EmailHandler {

    Session mailSession;
    Properties props = new Properties();

    public EmailHandler(String _username, String _password, String _server) {
        
        SetProps(_server);
        
        this.mailSession = Session.getInstance(this.props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(_username, _password);
            }
        });
    }

    public boolean sendMail(String _To, String _subject, String _content) {

        try {

            Message Msg = new MimeMessage(this.mailSession);
            Msg.setFrom();
            Msg.addRecipients(Message.RecipientType.TO, InternetAddress.parse(_To));
            Msg.setSubject(_subject);
            Msg.setContent(_content, "text/html;charset=UTF-8");
            Msg.setSentDate(new Date());
            Transport.send(Msg);
//            Transport t = this.mailSession.getTransport();
//            t.sendMessage(Msg, Msg.getAllRecipients());

        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

    private void SetProps(String _server) {
        switch (_server) {
            case "Gmail":
                this.props = gmailTLS();
                break;
            default:
                throw new RuntimeException("Not supported smtp server");
        }
    }

    private static Properties gmailTLS() {
        Properties gtls = new Properties();

        gtls.put("mail.smtp.auth", "true");
        gtls.put("mail.smtp.starttls.enable", "true");
        gtls.put("mail.smtp.host", "smtp.gmail.com");
        gtls.put("mail.smtp.port", "587");

        return gtls;
    }
}
