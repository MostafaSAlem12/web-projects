const password = document.getElementById("password");
const copyBtn = document.getElementById("copyBtn");
const generator = document.getElementById("generator");
const togglePasswordChkBx = document.getElementById("togglePasswordChkBx");
const upperCase = document.getElementById("upperCase");
const lowerCase = document.getElementById("lowerCase");
const numbers = document.getElementById("numbers");
const symbols = document.getElementById("symbols");
const lengthRange = document.getElementById("lengthRange");
const lengthValue = document.getElementById("lengthValue");

//load
const onload = (e) => {
  const length = localStorage.getItem("length") || 8;
  const upperChecked = localStorage.getItem("upperChecked") === "true" || false;
  const lowerChecked = localStorage.getItem("lowerChecked") === "true" || false;
  const numbersChecked =
    localStorage.getItem("numbersChecked") === "true" || false;
  const symbolsChecked =
    localStorage.getItem("symbolsChecked") === "true" || false;
  upperCase.checked = upperChecked;
  lowerCase.checked = lowerChecked;
  numbers.checked = numbersChecked;
  symbols.checked = symbolsChecked;
  lengthRange.value = length;
  lengthValue.innerHTML = lengthRange.value.trim();
  if (password.value.length === 0) {
    copyBtn.disabled = true;
  }
  if (
    !upperCase.checked &&
    !lowerCase.checked &&
    !numbers.checked &&
    !symbols.checked
  ) {
    generator.disabled = true;
  }
};

//generate password
const generatePassword = (
  upperCase,
  lowerCase,
  numbersCase,
  symbolsCase,
  length
) => {
  if (!upperCase && !lowerCase && !numbersCase && !symbolsCase) return "";
  const upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  const lower = "abcdefghijklmnopqrstuvwxyz";
  const numbers = "0123456789";
  const symbols = "~!@#$%^&*()_+-=/:;<>?\"'.`,";
  let seed = "";
  if (upperCase) seed += upper;
  if (lowerCase) seed += lower;
  if (numbersCase) seed += numbers;
  if (symbolsCase) seed += symbols;
  let chars = "";
  for (let i = 0; i < length; i++) {
    const index = Math.floor(Math.random() * seed.length);
    chars += seed[index];
  }
  return chars;
};

//copy
const copy = (e) => {
  navigator.clipboard.writeText(password.value);
  const toastLive = document.getElementById("toastLive");
  const toast = new bootstrap.Toast(toastLive);

  toast.show();
};

//generate button
const generate = (e) => {
  password.value = generatePassword(
    upperCase.checked,
    lowerCase.checked,
    numbers.checked,
    symbols.checked,
    lengthRange.value.trim()
  );
  if (password.value.length > 0) {
    copyBtn.disabled = true;
  }
  if (copyBtn.disabled) {
    copyBtn.disabled = false;
  }
};

//toggle password
const togglePassword = (e) => {
  const type = password.getAttribute("type");
  if (type === "password") {
    password.setAttribute("type", "text");
  } else {
    password.setAttribute("type", "password");
  }
};

///listeners

//uppercase listener
const uppercaseListener = (e) => {
  localStorage.setItem("upperChecked", upperCase.checked);
  const disabled = generator.disabled;
  if (
    !upperCase.checked &&
    !lowerCase.checked &&
    !numbers.checked &&
    !symbols.checked
  ) {
    generator.disabled = true;
    return;
  }
  if (disabled) {
    generator.disabled = false;
  }
};

//lowercase listener
const lowercaseListener = (e) => {
  localStorage.setItem("lowerChecked", lowerCase.checked);
  const disabled = generator.disabled;
  if (
    !upperCase.checked &&
    !lowerCase.checked &&
    !numbers.checked &&
    !symbols.checked
  ) {
    generator.disabled = true;
    return;
  }
  if (disabled) {
    generator.disabled = false;
  }
};

//numbers listener
const numbersListener = (e) => {
  localStorage.setItem("numbersChecked", numbers.checked);
  const disabled = generator.disabled;
  if (
    !upperCase.checked &&
    !lowerCase.checked &&
    !numbers.checked &&
    !symbols.checked
  ) {
    generator.disabled = true;
    return;
  }
  if (disabled) {
    generator.disabled = false;
  }
};

//symbols listener
const symbolsListener = (e) => {
  console.log(symbols.checked);
  localStorage.setItem("symbolsChecked", symbols.checked);
  console.log(localStorage.getItem("symbolsChecked"));
  const disabled = generator.disabled;
  if (
    !upperCase.checked &&
    !lowerCase.checked &&
    !numbers.checked &&
    !symbols.checked
  ) {
    generator.disabled = true;
    return;
  }
  if (disabled) {
    generator.disabled = false;
  }
};

//range listener
const rangeListener = (e) => {
  lengthValue.innerHTML = lengthRange.value.trim();
  localStorage.setItem("length", lengthRange.value.trim());
};

//elements assignment
window.addEventListener("load", onload);
copyBtn.addEventListener("click", copy);
generator.addEventListener("click", generate);
togglePasswordChkBx.addEventListener("change", togglePassword);
upperCase.addEventListener("change", uppercaseListener);
lowerCase.addEventListener("change", lowercaseListener);
numbers.addEventListener("change", numbersListener);
symbols.addEventListener("change", symbolsListener);
lengthRange.addEventListener("input", rangeListener);
