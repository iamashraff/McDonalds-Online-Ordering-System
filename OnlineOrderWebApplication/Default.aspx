<%@ Page Title="McDonalds Delivery" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OnlineOrderWebApplication.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



<div id="carouselExampleIndicators" class="carousel slide min-vh-100 animate__animated animate__fadeIn animate__slow" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="Images/slide1.png" alt="First slide">
        <div class="carousel-caption d-none d-md-block">
        <h5 class="lead">Japanese Curry Sauce</h5>
        <p>Get snacking on your favourite Chicken McNuggets™ with the NEW Japanese Curry Sauce, a delicious dip that will make you go sugoi!</p>
      </div>
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="Images/slide2.jpg" alt="Second slide">
        <div class="carousel-caption d-none d-md-block">
        <h5 class="lead">Dinosaur McFlurry</h5>
        <p>Make it the perfect meal with desserts you’ll love. Enjoy the sweet warm comfort of the Banana Pie and the chocolatey goodness of the Dinosaur McFlurry™!</p>
      </div>
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="Images/slide3.png" alt="Third slide">
        <div class="carousel-caption d-none d-md-block">
        <h5 class="lead">FREE 1L Coke Zero</h5>
        <p>Add a delightful fizz to your McD faves and top off your meal with a FREE bottle of 1L Coke Zero.</p>
      </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
        


<section class="bg-warning h-100"> 
        
    <div class="container">


    <div class="row">
        <div class="col my-5">

                    <div class="card" style="width: 18rem;">
  <img class="card-img-top" src="Images/Card1.png" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title lead font-weight-bold">Dinosaur McFlurry</h5>
    <p class="card-text lead">There's more to enjoy in every bite of the Banana Pie and Dinosaur McFlurry™</p>
      <br />
      <a href="Menu.aspx" class="btn btn-danger float-right">Order ></a>
  </div>
</div>


        </div>


                <div class="col my-5">

                    <div class="card" style="width: 18rem;">
  <img class="card-img-top" src="Images/Card2.png" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title lead font-weight-bold">Spicy Beef Deluxe With Cheese Burger</h5>
    <p class="card-text lead">Enjoy a thicker and juicier beef patty for a truly extra puas experience today!</p>
    <a href="Menu.aspx" class="btn btn-danger float-right">Order ></a>
  </div>
</div>


        </div>



                <div class="col my-5">

                    <div class="card" style="width: 18rem;">
  <img class="card-img-top" src="Images/Card3.png" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title lead font-weight-bold">Spicy McCrispy™ Chicken Burger</h5>
    <p class="card-text lead">Enjoy the extra crispy bites & spicy garlic sauce packed in a unique new shape !</p>
    <a href="Menu.aspx" class="btn btn-danger float-right">Order ></a>
  </div>
</div>


        </div>



    </div>

    </div>




    </section>


<section>
<style>
      #subsection2 {
        background-image: url("Images/bg.jpg");
        height: 80vh;
      }

      /* Height for devices larger than 576px */
      @media (min-width: 1024px) {
        #subsection2 {

        }
      }

    </style>
    <!-- Background image -->
    <div id="subsection2" class="bg-image shadow-lg">

      
        <div class="container d-flex align-items-center text-center h-100">
          <div class="float-left text-white" style="margin-left:-100px;">
              <h1  class="display-3 text-dark font-weight-bold">Craving ?</h1>
              <h1 class="display-4 text-dark">Order now !</h1>
            <a class="btn btn-warning btn-lg" href="Menu.aspx" role="button">Let's Order</a>
          </div>
        </div>
    </div>
    <!-- Background image -->
</section>

    





   

</asp:Content>
