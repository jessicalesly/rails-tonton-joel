import ScrollReveal from "scrollreveal/src/scrollreveal";

const revealOnScroll = () => {
  window.sr = ScrollReveal();
  sr.reveal('.reveal-on-scroll', {
    duration: 1000,
    origin: 'right'
  });
}

export { revealOnScroll };
