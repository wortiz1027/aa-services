package us.com.service.aa.ws.config;

import javax.xml.bind.annotation.adapters.XmlAdapter;

import java.time.LocalDateTime;

public class LocalDateAdapter extends XmlAdapter<String, LocalDateTime> {

    public LocalDateTime unmarshal(String v) throws Exception {
        return LocalDateTime.parse(v);
    }

    public String marshal(LocalDateTime v) throws Exception {
        return v.toString();
    }

}
