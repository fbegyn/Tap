{ createStore, combineReducers, applyMiddleware } = Redux
{ Router, Route, browserHistory } = 'react-router'
{ syncHistoryWithStore, routerReducer } = 'react-router-redux'

store = createStore combineReducers
    routing: routerReducer

history = syncHistoryWithStore browserHistory, store

class @App extends React.Component
    render: ->
        Provider store: store,
            Route path: '/', component=Index
