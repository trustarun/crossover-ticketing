# for more details see: http://emberjs.com/guides/models/defining-models/

CrossoverTicketing.Ticket = DS.Model.extend
  title: DS.attr 'string'
  description: DS.attr 'string'
  issuerUserId: DS.attr 'number'
  assignedToId: DS.attr 'number'
  categoryId: DS.attr 'number'
  statusId: DS.attr 'number'
  priorityId: DS.attr 'number'
  dueDate: DS.attr 'date'
