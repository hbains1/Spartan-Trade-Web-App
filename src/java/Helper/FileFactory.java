package Helper;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @date 2020-4-17 11:28:33
 * @author Yi Qiu
 */
public class FileFactory {

    // upload settings
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; 	// 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

    public static String getMD5(byte[] _file) throws NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance("MD5");
        digest.update(_file);
        BigInteger out = new BigInteger(1, digest.digest());
        String append = "0";
        return (out.toString().length() < 16) ? append + out.toString() : out.toString();
    }

    public static String getMD5(File _file) throws NoSuchAlgorithmException, IOException {
        InputStream fileinput = new FileInputStream(_file);
        byte[] buffer = new byte[(int) _file.length()];
        fileinput.read(buffer);
        return getMD5(buffer);
    }

    public static Integer servletFileUpload(HttpServletRequest _request, String _acceptExtension) {
        if (!ServletFileUpload.isMultipartContent(_request)) {
            return null;
        }
        Integer re = null;
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setFileSizeMax(MAX_FILE_SIZE);
        upload.setSizeMax(MAX_REQUEST_SIZE);
        String uploadPath = "/home/ubuntu/images";
       
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        try {
            List<FileItem> formItems = upload.parseRequest(_request);
            List<String> failList = new ArrayList<String>();
            List<String> successList = new ArrayList<String>();
            if (formItems != null && formItems.size() > 0) {
                for (FileItem item : formItems) {
                    if (!item.isFormField()) {
                        String extension = getExtension(item);
                        if (extensionValidCheck(extension, _acceptExtension)) {
                            String filePath = uploadPath + File.separator + getMD5(item.get()) + "." + extension;
                            File storeFile = new File(filePath);
                            item.write(storeFile);
                            System.out.print(filePath);
                            successList.add(filePath.substring(filePath.lastIndexOf(File.separator)+1));
                        } else {
                            failList.add(item.getName());
                        }
                    }else{
                        if(item.getFieldName().equals("itemId")){
                            re = Integer.parseInt(item.getString());
                        }
                    }
                }
                _request.getSession().setAttribute("successList", successList);
                _request.getSession().setAttribute("failList", failList);
            }
        } catch (Exception ex) {
            System.out.print(ex);
            return re;
        }

        return re;
    }

    private static String getExtension(FileItem _file) {
        String format = "none";
        String fileName = _file.getName();
        int index = fileName.lastIndexOf(".");
        if (index > 0) {
            format = fileName.substring(index + 1);
            format = format.toLowerCase();
        }
        return format;
    }

    private static String getExtension(String _file) {
        String format = "none";
        int index = _file.lastIndexOf(".");
        if (index > 0) {
            format = _file.substring(index + 1);
            format = format.toLowerCase();
        }
        return format;
    }

    private static boolean extensionValidCheck(String _ext, String _checklist) {
        boolean re = false;
        String[] extlist = _checklist.split(",");
        for (String s : extlist) {
            if (s.equals(_ext)) {
                re = true;
            }
        }
        return re;
    }
}
