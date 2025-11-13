Return-Path: <linux-mips+bounces-12226-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B42C57AF7
	for <lists+linux-mips@lfdr.de>; Thu, 13 Nov 2025 14:34:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 70DA74E8A0C
	for <lists+linux-mips@lfdr.de>; Thu, 13 Nov 2025 13:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338071DDC0B;
	Thu, 13 Nov 2025 13:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dCTchLVV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4MiiTFC"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E425158DA3
	for <linux-mips@vger.kernel.org>; Thu, 13 Nov 2025 13:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763040786; cv=none; b=PjPzOPIL0rm91WaqzQQkXKrmI6TjeuYpNMYlN8+Ovj1JJd691B9LYa0MsfNqLtPS0GX+Zt6xm01M43OIPITvKqQqVUQxRRBaB4DxvCN7bOGKHYWBA/GgeDYTwz8l3+gDaxc0YI7oBvjIMps4Pl23PqMwccnP/68uYudzAWzIRxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763040786; c=relaxed/simple;
	bh=WXUFQbgGI72BGKFWLLzMLBxPdA8zEK4LiioFwjl4y0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NlqfzqcOxBJiFnsmFrTr6N8Mem9tEsNxv1oQ8TY0etQFoB65i8HVbXd4qwgmK+MfJWWX9tDlf1theD2x0Xq6/YSrUseyxttLa+QctGAQEUGxdVtORbsm8nwSu5mq2T/3FTSEiQK5OiMDVR8GyHDr26Mn3JnwcP8jQN67rfoKKQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dCTchLVV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4MiiTFC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD8siRn2994637
	for <linux-mips@vger.kernel.org>; Thu, 13 Nov 2025 13:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wNLEUtImMXvAmjKIRtueCGZIQNgFOT3pJRe5fakSwLQ=; b=dCTchLVV2jAjgWiY
	ICFZIXcCA1dJnIdIViz48q5cmif6mK4Tv0rs91XKwf+WAKqP0coiOozMAqCNtf54
	v6WWSIzwslz5D+1JkALoTwwk/ae6y6C0EuTKEYl1O4rTOgn9jwhIMXqcJKyIBLLY
	GH+s4I/2nY0dwLFEo34gHaWMjv5jNRb9nyCg3ZtM58/JWNfCxxyRH82pTPnFmMUq
	7osKcoZo/tExDV4AhVEQD/W6FWf5rXTVCv2+piy1J93B+Y6hkdoZc9qgOc+61TyO
	XCK3H+LqmC4PnvDoQJ9QUGE62ObKb9yqGEqPJM9kWCxuO1TDgaUYSBWnqQ0cRRAI
	BI+hQg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad47jjc0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Thu, 13 Nov 2025 13:33:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed767bf637so829751cf.1
        for <linux-mips@vger.kernel.org>; Thu, 13 Nov 2025 05:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763040782; x=1763645582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wNLEUtImMXvAmjKIRtueCGZIQNgFOT3pJRe5fakSwLQ=;
        b=S4MiiTFCul1cQhmfXnht+b6ATdsH0JMjbcbDvDo3MrzaUqUSdD6lyxcb9ktD0oktW0
         FOLpdSusJYJd0zsI8CIhbbwufaddB5DlQ7OWsLChIIDL04MKu175s3n+kBYuxxPIw8QK
         YaK+2gC/o2XB2I9mL+avjJH2VTIYnd4wPnddCSveeZx8CIQosuudLimIqCnDpuMqVYBz
         Nm7ts6SM5xPBU26xLaiXCra9UVwY46nLFEjhlHLJ1oGp0Xdn+EopkElfp2sXBFpWTX4Y
         KrPfvZ1lEZ9iJbc8K2GaMuVSWe/1JLgXwm9uJDcHynR7nLyJJl/nJkqVbOC7LIBZvyyt
         tRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763040782; x=1763645582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wNLEUtImMXvAmjKIRtueCGZIQNgFOT3pJRe5fakSwLQ=;
        b=kIHt1bI5iiXW2f+UN3FWMY/zqZxCAtvyodRJHSW9kxzQ1RlL8sno5odAHxwLM84CUi
         fBjZfxouPWjLsRr8sAKc8/7nZrvAu2StF8JuEcaekDAHfaG3ADrY/KktCTgkX2xRWC4V
         4rRl4dnTkEMJ9NQQjHvZ089VbLNb+uTWJH+0aB7b5nMgBjKKeW2hDq0SeAHIyIyrI4Xf
         Ye4un7q0L8PBjgdWVQ8DRVHf78nDLFW3o1qjmJjPVUZUKHi/3KUenmksOAMplFmfcDWL
         g8eoDTvKwjXmkIaHB4zVzQtsfhdbrI9m3eRtR6PTiA6wXStp2WD8ZOkigObKfVbVxZw/
         l1Kg==
X-Forwarded-Encrypted: i=1; AJvYcCX8z1eQxQmthuLgz8ymokVsXandqYp5MUlFcYt7CMB80U2mlFhhj2IfP7lefkmQziD1yvlrBaw1Z6lP@vger.kernel.org
X-Gm-Message-State: AOJu0YypxoyAM/y07BecM7jX2mQqjH3fzvNslrvq7vF1YwQsm0EEuWQY
	LoemdykKmaVGTD6FFoIdIYT7ojaPCtOoUzoSyB25TGMgxy1/WFuXtMRHDZlA6kraEayJkcUYsEV
	uPdCGwTJGs4A8SXHJVFknQvnafv9JrWjXQbbMalndGBj8KQOfra2Vn6J+ewnr2Ce1
X-Gm-Gg: ASbGncvsg150pBsm83FV9G7GVYUZSExMqAcODrk/H9piqcvYnCQt5rH/wJVi9jT4ZDy
	T98x5hWw3Tn3X4H7Me/epYCSJNl2+e3P04hqzAMvCIML2c3j+u4Nfq4qzcmcJMrsGBLw+SMr7hI
	o/bcryrFfP70mpUBgO8uxsvEVgKpJUTndFC1kER2D+KDi42s7lrcZdUNTC2FKzSIRFnqkyiACTG
	K+bb0GDRgGZNA1+jxJLb3bM8iWZ7GAhb8+nQmXcdV29nvxbfnV1PlyThsGtGxe+2WxhGQMtFKkx
	DG0+UI7VqUVdBy20CsctNJb3hEGXu+tJGiAHsLkWKZ2THLWXf+9UMKD067/flVREhjTr+1L+A9u
	UlJlAGs8p2Q46OL3/3rZ9BVCASyB61CcCYHIjhMYf/23NFjoe9w267w19
X-Received: by 2002:ac8:5d8e:0:b0:4ed:b9ee:3ce2 with SMTP id d75a77b69052e-4eddbdae8demr64144821cf.11.1763040782413;
        Thu, 13 Nov 2025 05:33:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrzhJHhVjwGaQu/IkcGeYInBcpQOo8PGlB0mVpgZ0Fcc+3wNub2niPYVso88lX2dAHMTacPQ==
X-Received: by 2002:ac8:5d8e:0:b0:4ed:b9ee:3ce2 with SMTP id d75a77b69052e-4eddbdae8demr64144061cf.11.1763040781802;
        Thu, 13 Nov 2025 05:33:01 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd80a11sm162333266b.39.2025.11.13.05.32.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 05:33:01 -0800 (PST)
Message-ID: <cd7c0490-a2d6-4885-aa36-ee1492f107b8@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 14:32:53 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] net: stmmac: qcom-ethqos: use generic device
 properties
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Matthew Gerlach <matthew.gerlach@altera.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Minda Chen <minda.chen@starfivetech.com>,
        Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Shuang Liang <liangshuang@eswincomputing.com>,
        Zhi Li <lizhi2@eswincomputing.com>,
        Shangjuan Wei <weishangjuan@eswincomputing.com>,
        "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
        Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
        Samin Guo <samin.guo@starfivetech.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Swathi K S <swathi.ks@samsung.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org>
 <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
 <CAMRc=MexMn_GSC2EtMek5hDRLjGYA5HKM8ge9vrxw1pYDqPJgw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=MexMn_GSC2EtMek5hDRLjGYA5HKM8ge9vrxw1pYDqPJgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDEwMyBTYWx0ZWRfX0uah86tTKwvP
 Sv7D9V4PKcagYAGrj0id8/5CfrnjEhBe8tHz6m1QxRRs2aRjCX4eKbh4Zs4LgfNB9Fg75C9F1/b
 BvLSyp0kkgJz6abn0NVkFji7/XBPQm58dQCzWFctNt/Yv+FmYMChu0N28JiK+kDcBdiW/ijZLyO
 f9Cw2HkLVzKuo3t4YZbDxo9ehZ/iUgYPdFBUSE/BRCHw8lFCxtiEbiniimCzbr6ngkbBxjpDvjE
 CnyZKNmyDwKCuR+uYjHHW4EqJaibKTzs7eQBifUsO26Hc/iEQM8Jv3R3XVDbu8/DkrZYTsxFoP2
 VvjpUYCeeeJo25KwNpNewAhtX5sWG4BnPSDUAw3wkgqkBcrst0vT/8/5sejsU7HAfZ9R3/Ya2m6
 Am7HFQ7/HDJeMNN1Rdg0/QcifGnskw==
X-Proofpoint-GUID: HSiBrQQMgyMDFY5e1kP9DomSHGnb3SK1
X-Authority-Analysis: v=2.4 cv=A5Fh/qWG c=1 sm=1 tr=0 ts=6915de0f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Pp6BL5jzwldociJZjw0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: HSiBrQQMgyMDFY5e1kP9DomSHGnb3SK1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130103

On 11/13/25 2:18 PM, Bartosz Golaszewski wrote:
> On Fri, Nov 7, 2025 at 11:49 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> In order to drop the dependency on CONFIG_OF, convert all device property
>>> getters from OF-specific to generic device properties and stop pulling
>>> in any linux/of.h symbols.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> ---
>>
>> [...]
>>
>>> -     if (of_property_read_bool(np, "snps,tso"))
>>> +     if (device_property_present(dev, "snps,tso"))
>>
>> This is a change in behavior - "snps,tso = <0>" would have previously
>> returned false, it now returns true
>>
> 
> This property is a boolean flag, it cannot have a value.

Every DT property may have a value, so this is not as obvious as we'd
like it to be (IIUC - unless that changed recently)

Konrad

