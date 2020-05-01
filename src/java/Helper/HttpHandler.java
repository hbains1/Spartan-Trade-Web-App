/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Helper;

import Control.ServletBased;
import Dict.ServerENUM;
import static Dict.TypeIdentifier.*;
import static Helper.JSONprocessor.jsonToObject;
import static Helper.JSONprocessor.objectToJson;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.*;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.http.HttpResponse;
import org.apache.http.entity.StringEntity;
import org.apache.http.util.EntityUtils;
import org.json.JSONException;

/**
 *
 * @date 2020-3-5 15:07:23
 * @author Yi Qiu
 */
public class HttpHandler {

    public static <T> T loadFromHttpRequest(HttpServletRequest _request, Class<T> _object) throws InstantiationException, IllegalAccessException {
        T ret = _object.newInstance();
        Field[] field = _object.getDeclaredFields();
        for (Field f : field) {
            f.setAccessible(true);
            System.out.println(f.getType());
            f.set(ret, castHelper(f.getType(), _request.getParameter(f.getName())));
        }
        return ret;
    }

    public static HttpServletRequest addToHttpRequest(HttpServletRequest _request, Object _object) throws InstantiationException, IllegalAccessException {
        Class clas = _object.getClass();
        Field[] field = clas.getDeclaredFields();
        for (Field f : field) {
            _request.setAttribute(f.getName(), f.get(_object));
        }
        return _request;
    }

    public static void addToHttpSession(HttpServletRequest _request, Object _object) throws InstantiationException, IllegalAccessException {
        HttpSession session = _request.getSession();
        Class clas = _object.getClass();
        Field[] field = clas.getDeclaredFields();
        for (Field f : field) {
            session.setAttribute(f.getName(), f.get(_object));
        }
    }

    public static HttpResponse sendHttpRequest(String _URL, String _Json, String _method, Map _headers) throws UnsupportedEncodingException, IOException {
        //Pre-set Variables
        _Json = (_Json == null)?"null":_Json;
        HttpResponse response = null;

        //Creating Request and retrieve Response
        switch (_method) {
            case "POST":
                response = HttpUtil.post(_URL, _Json, _headers);
                break;
            case "PUT":
                response = HttpUtil.put(_URL, _Json, _headers);
                break;
            case "GET":
                response = HttpUtil.get(_URL, _headers);
                break;
            case "DELETE":
                response = HttpUtil.delete(_URL, _headers);
                break;
        }
        return response;
    }

    public static void sendAjaxResponse(HttpServletResponse _response, String _status, String _text) throws IOException, JSONException {
        _response.setContentType("text/plain");
        _response.setCharacterEncoding("UTF-8");
        Map<String, String> ret = new HashMap();
        ret.put("status", _status);
        ret.put("content", _text);
        _response.getWriter().write(objectToJson(ret).toString());
    }

    public static void forwardRequestWithAttr(HttpServletRequest _request, HttpServletResponse _response, Object _objects, String _attrname, String _to) throws ServletException, IOException {
        _request.setAttribute(_attrname, _objects);
        RequestDispatcher requestDispatcher = _request.getRequestDispatcher(_to);
        requestDispatcher.forward(_request, _response);
    }

    public static String getCheckedResponse(ServletBased _resPair, HttpResponse _res, String _method) throws ServletException {
        try {
            if (_res.getStatusLine().getStatusCode() != 200) {
                Map error = jsonToObject(EntityUtils.toString(_res.getEntity()), HashMap.class);
                switch (_method) {
                    case "Ajax":
                        sendAjaxResponse(_resPair.getResponse(), "Error", (String) error.get("message"));
                        break;
                    case "HttpServlet":
                        forwardRequestWithAttr(_resPair.getRequest(), _resPair.getResponse(), error, "Error", ServerENUM.getContent(201));
                        break;
                    default:
                        throw new RuntimeException("Unknown method");
                }
            } else {
                return EntityUtils.toString(_res.getEntity());
            }

        } catch (JSONException | IOException ex) {
            Logger.getLogger(HttpHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static String getResponseContent(HttpResponse _response) throws IOException {
        return EntityUtils.toString(_response.getEntity());
    }

    private static Object castHelper(Class _attrType, String _from) {
        try {
            switch (_attrType.toString()) {
                case INT:
                    return Integer.parseInt(_from);
                case BOOLEAN:
                    return Boolean.parseBoolean(_from);
                case STRING:
                    return _from;
                case LONG:
                    return Long.parseLong(_from);
                case SHORT:
                    return Short.parseShort(_from);
                case FLOAT:
                    return Float.parseFloat(_from);
                case DOUBLE:
                    return Double.parseDouble(_from);
                case CHAR:
                    return (_from.length() <= 1) ? _from.charAt(0) : null;
                case BYTE:
                    return (_from.length() <= 1) ? _from.getBytes() : null;
            }
        } catch (Exception e) {
            throw e;
        }
        return null;
    }
}
