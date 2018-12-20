/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Nitani
 */
public class Mail {

    public boolean Send(String email, String name) {
        boolean hasil = false;
        try {

            Properties properties = new Properties();
            properties.put("mail.smtp.host", "smtp.gmail.com");
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.ssl.enable", "true");
            properties.put("mail.smtp.port", "465");//default port dari smptp

            Session session = Session.getInstance(properties);
            session.setDebug(true);

            MimeMessage pesan = new MimeMessage(session);
            pesan.setFrom("achmadeko009@gmail.com"); //isi dengan gmail kalian sendiri, biasanya sama nanti dengan username
            pesan.setRecipient(Message.RecipientType.TO, new InternetAddress(email));//isi dengan tujuan email
            pesan.setSubject(name + ", selamat datang di CV Online");
            pesan.setText("Halo " + name + ",\n"
                    + "Kami sangat senang Anda memutuskan untuk bergabung bersama kami. Beberapa fitur yang kami berikan"
                    + " untuk memudahkan anda dalam membuat CV dan mencari lowongan pekerjaan.");

            String username = "achmadeko009@gmail.com"; //ganti dengan gmail kalian sendiri
            String password = "Makoto_Yuki009"; //ganti dengan password kalian sendiri
            Transport.send(pesan, username, password);
        } catch (MessagingException ex) {
            ex.printStackTrace();
        }
        return hasil;
    }
}
