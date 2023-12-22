package kr.co.group.utility;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class Utility {
	
	public Utility() {}
	
	@ResponseBody
    @RequestMapping(value="/uploadSummernoteImageFile",method=RequestMethod.POST)
    public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,HttpServletRequest request) { 
		JsonObject jsonObject = new JsonObject(); 

        //파일저장 외부 경로, 파일명, 저장할 파일명         
		try { 

			String originalFileName = multipartFile.getOriginalFilename(); 
			String root = request.getSession().getServletContext().getRealPath("resources"); 
			String savePath = root + "\\image\\review\\summerImageFiles"; 
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); 
			String extension = originalFileName.substring(originalFileName.lastIndexOf(".")+1); 
			String boardFileRename = sdf.format(new Date(System.currentTimeMillis())) + "." + extension;  
			File targetFile = new File(savePath); 

			if(!targetFile.exists()) { 
				targetFile.mkdir(); 
			} 
			
			multipartFile.transferTo(new File(savePath+"\\"+boardFileRename)); 

			System.out.println(savePath); 

			jsonObject.addProperty("url","/storage"+boardFileRename); 
			jsonObject.addProperty("originName",originalFileName); 
			jsonObject.addProperty("reponseCode","success");
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return jsonObject;
    }
}
