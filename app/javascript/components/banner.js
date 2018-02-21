import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["La petite carresse antillaise", "La douceur des îles "],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };

