import paData from '../paData'
import pa024Premium from '../../../json/pa/pa_คืนชัวร์.json'


let pa024 = Object.assign({}, paData);
pa024.paCode = "PA024";
pa024.paName = "ประกันอุบัติเหตุ คืนชัวร์";
pa024.paPlan = [200000,300000,500000,1000000];
pa024.paCompensatePlan = [1000];
pa024.paPlanMode = "12";
pa024.paPremium = function(sex,age,plan,cashback){
    let premium = pa024Premium.filter(d => d.AGE === Number(age) && d.PLAN === Number(plan))[0]
    return premium.RPRM
}

pa024.commission = function(insuranceObject,prospect){
    return 8
}


export default pa024