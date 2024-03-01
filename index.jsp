<%@ page import="java.util.List" %>
<%@ page import="your_package_name.Car" %>
<%@ page import="your_package_name.Customer" %>
<%@ page import="your_package_name.Rental" %>
<%@ page import="your_package_name.CarRentalSystem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Car Rental System</title>
</head>
<body>
    <h1>Welcome to the Car Rental System</h1>

    <form action="CarRentalServlet" method="post">
        <label for="customerName">Enter your name:</label>
        <input type="text" id="customerName" name="customerName" required>
        <br>

        <label for="carId">Select a car to rent:</label>
        <select id="carId" name="carId">
            <% for (Car car : cars) { %>
                <option value="<%= car.getCarId() %>">
                    <%= car.getBrand() %> <%= car.getModel() %> - <%= car.isAvailable() ? "Available" : "Not Available" %>
                </option>
            <% } %>
        </select>
        <br>

        <label for="rentalDays">Enter the number of days for rental:</label>
        <input type="number" id="rentalDays" name="rentalDays" required>
        <br>

        <button type="submit">Rent Now</button>
    </form>

    <hr>

    <h2>Rental Information</h2>
    <ul>
        <% for (Rental rental : rentals) { %>
            <li>
                <%= rental.getCustomer().getName() %> rented <%= rental.getCar().getBrand() %> <%= rental.getCar().getModel() %>
                for <%= rental.getDays() %> days.
            </li>
        <% } %>
    </ul>
</body>
</html>
