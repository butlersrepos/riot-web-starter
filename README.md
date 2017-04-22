# Web Starter Project

## Tech Choices
- Testing - Jest
- View - RiotJS
- Building - Webpack
- Styling - Colors.css + Sass (in riot components and scss files if needed)
- State Management - Redux

## Working
Use `npm run dev` to startup the webpack watcher which should rebuild on every change, I prefer to manually reload the webpage and so no other effort (browsersync etc) has been added yet.

## How to test
```
npm test
```
The Jest config is inside the `package.json` and can be invoked with `npm test`. It can pickup and compile `riot` components already. For more info on Jest's capabilities check out their [docs](https://facebook.github.io/jest/docs/getting-started.html)

## Views
Components are written in `riot` tag syntax, then the tag file is included in the `main.js`. From there you can use the tag element where ever you want in the app. All riot element are automatically available by virtue of the `riot.mount('*');` call in `main.js`. For more info check out [Riot docs](http://riotjs.com/guide)

All riot tags can use the special string `##srcServer##` anywhere inside. Webpack will replace this string with `./dist/` during local dev or whatever value you put in the `webpack.config.js` file inside the `Urls` object for other deployments which pass the `ENV=prod` flag. ENV is defaulted to `dev`. 

Example:
```javascript
//// webpack.config.js
let env = process.env.ENV || 'dev';

let Urls = {
    dev: './dist/',
    prod: 'my/deployment/url/maybe/s3/bucket/folder/'
};
```
```html
npm run build >>
    <a href="##srcServer##/img/logo.png"> becomes <a href="./dist/img/logo.png">

ENV=prod npm run build >>
    <a href="##srcServer##/img/logo.png"> becomes <a href="my/deployment/url/maybe/s3/bucket/folder/img/logo.png">
```

## Styling Guidelines
Individual components can have scss inlined according to `riot`'s own [documentation](http://riotjs.com/guide/#tag-styling). Normal CSS would work inside the components since it's also valid SCSS.

If you have some app-wide or higher level styles then `main.scss` is your "entry point". Add styles there or segment your styles into their own files and `@import` them into `main.scss`, they will be picked up by webpack as long as you retain the `import './main.scss';` line that is in the `main.js` to begin with.

This project manually includes [CLRS](http://clrs.cc) default color palette values as a SCSS partial under `/scss`, this can be imported straight into `riot` components as well.

## State managing
Learn some [redux](http://redux.js.org) immediately, its great! Your own state concerns might differ but sticking to the redux patterns and keeping your view components small and simple is a good start.

There is a basic reducer and store started for you in `/state/main-reducer.js` and `state/the-store.js` respectively. The `home-page.tag` component uses and listens to that store to provide the message changing functionality.

## Getting data
The whatwg-fetch module is included and should be used whenever you want to grab an endpoint for some data.

## Routing
Routing is handled by the `riot-route` library, frontend, in the `routes.js` file. See [here](http://riotjs.com/api/route/) for options available.

## Build
A one-off build task (and the `dev` task) generate resources to the `dist` folder. 