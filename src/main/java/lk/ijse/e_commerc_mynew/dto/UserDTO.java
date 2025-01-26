package lk.ijse.e_commerc_mynew.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserDTO {
    private int userId;
    private String userName;
    private String password;
    private String email;
    private String phone;
    private String address;
    private String role;
    private String status;

    public UserDTO(int userId, String userName,String email) {
    }
}

