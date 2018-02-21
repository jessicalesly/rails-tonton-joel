function switch_tabs() {
const tab_left = document.getElementById("tab_left")
const tab_right = document.getElementById("tab_right")
const container_left = document.getElementById("div_left")
const container_right = document.getElementById("div_right")
console.log(container_right.style);
container_right.style.display = "none";

tab_right.addEventListener("click", (event) => {
  tab_left.classList.remove("active");
  tab_right.classList.add("active");
  container_left.style.display = "none";
  container_right.style.display = "block";
});

tab_left.addEventListener("click", (event) => {
  tab_right.classList.remove("active");
  tab_left.classList.add("active");
  container_right.style.display = "none";
  container_left.style.display = "block";
});

}

export { switch_tabs };
