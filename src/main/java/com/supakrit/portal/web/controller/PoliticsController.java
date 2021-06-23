package com.supakrit.portal.web.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/v1")
public class PoliticsController {

	@GetMapping("/politics")
	public String politics(Model model) {
		Date d = new Date();
		model.addAttribute("Date", d);
		return "politics";
	}
	
	@GetMapping("/politics/localoffice/location")
	public String getProvincialLocalOfficeLocation(Model model) {
		Date d = new Date();
		model.addAttribute("Date", d);
		model.addAttribute("search", "Location of Provincial Local Office");
		
		try {
			URL url = new URL("https://opend.data.go.th/get-ckan/datastore_search?resource_id=df922923-e009-4dee-92fc-d963a86ce4b8&limit=100");
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			
			connection.setRequestMethod("GET");
			connection.setRequestProperty("Content-Type", "application/json; utf-8");
			connection.setRequestProperty("api-key", "JCizH1CqrBBt8WnUEb558zNgz9SYy1TP");
			
			Map<String, List<String>> m = connection.getHeaderFields();
			int responseCode = connection.getResponseCode();
			if(responseCode == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), Charset.forName("utf-8")));
				String line = "";
				StringBuilder responseStrBuilder = new StringBuilder();
				while((line = br.readLine()) != null) {
					responseStrBuilder.append(line);	
				}		
				connection.getInputStream().close();			
				JSONObject result = new JSONObject(responseStrBuilder.toString());
				JSONObject result2 = (JSONObject) result.get("result");
				JSONArray array = (JSONArray) result2.get("records");
				ArrayList<Object> locationArray = new ArrayList<Object>();
				for(int i = 0; i < array.length(); i++) {
					locationArray.add(array.get(i));
				}
				model.addAttribute("Array", locationArray);
				model.addAttribute("Total", result2);
			}
			
			model.addAttribute("Map", m);
			
			connection.disconnect();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "politics";
	}
	
	@GetMapping("/politics/organizationoffice/location")
	public String getLocalAdministrativeOrganizationOfficeLocation(Model model) {
		Date d = new Date();
		model.addAttribute("Date", d);
		model.addAttribute("search", "Location of Local Administrative Organization Office");
		
		try {
			URL url = new URL("https://opend.data.go.th/get-ckan/datastore_search?resource_id=981ffa6f-2700-407e-9056-0ee05810adc6&limit=8000");
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			
			connection.setRequestMethod("GET");
			connection.setRequestProperty("Content-Type", "application/json; utf-8");
			connection.setRequestProperty("api-key", "JCizH1CqrBBt8WnUEb558zNgz9SYy1TP");
			
			Map<String, List<String>> m = connection.getHeaderFields();

			int responseCode = connection.getResponseCode();
			if(responseCode == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), Charset.forName("utf-8")));
				String line = "";
				StringBuilder responseStrBuilder = new StringBuilder();
				while((line = br.readLine()) != null) {
					responseStrBuilder.append(line);	
				}		
				connection.getInputStream().close();			
				JSONObject result = new JSONObject(responseStrBuilder.toString());	
				JSONObject result2 = (JSONObject) result.get("result");
				JSONArray array = (JSONArray) result2.get("records");
				ArrayList<Object> locationArray = new ArrayList<Object>();
				for(int i = 0; i < array.length(); i++) {
					locationArray.add(array.get(i));
				}
				model.addAttribute("Array", locationArray);
				model.addAttribute("Total", result2);
			}
			
			model.addAttribute("Map", m);
			
			connection.disconnect();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return "politics";
	}
	
	@GetMapping("/politics/organizationoffice/website")
	public String getLocalAdministrativeOrganizationOfficeWebsite(Model model) {
		Date d = new Date();
		model.addAttribute("Date", d);
		model.addAttribute("search", "Website of Provincial Local Office");
		
		try {
			URL url = new URL("https://opend.data.go.th/get-ckan/datastore_search?resource_id=7782218d-baab-4f7d-8bd7-21f2dddbbe89&limit=10000");
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			
			connection.setRequestMethod("GET");
			connection.setRequestProperty("Content-Type", "application/json; utf-8");
			connection.setRequestProperty("api-key", "JCizH1CqrBBt8WnUEb558zNgz9SYy1TP");
			
			Map<String, List<String>> m = connection.getHeaderFields();

			int responseCode = connection.getResponseCode();
			if(responseCode == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), Charset.forName("utf-8")));
				String line = "";
				StringBuilder responseStrBuilder = new StringBuilder();
				while((line = br.readLine()) != null) {
					responseStrBuilder.append(line);	
				}		
				connection.getInputStream().close();			
				JSONObject result = new JSONObject(responseStrBuilder.toString());
				JSONObject result2 = (JSONObject) result.get("result");
				JSONArray array = (JSONArray) result2.get("records");
				ArrayList<Object> websiteArray = new ArrayList<Object>();
				for(int i = 0; i < array.length(); i++) {
					websiteArray.add(array.get(i));
				}
				model.addAttribute("Array", websiteArray);
				model.addAttribute("Total", result2);
			}
			
			model.addAttribute("Map", m);
			
			connection.disconnect();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "politics";
	}
	
	@GetMapping("/politics/organizationoffice/code")
	public String getLocalAdministrativeOrganizationOfficeCode(Model model) {
		Date d = new Date();
		model.addAttribute("Date", d);
		model.addAttribute("search", "Code of Provincial Local Office");
		
		try {
			URL url = new URL("https://opend.data.go.th/opend-search/vir_9793_1611202992/query?dsname=vir_9793_1611202992&path=vir_9793_1611202992&property=col_4&operator=S_EQUALS&valueLiteral=%E0%B8%81%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%B5%E0%B9%88&loadAll=1&type=json&limit=1000&offset=0");
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			
			connection.setRequestMethod("GET");
			connection.setRequestProperty("api-key", "JCizH1CqrBBt8WnUEb558zNgz9SYy1TP");
			
			Map<String, List<String>> m = connection.getHeaderFields();

			int responseCode = connection.getResponseCode();
			if(responseCode == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), Charset.forName("utf-8")));
				String line = "";
				StringBuilder responseStrBuilder = new StringBuilder();
				while((line = br.readLine()) != null) {
					responseStrBuilder.append(line);	
				}		
				connection.getInputStream().close();			
				JSONObject result = new JSONObject(responseStrBuilder.toString());
				JSONArray array = (JSONArray) result.get("data");
				ArrayList<Object> codeArray = new ArrayList<Object>();
				for(int i = 0; i < array.length(); i++) {
					codeArray.add(array.get(i));
				}
				model.addAttribute("Array", codeArray);
				model.addAttribute("Total", result);
			}
			
			model.addAttribute("Map", m);
			
			connection.disconnect();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "politics";
	}
	
}
