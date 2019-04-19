<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.codeu.data.Message" %>

<% String countryCode = (String) request.getAttribute("countryCode"); %>
<% String countryName = (String) request.getAttribute("name"); %>
<% List<Message> messages = (List<Message>) request.getAttribute("messages"); %>
<% String currentUser = (String) request.getAttribute("currentUser"); %>
<% Set<String> categories = (HashSet) request.getAttribute("categories"); %>

<!DOCTYPE html>
<html>
  <head>
    <title><%=countryName%></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/user-page.css">
    <script src="/js/message-loader.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/11.2.0/classic/ckeditor.js"></script>
  </head>
  <body onload="buildUI()">
    <div class="navbar">
      <a href="/">Home</a>
    <% if (currentUser != null) { %>
      <a href="/users/<%=currentUser%>">Your Page</a>
    <% } else { %>
      <a href="/login">Login</a>
    <% } %>
      <div class="dropdown">
        <button class="dropbtn">Categories
          <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
          <div>
    <%  Iterator iter = categories.iterator();
        while (iter.hasNext()) {
          String category = (String) iter.next();    %>
          <a href="/country/<%= countryCode %>/c/<%= category %>"><%= category %></a>
    <%  }   %>
  </div>
        </div>
      </div>
    </div>
    <h1 id="page-title"><%= countryName %></h1>




     <h4 id = "food-div">Food Thread</h4>

    <div class="message-container">
      <% 
      int categorySize = 0; 
      for (int j = 0; j < messages.size(); j++) {
            if (messages.get(j).getCategory().equals("Food")) {
              categorySize++;
          }
       }

      if (categorySize == 0) { %>
          <a href="/country/<%= countryCode %>/c/Food"><button class="limitPosts">Be the first to post on this thread.</button></a>
    <%  }
        int limit = 5;
        for(int i = 0; i < messages.size(); i++) {
          if (limit == 0) {
            break;
          }
          if (messages.get(i).getCategory().equals("Food")) {
            limit--;
    %>
          <div class="message-div">
            <div class="message-header">
              User: <%= messages.get(i).getUser() %> |
              Time: <%= new Date(messages.get(i).getTimestamp()) %> |
              Category: <%= messages.get(i).getCategory() %>
            </div>
            <div class="message-body">
              <%= messages.get(i).getText() %>
            </div>
            <% if (currentUser != null && currentUser.equals(messages.get(i).getUser())) { %>
            <form id="delete-form" action="/messages" method="POST">
              <input type="hidden" name="action" value="delete"/>
              <input type="hidden" name="callee" value="/country/<%=countryCode%>"/>
              <input type="hidden" name="messageID" value="<%=messages.get(i).getId()%>"/>
              <button type="submit" value="Submit">DELETE</button>
            </form>
          <% } %>
            </div>
      <%    }
       }  %>
      </div>

      <% if (categorySize != 0) { %>   
        <a href="/country/<%= countryCode %>/c/Food"><button class="limitPosts">Click to see full thread</button></a>
       <%  }
    %>




      <h4 id = "food-div">Culture Thread</h4>
      <div class="message-container">
      <% 
      int categorySizeC = 0; 
      for (int j = 0; j < messages.size(); j++) {
            if (messages.get(j).getCategory().equals("Culture")) {
              categorySizeC++;
          }
       }

      if (categorySizeC == 0) { %>
        <a href="/country/<%= countryCode %>/c/Culture"><button class="limitPosts">Be the first to post on this thread.</button></a>
    <%  }

        int limit1 = 5;
        for(int i = 0; i < messages.size(); i++) {
          if (limit1 == 0) {
            break;
          }
          if (messages.get(i).getCategory().equals("Culture")) {
            limit1--;
    %>
          <div class="message-div">
            <div class="message-header">
              User: <%= messages.get(i).getUser() %> |
              Time: <%= new Date(messages.get(i).getTimestamp()) %> |
              Category: <%= messages.get(i).getCategory() %>
            </div>
            <div class="message-body">
              <%= messages.get(i).getText() %>
            </div>
            <% if (currentUser != null && currentUser.equals(messages.get(i).getUser())) { %>
            <form id="delete-form" action="/messages" method="POST">
              <input type="hidden" name="action" value="delete"/>
              <input type="hidden" name="callee" value="/country/<%=countryCode%>"/>
              <input type="hidden" name="messageID" value="<%=messages.get(i).getId()%>"/>
              <button type="submit" value="Submit">DELETE</button>
            </form>
          <% } %>
            </div>
      <%    }
       }  %>
      </div>

    <% if (categorySizeC != 0) { %>
          <a href="/country/<%= countryCode %>/c/Culture"><button class="limitPosts">Click here to see full thread</button></a>
    <%  }




     
    %>
      <h4 id = "food-div">Attractions Thread</h4>
      <div class="message-container">
      <% 
      int categorySizeA = 0; 
      for (int j = 0; j < messages.size(); j++) {
            if (messages.get(j).getCategory().equals("Attractions")) {
              categorySizeA++;
          }
       }

      if (categorySizeA == 0) { %>
        <a href="/country/<%= countryCode %>/c/Attractions"><button class="limitPosts">Be the first to post on this thread.</button></a>
    <%  }

        int limit2 = 5;
        for(int i = 0; i < messages.size(); i++) {
          if (limit2 == 0) {
            break;
          }
          if (messages.get(i).getCategory().equals("Attractions")) {
            limit2--;
    %>

          <div class="message-div">
            <div class="message-header">
              User: <%= messages.get(i).getUser() %> |
              Time: <%= new Date(messages.get(i).getTimestamp()) %> |
              Category: <%= messages.get(i).getCategory() %>
            </div>
            <div class="message-body">
              <%= messages.get(i).getText() %>
            </div>
            <% if (currentUser != null && currentUser.equals(messages.get(i).getUser())) { %>
            <form id="delete-form" action="/messages" method="POST">
              <input type="hidden" name="action" value="delete"/>
              <input type="hidden" name="callee" value="/country/<%=countryCode%>"/>
              <input type="hidden" name="messageID" value="<%=messages.get(i).getId()%>"/>
              <button type="submit" value="Submit">DELETE</button>
            </form>
          <% } %>
            </div>
      <%    }
       }  %>
      </div>

      <% if (categorySizeA != 0) { %>
          <a href="/country/<%= countryCode %>/c/Attractions"><button class="limitPosts">Click here to see full thread</button></a>
     <% } %>

  </body>
</html>
