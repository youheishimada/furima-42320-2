  document.addEventListener("turbo:load", () => {
    // カード情報の初期化処理など
  

  document.addEventListener("turbo:render", () => {
    // リロードや戻る時も再初期化が必要

  if (typeof Payjp === "undefined" || typeof gon.public_key === "undefined") return;

  const payjp = Payjp(gon.public_key);
  const elements = payjp.elements();

  const numberElement = elements.create("cardNumber");
  numberElement.mount("#number-form");

  const expiryElement = elements.create("cardExpiry");
  expiryElement.mount("#expiry-form");

  const cvcElement = elements.create("cardCvc");
  cvcElement.mount("#cvc-form");

  const form = document.getElementById("charge-form");
  if (!form) return;

  form.addEventListener("submit", (e) => {
    e.preventDefault();
    payjp.createToken(numberElement).then((response) => {
      if (response.error) {
        alert(response.error.message);
      } else {
        const token = response.id;
        const tokenInput = document.createElement("input");
        tokenInput.setAttribute("type", "hidden");
        tokenInput.setAttribute("name", "token");
        tokenInput.setAttribute("value", token);
        form.appendChild(tokenInput);
        form.submit();
      }
    });
  });
});
});