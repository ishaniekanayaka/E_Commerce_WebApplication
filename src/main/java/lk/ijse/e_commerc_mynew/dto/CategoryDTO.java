package lk.ijse.e_commerc_mynew.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CategoryDTO {
    private int categoryId;
    private String categoryName;
    private String description;
}
