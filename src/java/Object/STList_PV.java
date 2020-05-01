package Object;

/**
 *
 * @date 2020-3-2 22:14:15
 * @author Yi Qiu
 */
public class STList_PV {
    private String catetoryId;
    private String itemId;
    private String title;
    private String rowNumber;

    public STList_PV(){
        
    }
    
    public STList_PV(String _catetoryId, String _itemId, String _title, String _rowNumber) {
        this.catetoryId = _catetoryId;
        this.itemId = _itemId;
        this.title = _title;
        this.rowNumber = _rowNumber;
    }

    public int getCatetoryId() {
        return Integer.parseInt(this.catetoryId);
    }

    public void setCatetoryId(String _catetoryId) throws IllegalArgumentException {
        if(!_catetoryId.matches("-?\\d+(\\.\\d+)?")){
            throw new IllegalArgumentException("The Attr: catetoryId must be an integer");
        }
        this.catetoryId = _catetoryId;
    }

    public int getItemId() {
        return Integer.parseInt(this.itemId);
    }

    public void setItemId(String _itemId) throws IllegalArgumentException {
        if(!_itemId.matches("-?\\d+(\\.\\d+)?")){
            throw new IllegalArgumentException("The Attr: catetoryId must be an integer");
        }
        this.itemId = _itemId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getRowNumber() {
        return Integer.parseInt(this.rowNumber);
    }

    public void setRowNumber(String _rowNumber) {
        if(!_rowNumber.matches("-?\\d+(\\.\\d+)?")){
            throw new IllegalArgumentException("The Attr: catetoryId must be an integer");
        }
        this.rowNumber = _rowNumber;
    }

}