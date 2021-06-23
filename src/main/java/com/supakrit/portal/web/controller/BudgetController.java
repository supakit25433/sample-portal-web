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
public class BudgetController {

	@GetMapping("/governBudget")
	public String budget(Model model) {
		Date d = new Date();
		model.addAttribute("Date", d);
		return "budget";
	}
	
	@GetMapping("/governBudget/ministry")
	public String getMinistry(Model model) {
		Date d = new Date();
		model.addAttribute("Date", d);
		model.addAttribute("search", "Ministry List");
		
		try {
			URL url = new URL("https://opend.data.go.th/govspending/bbministry?api-key=JCizH1CqrBBt8WnUEb558zNgz9SYy1TP");
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
				JSONArray array = (JSONArray) result.get("result");
				ArrayList<Object> ministryArray = new ArrayList<Object>();
				for(int i = 0; i < array.length(); i++) {
					ministryArray.add(array.get(i));
				}
				model.addAttribute("Array", ministryArray);
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
		return "budget";
	}
	
	@GetMapping("/governBudget/procurementproject")
	public String getProcurementProject(Model model) {
		Date d = new Date();
		model.addAttribute("Date", d);
		model.addAttribute("search", "Procurement Project");
		
		try {
			URL url = new URL("https://opend.data.go.th/govspending/cgdcontract?api-key=JCizH1CqrBBt8WnUEb558zNgz9SYy1TP");
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
				JSONArray resultArray = (JSONArray) result.get("result");
				ArrayList<Object> procurementArray = new ArrayList<Object>();
				for(int i = 0; i < resultArray.length(); i++) {
					procurementArray.add(resultArray.get(i));
				}
				model.addAttribute("Array", procurementArray);
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
		return "budget";
	}
	
	@GetMapping("/governBudget/disbursement2563")
	public String getBudgetAndDisbursement2563(Model model) {
		Date d = new Date();
		model.addAttribute("Date", d);
		model.addAttribute("search", "Budget & Disbursement 2563");
		
		try {
			URL url = new URL("https://opend.data.go.th/govspending/bbgf_summary?api-key=JCizH1CqrBBt8WnUEb558zNgz9SYy1TP&year=2563");
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
				model.addAttribute("Response", result.get("result"));
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
		return "budget";
	}
	
	@GetMapping("/governBudget/province")
	public String getProvincesList(Model model) {
		Date d = new Date();
		model.addAttribute("Date", d);
		model.addAttribute("search", "Provinces List");
		
		try {
			URL url = new URL("https://opend.data.go.th/govspending/bbgfmisprovince?api-key=JCizH1CqrBBt8WnUEb558zNgz9SYy1TP");
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
				JSONArray array = (JSONArray) result.get("result");
				ArrayList<Object> provinceArray = new ArrayList<Object>();
				for(int i = 0; i < array.length(); i++) {
					provinceArray.add(array.get(i));
				}
				model.addAttribute("Array", provinceArray);
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
		return "budget";
	}
	
	@GetMapping("/governBudget/department")
	public String getDepartment(Model model) {
		Date d = new Date();
		model.addAttribute("Date", d);
		model.addAttribute("search", "Department List");
		
		try {
			URL url = new URL("https://opend.data.go.th/govspending/bbagc?api-key=JCizH1CqrBBt8WnUEb558zNgz9SYy1TP");
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
				JSONArray array = (JSONArray) result.get("result");
				ArrayList<Object> departmentArray = new ArrayList<Object>();
				for(int i = 0; i < array.length(); i++) {
					departmentArray.add(array.get(i));
				}
				model.addAttribute("Array", departmentArray);
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
		return "budget";
	}
	
	@GetMapping("/governBudget/juristic")
	public String getJuristicOfSinosiam(Model model) {
		Date d = new Date();
		model.addAttribute("Date", d);
		model.addAttribute("search", "Juristic ID 0105537004444");
		
		try {
			URL url = new URL("https://opend.data.go.th/moc/juristic?api-key=JCizH1CqrBBt8WnUEb558zNgz9SYy1TP&juristic_id=0105537004444");
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			
			connection.setRequestMethod("GET");
			connection.setRequestProperty("Content-Type", "application/json; utf-8");
			
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
		return "budget";
	}
	
}
