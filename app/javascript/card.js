const pay = () => {
    Payjp.setPublicKey(pk_test_5c27a31a39d02f5d6e66c59e)
    const form = document.getElementById("charge-form");
    form.addEventListener("submit", (e) => {
        e.preventDefault();
        
        const formResult = document.getElementById("charge-form");
        const formData = new FormData(formResult);
    
        const card = {
          number: formData.get("order[number]"),
          cvc: formData.get("order[cvc]"),
          exp_month: formData.get("order[exp_month]"),
          exp_year: `20${formData.get("order[exp_year]")}`,
        };
    });
};
  
  window.addEventListener("load", pay);