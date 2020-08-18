
let paData = {
    paCode:{type: String, required: true },
    paName: {type: String, required: true },
    paPlan:{type: Array, required: true },
    paCompensatePlan: {type: Array, required: true },
    paPlanMode:{type: String, required: true },
    paPremium:function(){},
    commission:function(){}
}

export default paData