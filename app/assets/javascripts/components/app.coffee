{ createStore, combineReducers, applyMiddleware } = Redux
{ Router, Route, browserHistory } = ReactRouter
{ syncHistoryWithStore, routerReducer } = ReactRouterRedux

store = createStore combineReducers
    routing: routerReducer

history = syncHistoryWithStore browserHistory, store

class @App extends React.Component
    render: ->
        Provider store: store,
            Route path: '/', component=Index
