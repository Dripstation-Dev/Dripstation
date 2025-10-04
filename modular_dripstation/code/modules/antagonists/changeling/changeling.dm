
/datum/antagonist/changeling/on_gain()
    ADD_TRAIT(owner.current, TRAIT_FEARLESS, name)
	..()

/datum/antagonist/changeling/on_removal()
    REMOVE_TRAIT(owner.current, TRAIT_FEARLESS, name)
	..()