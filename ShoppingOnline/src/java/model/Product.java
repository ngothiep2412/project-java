
package model;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Builder
@Getter
@Setter
@ToString
public class Product {
     private int productID;
     private String productName;
     private int quantity;
     private double price;
     private String description;
     private String  imageUrl;
     private String createdDate;
     private int categoryID;
 
}
