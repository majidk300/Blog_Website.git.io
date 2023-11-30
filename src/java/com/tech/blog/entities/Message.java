
package com.tech.blog.entities;


public class Message {
    
    private String content;
    private String type;
    private String cssClass;
    
    
    public Message(String content, String type, String cssClass){
        this.content=content;
        this.type=type;
        this.cssClass=cssClass;
    }
    
    //getter and setters
    
    public String getContent(){
        return content;
    }
    
    public void setContent(String content){
        this.content=content;
    }
    
     public String gettype(){
        return type;
    }
    
    public void settype(String type){
        this.type=type;
    }
    
     public String getcssClass(){
        return cssClass;
    }
    
    public void setcssClass(String cssClass){
        this.cssClass=cssClass;
    }
    
}
