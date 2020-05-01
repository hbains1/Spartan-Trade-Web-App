/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Control;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @date 2020-3-21 19:27:07
 * @author Yi Qiu
 */
public class ServletBased {
    protected ServletConfig config;
    protected HttpServletRequest request;
    protected HttpServletResponse response;
    protected Integer Forward = 205;//Page Not Found

    public ServletBased(ServletConfig _config,HttpServletRequest _request, HttpServletResponse _response) {
        this.config = _config;
        this.request = _request;
        this.response = _response;
    }  

    public HttpServletRequest getRequest() {
        return request;
    }

    public HttpServletResponse getResponse() {
        return response;
    }
    
    
}
