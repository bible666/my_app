import paData from '../paData'
import pa018Premium from '../../../json/pa/pa_ไทยสมุทรใจกว้างเต็มแมกซ์2.json'


let pa018 = Object.assign({}, paData);
pa018.paCode = "PA018";
pa018.paName = "ไทยสมุทรใจกว้างเต็มแมกซ์ 2";
pa018.paPlan = [200000,300000,400000,500000,1000000];
pa018.paCompensatePlan = [500,1000];
pa018.paPlanMode = "0";
pa018.paPremium = function(sex,age,plan,cashback){
    let premium = pa018Premium.filter(d => d.AGE === Number(age) && d.PLAN === Number(plan) && d.CASHBACK === Number(cashback))[0]
    return premium.RPRM
}

pa018.commission = function(insuranceObject,prospect){
    let plan = Number(insuranceObject.paPlan)
    if(plan === 200000 || plan === 300000){
        return 10
     }else{
        return 12
     }
}


export default pa018