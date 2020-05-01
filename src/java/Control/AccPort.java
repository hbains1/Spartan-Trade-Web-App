package Control;

import java.io.IOException;
import Control.Account.Account;
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
@WebServlet(urlPatterns = {"/Acc"})
public class AccPort extends HttpServlet {

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
            Account acc = new Account(getServletConfig(),_request, _response);
            if (code == null || code == "") {
                //Err handler
                return;
            }
            switch (code) {
                case "SignUp":
                    acc.signUp();
                    break;
                case "SignIn":
                    acc.signIn();
                    break;
                case "Logoff":
                    acc.logOff();
                    break;
                case "Delete":
                    acc.deleteAccount();
                    break;
                case "ForgotPassword":
                    acc.forgotPassword();
                    break;
                case "UpdatePassword":
                    acc.updatePassword();
                    break;    
            }
        } catch (JSONException ex) {
            Logger.getLogger(AccPort.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Email verification handler & Account handler /n"
                + "Receiving data from web-page /n"
                + "Returning reponse and proper action";
    }

}
