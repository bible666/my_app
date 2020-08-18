import paData from '../paData'
import pa022Premium from '../../../json/pa/pa_ไทยสมุทรเบาใจ_รายปี.json'


let pa022 = Object.assign({}, paData);
pa022.paCode = "PA022";
pa022.paName = "ไทยสมุทรเบาใจ 1";
pa022.paPlan = [200000,300000,500000,1000000];
pa022.paCompensatePlan = [1000];
pa022.paPlanMode = "12";
pa022.paPremium = function(sex,age,plan,cashback){
    let premium = pa022Premium.filter(d => d.AGE === Number(age) && d.PLAN === Number(plan))[0]
    return premium.RPRM
}


pa022.commission = function(insuranceObject,prospect){
    return 8
}


export default pa022