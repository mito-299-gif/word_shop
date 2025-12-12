<%@ page import="java.io.*, java.net.*, java.util.*" %>
<%@ page contentType="application/json; charset=UTF-8" %>
<%
   
    response.setHeader("Access-Control-Allow-Origin", "*");
    response.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
    response.setHeader("Access-Control-Allow-Headers", "Content-Type, Authorization");
    response.setHeader("Access-Control-Max-Age", "3600");

   
    if ("OPTIONS".equals(request.getMethod())) {
        response.setStatus(200);
        return;
    }

    String externalUrl = "https://api.whiteee.store/api/ps";
    String method = request.getMethod();
    String pathInfo = request.getPathInfo();
    if (pathInfo != null && pathInfo.length() > 1) {
        externalUrl += pathInfo; 
    }

    try {
        URL url = new URL(externalUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod(method);

 
        Enumeration<String> headerNames = request.getHeaderNames();
        while (headerNames.hasMoreElements()) {
            String headerName = headerNames.nextElement();
            if (!"host".equalsIgnoreCase(headerName) && !"connection".equalsIgnoreCase(headerName)) {
                conn.setRequestProperty(headerName, request.getHeader(headerName));
            }
        }

        if ("POST".equals(method) || "PUT".equals(method)) {
            conn.setDoOutput(true);
            InputStream is = request.getInputStream();
            OutputStream os = conn.getOutputStream();
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = is.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
            os.close();
            is.close();
        }

        
        int responseCode = conn.getResponseCode();
        response.setStatus(responseCode);

    
        Map<String, List<String>> responseHeaders = conn.getHeaderFields();
        for (Map.Entry<String, List<String>> entry : responseHeaders.entrySet()) {
            if (entry.getKey() != null) {
                for (String value : entry.getValue()) {
                    response.addHeader(entry.getKey(), value);
                }
            }
        }

       
        InputStream responseStream = (responseCode >= 200 && responseCode < 300) ? conn.getInputStream() : conn.getErrorStream();
        if (responseStream != null) {
            BufferedReader reader = new BufferedReader(new InputStreamReader(responseStream, "UTF-8"));
            StringBuilder responseBody = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                responseBody.append(line);
            }
            reader.close();
            out.print(responseBody.toString());
        }

        conn.disconnect();
    } catch (Exception e) {
        response.setStatus(500);
        out.print("{\"error\": \"" + e.getMessage() + "\"}");
    }
%>
