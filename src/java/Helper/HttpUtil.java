/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Helper;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;

/**
 *
 * @date 2020-4-22 19:40:10
 * @author Yi Qiu
 */
public class HttpUtil {

    private static HttpClient hclient;

    static {
        hclient = HttpClientBuilder.create().build();
    }

    public static HttpResponse get(String _url) throws IOException {
        HttpGet httpget = new HttpGet(_url);
        return hclient.execute(httpget);
    }

    public static HttpResponse get(String _url, Map _headers) throws IOException {
        HttpGet httpGet = new HttpGet(_url);
        if (_headers != null) {
            Iterator itr = _headers.entrySet().iterator();
            while (itr.hasNext()) {
                Map.Entry<String, String> entry = (Map.Entry<String, String>) itr.next();
                httpGet.setHeader(entry.getKey(), entry.getValue());
            }
        }
        return hclient.execute(httpGet);
    }

    public static HttpResponse post(String _url, String _json) throws IOException {
        HttpEntity entity = new StringEntity(_json, ContentType.APPLICATION_JSON);
        HttpPost httpPost = new HttpPost(_url);
        httpPost.setEntity(entity);
        return hclient.execute(httpPost);
    }

    public static HttpResponse post(String _url, String _json, Map _headers) throws IOException {
        HttpEntity entity = new StringEntity(_json, ContentType.APPLICATION_JSON);
        HttpPost httpPost = new HttpPost(_url);
        httpPost.setEntity(entity);
        if (_headers != null) {
            Iterator itr = _headers.entrySet().iterator();
            while (itr.hasNext()) {
                Map.Entry<String, String> entry = (Map.Entry<String, String>) itr.next();
                httpPost.setHeader(entry.getKey(), entry.getValue());
            }
        }
        return hclient.execute(httpPost);
    }

    public static HttpResponse put(String _url, String _json) throws IOException {
        HttpEntity entity = new StringEntity(_json, ContentType.APPLICATION_JSON);
        HttpPut httpPut = new HttpPut(_url);
        httpPut.setEntity(entity);
        return hclient.execute(httpPut);
    }

    public static HttpResponse put(String _url, String _json, Map _headers) throws IOException {
        HttpEntity entity = new StringEntity(_json, ContentType.APPLICATION_JSON);
        HttpPut httpPut = new HttpPut(_url);
        httpPut.setEntity(entity);
        if (_headers != null) {
            Iterator itr = _headers.entrySet().iterator();
            while (itr.hasNext()) {
                Map.Entry<String, String> entry = (Map.Entry<String, String>) itr.next();
                httpPut.setHeader(entry.getKey(), entry.getValue());
            }
        }
        return hclient.execute(httpPut);
    }

    public static HttpResponse delete(String _url) throws IOException {
        HttpDelete httpDelete = new HttpDelete(_url);
        return hclient.execute(httpDelete);
    }

    public static HttpResponse delete(String _url, Map _headers) throws IOException {
        HttpDelete httpDelete = new HttpDelete(_url);
        if (_headers != null) {
            Iterator itr = _headers.entrySet().iterator();
            while (itr.hasNext()) {
                Map.Entry<String, String> entry = (Map.Entry<String, String>) itr.next();
                httpDelete.setHeader(entry.getKey(), entry.getValue());
            }
        }
        return hclient.execute(httpDelete);
    }

}