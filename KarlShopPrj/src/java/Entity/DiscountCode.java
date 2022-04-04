
package Entity;


public class DiscountCode {
    String code; 
    int discount;

    public DiscountCode(String code, int discount) {
        this.code = code;
        this.discount = discount;
    }

    public DiscountCode() {
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }
    
}
