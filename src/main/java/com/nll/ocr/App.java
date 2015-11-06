package com.nll.ocr;

import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;

import java.io.File;
import java.io.IOException;

/**
 * Hello world!
 */
public class App {
    private final static String tessdataPath = "/usr/local/share/";

    public static void main(String[] args) throws IOException {
        String path = "data/input/1.png";
        File file = new File(path);
        String result = ocr(file);
        System.out.println("result：\n" + result);
    }

    public static String ocr(File file) {
        Tesseract instance = Tesseract.getInstance();  // JNA Interface Mapping
        instance.setDatapath(tessdataPath);
        instance.setLanguage("eng");
        //instance.setLanguage("number");
        String result = "";
        try {
            result = instance.doOCR(file);
        } catch (TesseractException e) {
            System.err.println(e.getMessage());
        } finally {

        }
        return result;
    }
}
