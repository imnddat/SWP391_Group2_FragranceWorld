/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author THAISON
 */
public class Cart {
    private List<Item> itemList; 
    
    public Cart(){
            itemList = new ArrayList<>();  
    }

    public Cart(List<Item> itemList) {
        this.itemList = itemList;
    }

    public List<Item> getItemList() {
        return itemList;
    }

    public void setItemList(List<Item> itemList) {
        this.itemList = itemList;
    }
    
    public int getQuantityById(int id){
        return getItemById(id).getQuantity();
    }
    
    public Item getItemById(int id){
        for(Item i: itemList){
            if(i.getProduct().getId()==id)
                return i;
        }
        return null;
    }
    
    public boolean addItem(Item t){
        if(getItemById(t.getProduct().getId())!=null){
            Item m = getItemById(t.getProduct().getId());
            m.setQuantity(t.getQuantity());
            return false;
        }else{
            itemList.add(t);
            return true;
        }
    }
    
    public void removeItem(int id){
        if(getItemById(id)!= null){
            itemList.remove(getItemById(id));
        }
    }
    
    public double getTotalMoney(){
        double total = 0;
        for(Item t: itemList){
            total+=(t.getQuantity()*t.getPrice());
        }
        return total;
    }
}
