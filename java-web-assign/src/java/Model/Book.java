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

    public String getbId() {
        return bId;
    }

    public void setbId(String bId) {
        this.bId = bId;
    }

    public String getbName() {
        return bName;
    }

    public void setbName(String bName) {
        this.bName = bName;
    }

    public String getCatId() {
        return catId;
    }

    public void setCatId(String catId) {
        this.catId = catId;
    }

    public float getbPrice() {
        return bPrice;
    }

    public void setbPrice(float bPrice) {
        this.bPrice = bPrice;
    }

    public int getbQuantity() {
        return bQuantity;
    }

    public void setbQuantity(int bQuantity) {
        this.bQuantity = bQuantity;
    }

    public String getbAuthor() {
        return bAuthor;
    }

    public void setbAuthor(String bAuthor) {
        this.bAuthor = bAuthor;
    }

    public String getbDes() {
        return bDes;
    }

    public void setbDes(String bDes) {
        this.bDes = bDes;
    }

    public String getbCover() {
        return bCover;
    }

    public void setbCover(String bCover) {
        this.bCover = bCover;
    }
    
    
}
