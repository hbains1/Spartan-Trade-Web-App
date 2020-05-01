/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Object;

import org.apache.http.client.utils.URIBuilder;

/**
 *
 * @date 2020-3-5 13:58:41
 * @author Yi Qiu
 */
public class ValidationKey {

    private String validationKey;

    private int entityId;

    private String email;

    private int validationId;

    private String validationType;

    public void setValidationKey(String _validationKey) {
        this.validationKey = _validationKey;
    }

    public String getValidationKey() {
        return this.validationKey;
    }

    public void setEntityId(int _entityId) {
        this.entityId = _entityId;
    }

    public int getEntityId() {
        return this.entityId;
    }

    public void setEmail(String _email) {
        this.email = _email;
    }

    public String getEmail() {
        return this.email;
    }

    public void setValidationId(int _validationId) {
        this.validationId = _validationId;
    }

    public int getValidationId() {
        return this.validationId;
    }

    public void setValidationType(String _validationType) {
        this.validationType = _validationType;
    }

    public String getValidationType() {
        return this.validationType;
    }
    
    public String getValidationUrl(){
        URIBuilder valLink = new URIBuilder()
                .setScheme("http")
                .setHost("ec2-3-93-23-132.compute-1.amazonaws.com:8080")
                .setPath("/validateEmail")
                .setParameter("vkey", this.validationKey)
                .setParameter("vtype", this.validationType)
                .setParameter("id", Integer.toString(this.entityId))
                .setParameter("vid",Integer.toString(this.validationId));
        return valLink.toString();
    }
}
