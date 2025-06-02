const initializeCardForm = () => {
  const form = document.getElementById("charge-form");
  if (!form) return;
  if (typeof Payjp === "undefined" || typeof gon.public_key === "undefined") return;

  const payjp = Payjp(gon.public_key);
  const elements = payjp.elements();

  const numberElement = elements.create("cardNumber");
  numberElement.mount("#number-form");

  const expiryElement = elements.create("cardExpiry");
  expiryElement.mount("#expiry-form");

  const cvcElement = elements.create("cardCvc");
  cvcElement.mount("#cvc-form");

  form.addEventListener("submit", (e) => {
    e.preventDefault();

    payjp.createToken(numberElement).then((response) => {
      const errorContainer = document.getElementById("card-errors");

      if (response.error) {
        // if (errorContainer) {
        //   // HTMLとして整形して表示（Railsのエラー表示と統一）
        //   errorContainer.innerHTML = `
        //     <div class="error-alert">
        //       <ul>
        //         <li class="error-message">${response.error.message}</li>
        //       </ul>
        //     </div>
        //   `;
        //   errorContainer.style.display = "block";
        // }
      } else {
        const token = response.id;
        const tokenInput = document.createElement("input");
        tokenInput.setAttribute("type", "hidden");
        tokenInput.setAttribute("name", "token");
        tokenInput.setAttribute("value", token);
        form.appendChild(tokenInput);

        if (errorContainer) {
          errorContainer.innerHTML = "";
          errorContainer.style.display = "none";
        }       
      }
      form.submit();
    });
  });
};

window.addEventListener("turbo:load", initializeCardForm);
window.addEventListener("turbo:render", initializeCardForm);