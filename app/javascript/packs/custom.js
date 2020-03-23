let new_date = new Date();
let new_day = new_date.getDay();

let options = {
  weekday: "long",
  year: "numeric",
  month: "long",
  day: "numeric",
  hour: "2-digit",
  minute: "2-digit",
  second: "2-digit",
  hour12: false
};
let prnDt = new Date().toLocaleTimeString("en-us", options);

document.getElementById("recentevents-header").innerText = prnDt;
