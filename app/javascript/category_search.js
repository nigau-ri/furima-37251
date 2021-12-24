function search() {
  const categoryList = document.getElementById("q_category_id_eq");
  if (!categoryList) return null;

  const catetoryForm = document.querySelector('.category-list');
  catetoryForm.addEventListener('mouseover', ()=>{
    categoryList.removeAttribute('class');
  });
  catetoryForm.addEventListener('mouseout', ()=>{
    categoryList.setAttribute('class', 'hidden');
  });

  categoryList.addEventListener('change', ()=>{
    catetoryForm.submit();
  });
}

window.addEventListener('load', search);