package Control.Trade;

import Control.ServletBased;
import Dict.ServerENUM;
import static Helper.HttpHandler.*;
import static Helper.JSONprocessor.*;
import Object.STList_ITEM;
import Object.STList_SR;
import Object.STPagination;
import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONException;

/**
 *
 * @date 2020-3-3 12:07:01
 * @author Yi Qiu
 */
public class TradeItemList extends ServletBased {

    private static final int ITEM_PER_PAGE = 12;

    /**
     * initialize the TradeItemList object.
     *
     * @param _request HttpServletRequest
     * @param _response HttpServletResponse
     */
    public TradeItemList(ServletConfig _config, HttpServletRequest _request, HttpServletResponse _response) {
        super(_config, _request, _response);
    }

    /**
     * Get 5 newest posts in each catagory, return the data in Ajax way.
     *
     * @throws IOException
     * @throws JSONException
     */
    public void getHmPagePreviewList() throws IOException, JSONException, ServletException {
        String url = ServerENUM.getContent(0) + ServerENUM.getContent(1) + "top5";
        String json = getCheckedResponse(this, sendHttpRequest(url, null, "GET", null), "Ajax");
        if (json == null) {
            return;
        }
        sendAjaxResponse(this.response, "Success", json);
    }

    /**
     * Get 12 items for pageNo=N, return a STPagination object.
     *
     * @throws IOException
     * @throws ServletException
     */
    public void getSearchResults() throws IOException, ServletException, JSONException {
        String category = this.request.getParameter("category");
        String page = this.request.getParameter("page");
        String To = this.request.getParameter("To");
        
        String url = ServerENUM.getContent(0) + ServerENUM.getContent(1) + "category/" + category + "?pageNo=" + page + "&pageSize=" + ITEM_PER_PAGE;
        String json = getCheckedResponse(this, sendHttpRequest(url, null, "GET", null), "HttpServlet");
        if (json == null) {
            return;
        }
        STPagination SearchResult = jsonToObject(json, STPagination.class);
        SearchResult.deserializeList(STList_SR.class);
        this.Forward = (To != null)?Integer.parseInt(To):205;
        forwardRequestWithAttr(this.request, this.response, SearchResult, "SearchResult", ServerENUM.getContent(this.Forward));

    }

    /**
     * Get detail infomation of one item base on its item_id, return a
     * STList_ITEM object.
     *
     * @throws IOException
     * @throws ServletException
     */
    public void getItemDetail() throws IOException, ServletException {
        String itemid = this.request.getParameter("itemid");
        String To = this.request.getParameter("To");
        String url = ServerENUM.getContent(0) + ServerENUM.getContent(1) + itemid;
        String json = getCheckedResponse(this, sendHttpRequest(url, null, "GET", null), "HttpServlet");
        if (json == null) {
            return;
        }
        STList_ITEM ItemDetail = jsonToObject(json, STList_ITEM.class);
        this.Forward = (To != null)?Integer.parseInt(To):205;
        forwardRequestWithAttr(this.request, this.response, ItemDetail, "ItemDetail", ServerENUM.getContent(this.Forward));
    }

    /**
     * Get all items for user:user_id, return a ArrayList of STList_SR object.
     *
     * @throws IOException
     * @throws ServletException
     */
    public void getUserItems() throws IOException, ServletException, JSONException {
        int userID = (int) ((Double) (((Map) this.request.getSession().getAttribute("CurrentUserInfo")).get("userId"))).doubleValue();
        String page = this.request.getParameter("page");
        String To = this.request.getParameter("To");
        String url = ServerENUM.getContent(0) + ServerENUM.getContent(2) + userID + ServerENUM.getContent(1);
        url = url.substring(0, url.length() -1) + "?pageNo=" + page + "&pageSize=" + ITEM_PER_PAGE;
        String json = getCheckedResponse(this, sendHttpRequest(url, null, "GET", (Map) this.request.getSession().getAttribute("Authorization64")), "HttpServlet");
        if (json == null) {
            return;
        }
        STPagination SearchResult = jsonToObject(json, STPagination.class);
        SearchResult.deserializeList(STList_ITEM.class);
        this.Forward = (To != null)?Integer.parseInt(To):205;
        forwardRequestWithAttr(this.request, this.response, SearchResult, "SearchResult", ServerENUM.getContent(this.Forward));
    }

    /**
     * Get a specific item base on its item_id for user:user_id, return a
     * STList_ITEM object.
     *
     * @throws IOException
     * @throws ServletException
     */
    public void getTargetUserItem() throws IOException, ServletException {
        int userID = (int) ((Double) (((Map) this.request.getSession().getAttribute("CurrentUserInfo")).get("userId"))).doubleValue();
        int itemID = Integer.parseInt(this.request.getParameter("itemID"));
        String To = this.request.getParameter("To");

        if(To == null){
            String method = "Ajax";
            String url = ServerENUM.getContent(0) + ServerENUM.getContent(2) + userID + ServerENUM.getContent(1) + itemID;
            String json = getCheckedResponse(this, sendHttpRequest(url, null, "GET", (Map) this.request.getSession().getAttribute("Authorization64")), "HttpServlet");
        }
        
        String url = ServerENUM.getContent(0) + ServerENUM.getContent(2) + userID + ServerENUM.getContent(1) + itemID;
        String json = getCheckedResponse(this, sendHttpRequest(url, null, "GET", (Map) this.request.getSession().getAttribute("Authorization64")), "HttpServlet");
        if (json == null) {
            return;
        }
        
        STList_ITEM ItemDetail = jsonToObject(json, STList_ITEM.class);
        this.Forward = (To != null)?Integer.parseInt(To):205;
        forwardRequestWithAttr(this.request, this.response, ItemDetail, "SearchResult", ServerENUM.getContent(this.Forward));
    }
}