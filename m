Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCE5B2F02CE
	for <lists+linux-mips@lfdr.de>; Sat,  9 Jan 2021 19:16:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725978AbhAISQm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Jan 2021 13:16:42 -0500
Received: from sonic303-37.consmr.mail.bf2.yahoo.com ([74.6.131.236]:41072
        "EHLO sonic303-37.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725872AbhAISQm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 Jan 2021 13:16:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1610216155; bh=h/9a/Fy6iXiOd5QokDs7ep8voH7YVL4u2LG3cYHR+ow=; h=Date:From:Reply-To:Subject:References:From:Subject; b=gKufrnPa9oHjJzDLMgCfuh09/R0iTaxwy5U89o/yQ/7viPTJ7Whw/jPFzTtT2RSHa1Hj/aKsiaXUo5N80xDCHB6dPl/wR9dAnvNCCHsF84CVxO4W4DSeoYZ8fSeC5Bu8RHxi0bG6escpP1eJuo0/CecK+3xlcU7bGKDOp9aWhXXkN/NerdmVLC3lmlFGp3UQ2nGxDC4sJUE0feC7fnMGv8G9Vzooh/jyNMX57EbPK2EerTt0B1SbHyVrra0cQJ37EONe6IMdU/a2ISDb4aRPnH/C42iwv0bFvrJHWFsUk+xMRXUt1kw88NhFzMIhdlQuXsowNlqLQ/4QpsIZnimJ2Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1610216155; bh=CF3ouhdAh1LW4fKvza6pooVgJCsknK15LzvdDbsnQ/n=; h=Date:From:Subject:From:Subject; b=RoN2s7Tj2X3Yyw/O+klfL4iuzBz0ABScAcllhCI2ZcX24+yb9fQidHQUN/zJDuf3352h1U144gWHp11zpud6JD/wElU4kQq+XCgHZlQMVAcI3IFZK80TNrk20nqnX1tknlw6i2/CB38XwSoRrRUJ9dBGIBRa9J9XIcAswxZJBRcsTeouhf4NYVoPhpO8WgfpVy9T5iYrY449IBz8eLmq6qoA/WvE5vybkpnlAaA6fCG9Gq6H8tcbEo+pOM33sBNtGd0+Uwd1tlIV7YhtZ1YGJleyeF7Gbl97BBk+hIMBGVu6xwc0LLjEBpKNg01x3gA31wItAdq/luJ0fyPdYKnZCg==
X-YMail-OSG: y82rypUVM1lXyHjlcP9LAwkae85PlMx.DlCWcKTXEQZx5tH8brPXWyBWppDe5wW
 P9fomB1_L9JnbnHhOV9Ax83h_UfCIMNMLE3uZsEs6fcWGi.cB5SnoWo1K.Wj7IUDdKpGrFTgL2WT
 IazK97HmZIKLoJYal.mt9xSiU5tYTAPuK5qgDmyOpdxSbN39CrRafYMmWGX2Z4IWgIZm11lh7NVf
 0ysVP0iZA_SIimKaye..fEdtfly82Og0Ld.77GrEEAQo5X.SunS9sRYU60_X_iM88QhqOdZJa8yh
 xJzmPwx0EDk2gorxUf71qvvpEnnTQ9gUBhMdVnVO6LMATSFgste_ExRJbNKkUahHoXKwemwls2Rb
 7_MElldSFbSS9G23pUvi_ITbR.T6aLrNBadwiP0fXst0.lLwb7HTY43NV7R4RHRqHA_pqOYk3KGv
 tM27ur1gDmBCPaPHizKkSaQH5iOB1JhGegSeIIWPoIr8H9jwiFwaylookbAXqDM8IgsC8yPRVIPd
 7Tw1ehGLvoJkKt.54VDKzj0YbBUafffdTM3bmvw0vO0nNBezgAR_CseNYjsdHGPsnoyJgXf3QiqR
 O_6IOxD7Mpok1tf8VxdwIiUdH1kQNtRTcBCXVDNrzgyEXyfWbfoFnGa0q1JIS0LgcNRCU4F4xK6p
 wWsKwaYai0wQ4dqoojodTEIp1l_v5s7zfsXI1o6MSbQyKzPrc_XvTjltcg9AFPoatG9mF5Gm1k1B
 h6ai0iE_otnSuWo2ky0VM8qv9qCFAraTrLTLRgSyhjn_eSJuBatMYPd.w74zsjL.zSioRMZ_sVac
 5B_HFWg4Z1GcTpJeaI4cSeOQ5P_FfaWF1c52bk8SiX2XjLzWNc.e1OZiIS5J.sf_HXjRR4yc9MpZ
 4iuUcJ5Y7Y78tAvbsz1i.XT4uHrQCsvxsID_WpiHSatOhgbez.4hMwWTbWPhsoG_HxHdbOB51CoY
 YrVzaKAMs1_d1ByvcIWkeT8SHFSL5a9kzSZSMJdaCcuFAibMW_ccdHbIyfhPXScCPdvwxNXOZNIi
 rKP7.SzWyeuoQxF4HFvuZi7Pciem9JzWGxd6.b4dkRDW_SNzuWJMbpSjnZ6ngmruIVQ6_9WRR8Yd
 ALYuQ5m7_0c57awdAP1mCuouebitBoKRVDIvv2PKqrszvoqo5yxCwKXNarG3vQ5Nh4Sq3ZHyKhUc
 lem3bar2H4KX.8C2AfM.ZO1ehhyBYl0Hc1C9cRlmRcTFYAYebTK938Hg8uodFQkcMoss08N6kBao
 ELw8kbwbdizgCtBM071Joya_C3E_J.YvDoqzFViROxH3sbvDNjwF3Eu8eO4UyGhlSujUwpiyXBTo
 z5qs9mJB.1cixzT1WlMpq4KdrrYJfZIyCJg4adFQ4B6hIY_4uHZ7fg4vc_ue_g2U_EyMf.XsoBR.
 ucILW_fiosGvoVXwAo.qeCTRsCfUhG.KyBDRTdmE95zRzNK.Q5RKJHy4jT6KB_nqBtgOs3YmUeVq
 WfaYB4rlCm9Qt1xcoByFU9QoGprf9G.XPDlTCytId1rS4IoApRekQVMygM450xe1XCUblBxMSrWo
 ut2SyXNNRRg45MFgXnUMjWkBUCNZNLWxfLeW5I1KC_bjQ5bRyJYCOpoOt9R6CqZffCa6bVYizUhI
 0lZ5xEuBXm5jSeFfcZcACD6zPhVxazBjrzbx8YdUgfgJGReT212_T8k3Cfqz_cq0QW4P8.vh1M3H
 WtJIGOqoKK0I6iLacACtTPMo5pO3BYFgln23jVphGstOrNeC0okTniT1NG1CwrV96.21PJkTaOF4
 Gc7AQDB44hX70UfVLjJdtZBmLXN28eWb2XFarEdDQQR0ZKZRVJxXVlu8ULqf2QSrENeeQDwcMiEP
 AtHFlKgO9gsNyH3i5uxjMV_404IDUk.AZEbaXaa6y5ahO6C1syy6v9CGnVxOJvojftte6nAiFlWA
 kukMcmpQkVojObuLILFIhdTCFjs6HRKA3pt4iHpfX_YWMZxmLB846Em9_Ofi9EwDePEEgs4IBw5l
 IL8GyidijPMoTjWul3o8RSfI.eV5VJDvzNT8_TsE4it.vTUBiFk.UwYLfj_gvx3c5llRigSuYEni
 yF_WsFzEm6jVCaQUjF75twtH6EBMTC_KYu2W.2okkJcGaIpG3kGjX.ZtB6ki2i9lqkzN_OaM0IBh
 xKUDlt0fNrUn2TB.RsUAvlS5IexBgekUoEkv3j_ejVUeyDb4nfpqurvvAWAeVYN3O4J3sTr1NiOA
 Wrf04veC2hHuoFl7SFCaDP99icnRV6MyLIR_OafG5iazh1YPYzfQX1_S0XNmlHbJaaIT7MdK38t_
 ru_idWRN4y4b.q_KSZbDWmM6BIakxqopiuefjF4engDciudldg.lPlEqIFe8.6oi0.syyQ6K.4dU
 XTCIqC4ksRN_8Ddse81j4VofrFuP770z8fLqUsKu5GC08NZR_HV_aunDpD6aID7CLl0Xbued35oo
 mSlx7uJ6.K22Y.DV4qBQ5GROBo8LCcU8cRM65IzOVTc1hwhOgdNKrwfFnDzNb8XUx4V1BU72rm.x
 A1gSJ35UaJVwoLnuCNS3IWNEOIa6RExKomsNRP2qvSA99i58wjXbXuRoHlDvPXP1pQ2pqn2tQSze
 ZAZmACvFlgFpfAL1Z2zPDhj4XomPchl2mUO9kdLWu7AbPe2g_2UZgLsOE8x2Aw89vfFQ9A_JvugT
 PM4STG9LNuWMgKrKPAz5cu1XJWBLtuVMqWdCcIjQ0Ac1GAMvwAUd1Ll9NZmsPGtl1WdY6IEqQ2Sx
 k4BBpPntweAPwL1WX2qKPHM9ghrNLQGSyW4wI9nVvR9y0m81D.4BZu2UQSuLPMz107d71QjwZMvz
 mJwh6OnhYtxUfbR75zVTNe5yHpE9XNLaGojGw8cd5wb51UcgOXzhoYQTroK3wxsAl4lgJM_EZUKY
 tSO_GncBs1EkiVF5Cl98n2RvZ6W0NEnglqSQopOIe25fftBENJm.ZYMxV1mXDH0qVD3OlXVH7Ofw
 VkY5VxDsZhK1PixpeZUc8wkk_9lyp6l7J7xaozTqF9Xx1uWOpCLKbdzlaKxi7CVdeT4fqaJc2cBs
 nnkEQsGRLRcxeuadAump4HInDaispBW._0iBekBRVEbenTJKk.0TVCAa5WlyQ9O9432GpP5DM67f
 j3C31X89yg8A5xXWtjcFbROPMza6Ym4d7H9_FG3bg_gu2R.a9YCYgYMueydhpXirF3GWOGlMlIL2
 AdNvCa2tL2orlwyLc4wzXtfQo7lNbZiQ23P8iarYZaBiuuB.EK0mUnvDz6PWw03TPtgdEMK3WMkP
 fnYDMjeqKGk0Mc_srBegEUGicq1fm1B0RoW1QFFZoKAj_wUbpMqIPoG03FeuId0YH4Ln_QMQkNwn
 WKjyP8eRhqMJrneAkyL52KyOOE7YCYJmaZah3EeDeehEGFG4_C82KwdBDHsUJmyl66te_ZUVMDC_
 tHcKJIaMvaHyGmvYHAWjtHBifQ.DayqJQh03RXGpWj_rGpuIAIpc8bicecw7csFcKZykZZg63eEL
 9jR998aM7WIziYR5ymQfdZ8V4cya_qeA8FndZUhm2KpKlCT7Mybb1tTGNPldCDsf6kIoImXsH4qd
 l5nFit0H8g4Cuhcy0LQkocZy18ZYRUiKVDocO.37FdwbwkQpTUpswDXZFmr4Qz22csle5GpYC40i
 gokooGpvvDr9zICd38sl5pwwqxNVh0sZWAhl7o885mm.a28PrELbZN6rCJzbeCCR8_WKH_FNAZ9w
 FFATMKczXggHMGgsaPNROMIOPUejJzfh4ncfAo_vHvdZkhdtFzYXGWpbRw5Tjg5J66mjCbdFxSln
 tnXtrVVXxFK7xz67Al0PpN.MsYstxO88F
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.bf2.yahoo.com with HTTP; Sat, 9 Jan 2021 18:15:55 +0000
Date:   Sat, 9 Jan 2021 18:13:54 +0000 (UTC)
From:   "Mrs. Maureen Hinckley" <mau51@axisdept.in>
Reply-To: maurhinck5@gmail.com
Message-ID: <177520702.113864.1610216034405@mail.yahoo.com>
Subject: RE
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <177520702.113864.1610216034405.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.17501 YMailNodin Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



I am Maureen Hinckley and my foundation is donating (Five hundred and fifty=
 thousand USD) to you. Contact us via my email at (maurhinck5@gmail.com) fo=
r further details.

Best Regards,
Mrs. Maureen Hinckley,
Copyright =C2=A92021 The Maureen Hinckley Foundation All Rights Reserved.
