package util;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author IU-CSE Team
 */

public class MailService {

    private static final String REPLY_TO = "no_reply@ecommercebook2016.com";
    private static final String SUB_SUBJECT = "E-Commerce Communication";
    private static final String MAIL_ADDRESS = "ecommercebook2016@gmail.com";
    private static final String MAIL_PASSWORD = "3c0mm3rc3b00k2k16";

    public static void transportMail(Session session, String toMail, String subject, String body) {
        try {
            MimeMessage msg = new MimeMessage(session);

            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.addHeader("format", "flowed");
            msg.addHeader("Content-Transfer-Encoding", "8bit");

            msg.setFrom(new InternetAddress(REPLY_TO, SUB_SUBJECT));
            msg.setReplyTo(InternetAddress.parse(REPLY_TO, false));

            msg.setSubject(subject, "UTF-8");
            msg.setText(body);
            msg.setSentDate(new Date());
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toMail, false));

            Transport.send(msg);
            System.out.println("Sent mail successfully");

        } catch (UnsupportedEncodingException | MessagingException e) {
            System.out.println("Mail Service Exception:" + e);
        }
    }

    public static void sendMail(String recipientAddress, String content) {

        final String toMail = recipientAddress;
        Properties properties = new Properties();

        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.socketFactory.port", "465");
        properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.port", "465");

        Authenticator authenticator = new Authenticator() {

            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(MAIL_ADDRESS, MAIL_PASSWORD);
            }
        };

        Session session = Session.getDefaultInstance(properties, authenticator);
        transportMail(session, toMail, SUB_SUBJECT, content);
    }
}

