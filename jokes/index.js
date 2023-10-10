const loading = document.getElementById("loading");
const category = document.getElementById("category");
const language = document.getElementById("language");
const joke = document.getElementById("joke");
const error = document.getElementById("error");
const jokeBtn = document.getElementById("jokeBtn");
const jokeSetup = document.getElementById("jokeSetup");
const jokeDelivery = document.getElementById("jokeDelivery");
const getJoke = async () => {
  error.hidden = true;
  joke.hidden = true;
  loading.hidden = false;
  try {
    const url = `https://v2.jokeapi.dev/joke/${category.value}?type=json&lang=${language.value}`;
    const data = await fetch(url);
    const json = await data.json();
    if (json.error) {
      error.innerHTML = json.message;
    } else if (json.joke) {
      jokeSetup.innerHTML = json.joke;
      jokeDelivery.hidden = true;
      localStorage.setItem("joke", json.joke);
      localStorage.removeItem("setup");
      localStorage.removeItem("delivery");
    } else {
      jokeSetup.innerHTML = "-" + json.setup;
      jokeDelivery.innerHTML = "=" + json.delivery;
      jokeDelivery.hidden = false;
      localStorage.removeItem("joke");
      localStorage.setItem("setup", json.setup);
      localStorage.setItem("delivery", json.delivery);
    }
    joke.hidden = false;
  } catch (err) {
    const jokeVal = localStorage.getItem("joke");
    const setup = localStorage.getItem("setup");
    const delivery = localStorage.getItem("delivery");
    console.log(setup, "-", delivery);
    if (setup && delivery) {
      console.log("in 2 parts");
      jokeSetup.innerHTML = "-" + setup;
      jokeDelivery.innerHTML = "=" + delivery;
      jokeDelivery.hidden = false;
      joke.hidden = false;
    } else if (jokeVal) {
      jokeSetup.innerHTML = jokeVal;
      jokeDelivery.hidden = true;
      joke.hidden = false;
    } else {
      error.innerHTML = err;
      error.hidden = false;
    }
  }
  loading.hidden = true;
};
getJoke();
jokeBtn.addEventListener("click", getJoke);
