module LP
  module Destinations
    TEMPLATE = <<-HTML
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Lonely Planet</title>
    <link href="all.css" media="screen" rel="stylesheet" type="text/css">
  </head>

  <body>
    <div id="container">
      <div id="header">
        <div id="logo"></div>
        <h1>Lonely Planet: <%= self.title %></h1>
      </div>

      <div id="wrapper">
        <div id="sidebar">
          <div class="block">
            <h3>Navigation</h3>
            <div class="content">
              <div class="inner">
                <% self.ancestors.each do |ancestor| %>
                <a href="<%= ancestor.id %>.html"><%= ancestor.title %></a> &raquo; 
                <% end %>
                <%= self.title %>
              </div>
            </div>
          </div>
        </div>

        <div id="main">
          <div class="block">
            <% if self.children.any? %>
            <div class="secondary-navigation">
              <ul>
                <% self.children.each do |child| %>
                <li class="first"><a href="<%= child.id %>.html"><%= child.title %></a></li>
                <% end %>
              </ul>
              <div class="clear"></div>
            </div>
            <% end %>
            <div class="content">
              <div class="inner">
                <%= self.content %>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
    HTML

    CSS = <<-CSS
    * {margin:0;padding:0}
.clear { clear: both; height: 0; }

h1 { margin: 15px 0; font-size: 22px; font-weight: normal; }
h2 { font-size: 22px; margin: 15px 0; font-weight: normal;}
h3 { font-size: 18px; margin: 10px 0; font-weight: normal;}
h4 { font-size: 16px; margin: 10px 0; font-weight: normal;}
hr {height: 1px; border: 0; }
p { margin: 15px 0;}
a img { border: none; }

body {
  font-size: 12px;
  font-family: sans-serif;
}

#container {
  min-width: 960px;
}

#header, #wrapper, #footer {
  padding: 0 20px;
}

#header {
  position: relative;
  padding-top: 1px;
}

#header h1 {
  margin: 0;
  padding: 10px 0;
  font-size: 30px;
  color: #FFFFFF;
}

#header h1 a:link, #header h1 a:active, #header h1 a:hover, #header h1 a:visited {
  text-decoration: none;
}

#main {
  width: 70%;
  float: left;
}

.actions-bar {
  padding: 10px 1px;
}

.actions-bar .actions {
  float: left;
  margin-bottom: 10px;
}

.actions-bar .pagination {
  float: right;
  padding: 1px 0;
}

#sidebar {
  width: 25%;
  float: right;
}

#sidebar h3 {
  padding: 10px 15px;
  margin: 0;
  font-size: 13px;
}

#sidebar .block {
  margin-bottom: 20px;
  padding-bottom: 10px;
}

#sidebar .block .content {
  padding: 0 15px;
}

#sidebar ul.navigation li a:link, #sidebar ul.navigation li a:visited {
  display: block;
  padding: 10px 15px;
}

#sidebar .block .sidebar-block, #sidebar .notice {
  padding:10px;
}

#wrapper {
  padding-top: 20px;
}

#main .block {
  margin-bottom: 20px;
  padding-top: 1px;
}

#main .block .content .inner {
  padding: 15px 15px 0 15px;
}

#main .main p.first {
  margin-top: 0;
}

#user-navigation {
  position: absolute;
  top: 0px;
  right: 20px;
}

#user-navigation ul, #main-navigation ul, .secondary-navigation ul, #sidebar ul.navigation {
  margin: 0;
  padding: 0;
  list-style-type: none;
}

#user-navigation ul li, #main-navigation ul li, .secondary-navigation ul li {
  float: left;
}

#main-navigation ul li {
  margin-right: 5px;
}

#user-navigation ul li {
  padding: 5px 10px;
}

#main-navigation ul li a:link, #main-navigation ul li a:visited, #main-navigation ul li a:hover, #main-navigation ul li a:active,
.secondary-navigation ul li a:link, .secondary-navigation ul li a:visited, .secondary-navigation ul li a:hover, .secondary-navigation ul li a:active,
#user-navigation ul li a:link, #user-navigation ul li a:visited, #user-navigation ul li a:hover, #user-navigation ul li a:active {
  text-decoration: none;
}

#main-navigation ul li a {
  font-size: 15px;
  display: block;
  padding: 8px 15px;
}

.secondary-navigation {
  font-size: 13px;
  border-bottom-width: 10px;
  border-bottom-style: solid;
}

.secondary-navigation ul li a {
  display: block;
  padding: 10px 15px;
}

#footer {
  padding-bottom: 20px;
}

/* pagination */

.pagination a, .pagination span {
  padding: 2px 5px;
  margin-right: 5px;
  display: block;
  float: left;
}

.pagination span.current {
  font-weight: bold;
  border-width: 1px;
  border-style: solid;
}

.pagination a {
  text-decoration: none;
  border-width: 1px;
  border-style: solid;
}

/* tables */
.table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 15px;
  font-size: 12px;
}

.table th {
  padding: 10px;
  font-weight: bold;
  text-align: left;
}

.table th.first {
  width: 30px;
}

.table .checkbox {
  margin-left: 10px;
}

.table td {
  padding: 10px;
}


/* lists */

ul.list {
  margin: 0;
  padding: 0;
  list-style-type: none;
}

ul.list li {
  clear: left;
  padding-bottom: 5px;
}

ul.list li .left {
  float: left;
}

ul.list li .left .avatar {
  width: 50px;
  height: 50px;
}

ul.list li .item {
  margin-left: 80px;
}

ul.list li .item .avatar {
  float: left;
  margin: 0 5px 5px 0;
  width: 30px;
  height: 30px;
}

/* box */

#box {
  width: 500px;
  margin: 50px auto;
}

#box .block {
  margin-bottom: 20px;
}

#box .block h2 {
  padding: 10px 15px;
  margin: 0;
}

#box .block .content {
  padding: 15px 20px;
}



.small { font-size:11px; }
.gray { color:#999999; }
.hightlight { background-color:#FFFFCC; }

a:link, a:visited, a:hover, a:active, h1, h2, h3 { color: #0A4F9C; }
a { -moz-outline: none; }

body {
  color: #222;
  background: #f0f0ee;
  font-family: helvetica, arial, sans-serif;
}

hr {
  background: #f0f0ee;
  color: #f0f0ee;
}

#header {
  background: #0A4F9C;
}

#header h1 {
  padding: 20px 0;
}

#header h1 a:link, #header h1 a:active, #header h1 a:hover, #header h1 a:visited {
  color: #FFF;
}

#user-navigation {
  top: auto;
  bottom: 5px;
  right: 25px;
}

#main .block .content {
  background: #FFF;
  padding-top: 1px;
}

#main .block .content h2 {
  margin-left: 15px;
}

#sidebar .block {
  background: #FFF;
}

#sidebar h3 {
  background: #0A4F9C;
  color: #FFF;
  border-bottom: 10px solid #262626;
}

.block h3.title {
  background: #0A4F9C;
  color: #FFF;
  border-bottom: 10px solid #262626;
  font-size:13px;
  margin:0;
  padding:10px 15px;
}

#main-navigation ul li {
  padding-left: 15px;
}

#main-navigation ul li a {
  padding: 8px 0;
}

#main-navigation ul li.active {
  padding: 0;
  margin-left: 15px;
}

#main-navigation ul li.active {
  margin-left: 15px;
}

#main-navigation ul li.active a {
  padding: 8px 15px;
}

#sidebar ul li a:link, #sidebar ul li a:visited {
  background: #FFF;
  border-bottom: 1px solid #F0F0EE;
  text-decoration: none;
}

#sidebar ul li a:hover, #sidebar ul li a:active {
  background: #470E0E;
  color: #FFF;
}

#main-navigation {
  background: #262626;
}

#main-navigation ul li {
  background: #262626;
  margin-right: 0;
}

#main-navigation ul li.active {
  background: #f0f0ee;
}

#main-navigation ul li a:link, #main-navigation ul li a:visited, #main-navigation ul li a:hover, #main-navigation ul li a:active,
.secondary-navigation ul li a:link, .secondary-navigation ul li a:visited, .secondary-navigation ul li a:hover, .secondary-navigation ul li a:active,
#user-navigation ul li a:link, #user-navigation ul li a:visited, #user-navigation ul li a:hover, #user-navigation ul li a:active {
  text-decoration: none;
  color: #FFF;
}

.secondary-navigation li a:hover {
  background: #470E0E;
}

#main-navigation ul li.active a:link, #main-navigation ul li.active a:visited, #main-navigation ul li.active a:hover, #main-navigation ul li.active a:active {
  color: #262626;
}

.secondary-navigation {
  background: #0A4F9C;
  border-bottom-color: #262626;
}

.secondary-navigation ul li.active, .secondary-navigation ul li.active a:hover {
  background-color: #262626;
}

#footer .block {
  color: #FFF;
  background: #262626;
  width: 70%;
}

#footer .block p {
  margin: 0;
  padding: 10px;
}

/* pagination */

.pagination span.current {
  background: #262626;
  color: #FFF;
  border-color: #262626;
}

.pagination a {
  color: #262626;
  border-color: #262626;
}

.pagination a:hover {
    color: #FFF;
    background: #262626;
}

/* tables */

.table th {
  background: #262626;
  color: #FFF;
}

.table td {
  border-bottom:1px solid #F0F0EE;
}

/* forms */
.form label.label, .form input.text, .form textarea {
  font-size: 1.0em;
}

.form input.text, .form textarea {
  width: auto;
  font-size: 0.9em;
  border: 1px solid #262626;
}

.form input.button, .inline-form input.button {
  background: #EEE;
  color: #262626;
  padding: 2px 5px;
  border: 1px solid #262626;
  cursor: pointer;
}

.form .description {
  font-style: italic;
  color: #8C8C8C;
  font-size: .9em;
  display: block;
}

/* lists */

ul.list li {
  border-bottom-color: #F0F0EE;
  border-bottom-width: 1px;
  border-bottom-style: solid;
}

ul.list li .item .avatar {
  border-color: #F0F0EE;
  border-width: 1px;
  border-style: solid;
  padding: 2px;
}

/* box */

#box .block {
  background: #FFF;
}

#box .block h2 {
  background: #0A4F9C;
  color: #FFF;
}


/* rounded borders */

#main, #main-navigation, #main-navigation li, .secondary-navigation, .block .title, #main .block, #sidebar .block, #sidebar h3, ul.list li,
#footer .block, .form input.button, .inline-form input.button, #box .block, #box .block h2 {
  -moz-border-radius-topleft: 4px;
  -webkit-border-top-left-radius: 4px;
  -moz-border-radius-topright: 4px;
  -webkit-border-top-right-radius: 4px;
}

.secondary-navigation li.first a, .secondary-navigation ul li.first, .table th.first, .table th.first {
  -moz-border-radius-topleft: 4px;
  -webkit-border-top-left-radius: 4px;
}

.table th.last {
  -moz-border-radius-topright: 4px;
  -webkit-border-top-right-radius: 4px;
}

.secondary-navigation ul li.first {
  -moz-border-radius-topleft: 4px;
  -webkit-border-top-left-radius: 4px;
}

#sidebar, #sidebar .block, #main .block, #sidebar ul.navigation, ul.list li, #footer .block, .form input.button, .inline-form input.button, #box .block {
  -moz-border-radius-bottomleft: 4px;
  -webkit-border-bottom-left-radius: 4px;
  -moz-border-radius-bottomright: 4px;
  -webkit-border-bottom-right-radius: 4px;
}

.actions-bar .page_entries .actions{
  float: left;
  margin: 3px 0 0 0;
}

.actions-bar .actions a{
  margin: 0 10px 0 0;
}

.table th.numeric {
  text-align: right;
}

.table td.numeric {
  text-align: right;
}

.table th.centre {
  text-align: center;
}

ul.list li .upload_file {
  margin-left: 30px;
  padding: 2px 0 0 0;
}

#dialog {
  background: #f0f0ee;
}

#dialog .block {
  background:#FFFFFF none repeat scroll 0 0;
  margin-bottom: 20px;
  padding-bottom: 10px;
}

#dialog .block .content {
  padding: 0 15px;
}

.form input.full_width {
  width: 100%;
}

.source_list {
  float:left;
  display: inline;
  margin: 0 5px 0 0;
}

.date {
  width:75px;
}

.source {
  width:105px;
}

#main h3.title a {
  color: #FFF;
}

form.bulk_poi_editor th a {
  color: #FFF;
}

#sidebar .block .content .inner {
padding:15px 0 0 0;
}
    CSS
  end
end