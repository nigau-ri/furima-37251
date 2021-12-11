function pay() {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const submit = document.getElementById('button');
  submit.addEventListener('click', (e)=>{
    e.preventDefault();

    const chargeForm = document.getElementById('charge-form');
    const formData = new FormData(chargeForm);
    const card = {
      number:    formData.get("order[number]"),
      exp_month: formData.get("order[exp_month]"),
      exp_year:  `20${formData.get("order[exp_year]")}`,
      cvc:       formData.get("order[cvc]")
    };

    Payjp.createToken(card, (status, response)=>{
      if (status == 200) {
        const token = response.id;
        const tokenObj = `<input value=${token} name='token' type='hidden'>`;
        chargeForm.insertAdjacentHTML('beforeend', tokenObj);

        document.getElementById('card-number').removeAttribute('name');
        document.getElementById('card-exp-month').removeAttribute('name');
        document.getElementById('card-exp-year').removeAttribute('name');
        document.getElementById('card-cvc').removeAttribute('name');

        chargeForm.submit();
      }
    });
  });
}

window.addEventListener('load', pay);