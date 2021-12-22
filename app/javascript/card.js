function pay() {
  const chargeForm = document.getElementById('charge-form');
  if (!chargeForm) return null;

  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const submit = document.getElementById('button');
  submit.addEventListener('click', (e)=>{
    e.preventDefault();

    const formData = new FormData(chargeForm);
    const card = {
      number:         formData.get("order_address[number]"),
      exp_month:      formData.get("order_address[exp_month]"),
      exp_year:  `20${formData.get("order_address[exp_year]")}`,
      cvc:            formData.get("order_address[cvc]")
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

      } else {
        alert('クレジットカードの情報が正しくありません');
      }
      chargeForm.submit();  
    });
  });
}

window.addEventListener('load', pay);