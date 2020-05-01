/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Object;

import Object.STList_ITEM.Image;
import java.util.List;

/**
 *
 * @date 2020-3-21 18:32:30
 * @author Yi Qiu
 */
public class STList_SR {
    private Integer itemId;
    private Integer categoryId;
    private String description;
    private String updatedDate;
    private String title;
    private Double price;
    private List<String> imageFiles;
    
    public STList_SR() {
    }
    
    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer _itemId) {
        this.itemId = _itemId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String _description) {
        this.description = _description;
    }

    public String getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(String _updatedDate) {
        this.updatedDate = _updatedDate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String _title) {
        this.title = _title;
    }

    public List<String> getImageFiles() {
        return imageFiles;
    }

    public void setImageFiles(List<String> _imageFiles) {
        this.imageFiles = _imageFiles;
    }


    
    
}