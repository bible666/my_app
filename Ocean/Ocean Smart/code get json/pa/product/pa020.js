import paData from '../paData'
import pa020Premium from '../../../json/pa/pa_ไทยสมุทรคุ้มค่า_รายปี.json'


let pa020 = Object.assign({}, paData);
pa020.paCode = "PA020";
pa020.paName = "ไทยสมุทรคุ้มค่า 1";
pa020.paPlan = [200000,300000,500000,1000000];
pa020.paCompensatePlan = [];
pa020.paPlanMode = "12";
pa020.paPremium = function(sex,age,plan,cashback){
    let premium = pa020Premium.filter(d => d.AGE === Number(age) && d.PLAN === Number(plan))[0]
    return premium.RPRM
}


pa020.commission = function(insuranceObject,prospect){
    return 8
}


export default pa020