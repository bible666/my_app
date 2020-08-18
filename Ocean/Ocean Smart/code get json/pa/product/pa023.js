import paData from '../paData'
import pa023Premium from '../../../json/pa/pa_ไทยสมุทรเบาใจ_ครั้งเดียว.json'


let pa023 = Object.assign({}, paData);
pa023.paCode = "PA023";
pa023.paName = "ไทยสมุทรเบาใจ 2";
pa023.paPlan = [200000,300000,500000,1000000];
pa023.paCompensatePlan = [1000];
pa023.paPlanMode = "0";
pa023.paPremium = function(sex,age,plan,cashback){
    let premium = pa023Premium.filter(d => d.AGE === Number(age) && d.PLAN === Number(plan) )[0]
    return premium.RPRM
}


pa023.commission = function(insuranceObject,prospect){
    return 8
}


export default pa023