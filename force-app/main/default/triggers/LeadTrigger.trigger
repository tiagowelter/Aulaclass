trigger LeadTrigger on Lead (before insert, after insert , before update, after update) {
    for (Lead l : Trigger.new) {

    }

    for (Lead l : Trigger.old) {

    }
  }