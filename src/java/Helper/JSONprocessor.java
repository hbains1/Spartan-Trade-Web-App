package Helper;

import com.google.gson.*;
import org.json.*;
import java.lang.reflect.*;
import com.google.gson.reflect.TypeToken;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @date 2020-3-2 22:36:46
 * @author Yi Qiu
 */
public class JSONprocessor {

    public static <T> T jsonToObject(String _jsonString, Class<T> _object) {
        if (_jsonString == null || _jsonString == "")
            return null;
        
        Gson gson = new GsonBuilder().serializeNulls().create();
        Object o = gson.fromJson(_jsonString, _object);
        return gson.fromJson(_jsonString, _object);
    }

    public static <T> T jsonToObject(JSONArray _jsonString, Class<T> _object) {
        String jsonString = _jsonString.toString();
        return jsonToObject(jsonString, _object);
    }

    public static <T> T jsonToObject(JSONObject _jsonString, Class<T> _object) {
        String jsonString = _jsonString.toString();
        return jsonToObject(jsonString, _object);
    }

    public static <T> T jsonToObject(String _jsonString, List<T> _object) {
        Type objType = new TypeToken<ArrayList<T>>() {
        }.getType();
        
        if (_jsonString == null || _jsonString == "")
            return null;
        
        Gson gson = new GsonBuilder().serializeNulls().create();
        return gson.fromJson(_jsonString, objType);
    }

    public static <T> JSONObject objectToJson(T _object) throws JSONException {
        Gson gson = new GsonBuilder().serializeNulls().create();
        String jsonString = gson.toJson(_object);
        return new JSONObject(jsonString);
    }

    public static <T> JSONArray objectToJson(List<T> _object) throws JSONException {
        Gson gson = new GsonBuilder().serializeNulls().create();
        String jsonString = gson.toJson(_object);
        return new JSONArray(jsonString);
    }

}
