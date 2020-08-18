
import paData from '../paData'
import pa017Premium from '../../../json/pa/pa_ไทยสมุทรใจกว้างเต็มแมกซ์1.json'


let pa017 = Object.assign({}, paData);
pa017.paCode = "PA017";
pa017.paName = "ไทยสมุทรใจกว้างเต็มแมกซ์ 1";
pa017.paPlan = [200000,300000,400000,500000,1000000];
pa017.paCompensatePlan = [500,1000];
pa017.paPlanMode = "12";

pa017.paPremium = function(sex,age,plan,cashback){
    let premium = pa017Premium.filter(d => d.AGE === Number(age) && d.PLAN === Number(plan) && d.CASHBACK === Number(cashback))[0]
    return premium.RPRM
}

pa017.commission = function(insuranceObject,prospect){
    let plan = Number(insuranceObject.paPlan)
    if(plan === 200000 || plan === 300000){
        return 10
     }else{
        return 12
     }
}

export default pa017
