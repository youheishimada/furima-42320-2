const payjp = Payjp("YOUR_PUBLIC_KEY"); // 公開鍵（.envやcredentialsで管理）
const elements = payjp.elements();
const card = elements.create("card");
card.mount("#card-element");

const form = document.getElementById("charge-form");

form.addEventListener("submit", (e) => {
  e.preventDefault();
  payjp.createToken(card).then((response) => {
    if (response.error) {
      alert(response.error.message);
    } else {
      const token = response.id;
      const tokenObj = document.createElement("input");
      tokenObj.setAttribute("type", "hidden");
      tokenObj.setAttribute("name", "token");
      tokenObj.setAttribute("value", token);
      form.appendChild(tokenObj);
      form.submit();
    }
  });
});