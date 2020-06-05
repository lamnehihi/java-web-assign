/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Admin
 */
public class Book {
    private String bId;
    private String bName;
    private String catId;
    private float bPrice;
    private int bQuantity;
    private String bAuthor;
    private String bDes;
    private String bCover;
    
    public Book() {
    }

    public Book(String bId, String bName, String catId, float bPrice, int bQuantity, String bAuthor, String bDes) {
        this.bId = bId;
        this.bName = bName;
        this.catId = catId;
        this.bPrice = bPrice;
        this.bQuantity = bQuantity;
        this.bAuthor = bAuthor;
        this.bDes = bDes;
    }
    
    public Book(String bId, String bName, String catId, float bPrice, int bQuantity, String bAuthor, String bDes, String bCover) {
        this.bId = bId;
        this.bName = bName;
        this.catId = catId;
        this.bPrice = bPrice;
        this.bQuantity = bQuantity;
        this.bAuthor = bAuthor;
        this.bDes = bDes;
        this.bCover = bCover;
    }
}
