/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dict;

/**
 *
 * @date 2020-4-11 3:05:43
 * @author Yi Qiu
 */
public enum ServerENUM {
    API_DOMAIN("http://ec2-3-93-23-132.compute-1.amazonaws.com:8080", 0),
    ITEM_API("/items/", 1),
    USER_API("/users/", 2),
    LOGIN_API("/login", 3),
    REGISTER_API("/register", 4),
    FORGOT_PASSWORD("/forgotPassword", 5),
    UPDATE_PASSWORD("/updatePassword", 6),
    IMAGE_API("/images",7),
    EMAIL_USERNAME("SpartanTrade2020", 101),
    EMAIL_PASSWORD("SpartanTrade2020A", 102),
    EMAIL_TYPE_GMAIL("Gmail", 103),
    PAGE_INDEX("Home.jsp", 200),
    PAGE_ERROR("Error.jsp", 201),
    PAGE_SEARCH_RESULT("SearchResult.jsp", 202),
    PAGE_ITEM_INFO("ItemInfo.jsp", 203),
    PAGE_ACCOUNT("Account.jsp", 204),
    PAGE_MISSING("PageNotFound.jsp", 205),
    PAGE_EDIT("EditListing.jsp", 206),
    PAGE_SUBMIT_USER("SubmitByUser.jsp", 207),
    PAGE_SUBMIT_DEFAULT("SubmitListing.jsp", 208);

    private String name;
    private int index;

    private ServerENUM(String name, int index) {
        this.name = name;
        this.index = index;
    }

    public static String getContent(int index) {
        for (ServerENUM e : ServerENUM.values()) {
            if (e.getIndex() == index) {
                return e.name;
            }
        }
        return null;
    }

    private int getIndex() {
        return index;
    }

}
