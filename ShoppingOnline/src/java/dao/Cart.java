/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import model.Product;

@Builder
@ToString
@Getter
@Setter
public class Cart {

    private Product product;
    private int quantity;

}
