const initDropdownMenu = () => {

  const bookingsTitle = document.getElementById("bookings-title");
  const bookingsSection = document.getElementById("bookings-section");
  const camelsTitle = document.getElementById("camels-title");
  const camelsSection = document.getElementById("camels-section");


  bookingsTitle.addEventListener("click", (event) => {
    bookingsSection.classList.toggle("hide");
    // bookingsSection.style.height = "300px";
    // bookingsSection.style.height = "300px";
  });


  camelsTitle.addEventListener("click", (event) => {
    camelsSection.classList.toggle("hide");
    // bookingsSection.style.height = "0px";
  });
}

export { initDropdownMenu };
