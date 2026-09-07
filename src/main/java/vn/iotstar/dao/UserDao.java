package vn.iotstar.dao;

import vn.iotstar.entity.User;

public interface UserDao {
    User get(String username);
    void insert(User user);
    void update(User user);
    boolean checkExistEmail(String email);
    boolean checkExistUsername(String username);
    boolean checkExistPhone(String phone);
    User getByEmail(String email);
    void updateProfile(int userId, String fullName, String phone, String avatarName);
}