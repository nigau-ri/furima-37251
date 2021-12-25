function pay() {
  const registrationForm = document.getElementById('card-registration-form');
  if (!registrationForm) return null;

  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const submit = document.getElementById('button');
  submit.addEventListener('click', (e)=>{
    e.preventDefault();

    const formData = new FormData(registrationForm);
    const card = {
      number:         formData.get("number"),
      exp_month:      formData.get("exp_month"),
      exp_year:  `20${formData.get("exp_year")}`,
      cvc:            formData.get("cvc")
    };

    Payjp.createToken(card, (status, response)=>{
      if (status == 200) {
        const token = response.id;
        const tokenObj = `<input value=${token} name='card_token' type='hidden'>`;
        registrationForm.insertAdjacentHTML('beforeend', tokenObj);

        document.getElementById('number').removeAttribute('name');
        document.getElementById('cvc').removeAttribute('name');
        document.getElementById('exp_month').removeAttribute('name');
        document.getElementById('exp_year').removeAttribute('name');

      } else {
        alert('クレジットカードの情報が正しくありません');
      }
      registrationForm.submit();  
    });
  });
}

window.addEventListener('load', pay);