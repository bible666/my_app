import paData from '../paData'
import pa018Premium from '../../../json/pa/pa_ไทยสมุทรใจกว้างเต็มแมกซ์2.json'


let pa085 = Object.assign({}, paData);
pa085.paCode = "PA085";
pa085.paName = "ไทยสมุทรใจกว้างเต็มแมกซ์ 2";
pa085.paPlan = [200000,300000,400000,500000,1000000];
pa085.paCompensatePlan = [500,1000];
pa085.paPlanMode = "0";
pa085.paPremium = function(sex,age,plan,cashback){
    let premium = pa018Premium.filter(d => d.AGE === Number(age) && d.PLAN === Number(plan))[0]
    return premium.RPRM
}

pa085.commission = function(insuranceObject,prospect){
    return 8
}


export default pa085