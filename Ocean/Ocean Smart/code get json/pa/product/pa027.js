import paData from '../paData'
import pa027Premium from '../../../json/pa/pa_mvip.json'


let pa027 = Object.assign({}, paData);
pa027.paCode = "PA027";
pa027.paName = "มอไซค์วีไอพี";
pa027.paPlan = [200000,300000,500000];
pa027.paCompensatePlan = [500];
pa027.paPlanMode = "12";
pa027.paPremium = function(sex,age,plan,cashback){
    let premium = pa027Premium.filter(d => d.AGE === Number(age) && d.PLAN === Number(plan))[0]
    return premium.RPRM
}

pa027.commission = function(insuranceObject,prospect){
    return 8
}


export default pa027