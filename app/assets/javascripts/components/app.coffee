{ createStore, combineReducers, applyMiddleware } = require 'redux'
{ Provider } = require 'react-redux'
{ Router, Route, browserHistory } = require 'react-router'
{ syncHistoryWithStore, routerReducer } = require 'react-router-redux'

Index = require './index'

{ div } = React.DOM

store = createStore combineReducers
    routing: routerReducer

history = syncHistoryWithStore browserHistory, store

class App extends React.Component
    render: ->
        Provider store: store,
            Router history: history,
                Route path: '/', component: Index

module.exports = App
