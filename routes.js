import riot from 'riot';
import route from 'riot-route';

route('/', () => riot.mount('main', 'home-page'));

route.start(true);