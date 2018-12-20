/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Base64;

/**
 *
 * @author Nitani
 */
public class Tools {
    
    //Encode Image to String
    public static String encodeToString(String file) throws FileNotFoundException, IOException {
        String encodedfile = "";
        File filee = new File(file);
        FileInputStream fileInputStreamReader = new FileInputStream(filee);
        byte imageData[] = new byte[(int) filee.length()];
        fileInputStreamReader.read(imageData);
        encodedfile = Base64.getEncoder().encodeToString(imageData);
        return encodedfile;
    }

    //Decode String to Image
    public static String decode(String file) throws FileNotFoundException, IOException {
        String encodedfile = "";
        FileOutputStream imageOutFile = new FileOutputStream("C:\\Users\\Nitani\\Downloads\\METRODATA");
        byte[] imageByteArray = Base64.getDecoder().decode(file);
        imageOutFile.write(imageByteArray);
        return encodedfile;
    }
}
