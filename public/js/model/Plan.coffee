'use strict'

traplaApp.factory 'Plan', ['$resource', ($resource) ->
  res = $resource 'http://metis.personal.net/api/users'

  $resource '/api/plans/:id', {id: '@id'}, {
    all: {method: 'GET', isArray: true},
    find: {method: 'GET'}
    create: {method: 'POST'},
  }
]
