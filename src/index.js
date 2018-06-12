import './main.css';
import { Main } from './Main.elm';
import registerServiceWorker from './registerServiceWorker';

// Embed the Elm App
const App = Main.embed(document.getElementById('root'));

// Add a scroll listener to the Elm App
if (typeof window !== 'undefined') {
	  let scroll = window.pageYOffset;

    window.addEventListener('scroll', () => {
	    App.ports.scroll.send([scroll, window.pageYOffset]);
	    scroll = window.pageYOffset;
    });
}

registerServiceWorker();
