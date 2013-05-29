using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HeadacheCDSSWeb.Models
{
    public class HeadacheDiagnosis
    {
        VisitDataOperation vdataoperation = new VisitDataOperation();
        public List<string> GetDiagnosis(VisitData vData)
        {
            List<string> result = new List<string>();
            VisitData vd = vdataoperation.DataPreprocess(vData);
            if (vd.visitrecord.SecondaryHeadacheSymptom.Count != 0)
            {
                //继发性头痛
                        string[] Disease1 = { "蛛网膜下腔出血", "脑出血", "瘤卒中", "脑外伤", "颅内占位病变" };
                        string[] Disease2 = { "颅内占位病变", "硬膜下血肿", "过度使用药物" };
                        string[] Disease3 = { "颅内感染", "系统性感染", "结缔组织疾病", "血管炎" };
                        string[] Disease4 = { "颅内占位", "动静脉畸形", "结缔组织疾病", "颅内感染", "脑卒中" };
                        string[] Disease5 = { "颅内占位病变", "假性脑瘤综合怔", "颅内感染" };
                        string[] Disease6 = { "蛛网膜下腔出血", "颅内占位病变" };
                        string[] Disease7 = { "皮层静脉/静脉窦血栓形成", "垂体卒中" };
                        string[] Disease8 = { "转移癌", "机会性感染" };
                        string[] Disease9 = { "颅内占位病变", "颞动脉炎" };
                        List<string[]> StrDisease = new List<string[]>();
                        StrDisease.Add(Disease1);
                        StrDisease.Add(Disease2);
                        StrDisease.Add(Disease3);
                        StrDisease.Add(Disease4);
                        StrDisease.Add(Disease5);
                        StrDisease.Add(Disease6);
                        StrDisease.Add(Disease7);
                        StrDisease.Add(Disease8);
                        StrDisease.Add(Disease9);
                        List<string> advice = new List<string>();
                        List<string> disease = new List<string>();
                        string conclusion = "";
                        for (int n = 0; n < vd.visitrecord.SecondaryHeadacheSymptom.Count; n++)
                        {
                            int num = n + 1;
                            string number = num.ToString();
                            adddisease(disease, StrDisease[n]);
                            advice.Add(number);
                        }
                        if (advice.Count != 0)
                        {
                            conclusion = conclusion + "神经影像学检查";
                            if (advice.Contains("1") || advice.Contains("3") || advice.Contains("4"))
                            {
                                conclusion = conclusion + "、腰穿";
                            }
                            else
                            {
                                if (advice.Contains("5") || advice.Contains("6") || advice.Contains("8"))
                                {
                                    conclusion = conclusion + "、腰穿";
                                }
                            }
                         }
                        string last = "";
                        foreach (string d in disease)
                        {
                            last = last + d + "、";
                        }
                        string DiseaseLast = last.Substring(0, last.Length - 1);
                        result.Add(DiseaseLast);
                        result.Add(conclusion);
                }
                else
                {
                    //原发性头痛
                }

                return result;
           
        }
        private void adddisease(List<string> disease, string[] newdisease)
        {
            foreach (string d in newdisease)
            {
                if (!disease.Contains(d))
                {
                    disease.Add(d);
                }
            }

        }
    }
}