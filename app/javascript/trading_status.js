function tradingStatus() {
  const checkbox = document.getElementById('trading-status-checkbox');
  if (!checkbox) return null;

  const submit = document.getElementById('detailed-search-form-submit');
  submit.addEventListener('click', ()=>{
    checkbox.submit();
  });
}

window.addEventListener('load', tradingStatus);