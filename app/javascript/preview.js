function preview() {

  const postImage = document.getElementById('item-image');
  if (!postImage) return null;
  
  const fileForm = document.querySelector('input[type="file"][name="item[image]"]');
  fileForm.addEventListener('change', (e)=>{
    const alreadyPreview = document.querySelector('.item-preview-image');
    if (alreadyPreview) {
      alreadyPreview.remove();
    }

    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'item-preview-image');
    previewImage.setAttribute('src', blob);
    document.getElementById('item-preview-image-wrapper').appendChild(previewImage);
  });
}

window.addEventListener('load', preview);