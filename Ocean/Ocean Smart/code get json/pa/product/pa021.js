import paData from '../paData'
import pa021Premium from '../../../json/pa/pa_ไทยสมุทรคุ้มค่า_ครั้งเดียว.json'


let pa021 = Object.assign({}, paData);
pa021.paCode = "PA021";
pa021.paName = "ไทยสมุทรคุ้มค่า 2";
pa021.paPlan = [200000,300000,500000,1000000];
pa021.paCompensatePlan = [];
pa021.paPlanMode = "0";
pa021.paPremium = function(sex,age,plan,cashback){
    let premium = pa021Premium.filter(d => d.AGE === Number(age) && d.PLAN === Number(plan))[0]
    return premium.RPRM
}

pa021.commission = function(insuranceObject,prospect){
    return 8
}


export default pa021