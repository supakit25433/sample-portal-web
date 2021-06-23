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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/v1")
public class EducationController {

	@GetMapping("/education")
	public String education(Model model) {
		Date d = new Date();
		model.addAttribute("Date", d);
		return "education";
	}

	@GetMapping("/education/university")
	public String getUniversity(Model model) {
		Date d = new Date();
		model.addAttribute("Date", d);
		model.addAttribute("search", "University");

		try {
			URL url = new URL("http://202.44.139.145/api/public/opendata/univ_uni_11_06");
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("Content-Type", "application/json; utf-8");
			Map<String, List<String>> m = connection.getHeaderFields();
			int responseCode = connection.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
				String line = "";
				StringBuilder responseStrBuilder = new StringBuilder();
				while ((line = br.readLine()) != null) {
					responseStrBuilder.append(line);
				}
				connection.getInputStream().close();
				JSONArray result = new JSONArray(responseStrBuilder.toString());
				ArrayList<Object> al = new ArrayList<Object>();
				for (int i = 0; i < result.length(); i++) {
					al.add(result.get(i));
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
		return "education";
	}

	@GetMapping("/education/demonstration")
	public String getDemonstrationSchool(Model model) {
		Date d = new Date();
		model.addAttribute("Date", d);
		model.addAttribute("search", "Demonstration School");

		try {
			URL url = new URL("http://202.44.139.145/api/public/opendata/satit_sch_11_01");
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("Content-Type", "application/json; utf-8");
			Map<String, List<String>> m = connection.getHeaderFields();
			int responseCode = connection.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(
						new InputStreamReader(connection.getInputStream(), Charset.defaultCharset()));
				String line = "";
				StringBuilder responseStrBuilder = new StringBuilder();
				while ((line = br.readLine()) != null) {
					responseStrBuilder.append(line);
				}
				connection.getInputStream().close();
				JSONArray result = new JSONArray(responseStrBuilder.toString());
				ArrayList<Object> al = new ArrayList<Object>();
				for (int i = 0; i < result.length(); i++) {
					al.add(result.get(i));
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
		return "education";
	}

	@GetMapping("/education/demonstration/nameandsex")
	public String getNumberOfStudents(Model model) {
		Date d = new Date();
		model.addAttribute("Date", d);
		model.addAttribute("search", "Number of Students");

		try {
			URL url = new URL("http://202.44.139.145/api/public/opendata/SATIT_STD_11_03");
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("Content-Type", "application/json; utf-8");
			Map<String, List<String>> m = connection.getHeaderFields();
			int responseCode = connection.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(
						new InputStreamReader(connection.getInputStream(), Charset.defaultCharset()));
				String line = "";
				StringBuilder responseStrBuilder = new StringBuilder();
				while ((line = br.readLine()) != null) {
					responseStrBuilder.append(line);
				}
				connection.getInputStream().close();
				JSONArray result = new JSONArray(responseStrBuilder.toString());
				ArrayList<Object> al = new ArrayList<Object>();
				for (int i = 0; i < result.length(); i++) {
					al.add(result.get(i));
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "education";
	}

}
