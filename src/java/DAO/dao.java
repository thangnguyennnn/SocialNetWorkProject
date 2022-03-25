package DAO;

import connectDB.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Random;
import java.util.regex.Pattern;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.Attachment;
import model.Comment;
import model.Conversation;
import model.Post;
import model.account;
import model.calTime;
import model.confirmCode;
import model.containerChat;
import model.datingAccount;
import model.datingDetail;
import model.datingMatch;
import model.datingProfile;
import model.friend;
import model.messages;
import model.notification;
import model.report;
import model.userInformation;
import model.userPhoto;

public class dao {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public account checkLogin(String email, String password) {
        try {
            String sql = "select * from Account,(SELECT CONVERT(VARCHAR(32), HashBytes('MD5', '" + password + "'), 2) as md5) mh\n"
                    + "where email = ? and [password] = mh.md5";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            //ps.setString(1, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new account(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public String getChatBox(String user1, String user2) {
        try {
            String sql = "select conversationID from Participant where userID1 = ? and userID2 = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, user1);
            ps.setString(2, user2);
            rs = ps.executeQuery();
            while (rs.next()) {
                if (!rs.getString(1).equals("NULL")) {
                    return rs.getString(1);
                }
            }
            con.close();
        } catch (Exception e) {
        }
        return "";
    }

    public boolean creatBoxChat(String id1) {
        try {
            String sql = "Insert into Conversation values (?,'','1','1')";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id1);
            int n = ps.executeUpdate();
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public userInformation getInforSessionLogin(account a) {

        try {
            String sql = "select * from UserInformation where userID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, a.getUserId());
            rs = ps.executeQuery();

            while (rs.next()) {
                return new userInformation(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(6).trim(),
                        rs.getString(5).trim(),
                        rs.getString(4).trim(),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15),
                        rs.getString(16),
                        rs.getString(17),
                        rs.getString(18),
                        rs.getString(19),
                        rs.getString(20),
                        rs.getString(21));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public userInformation getUserInfo(String uID) {

        try {
            String sql = "select * from userInformation where userID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, uID);
            rs = ps.executeQuery();

            while (rs.next()) {
                return new userInformation(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(6).trim(),
                        rs.getString(5).trim(),
                        rs.getString(4).trim(),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15),
                        rs.getString(16),
                        rs.getString(17),
                        rs.getString(18),
                        rs.getString(19),
                        rs.getString(20),
                        rs.getString(21));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<friend> getListFriendByUser(account a) {

        try {
            String sql = "select f.userID,firstName,middleName,lastName,avatar,Account.[status],f.[status]\n"
                    + "                        from Account, (select userID,firstName,middleName,lastName,avatar,[status]\n"
                    + "                                            from UserInformation, (select userID2,[status]\n"
                    + "                            					from Participant where userID1 = ? and [status] = 1) friend\n"
                    + "                                           where UserInformation.userID = friend.userID2) f\n"
                    + "                            where f.userID = Account.userID";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, a.getUserId());

            rs = ps.executeQuery();

            List<friend> list = new ArrayList();
            while (rs.next()) {

                list.add(new friend(rs.getString(1), rs.getString(4).trim() + " " + rs.getString(3).trim() + " " + rs.getString(2).trim(), rs.getString(5), rs.getInt(6), rs.getString(7)));
            }

            return list;

        } catch (Exception e) {
        }
        return null;
    }

    public List<friend> getListRequestByUser(account a) {
        try {
            String sql = "select f.userID,firstName,middleName,lastName,avatar,f.[status]\n"
                    + "from Account, (select userID,firstName,middleName,lastName,avatar,status\n"
                    + "                from UserInformation, (select userID2,status\n"
                    + "					from Participant where userID1 = ? and status = 2) friend\n"
                    + "                where UserInformation.userID = friend.userID2) f\n"
                    + "where f.userID = Account.userID";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, a.getUserId());
            rs = ps.executeQuery();
            List<friend> list = new ArrayList();

            while (rs.next()) {
                list.add(new friend(rs.getString(1), rs.getString(4).trim() + " " + rs.getString(3).trim() + " " + rs.getString(2).trim(), rs.getString(5), 0, rs.getString(6)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public String ramdomCofirmCode() {
        Random r = new Random();
        int n = r.nextInt((999999 - 100000) - 1) + 100000;
        return n + "";
    }

    public confirmCode sendCofrimCode(String emailRecevie, String cofirmCode) throws AddressException, MessagingException {
        Properties mailServer;
        Session getMailSession;
        MimeMessage mailMessage;

        mailServer = System.getProperties();
        mailServer.put("mail.smtp.port", "587");
        mailServer.put("mail.smtp.auth", "true");
        mailServer.put("mail.smtp.starttls.enable", "true");

        getMailSession = Session.getDefaultInstance(mailServer, null);
        mailMessage = new MimeMessage(getMailSession);

        mailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(emailRecevie));
        Date d = new Date();
        int hour = d.getHours();
        int minute = d.getMinutes();
        int second = d.getSeconds();
        String time = hour + ":" + minute + ":" + second;
        confirmCode cc = new confirmCode(cofirmCode, time);
        mailMessage.setSubject("He Thong TOP TOP");
        mailMessage.setText("Ma xac nhan cua ban là: " + cofirmCode + ". Vui long khong chia se ma nay voi ai khac de dam bao an toan thong tin cua ban. Thoi gian hieu luc 5 phut! Thoi gian gui: " + time);

        Transport tp = getMailSession.getTransport("smtp");

        tp.connect("smtp.gmail.com", "hethongswp301@gmail.com", "42501002nht");
        tp.sendMessage(mailMessage, mailMessage.getAllRecipients());
        tp.close();

        return cc;
    }

    public userPhoto getUserPhotos(String uID) {
        try {
            String sql = "select * from UserPhoto where user_id = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, uID);
            rs = ps.executeQuery();

            while (rs.next()) {
                return new userPhoto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public String maHoaMatKhau(String mk) {
        try {
            String sql = "SELECT CONVERT(VARCHAR(32), HashBytes('MD5', '" + mk + "'), 2) as md5";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString("md5");
            }
        } catch (Exception e) {
        }
        return "";
    }

    public void updatePass(String email, String newPass) {
        String newP = maHoaMatKhau(newPass);
        try {
            String sql = "update Account set password = ? where email = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, newP);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public boolean checkEmailExit(String email) {
        try {
            String sql = "select * from account where email = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                return false;
            }
        } catch (Exception e) {
        }
        return true;
    }

    public String creatIDUser() {
        try {
            String sql = "select count(*) from Account";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            String num = "";
            while (rs.next()) {
                num = rs.getString(1);
            }
            Date da = new Date();
            int day = da.getDate();
            int month = da.getMonth() + 1;
            int year = da.getYear() - 100;
            String ms = day + "" + month + "" + year;
            int n = Integer.parseInt(ms);

            return ms + "0000" + Integer.parseInt(num);
        } catch (Exception e) {
        }
        return null;
    }

    public boolean addNewAccout(account a) {
        String mk = maHoaMatKhau(a.getPassword());
        try {
            String sql = "Insert into Account values(?,?,?,?,'False')";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, a.getUserId());
            ps.setString(2, a.getEmail());
            ps.setString(3, mk);
            ps.setInt(4, a.getStatus());
            //ps.setString(5, a.getCreatTime());

            int n = ps.executeUpdate();
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean addUserInformation(userInformation u) {
        try {
            String sql = "insert into UserInformation values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getUserId());
            ps.setString(2, u.getAvatar());
            ps.setString(3, u.getBackground());
            ps.setString(4, u.getFirstName());
            ps.setString(5, u.getMiddleName());
            ps.setString(6, u.getLastName());
            ps.setString(7, u.getBirthdate());
            ps.setString(8, u.getSex());
            ps.setString(9, u.getPhone());
            ps.setString(10, u.getEmail());
            ps.setString(11, u.getAddress());
            ps.setString(12, u.getEducation());
            ps.setString(13, u.getJob());
            ps.setString(14, u.getHobbie());
            ps.setString(15, u.getOrther());
            ps.setString(16, u.getImgfile());
            ps.setString(17, u.getFbLink());
            ps.setString(18, u.getIgLink());
            ps.setString(19, u.getEmailLink());
            ps.setString(20, u.getTweetLink());
            ps.setString(21, u.getCreatAt());
            int n = ps.executeUpdate();
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public String checkEmail(String email) {
        try {
            String sql = "select * from Account where email = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString("userID");
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<datingAccount> getListDatingAccount(String gender, int index) {
        try {
            List<datingAccount> list = new ArrayList<>();
            String sql = "select * from DatingProfile D, UserInformation U\n"
                    + "where D.userID = U.userID and sex like ? and active = 2\n"
                    + "order by NEWID() OFFSET 0 rows fetch next ? rows only";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + gender + "%");
            ps.setInt(2, index);
            rs = ps.executeQuery();
            while (rs.next()) {
                String str = rs.getString("birthDate");
                String[] parts = str.split(Pattern.quote("-"));

                Date date = new Date();
                int year = date.getYear() + 1900;
                int age = year - Integer.parseInt(parts[0]);
                String name = rs.getString("lastName").trim() + " " + rs.getString("middleName").trim() + " " + rs.getString("firstName").trim();

                if (!rs.getString("image1").equals("")) {
                    list.add(new datingAccount(rs.getString("userID"), rs.getString("nickName"), name, rs.getString("sex"), age, rs.getString("location"), rs.getString("image1")));
                } else if (!rs.getString("image2").equals("")) {
                    list.add(new datingAccount(rs.getString("userID"), rs.getString("nickName"), name, rs.getString("sex"), age, rs.getString("location"), rs.getString("image2")));
                } else if (!rs.getString("image3").equals("")) {
                    list.add(new datingAccount(rs.getString("userID"), rs.getString("nickName"), name, rs.getString("sex"), age, rs.getString("location"), rs.getString("image3")));
                } else if (!rs.getString("image4").equals("")) {
                    list.add(new datingAccount(rs.getString("userID"), rs.getString("nickName"), name, rs.getString("sex"), age, rs.getString("location"), rs.getString("image4")));
                } else if (!rs.getString("image5").equals("")) {
                    list.add(new datingAccount(rs.getString("userID"), rs.getString("nickName"), name, rs.getString("sex"), age, rs.getString("location"), rs.getString("image5")));
                } else {
                    list.add(new datingAccount(rs.getString("userID"), rs.getString("nickName"), name, rs.getString("sex"), age, rs.getString("location"), "images/anhDep10d.jpg"));
                }
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public String getStatusParticipant(String id1, String id2) {
        try {
            String sql = "select status from Participant where userID1 = ? and userID2 = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id1);
            ps.setString(2, id2);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<datingAccount> searchListDatingAccount(String gender, int begin, int end, String location) {
        try {
            List<datingAccount> list = new ArrayList<>();
            String sql = "select * from DatingProfile D, UserInformation U\n"
                    + "where D.userID = U.userID and sex like ? and location like ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + gender + "%");
            ps.setString(2, "%" + location + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                String str = rs.getString("birthDate");
                String[] parts = str.split(Pattern.quote("-"));
                Date date = new Date();
                int year = date.getYear() + 1900;
                int age = year - Integer.parseInt(parts[0]);
                String name = rs.getString("lastName").trim() + " " + rs.getString("middleName").trim() + " " + rs.getString("firstName").trim();

                if ((age >= begin && age <= end) || (age >= end && age <= begin)) {
                    if (!rs.getString("image1").equals("")) {
                        list.add(new datingAccount(rs.getString("userID"), rs.getString("nickName"), name, rs.getString("sex"), age, rs.getString("location"), rs.getString("image1")));
                    } else if (!rs.getString("image2").equals("")) {
                        list.add(new datingAccount(rs.getString("userID"), rs.getString("nickName"), name, rs.getString("sex"), age, rs.getString("location"), rs.getString("image2")));
                    } else if (!rs.getString("image3").equals("")) {
                        list.add(new datingAccount(rs.getString("userID"), rs.getString("nickName"), name, rs.getString("sex"), age, rs.getString("location"), rs.getString("image3")));
                    } else if (!rs.getString("image4").equals("")) {
                        list.add(new datingAccount(rs.getString("userID"), rs.getString("nickName"), name, rs.getString("sex"), age, rs.getString("location"), rs.getString("image4")));
                    } else if (!rs.getString("image5").equals("")) {
                        list.add(new datingAccount(rs.getString("userID"), rs.getString("nickName"), name, rs.getString("sex"), age, rs.getString("location"), rs.getString("image5")));
                    } else {
                        list.add(new datingAccount(rs.getString("userID"), rs.getString("nickName"), name, rs.getString("sex"), age, rs.getString("location"), "images/anhDep10d.jpg"));
                    }
                }
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean processPaticipant(String a1, String a2, String status) {
        try {
            String sql = "Update Participant set status = ? where userID1 = ? and userID2 = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, a1);
            ps.setString(3, a2);
            int n = ps.executeUpdate();
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean updateParticipant(String id1, String id2, String IDCon) {
        try {
            String sql = "Update Participant set conversationID = ? where userID1 = ? and userID2 = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, IDCon);
            ps.setString(2, id1);
            ps.setString(3, id2);
            int n = ps.executeUpdate();
            if (n > 0) {
                return true;
            }
            con.close();
        } catch (Exception e) {
        }
        return false;
    }

    public String getConverID(String a1, String a2) {
        try {
            String sql = "select conversationID from Participant where userID1 = ? and userID2 = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, a1);
            ps.setString(2, a2);
            rs = ps.executeQuery();
            String cid = "";
            while (rs.next()) {
                if (!rs.getString(1).equals("null")) {
                    return rs.getString(1);
                }
            }
        } catch (Exception e) {
        }
        return "";
    }

    public boolean UpdateStatusFriend(String a1, String a2, String stt) {
        try {
            String sql = "update Participant set [status] = ? where userID1 = ? and userID2 = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, stt);
            ps.setString(2, a1);
            ps.setString(3, a2);
            int n = ps.executeUpdate();
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean deleteFriend(String a1, String a2) {
        try {
            String sql = "delete from Participant where userID1 = ? and userID2 = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, a1);
            ps.setString(2, a2);
            int n = ps.executeUpdate();
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean checkID(String id) {
        try {
            String sql = "select * from Participant where participantID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return false;
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
        }
        return true;
    }

    public String createID(String t) {
        String id;
        do {
            String code = ramdomCofirmCode();
            id = t + code;
        } while (!checkID(id));
        return id;
    }

    public boolean creatRela(String partID, String a1, String a2, String status) {
        try {
            String sql = "insert into Participant values(?,?,?,?,null)";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, partID);
            ps.setString(2, a1);
            ps.setString(3, a2);
            ps.setString(4, status);
            int n = ps.executeUpdate();
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean updateInfor(userInformation u) {
        try {
            String sql = "update UserInformation set "
                    + "avatar = ?,"
                    + "background = ?,"
                    + "firstName = ?,"
                    + "middleName = ?,"
                    + "lastName = ?,"
                    + "birthDate = ?,"
                    + "sex = ?,"
                    + "phone = ?,"
                    + "email = ?,"
                    + "address = ?,"
                    + "education = ?,"
                    + "job = ?,"
                    + "hobbie = ?,"
                    + "ortherInterest = ?,"
                    + "imageFile = ?,"
                    + "fbLink = ?,"
                    + "instaLink = ?,"
                    + "emailLink = ?,"
                    + "tweetLink = ?,"
                    + "createAt = ?"
                    + " where userID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getAvatar());
            ps.setString(2, u.getBackground());
            ps.setString(3, u.getFirstName());
            ps.setString(4, u.getMiddleName());
            ps.setString(5, u.getLastName());
            ps.setString(6, u.getBirthdate());
            ps.setString(7, u.getSex());
            ps.setString(8, u.getPhone());
            ps.setString(9, u.getEmail());
            ps.setString(10, u.getAddress());
            ps.setString(11, u.getEducation());
            ps.setString(12, u.getJob());
            ps.setString(13, u.getHobbie());
            ps.setString(14, u.getOrther());
            ps.setString(15, u.getImgfile());
            ps.setString(16, u.getFbLink());
            ps.setString(17, u.getIgLink());
            ps.setString(18, u.getEmailLink());
            ps.setString(19, u.getTweetLink());
            ps.setString(20, u.getCreatAt());
            ps.setString(21, u.getUserId());
            int n = ps.executeUpdate();
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean updateAvatar(String id, String avt) {
        try {
            String sql = "update UserInformation set avatar = ? where userID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, avt);
            ps.setString(2, id);
            int n = ps.executeUpdate();
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean updateBackground(String id, String bgr) {
        try {
            String sql = "update UserInformation set background = ? where userID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, bgr);
            ps.setString(2, id);
            int n = ps.executeUpdate();
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean checkDatingAccountExist(String uID) {
        try {
            String sql = "select * from DatingProfile\n"
                    + "where userID = ? and active = 1";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, uID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public datingDetail getDatingDetail(String uID) {
        try {
            String sql = "select * from DatingProfile D, UserInformation U\n"
                    + "where D.userID = U.userID and D.userID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, uID);
            rs = ps.executeQuery();
            int age = 0;
            while (rs.next()) {
                String str = rs.getString("birthDate");
                if (!str.equals("")) {
                    String[] parts = str.split(Pattern.quote("-"));
                    Date date = new Date();
                    int year = date.getYear() + 1900;
                    age = year - Integer.parseInt(parts[0]);
                }
                String name = rs.getString("lastName").trim() + " " + rs.getString("middleName").trim() + " " + rs.getString("firstName").trim();
                return new datingDetail(
                        rs.getString("userID"),
                        name,
                        rs.getString("nickName"),
                        rs.getString("birthDate"),
                        age,
                        rs.getString("location"),
                        rs.getString("sex"),
                        rs.getString("isHaveChild"),
                        rs.getString("gender"),
                        rs.getString("education"),
                        rs.getString("job"),
                        rs.getString("hobbie"),
                        rs.getString("detail"),
                        rs.getString("avatar"),
                        rs.getString("image1"),
                        rs.getString("image2"),
                        rs.getString("image3"),
                        rs.getString("image4"),
                        rs.getString("image5"),
                        rs.getString("active"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<friend> getListFriendNotContacYet(String id) {
        try {
            String sql = "select p.userID2,u.avatar, u.firstName +' '+u.middleName + ' ' + u.lastName [fullname] , a.[status] [active] ,p.[status]\n"
                    + "from UserInformation u ,(select userID2,[status] from Participant where userID1 = ? and conversationID is null and [status] = 1) p,Account a\n"
                    + "where u.userID = p.userID2 and a.userID = p.userID2";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            List<friend> list = new ArrayList<>();
            while (rs.next()) {

                list.add(new friend(rs.getString(1), rs.getString(3), rs.getString(2), rs.getInt(4), rs.getString(5)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean updateDatingProfile1(datingProfile dP) {
        try {
            String sql = "update UserInformation set birthDate = ?, sex = ?, education = ?, job = ?, hobbie = ? where userID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(6, dP.getUserID());
            ps.setString(1, dP.getBirthDate());
            ps.setString(2, dP.getSex());
            ps.setString(3, dP.getEducation());
            ps.setString(4, dP.getJob());
            ps.setString(5, dP.getHobbie());
            int n = ps.executeUpdate();
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean updateDatingProfile2(datingProfile dP) {
        try {
            String sql = "update DatingProfile set nickName = ?, location = ?, isHaveChild = ?, gender = ?, detail = ?, \n"
                    + "image1 = ?, image2 = ?, image3 = ?, image4 = ?, image5 = ?, active = ? where userID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(12, dP.getUserID());
            ps.setString(1, dP.getNickName());
            ps.setString(2, dP.getLocation());
            ps.setString(3, dP.getChild());
            ps.setString(4, dP.getGender());
            ps.setString(5, dP.getDetail());
            ps.setString(6, dP.getImage1());
            ps.setString(7, dP.getImage2());
            ps.setString(8, dP.getImage3());
            ps.setString(9, dP.getImage4());
            ps.setString(10, dP.getImage5());
            ps.setString(11, dP.getActive());
            int n = ps.executeUpdate();
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean createDatingProfile(datingProfile d) {
        try {
            String sql = "insert into DatingProfile values(?,?,?,?,?,?,?,?,?,?,?,?)";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, d.getUserID());
            ps.setString(2, d.getNickName());
            ps.setString(3, d.getLocation());
            ps.setString(4, d.getChild());
            ps.setString(5, d.getGender());
            ps.setString(6, d.getDetail());
            ps.setString(7, d.getImage1());
            ps.setString(8, d.getImage2());
            ps.setString(9, d.getImage3());
            ps.setString(10, d.getImage4());
            ps.setString(11, d.getImage5());
            ps.setString(12, d.getActive());
            int n = ps.executeUpdate();
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public List<userInformation> getListUserByName(String txtSearch) {
        try {
            String sql = "select * from userInformation where firstname like ? or middlename like ? or lastname like ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            ps.setString(2, "%" + txtSearch + "%");
            ps.setString(3, "%" + txtSearch + "%");
            List<userInformation> list = new ArrayList<>();
            rs = ps.executeQuery();
            while (rs.next()) {

                list.add(new userInformation(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(6).trim(),
                        rs.getString(5).trim(),
                        rs.getString(4).trim(),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15),
                        rs.getString(16),
                        rs.getString(17),
                        rs.getString(18),
                        rs.getString(19),
                        rs.getString(20),
                        rs.getString(21)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public int getNUmofTotalMessage(String id) {
        try {
            String sql = "select count(*) from MessageContent m where m.ConversationID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            String stt = "0";
            while (rs.next()) {
                stt = rs.getString(1);
            }
            int n = Integer.parseInt(stt);
            return n;
        } catch (Exception e) {
        }
        return 0;
    }

    public boolean sendMessage(messages m) {
        try {
            String sql = "Insert into MessageContent values(?,?,?,?,?,?,?,?)";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, m.getConversationID());
            ps.setString(2, m.getSenderID());
            ps.setString(3, m.getContent());
            ps.setString(4, m.getTime());
            ps.setInt(5, m.getSttMess());
            ps.setInt(6, m.getType());
            ps.setInt(7, m.getReaded1());
            ps.setInt(8, m.getReaded2());
            int n = ps.executeUpdate();
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public List<userInformation> getListFriendContacYet(String id) {
        try {
            String sql = "select * from UserInformation u, (select userID2 from Participant where userID1 = ? and conversationID is not null) p\n"
                    + "where u.userID = p.userID2";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            List<userInformation> list = new ArrayList<>();
            while (rs.next()) {

                list.add(new userInformation(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(6).trim(),
                        rs.getString(5).trim(),
                        rs.getString(4).trim(),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15),
                        rs.getString(16),
                        rs.getString(17),
                        rs.getString(18),
                        rs.getString(19),
                        rs.getString(20),
                        rs.getString(21)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public containerChat getConverByUser(userInformation u1, userInformation u2) {
        try {
            String sql = "select top 1 c.conversationID,u.firstName + ' ' + u.middleName + ' ' + u.lastName [name],m.content,m.[time],m.[type],m.[status1],m.senderID,a.[status] [on_off], m.sttMessage\n"
                    + "from [Conversation] c,\n"
                    + "	(select conversationID from Participant where userID1 = ? and userID2 = ? and conversationID is not null) p,\n"
                    + "	MessageContent m,\n"
                    + "	Account a,\n"
                    + "	UserInformation u\n"
                    + "where c.conversationID = p.conversationID and m.ConversationID = p.conversationID and a.userID = m.senderID and u.userID = m.senderID\n"
                    + "order by m.sttMessage DESC";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, u1.getUserId());
            ps.setString(2, u2.getUserId());
            rs = ps.executeQuery();
            Conversation c = null;
            while (rs.next()) {
                calTime ct = getUnitTime(rs.getString(4));
                c = new Conversation(rs.getString(1), rs.getString(2), rs.getString(7), rs.getString(3), rs.getString(6), rs.getString(4), rs.getString(5), rs.getString(8), ct);
            }
            containerChat cc = new containerChat(u2, c);
            return cc;
        } catch (Exception e) {
        }
        return null;
    }

    public calTime getUnitTime(String time) {
        Date date = new Date();

        String[] stringTime = time.split("-");
        String[] dateString = stringTime[0].split("/");
        String[] timeString = stringTime[1].split("/");
        int second = Integer.parseInt(timeString[2]);
        int minute = Integer.parseInt(timeString[1]);
        int hour = Integer.parseInt(timeString[0]);
        int day = Integer.parseInt(dateString[0]);
        int month = Integer.parseInt(dateString[1]);
        int year = Integer.parseInt(dateString[2]);

        int _sencond = date.getSeconds();
        int _minute = date.getMinutes();
        int _hour = date.getHours();
        int _day = date.getDate();
        int _month = date.getMonth() + 1;
        int _year = date.getYear() + 1900;

        int timee = (_year - year) * 12 * 30 * 24 * 60 * 60 + (_month - month) * 30 * 24 * 60 * 60 + (_day - day) * 24 * 60 * 60 + (_hour - hour) * 60 * 60 + (_minute - minute) * 60 + (_sencond - second);

        calTime ct = new calTime();
        ct.setTotalSecond(timee);
        if (timee <= 60) {

            ct.setCountTime(timee);
            ct.setUnit("giây");
        } else if (timee > 60 && timee <= 3600) {
            int temp = timee / 60;
            ct.setCountTime(temp);
            ct.setUnit("phút");

        } else if (timee > 3600 && timee <= 86400) {
            int temp = timee / 3600;
            ct.setCountTime(temp);
            ct.setUnit("giờ");
        } else if (timee > 86400 && timee <= 2592000) {
            int temp = timee / 86400;
            ct.setCountTime(temp);
            ct.setUnit("ngày");
        } else if (timee > 2592000 && timee <= 31104000) {
            int temp = timee / 2592000;
            ct.setCountTime(temp);
            ct.setUnit("Tháng");
        } else {
            int temp = timee / 31104000;
            ct.setCountTime(temp);
            ct.setUnit("Năm");
        }

        return ct;
    }

    public String getUser2InConversation(String onverID, String user1) {
        try {
            String sql = "select userID2 from participant where userID1 = ? and conversationID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, user1);
            ps.setString(2, onverID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }
        return "";
    }

    public List<messages> getListMessages(String converID) {
        try {
            String sql = "select * from MessageContent where ConversationID = ? order by sttMessage DESC OFFSET 0 rows fetch next 10 rows only";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, converID);
            rs = ps.executeQuery();
            List<messages> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new messages(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getInt(8)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public void readMessage(String converID) {
        try {
            String sql = "update MessageContent set status1 = '1' where ConversationID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, converID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public boolean dislikeTarget(String a1, String a2) {
        try {
            String sql = "delete from Dating where userID = ? and targetID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, a1);
            ps.setString(2, a2);
            int n = ps.executeUpdate();
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public String createDatingID() {
        String id;
        do {
            String code = ramdomCofirmCode();
            id = "D" + code;
        } while (!checkDatingID(id));
        return id;
    }

    public boolean creatDatingRela(String datingID, String a1, String a2, String status) {
        try {
            String sql = "insert into Dating values(?,?,?,?)";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, datingID);
            ps.setString(2, a1);
            ps.setString(3, a2);
            ps.setString(4, status);
            int n = ps.executeUpdate();
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean checkDatingID(String id) {
        try {
            String sql = "select * from Dating where datingID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return false;
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
        }
        return true;
    }

    public boolean checkDatingMatch(String uID, String tID) {
        try {
            List<datingMatch> list = new ArrayList<>();
            String sql = "select * from Dating\n"
                    + "where userID = ? and targetID = ? and isLike = 1";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, uID);
            ps.setString(2, tID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public List<datingMatch> getListDatingMatch(String uID) {
        try {
            List<datingMatch> list = new ArrayList<>();
            String sql = "select * from Dating\n"
                    + "where userID = ? and isLike = 1";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, uID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new datingMatch(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean checkNotificationID(String id) {
        try {
            String sql = "select * from Notification where notificationID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return false;
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
        }
        return true;
    }

    public String createNotificationID() {
        String id;
        do {
            String code = ramdomCofirmCode();
            id = "N" + code;
        } while (!checkNotificationID(id));
        return id;
    }

    public boolean createNotification(String notiID, String rID, String dID, String message, String link, String icon) {
        try {
            String status = "1";
            Date date = new Date();
            String time = date.getHours() + "-" + date.getMinutes() + "-" + date.getSeconds() + "-" + date.getDate() + "-" + (date.getMonth() + 1) + "-" + (date.getYear() + 1900);

            String sql = "insert into Notification values(?,?,?,?,?,?,?,?)";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, notiID);
            ps.setString(2, rID);
            ps.setString(3, dID);
            ps.setString(4, message);
            ps.setString(5, link);
            ps.setString(6, icon);
            ps.setString(7, status);
            ps.setString(8, time);
            int n = ps.executeUpdate();
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public List<notification> getNotification(String rID, int index) {
        try {
            List<notification> list = new ArrayList<>();
            String sql = "select * from Notification, UserInformation\n"
                    + "where receiverID = ? and delivererID = userID\n"
                    + "order by stt desc OFFSET 0 rows fetch next ? rows only";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, rID);
            ps.setInt(2, index);
            rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getString("lastName").trim() + " " + rs.getString("middleName").trim() + " " + rs.getString("firstName").trim();
                String time = getDateTime(rs.getString("date"));

                list.add(new notification(
                        rs.getString("notificationID"),
                        rs.getString("receiverID"),
                        rs.getString("delivererID"),
                        rs.getString("message"),
                        rs.getString("link"),
                        rs.getString("icon"),
                        rs.getString("status"),
                        time,
                        name,
                        rs.getString("avatar")));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<notification> getUnreadNotification(String rID) {
        try {
            List<notification> list = new ArrayList<>();
            String sql = "select * from Notification, UserInformation\n"
                    + "where receiverID = ? and status = 1 and delivererID = userID";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, rID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new notification(
                        rs.getString("notificationID"),
                        rs.getString("receiverID"),
                        rs.getString("delivererID"),
                        rs.getString("message"),
                        rs.getString("link"),
                        rs.getString("icon"),
                        rs.getString("status"),
                        rs.getString("date"),
                        rs.getString("firstName"),
                        rs.getString("avatar")));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean updateNotificationStatus(String status, String notiID) {
        try {
            String sql = "update Notification set status = ? where notificationID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, notiID);
            int n = ps.executeUpdate();
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean deleteNotification(String notiID) {
        try {
            String sql = "delete from Notification where notificationID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, notiID);
            int n = ps.executeUpdate();
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public String getStatusDatingTarget(String id1, String id2) {
        try {
            String sql = "select isLike from Dating where userID = ? and targetID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id1);
            ps.setString(2, id2);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public datingAccount getDatingMatch(String uID) {
        try {
            List<datingAccount> list = new ArrayList<>();
            String sql = "select * from DatingProfile D, UserInformation U\n"
                    + "where D.userID = U.userID and D.userID like ? and active = 2";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + uID + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                String str = rs.getString("birthDate");
                String[] parts = str.split(Pattern.quote("-"));

                Date date = new Date();
                int year = date.getYear() + 1900;
                int age = year - Integer.parseInt(parts[0]);
                String name = rs.getString("lastName").trim() + " " + rs.getString("middleName").trim() + " " + rs.getString("firstName").trim();

                if (!rs.getString("image1").equals("")) {
                    return (new datingAccount(rs.getString("userID"), rs.getString("nickName"), name, rs.getString("sex"), age, rs.getString("location"), rs.getString("image1")));
                } else if (!rs.getString("image2").equals("")) {
                    return (new datingAccount(rs.getString("userID"), rs.getString("nickName"), name, rs.getString("sex"), age, rs.getString("location"), rs.getString("image2")));
                } else if (!rs.getString("image3").equals("")) {
                    return (new datingAccount(rs.getString("userID"), rs.getString("nickName"), name, rs.getString("sex"), age, rs.getString("location"), rs.getString("image3")));
                } else if (!rs.getString("image4").equals("")) {
                    return (new datingAccount(rs.getString("userID"), rs.getString("nickName"), name, rs.getString("sex"), age, rs.getString("location"), rs.getString("image4")));
                } else if (!rs.getString("image5").equals("")) {
                    return (new datingAccount(rs.getString("userID"), rs.getString("nickName"), name, rs.getString("sex"), age, rs.getString("location"), rs.getString("image5")));
                } else {
                    return (new datingAccount(rs.getString("userID"), rs.getString("nickName"), name, rs.getString("sex"), age, rs.getString("location"), "images/anhDep10d.jpg"));
                }
            }
        } catch (Exception e) {
        }
        return null;
    }

    public boolean updateActive(String stt, account a) {
        try {
            String sql = "update account set [status] = ? where userID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, stt);
            ps.setString(2, a.getUserId());
            int n = ps.executeUpdate();
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public int getNumberMutualFriend(String a1, String a2) {
        try {
            String sql = "select count(*) from (select * from Participant where userID1 = ?) p1 , (select * from Participant where userID1 = ?) p2\n"
                    + "where p1.userID2 = p2.userID2";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, a1);
            ps.setString(2, a2);
            rs = ps.executeQuery();
            while (rs.next()) {
                return Integer.parseInt(rs.getString(1));
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<userInformation> getListAllFriend(String id) {
        try {
            String sql = "select * from UserInformation u , (select userID2 from Participant p where p.userID1 = ? and [status] != '5')  t\n"
                    + "where t.userID2 = u.userID";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            List<userInformation> list = new ArrayList<>();
            rs = ps.executeQuery();
            while (rs.next()) {

                list.add(new userInformation(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(6).trim(),
                        rs.getString(5).trim(),
                        rs.getString(4).trim(),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15),
                        rs.getString(16),
                        rs.getString(17),
                        rs.getString(18),
                        rs.getString(19),
                        rs.getString(20),
                        rs.getString(21)));
            }
            return list;
        } catch (Exception e) {

        }
        return null;
    }

    public String getFriendByID(String id, String GId) {
        try {
            String sql = "select p.[status] from Participant p where p.userID1 = ? and p.userID2 = ?";
            con = new DBContext().getConnection();
            ps = con.prepareCall(sql);
            ps.setString(1, id);
            ps.setString(2, GId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }
        return "";
    }

    public int getLikeTotal(String postID) {
        try {
            String sql = "SELECT count(*) [count] FROM [Like] WHERE postID=?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, postID);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                return rs.getInt("count");
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

        return 0;
    }

    public String getFullNameByID(String userID) {
        try {
            String sql = "select lastName + ' ' + middleName + ' ' + firstName as [fullName] from UserInformation a where userID= ?";

            Connection conn = new DBContext().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, userID);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                return rs.getString("fullName");
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public String getUserAvatar(String userID) {
        try {
            String sql = "select avatar from UserInformation WHERE userID=?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, userID);

            ResultSet rs = stmt.executeQuery();

            //String url = "web/userPhoto/"+userID+"/avatar/";
            String url = "userPhoto//" + userID + "//avatar//";

            while (rs.next()) {
                url += rs.getString("avatar");
            }

            return url;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return "";
    }

    public String getUserBgr(String userID) {
        try {
            String sql = "select background from UserInformation WHERE userID=?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, userID);

            ResultSet rs = stmt.executeQuery();

            //String url = "web/userPhoto/"+userID+"/avatar/";
            String url = "userPhoto//" + userID + "//background//";

            while (rs.next()) {
                url += rs.getString("background");
            }

            return url;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return "";
    }

    public int getCommentTotal(String postID) {
        try {
//            String sql = "SELECT TOP 1 * from Comment ORDER BY time DESC";
            String sql = "SELECT count(commentID) [count] FROM [Comment] WHERE postID=?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, postID);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                return rs.getInt("count");
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

        return 0;
    }

    public String getPostType(String postID) {
        try {
            String sql = "SELECT imageFile FROM Post WHERE postID=?";

            Connection conn = new DBContext().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, postID);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                return rs.getString(1);
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return "text";
    }

    public List<Attachment> getAllImageAttachment(String postID) {
        try {
            String sql = "SELECT * FROM Attachments WHERE postID=? ORDER BY ID ASC";

            Connection conn = new DBContext().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, postID);
            ResultSet rs = stmt.executeQuery();

            List<Attachment> lists = new ArrayList<Attachment>();

            while (rs.next()) {
                lists.add(new Attachment(
                        rs.getString("ID"),
                        rs.getString("postID"),
                        rs.getString("attachmentURL")
                )
                );
            }

            return lists;

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public Comment getLastestComment(String PID) {
        try {
//            String sql = "SELECT TOP 1 * from Comment ORDER BY time DESC";
            String sql = "SELECT top 1 * from Comment WHERE postID=? ORDER BY sttCmt DESC";
            Connection conn = new DBContext().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, PID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {

                return new Comment(
                        rs.getString("commentID"),
                        rs.getString("postID"),
                        rs.getString("userID"),
                        rs.getString("detail"),
                        rs.getString("time"),
                        rs.getInt("status"),
                        rs.getString("time")
                );
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

        return null;
    }

    public boolean checkPostID(String id) {
        try {
            String sql = "select * from Post where postID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return false;
            }
        } catch (Exception e) {
        }
        return true;
    }

    public String createPostID() {
        String pID;
        do {
            String id = ramdomCofirmCode();
            pID = "P" + id;
        } while (!checkPostID(pID));
        return pID;
    }

    public boolean addTextPostByUser(String postContent, String userID) {
        String postID = createPostID();
        try {
            String sql = "INSERT INTO Post (postID, userID, detail, posted_time,imageFile) VALUES(?,?,?,?,?)";

            Connection conn = new DBContext().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);

            Date date = new Date();
            int day = date.getDate();
            int month = date.getMonth() + 1;
            int year = date.getYear() + 1900;
            int hour = date.getHours();
            int minute = date.getMinutes();
            int second = date.getSeconds();
            String time = day + "/" + month + "/" + year + "-" + hour + "/" + minute + "/" + second;

            stmt.setString(1, postID);
            stmt.setString(2, userID);
            stmt.setString(3, postContent);
            stmt.setString(4, time);
            stmt.setString(5, "text");
            stmt.executeUpdate();
            return true;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }

    public String addImagePostByUser(String postContent, String userID, String type) {
        String postID = createPostID();
        try {
            String sql = "INSERT INTO Post (postID, userID, detail, imageFile, posted_time) VALUES(?,?,?,?,?)";

            Connection conn = new DBContext().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);

            Date date = new Date();
            int day = date.getDate();
            int month = date.getMonth() + 1;
            int year = date.getYear() + 1900;
            int hour = date.getHours();
            int minute = date.getMinutes();
            int second = date.getSeconds();
            String time = day + "/" + month + "/" + year + "-" + hour + "/" + minute + "/" + second;

            stmt.setString(1, postID);
            stmt.setString(2, userID);
            stmt.setString(3, postContent);
            stmt.setString(4, type);
            stmt.setString(5, time);
            stmt.executeUpdate();
            return postID;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return "";
    }

    public boolean addImageAttachment(String postID, String fileName) {
        try {
            String sql = "INSERT INTO Attachments (postID, attachmentURL) VALUES(?,?)";

            Connection conn = new DBContext().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, postID);
            stmt.setString(2, fileName);
            stmt.executeUpdate();
            return true;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }

    public List<Post> getListPostsByUser(String userID) {
        List<Post> listPosts = new ArrayList<Post>();

        try {
            String sql = "SELECT * FROM Post WHERE userID = ? ORDER BY sttPost DESC";

            Connection conn = new DBContext().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, userID);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                listPosts.add(new Post(
                        rs.getString("postID"),
                        rs.getString("userID"),
                        rs.getString("detail"),
                        rs.getString("imageFile"),
                        rs.getString("videoLink"),
                        rs.getString("status"),
                        rs.getString("posted_time")
                ));
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

        return listPosts;
    }

    public List<Comment> getAllCommentsByPost(String postID) {
        try {
//            String sql = "select * from Comment WHERE postID=?";
            String sql = "SELECT * from Comment WHERE postID=? ORDER BY sttCmt DESC";

            Connection conn = new DBContext().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, postID);

            ResultSet rs = stmt.executeQuery();

            List<Comment> listComments = new ArrayList<Comment>();

            while (rs.next()) {
                listComments.add(new Comment(
                        rs.getString("commentID"),
                        rs.getString("postID"),
                        rs.getString("userID"),
                        rs.getString("detail"),
                        rs.getString("time"),
                        rs.getInt("status"),
                        rs.getString("time")));
            }

            return listComments;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public List<Post> getFriendPosts(String userID) {
        try {
            String sql = "select top 10 * from Post po, (select p.userID2 "
                    + "from Participant p "
                    + "where p.userID1 = ? and [status] = '1') id "
                    + "where po.userID = id.userID2 "
                    + "order by sttPost DESC";
            Connection conn = new DBContext().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, userID);

            ResultSet rs = stmt.executeQuery();

            List<Post> listPosts = new ArrayList<Post>();

            while (rs.next()) {
                listPosts.add(new Post(
                        rs.getString("postID"),
                        rs.getString("userID"),
                        rs.getString("detail"),
                        rs.getString("imageFile"),
                        rs.getString("videoLink"),
                        rs.getString("status"),
                        rs.getString("posted_time")
                )
                );
            }

            return listPosts;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public Post getPostByID(String id) {
        try {
            String sql = "select * from Post where postID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Post(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public boolean checkCMTID(String id){
        try {
            String sql = "select * from Comment where commentID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return false;
            }
        } catch (Exception e) {
        }
        return true;
    }

    public String createCommentID() {
        String pID;
        do {
            String id = ramdomCofirmCode();
            pID = "CM" + id;
        } while (!checkCMTID(pID));
        return pID;
    }

    public boolean addCommentToPost(String postID, String userID, String detail) {
        try {
            String sql = "INSERT INTO Comment (commentID, postID, userID, detail, time) VALUES(?,?,?,?,?)";
            String commentID = createCommentID();
            Connection conn = new DBContext().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);

            

            Date date = new Date();
            int day = date.getDate();
            int month = date.getMonth() + 1;
            int year = date.getYear() + 1900;
            int hour = date.getHours();
            int minute = date.getMinutes();
            int second = date.getSeconds();
            String time = day + "/" + month + "/" + year + "-" + hour + "/" + minute + "/" + second;

            stmt.setString(1, commentID);
            stmt.setString(2, postID);
            stmt.setString(3, userID);
            stmt.setString(4, detail);
            stmt.setString(5, time);

            int n = stmt.executeUpdate();
            if (n > 0) {
                return true;
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }

    public String getHostByPostID(String pID) {
        try {
            String sql = "select userID from Post where postID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, pID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }
        return "";
    }

    public void deleteLikeOfPost(String pID) {
        try {
            String sql = "delete from [like] where postID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, pID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteCmtOfPost(String pID) {
        try {
            String sql = "delete from [comment] where postID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, pID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteRelaFile(String pID) {
        try {
            String sql = "delete from [Attachments] where postID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, pID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deletePost(String pID) {
        try {
            String sql = "delete from [Post] where postID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, pID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public boolean getIsLikePost(String uID, String postID) {
        try {
            String sql = "select * from [Like] where postID=? and userID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, postID);
            ps.setString(2, uID);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public void unLikePost(String pID, String uID) {
        try {
            String sql = "delete from [Like] where postID = ? and userID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, pID);
            ps.setString(2, uID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void likePost(String pID, String uID) {
        try {
            String sql = "Insert into [Like] values (?,?)";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, pID);
            ps.setString(2, uID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Attachment> getAllPhoto(String uID) {
        try {
            String sql = "select * from Attachments a,(select * from Post where imageFile = 'image') p where p.postID = a.postID and p.userID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, uID);
            rs = ps.executeQuery();
            List<Attachment> l = new ArrayList<>();
            while (rs.next()) {
                l.add(new Attachment(rs.getString(1), rs.getString(2), rs.getString(3)));
            }
            return l;
        } catch (Exception e) {
        }
        return null;
    }

    public userInformation getReccentBitrhDate(String uID) {
        Date da = new Date();
        int ngay = da.getDate();
        int thang = da.getMonth() + 1;

        List<String> recent = new ArrayList<>();
        for (int i = ngay; i <= ngay + 5; i++) {
            int tempThang = thang;
            if (i <= 30) {
                recent.add(tempThang + "-" + i);

            } else {
                int ngayN = i - 30;
                tempThang++;
                recent.add(tempThang + "-" + ngayN);
            }
        }
        String uIDd = getBirthUser(recent, uID);
        return getUserInfo(uIDd);
    }

    public String getBirthUser(List<String> l, String id) {
        for (String s : l) {
            try {
                String sql = "select userID from UserInformation u, (select userID2 from Participant where userID1 = ? and [status] = 1) p \n"
                        + "where birthDate like ? and p.userID2 = u.userID";
                con = new DBContext().getConnection();
                ps = con.prepareStatement(sql);
                ps.setString(1, id);
                ps.setString(2, "%" + s + "%");
                rs = ps.executeQuery();
                while (rs.next()) {
                    return rs.getString(1);
                }
            } catch (Exception e) {
            }
        }
        return "";
    }

    public List<String> getListCarePost(String postID, String host) {
        try {
            String sql = "select DISTINCT userID from Comment where postID = ? and userID != ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, postID);
            ps.setString(2, host);

            rs = ps.executeQuery();
            List<String> l = new ArrayList<String>();
            while (rs.next()) {

                l.add(rs.getString(1));
            }
            return l;
        } catch (Exception e) {
        }
        return new ArrayList<>();
    }

    public boolean deleteDatingProfile(String uID) {
        try {
            String sql = "update DatingProfile set nickName = '', location = '', isHaveChild = '', gender = '', detail = '',\n"
                    + "image1 = '', image2 = '', image3 = '', image4 = '', image5 = '', active = 1\n"
                    + "where userID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, uID);
            int n = ps.executeUpdate();
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean checkReportID(String id) {
        try {
            String sql = "select * from Report where reportID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return false;
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
        }
        return true;
    }

    public String createReportID() {
        String id;
        do {
            String code = ramdomCofirmCode();
            id = "R" + code;
        } while (!checkReportID(id));
        return id;
    }

    public boolean createReport(String postID, String accuser, String accused, String reason, String message, String link) {
        String id = createReportID();
        try {
            String status = "1";
            Date date = new Date();
            String time = date.getHours() + "-" + date.getMinutes() + "-" + date.getSeconds() + "-" + date.getDate() + "-" + (date.getMonth() + 1) + "-" + (date.getYear() + 1900);

            String sql = "insert into Report values(?,?,?,?,?,?,?,?,?)";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, postID);
            ps.setString(3, accuser);
            ps.setString(4, accused);
            ps.setString(5, reason);
            ps.setString(6, message);
            ps.setString(7, link);
            ps.setString(8, status);
            ps.setString(9, time);
            int n = ps.executeUpdate();
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public List<report> getReport(int index) {
        try {
            List<report> list = new ArrayList<>();
            String sql = "select R.reportID, R.postID, R.accuser, R.accused, U.lastName, U.middleName, U.firstName,\n"
                    + "	   A.lastName, A.middleName, A.firstName, R.reason, R.[message], R.link, R.[status], R.[date], U.avatar\n"
                    + "from Report R, UserInformation U, UserInformation A\n"
                    + "where R.accuser = U.userID and r.accused = A.userID\n"
                    + "order by R.stt desc OFFSET 0 rows fetch next ? rows only";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, index);
            rs = ps.executeQuery();

            while (rs.next()) {

                list.add(new report(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5).trim() + " " + rs.getString(6).trim() + " " + rs.getString(7).trim(),
                        rs.getString(8).trim() + " " + rs.getString(9).trim() + " " + rs.getString(10).trim(),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        getDateTime(rs.getString(15)),
                        rs.getString(16)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<report> getUnreadReport() {
        try {
            List<report> list = new ArrayList<>();
            String sql = "select * from Report\n"
                    + "where status = 1";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new report(
                        rs.getString("reportID"),
                        rs.getString("postID"),
                        rs.getString("accuser"),
                        rs.getString("accused"),
                        "",
                        "",
                        rs.getString("reason"),
                        rs.getString("message"),
                        rs.getString("link"),
                        rs.getString("status"),
                        rs.getString("date"),
                        ""));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean updateReportStatus(String status, String reportID) {
        try {
            String sql = "update Report set status = ? where reportID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, reportID);
            int n = ps.executeUpdate();
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean deleteReport(String reportID) {
        try {
            String sql = "delete from Report where reportID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, reportID);
            int n = ps.executeUpdate();
            if (n > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public String getFullName(String uID) {
        try {
            String sql = "select lastName, middleName, firstName from UserInformation where userID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, uID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1) + " " + rs.getString(2) + " " + rs.getString(3);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public String getDateTime(String str) {
        String[] parts = str.split(Pattern.quote("-"));
        Date date = new Date();
        int year = date.getYear() + 1900;
        int month = date.getMonth() + 1;
        int day = date.getDate();
        int second = date.getSeconds();
        int minute = date.getMinutes();
        int hour = date.getHours();
        String time;
        if (year > Integer.parseInt(parts[5])) {
            time = (year - Integer.parseInt(parts[5])) + " năm trước";
        } else if (month > Integer.parseInt(parts[4])) {
            time = (month - Integer.parseInt(parts[4])) + " tháng trước";
        } else if (day > Integer.parseInt(parts[3])) {
            time = (day - Integer.parseInt(parts[3])) + " ngày trước";
        } else if (hour > Integer.parseInt(parts[0])) {
            time = (hour - Integer.parseInt(parts[0])) + " giờ trước";
        } else if (minute > Integer.parseInt(parts[1])) {
            time = (minute - Integer.parseInt(parts[1])) + " phút trước";
        } else {
            time = (second - Integer.parseInt(parts[2])) + " giây trước";
        }
        return time;
    }

    public String getReportID(String postID) {
        try {
            String sql = "select top 1 reportID\n"
                    + "from Report where postID = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, postID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) throws MessagingException {
        dao d = new dao();
        account a = d.checkLogin("dungvcde150071@fpt.edu.vn", "123456");
        account a2 = d.checkLogin("huynhbaphu2001@gmail.com", "123456");
        System.out.println(a);
//        System.out.println(a2);
//        System.out.println(d.getReccentBitrhDate("2822200001"));
//        List<String> l = d.getListCarePost("P952968", "2822200001");
//        for (String o : l) {
//            System.out.println(o);
//        }
        System.out.println(d.getConverByUser(d.getUserInfo(a.getUserId()), d.getUserInfo(a2.getUserId())));
        String ConverID = d.getConverID(a2.getUserId(), "1432200005");
        System.out.println(ConverID.equals(""));
        String checkChatBoxExist = d.getChatBox(a.getUserId(), "1132200004");
        System.out.println(checkChatBoxExist);
        String id = d.createID("C");
        System.out.println(id);
    }
}
