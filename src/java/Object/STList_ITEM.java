package Object;

import java.text.ParseException;
import java.util.List;

/**
 *
 * @date 2020-3-2 22:33:15
 * @author Yi Qiu
 */
public class STList_ITEM {

    public int itemId;
    public String title;
    public String description;
    public String status;
    public String phone;
    public String contactMethod;
    public String createdDate;
    public int categoryId;
    public String userId;
    public int validationId;
    public String email;
    public String updatedDate;
    public double price;
    public List<Image> images;

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int _itemId) {
        this.itemId = _itemId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String _title) {
        this.title = _title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String _description) {
        this.description = _description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String _status) {
        this.status = _status;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String _phone) {
        this.phone = _phone;
    }

    public String getContactMethod() {
        return contactMethod;
    }

    public void setContactMethod(String _contactMethod) {
        this.contactMethod = _contactMethod;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String _createdDate) throws ParseException {
        this.createdDate = _createdDate;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int _categoryId) {
        this.categoryId = _categoryId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String _userId) {
        this.userId = _userId;
    }

    public int getValidationId() {
        return validationId;
    }

    public void setValidationId(int _validationId) {
        this.validationId = _validationId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(String updatedDate) {
        this.updatedDate = updatedDate;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    
    
    public class Image {

        public int imageId;
        public String fileName;

        public Image() {
        }

        public int getImageId() {
            return imageId;
        }

        public void setImageId(int _imageId) {
            this.imageId = _imageId;
        }

        public String getFileName() {
            return fileName;
        }

        public void setFileName(String _fileName) {
            this.fileName = _fileName;
        }
        
        
    }
}
