/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.entity.Contact;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author saini
 */
public class ContactDAO {
    
    private Connection conn;
    
    public ContactDAO(Connection conn){
        super();
        this.conn = conn;
    }
    public boolean saveContact(Contact c){
        boolean f = false;
        
        try{
            String sql = "insert into contacts(name, email, phone, about, userId) values(?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, c.getName());
            ps.setString(2, c.getEmail());
            ps.setString(3, c.getPhone());
            ps.setString(4, c.getAbout());
            ps.setInt(5, c.getUserId());
             
            int i=ps.executeUpdate();
            
            if(i==1){
                f=true;
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    public List<Contact> getAllContact(int uId){
        List<Contact> list = new ArrayList<Contact>();
        Contact c = null;
        try{
            String sql = "select * from contacts where userid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, uId);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                c = new Contact();
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                c.setEmail(rs.getString(3));
                c.setPhone(rs.getString(4));
                c.setAbout(rs.getString(5));
                list.add(c);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        
        return list;
    }
    
    public Contact getContactByID(int cid){
       Contact c = new Contact();
       
       try{
           PreparedStatement ps = conn.prepareStatement("select * from contacts where id=?");
           ps.setInt(1, cid);
           
           ResultSet rs=ps.executeQuery();
           
           while(rs.next()){
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                c.setEmail(rs.getString(3));
                c.setPhone(rs.getString(4));
                c.setAbout(rs.getString(5));
           }
           
       }catch(Exception exc){
           exc.printStackTrace();
       }
       
        return c;
    }
    
    public boolean editContact(Contact c){
         boolean f = false;
        
        try{
            String sql = "update contacts set name =?, email=?, phone=?, about=? where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, c.getName());
            ps.setString(2, c.getEmail());
            ps.setString(3, c.getPhone());
            ps.setString(4, c.getAbout());
            ps.setInt(5, c.getId());
             
            int i=ps.executeUpdate();
            
            if(i==1){
                f=true;
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    public boolean deleteContactByID(int id){
        boolean f = false;
        try{
            String sql = "delete from contacts where id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            int i=ps.executeUpdate();
            if(i==1){
                f =true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
}
