package lk.ijse.e_commerc_mynew.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Order {
    private int orderId;
    private int userId;
    private double totalPrice;
    private Date date;
}
