/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Control.Trade.TradeItemList;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONException;

/**
 *
 * @author Yi Qiu
 */
@WebServlet(name = "Search", urlPatterns = {"/Search"})
public class TradeInfo extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param _request servlet request
     * @param _response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest _request, HttpServletResponse _response)
            throws ServletException, IOException {
        doPost(_request, _response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param _request servlet request
     * @param _response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest _request, HttpServletResponse _response)
            throws ServletException, IOException {
        try {
            String code = _request.getParameter("code");
            TradeItemList trade = new TradeItemList(getServletConfig(), _request, _response);
            if(code == null || code == ""){
                //Err handler
                return;
            }
            switch(code){
                case "STPV":
                    trade.getHmPagePreviewList();
                    break;
                case "STSR":
                    trade.getSearchResults();
                    break;
                case "STitem":
                    trade.getItemDetail();
                    break;
                case "URSR":
                    trade.getUserItems();
                    break;
                case "URitem":
                    trade.getTargetUserItem();
                    break;
            }
        } catch (JSONException ex) {
            Logger.getLogger(TradeInfo.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Trading handler /n" + 
                "listing opening trade, retrieve the detail infomation of an item, and change trading status.";
    }

}
