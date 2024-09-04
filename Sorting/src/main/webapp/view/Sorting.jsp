<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>UUID Generator</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body, html {
            height: 100%;
            margin: 0;
        }
        body {
            background-color: #f8f9fa; /* Light background color for the body */
            color: #212529; /* Dark text color */
        }
        .container {
            position: relative;
            padding: 20px;
            text-align: center;
            width: 90%;
            max-width: 600px;
            margin: auto;
            top: 50%;
            transform: translateY(-50%);
        }
        .text-labelSmall {
            display: block;
            margin: 20px auto;
            padding: 10px;
            background-color: red; /* Light background for the label */
            color: #212529;
            border-radius: 5px;
            width: 100%;
        }
        .text-labelBig {
            display: block;
            margin: 20px auto;
            padding: 10px;
            background-color: green; /* Light background for the label */
            color: #212529;
            border-radius: 5px;
            width: 100%;
        }
        #resultBig {
            color: black;
        }
        #resultSmall {
            color: black;
        }
        @media (max-width: 768px) {
            .container {
                width: 100%;
                padding: 10px;
                top: 0;
                transform: none;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="text-labelBig" id="resultBig">Awaiting calculation...</div>
    <div class="text-labelSmall" id="resultSmall">Awaiting calculation...</div>

    <form id="calcForm">
        <div class="form-group">
            <label for="input1">Input 1:</label>
            <input type="text" id="input1" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="input2">Input 2:</label>
            <input type="text" id="input2" class="form-control" required>
        </div>
        <button type="button" class="btn btn-primary" onclick="calculateSum()">
            <i class="fas fa-sync-alt"></i> Calculate
        </button>
    </form>

</div>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function calculateSum() {
        const input1 = document.getElementById('input1').value;
        const input2 = document.getElementById('input2').value;

        if (input1 === '' || input2 === '') {
            document.getElementById('resultBig').textContent = 'Please enter both numbers.';
            return;
        }

        const url = "<%=request.getContextPath()%>/calculate";
        fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams({
                'num1': input1,
                'num2': input2
            })
        })
            .then(response => response.json())
            .then(data => {
                document.getElementById('resultBig').textContent = 'Big List: ' + data.big.join(', ');
                document.getElementById('resultSmall').textContent = 'Small List: ' + data.small.join(', ');
            })
            .catch(error => console.error('Error:', error));
    }
</script>

</body>
</html>
