Return-Path: <linux-mips+bounces-12231-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A37D4C58069
	for <lists+linux-mips@lfdr.de>; Thu, 13 Nov 2025 15:50:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 15A853517E9
	for <lists+linux-mips@lfdr.de>; Thu, 13 Nov 2025 14:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5FFA27F00A;
	Thu, 13 Nov 2025 14:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/JRKlQa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQH1pmrl"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F9F2D47F1
	for <linux-mips@vger.kernel.org>; Thu, 13 Nov 2025 14:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763045242; cv=none; b=Fmj8P9hYtjZrgn/EBNdQPvcdMgxDbbwo+djxaOao82iMm9BC9jIev+/AuQG4yOCrEVdteT7lmCyJ7uu9wKF9LZHcCyqjmWdvALDU7hXSQQ4YniWJmEZCSlSq19r3p8lUmS26th4CXPeghmKSIqzc/aJXzd7abfYhyD/E9fySgSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763045242; c=relaxed/simple;
	bh=F2kBxpSXrkU6fwfKy+g1N0BGk9Qwugl4Eo5aCFQcm9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HZ2v/O7gUlamZqxv4HhWSYJviiCKvTcD0MMfJDNPNME6hqLW0t0wjebIT6885jXcLuYkcqCjEHvELkXcEcSA5fpF47f453BkUE+TBuJNH+NXmUXzqIUVT2PGSUJuAEVsvKl/zOlKP3JFlpTqHGkzymrgwtYYyCeZAAdYA1c3dy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/JRKlQa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQH1pmrl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADCrTas3443198
	for <linux-mips@vger.kernel.org>; Thu, 13 Nov 2025 14:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c/j8O4OMZ/iO6ANHgdWOttUeORFw+6paoVM6GB+aNhc=; b=b/JRKlQaoXhQbjBg
	7mm9S/5h3Fp/qe27uSlmDQXdKJyVelTPms9TAYlDvBXVpwrx7Y/JPF42qOoJETR1
	cZsoxMoudkiU5Xx0VLidAV4Vf4PHDod433Ykxn74s+LsoMkTrwjARIl3IDm/A+Rr
	grUZjvJu70AF5w6jwH7l4Aq5Be8BuM4nP6pt3KJhqDbJ+xtwdCLznzo3aNk/9SZu
	F6Qj+Ub89gKav1oigAckmv9WKdjgeoUN7Q2qgBe471l3GyeBKiIxCveVSXs/+XGB
	RXI/WhEDsA6qtDMbbTNJWwMSedDbYI2Id5NJthr9QY3IvsFmN+3HmL11WKKwX00L
	cTlHdQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9789pwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Thu, 13 Nov 2025 14:47:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b10c2ea0b5so39283785a.0
        for <linux-mips@vger.kernel.org>; Thu, 13 Nov 2025 06:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763045239; x=1763650039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c/j8O4OMZ/iO6ANHgdWOttUeORFw+6paoVM6GB+aNhc=;
        b=BQH1pmrlarkpFn0tAexcqzdylCjYSNIWFaHmR5+Cyi3rVUvtIA0xDj7VfOveWdyXTb
         tDo8CvV+LmyQfvLaPl9/W8qBLExhB6sTvorkSYsPMLleDFWCKBNEgBzzVlZj9zXq2Egk
         HSqSb988zCRPFH5HPFco5+XvJvFYsXnbPUILd4vwW6UMvD4VTPdp4ggJdKIHsIap57+z
         nsL/uowEE5XeWmE9CxDp4hZRofDM2iK4hQ+iLv2Lr+VhOQmhUczddVtzPCsS2hrFYoyO
         vdUr9ZBPOPVDxlozV57hVgbZ2/GOR6YHNpQ1IHJKV2GSAqOGTsi4/ohzcoA+/znUQ4c8
         I59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763045239; x=1763650039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/j8O4OMZ/iO6ANHgdWOttUeORFw+6paoVM6GB+aNhc=;
        b=iNE0COt7noFJz9lNkMEqppwu3H00WtQ4s4Na/poeqi+VU6VBMXh7bWidjGuT6ye1lE
         nvgWXdxZmjEymFBVFbOFOfjiRjCK4H0AVc4bheauAhMrmy1gNnLmcvXlXz6qJyJxzp+A
         nOLZ0ZWurFBMtlGlLnLxhOdTFU4mPFhPm9N1NidUIaKt5hlcLXhKXEGotSrAmZFiKsTp
         6nFB8zuQPl9BFBw4LRVp/rAF1EVIBgx6g+WnjKdp5ouIY8l8Dlh5rUIpf7PHXT2nwWW0
         voaUFVRjgvPX5dHZuBsenZRxFKCPjGB5c2u+t8zRzUij9V/ytnYD3vSmvW6f1vf9gWMM
         8soQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPWnv2W6VoLAHSjokq953OfvAgqYP14RjIFa7thz/sihn18Cf0vVP+se3RN7M9PufEHtPu2kPhqzBG@vger.kernel.org
X-Gm-Message-State: AOJu0YwLybCHjAUwxh0xzB0/pxfyN8qBgB85xa2jXfbKwfcroRBu3BQc
	wFmPeN/jUB1Vt+QQRup/buSKyPO3NMM6NCN5z5hk34zAx8M7AAgvmvrWfSXC7mDEsMlakmilXnL
	RJ5GpPabpr6n/INFkLatAluwdnXavwzyw4tChvC7IZtsYLlypSdN5VvWH62qgedLa
X-Gm-Gg: ASbGnctbe3iN2svRz8NDZKKjl3zIYjlTBu+AH4I6M2SRWGN3ACE2thgMajSqp3ZLsPU
	+L5B1fl/pWtPazN7+P6ijiic440f9uq9sv4CoEdUO90G6Bo+PWIbnEmtz04wk0A4YrCh2oINztV
	8SKeVpLJnVnEPhE4TfH+0ToPH3KtaQYdwFisDkzgKEGYkyO7pJx5P4zvZBTO6/cIO5Ypa4jPiD1
	dKJvBvIK8K1IOPp9ngen9wEu5q+fgdJWmSfHj7HxzPPmqGPdb9ufkhutAn3i7K4Hzht3pvq9kTE
	WNKXfZabkWcPmoBxtsW/vtppnCvy8oEQsh5/qTzPG1KPKHpNVnXPN5YM6bRIF8yvbpJ8zIyg0E4
	oaQngwqdH42wC7va+X696c/oC5nPVmCHdsjt6UbTtmxgCbK86tTjiCStO
X-Received: by 2002:ac8:5f10:0:b0:4ed:7ca:5f33 with SMTP id d75a77b69052e-4eddbc9256dmr60355031cf.5.1763045238359;
        Thu, 13 Nov 2025 06:47:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFM7YamsAo7x44iby6/PzuNKLIab4wveVf6S4JQ4cd4mg9yAzxbvu88BKH+RnT7m5FWyF+0JA==
X-Received: by 2002:ac8:5f10:0:b0:4ed:7ca:5f33 with SMTP id d75a77b69052e-4eddbc9256dmr60354251cf.5.1763045237576;
        Thu, 13 Nov 2025 06:47:17 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fdaf6dasm176196266b.63.2025.11.13.06.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 06:47:17 -0800 (PST)
Message-ID: <45915f40-caa1-417b-95bb-deb7363a2ffc@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 15:47:09 +0100
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
 <cd7c0490-a2d6-4885-aa36-ee1492f107b8@oss.qualcomm.com>
 <CAMRc=MeuByh=N_-F2+zPiqnh+Qp9u97kiMheLJ-xxcSZSy+_tw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=MeuByh=N_-F2+zPiqnh+Qp9u97kiMheLJ-xxcSZSy+_tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDExNCBTYWx0ZWRfX9GcCRgAYZLnj
 ASp1n7GrCJEN0jI4TQXe0TpnFoLjwpnA/q3vz1tMH8oSyhEArlofIsJCkmXzCyHRqe+C7EM/JIk
 oSKFmaLu3s9z9g2PngmfASxhMfMQnfW3KjwPDjRES54bXTHp/JBwpl38GyZkGcOKOL5TCA/Pj2N
 /ZlnltCbUBhiuaYXAX8jWceHifqlsVOZcvCBVeHMsOhqS0Ca3l/DrU89TMAC5rXqWTQZq7O9kUn
 Ft5bMTB3Z4m9rhrS5I5UCIO1bKmTNPBvKpLfL+hqOIoDY6BoMwguAyLfsKQPiKJXQ/Mfe0h4QZV
 IlpVP3iPw2cRyt6ZFtapbJpF1XKgq+WQZ/J4VjziPmvXddvJlSsJo/FbXL7PswQIMdadEaUeaz4
 V5xn8tzR/X8sAslxUfIvYIk+fakfpQ==
X-Proofpoint-ORIG-GUID: 30MmCkbizmEQOIyScBKQOt_XMEyP1rPT
X-Proofpoint-GUID: 30MmCkbizmEQOIyScBKQOt_XMEyP1rPT
X-Authority-Analysis: v=2.4 cv=PIYCOPqC c=1 sm=1 tr=0 ts=6915ef77 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=IegXRtMujPCPvfbY5ZIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130114

On 11/13/25 2:41 PM, Bartosz Golaszewski wrote:
> On Thu, Nov 13, 2025 at 2:33 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 11/13/25 2:18 PM, Bartosz Golaszewski wrote:
>>> On Fri, Nov 7, 2025 at 11:49 AM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
>>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>>
>>>>> In order to drop the dependency on CONFIG_OF, convert all device property
>>>>> getters from OF-specific to generic device properties and stop pulling
>>>>> in any linux/of.h symbols.
>>>>>
>>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> -     if (of_property_read_bool(np, "snps,tso"))
>>>>> +     if (device_property_present(dev, "snps,tso"))
>>>>
>>>> This is a change in behavior - "snps,tso = <0>" would have previously
>>>> returned false, it now returns true
>>>>
>>>
>>> This property is a boolean flag, it cannot have a value.
>>
>> Every DT property may have a value, so this is not as obvious as we'd
>> like it to be (IIUC - unless that changed recently)
>>
> 
> That's new to me. I thought that if a property is a
> /schemas/types.yaml#/definitions/flag then only its boolean form is
> allowed. The fact that the dtc can compile it with a value doesn't
> matter as the bindings are the higher authority for DT sources?

You're right, I misrepresented the issue. read_bool() was historically
used for making sure a property is present and this was a problem
when the type was != flag.

Please discard my comment

Konrad

