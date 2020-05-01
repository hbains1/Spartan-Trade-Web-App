/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Object;

import static Helper.JSONprocessor.jsonToObject;
import static Helper.JSONprocessor.objectToJson;
import java.util.List;
import org.json.JSONException;

/**
 *
 * @date 2020-4-5 2:20:37
 * @author Yi Qiu
 */
public class STPagination {

    private int totalElements;

    private int totalPages;

    private int size;

    private int currentPage;
    
    private int category;
    
    private String description;
    
    private double price;

    private List<Object> content;

    private boolean isSerialized = false;

    public int getTotalElements() {
        return totalElements;
    }

    public void setTotalElements(int _totalElements) {
        this.totalElements = _totalElements;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int _totalPages) {
        this.totalPages = _totalPages;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int _size) {
        this.size = _size;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int _currentPage) {
        this.currentPage = _currentPage;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isIsSerialized() {
        return isSerialized;
    }

    public void setIsSerialized(boolean isSerialized) {
        this.isSerialized = isSerialized;
    }

    public List<Object> getContent() {
        return content;
    }

    public void setContent(List<Object> _content) {
        this.content = _content;
    }

    public <T> void deserializeList(Class<T> _toType) throws JSONException {
        if (isSerialized) {
            throw new IllegalArgumentException("isSerialized can not be true");
        }

        for (int i = 0; i < this.content.size(); i++) {
            String jsonString = objectToJson(this.content.get(i)).toString();
            this.content.set(i, jsonToObject(jsonString, _toType));
        }

        this.isSerialized = true;
    }

    public void serializeList() throws JSONException {
        if (isSerialized) {
            throw new IllegalArgumentException("isSerialized can not be false");
        }

        for (Object o : content) {          
            o = objectToJson(o);
        }

        this.isSerialized = false;
    }
}