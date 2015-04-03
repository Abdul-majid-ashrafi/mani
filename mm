
<!doctype html>

<html lang="en-us">
<head>
    <title>Credit system</title>

    <style>
div#two{background-color: bisque;
    height: 420px

}
div#one{
    background-color: khaki;
    text-align: center;
    padding: 40px;}

        button{margin: 10px}

  table tr th,td{
        padding: 3px  23px  5px  23px ;  }


table{
        background-color: beige;
        margin-left: 383px;}
td{
    text-align: center}
    </style>

</head>
<body onload="olf();">
<div id="one"><h1>Credit  System</h1>
<button onclick="addcustomer()">Customer</button>
<button onclick="credit();">Credit</button>
<button onclick="debit();">Debit</button>
<button onclick="delet()">Delete</button>
</div>
<div id="two">

    <table id="sample">
        <thead>
        <tr>
            <th>Name</th>
            <th>Limit</th>
            <th>Current</th>
        </tr>
        </thead>
        <tr class="one">

            <td id="namelist"></td>
            <td id="limitlist"></td>
            <td id="currentlist"></td>
        </tr>
    </table>
</div>

<script>
    function olf() {
        totalcustomer = JSON.parse(localStorage.getItem("creditrecord"));
        if(totalcustomer == null){
            totalcustomer = [];
        }
        filllist();

    }



    function Client(name,limit,current){
        this.name = name;
        this.limit = limit;
        this.current = current;}


    function clearlist() {
        document.getElementById("namelist").innerHTML    = "";
        document.getElementById("limitlist").innerHTML   = "";
        document.getElementById("currentlist").innerHTML = "";}


    function filllist() {
        for(i=0;i<totalcustomer.length;i++){
            document.getElementById("namelist").innerHTML += totalcustomer[i].name + "<br />" ;
            document.getElementById("limitlist").innerHTML += totalcustomer[i].limit + "<br />" ;
            document.getElementById("currentlist").innerHTML += totalcustomer[i].current + "<br />" ;}}


    function addcustomer() {
        var a = prompt("Enter client name","");
        for(i=0;i<totalcustomer.length;i++){
            if(a == totalcustomer[i].name){
                alert("this name already has been entered ENTER NEW NAME");
                return;}}

        var b = +prompt("credit limit enter","");
        if(b<=0){
            alert("put can not be zero or negative");
            return }


        var c = +prompt("current credit","");
        if(c>b){
            alert("Error: current credit can not be more then limit");
            return; }

        var newcustomer = new Client(a,b,c);

        totalcustomer.push(newcustomer);
        localStorage.setItem("creditrecord",JSON.stringify(totalcustomer));

        clearlist();
        filllist(); }



    function credit(){
        var a = prompt("enter client name:");
        for(i=0;i<totalcustomer.length;i++){
            if(a == totalcustomer[i].name){


                var b = +prompt("enter amount:");

                if(b>totalcustomer[i].limit){
                    alert("PLEASE Amount enter your limit: " + totalcustomer[i].limit );
                    return;

                }else if(b > (totalcustomer[i].limit-totalcustomer[i].current)) {
                    alert("sorry in this situation you can get only " + (totalcustomer[i].limit - totalcustomer[i].current));
                    return;

                }else if(b < (totalcustomer[i].limit-totalcustomer[i].current) ){

                    totalcustomer[i].current += b;
                    alert("Thank you");
                }
                localStorage.setItem("creditrecord",JSON.stringify(totalcustomer));

                clearlist();
                filllist(); }}}


    function debit(){
        var a = prompt("enter client name:");

        for(i=0;i<totalcustomer.length;i++){
            if(a == totalcustomer[i].name){
                if(totalcustomer[i].current == 0){
                    alert("you have no dues");
                    return;
                }
                var b = +prompt("enter debit amount: ");

                if(b == totalcustomer[i].current){
                    totalcustomer.current = 0;
                    alert("debit successfull, you have no dues now")
                }else if(b > totalcustomer[i].current){

                    alert("debit successfull, your dues was not Rs."+b+" we" +
                            " returning you Rs."+(b - totalcustomer[i].current));
                    totalcustomer[i].current = 0;
                }else if(b < totalcustomer[i].current){

                    totalcustomer[i].current -= b;
                    alert("debit successfull, your remaining credit is Rs." + totalcustomer[i].current);
                }
                localStorage.setItem("creditrecord",JSON.stringify(totalcustomer));

                clearlist();
                filllist();
            }
        }
    }
    function delet(){
        if(confirm("are you sure to delete?")){
            totalcustomer = [];
            localStorage.setItem("creditrecord",JSON.stringify(totalcustomer));
            clearlist();
        }

    }

    </script>
</body>
</html>




