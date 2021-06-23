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
public class HealthController {

	@GetMapping("/health")
	public String health(Model model) {
		Date d = new Date();
		model.addAttribute("Date", d);
		return "health";
	}
	
	@GetMapping("/health/covid-19/daily")
	public String getDailyCovid(Model model) {
		Date d = new Date();
		model.addAttribute("Date", d);
		model.addAttribute("search", "Daily Covid-19");
		
		try {
			URL url = new URL("https://covid19.th-stat.com/json/covid19v2/getTodayCases.json");
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("Content-Type", "application/json; utf-8");
			Map<String, List<String>> m = connection.getHeaderFields();
			int responseCode = connection.getResponseCode();
			if(responseCode == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), Charset.defaultCharset()));
				String line = "";
				StringBuilder responseStrBuilder = new StringBuilder();
				while((line = br.readLine()) != null) {
					responseStrBuilder.append(line);	
				}
				connection.getInputStream().close();
				JSONObject result = new JSONObject(responseStrBuilder.toString());
				model.addAttribute("Response", result);
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
		return "health";
	}
	
	@GetMapping("/health/covid-19/timeline")
	public String getTimeCovid(Model model) {
		Date d = new Date();
		model.addAttribute("Date", d);
		model.addAttribute("search", "Timeline Covid-19");
		
		try {
			URL url = new URL("https://covid19.th-stat.com/json/covid19v2/getTimeline.json");
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("Content-Type", "application/json; utf-8");	
			Map<String, List<String>> m = connection.getHeaderFields();
			int responseCode = connection.getResponseCode();
			if(responseCode == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), Charset.defaultCharset()));
				String line = "";
				StringBuilder responseStrBuilder = new StringBuilder();
				while((line = br.readLine()) != null) {
					responseStrBuilder.append(line);	
				}
				connection.getInputStream().close();
				JSONObject result = new JSONObject(responseStrBuilder.toString());
				JSONArray array = (JSONArray) result.get("Data");
				ArrayList<Object> al = new ArrayList<Object>();
				for(int i = 0; i < array.length(); i++) {
					al.add(array.get(i));
				}
				model.addAttribute("Array", al);
				model.addAttribute("Response", result);
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
		return "health";
	}
	
	@GetMapping("/health/covid-19/bycase")
	public String getCaseCovid(Model model) {
		Date d = new Date();
		model.addAttribute("Date", d);
		model.addAttribute("search", "Summary Case Covid-19");
		
		try {
			URL url = new URL("https://covid19.th-stat.com/json/covid19v2/getSumCases.json");
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("Content-Type", "application/json; utf-8");
			Map<String, List<String>> m = connection.getHeaderFields();
			int responseCode = connection.getResponseCode();
			if(responseCode == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), Charset.forName("TIS-620")));
				String line = "";
				StringBuilder responseStrBuilder = new StringBuilder();
				while((line = br.readLine()) != null) {
					responseStrBuilder.append(line);	
				}		
				connection.getInputStream().close();			
				JSONObject result = new JSONObject(responseStrBuilder.toString());	
				JSONArray province = (JSONArray) result.get("Province");
				ArrayList<Object> provinceArray = new ArrayList<Object>();
				for(int i = 0; i < province.length(); i++) {
					provinceArray.add(province.get(i));
				}
				JSONArray nation = (JSONArray) result.get("Nation");
				ArrayList<Object> nationArray = new ArrayList<Object>();
				for(int i = 0; i < nation.length(); i++) {
					nationArray.add(nation.get(i));
				}
				JSONArray gender = (JSONArray) result.get("Gender");
				ArrayList<Object> genderArray = new ArrayList<Object>();
				for(int i = 0; i < gender.length(); i++) {
					genderArray.add(gender.get(i));
				}
				model.addAttribute("Response", result);
				model.addAttribute("ProvinceArray", provinceArray);
				model.addAttribute("NationArray", nationArray);
				model.addAttribute("GenderArray", genderArray);
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
		return "health";
	}
	
}
