{ createStore, combineReducers, applyMiddleware } = require 'redux'
{ Router, Route, browserHistory } = require 'react-router'
{ syncHistoryWithStore, routerReducer } = require 'react-router-redux'

{ div } = React.DOM

store = createStore combineReducers
    routing: routerReducer

#history = syncHistoryWithStore(browserHistory, store)

class App extends React.Component
    render: ->
        div className: 'container', "hoi"

module.exports = App
