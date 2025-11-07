Return-Path: <linux-mips+bounces-12111-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 04631C3F935
	for <lists+linux-mips@lfdr.de>; Fri, 07 Nov 2025 11:50:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C64D64EDFB1
	for <lists+linux-mips@lfdr.de>; Fri,  7 Nov 2025 10:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50A431A55F;
	Fri,  7 Nov 2025 10:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j19zi5vc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aVpK38KF"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9498731987A
	for <linux-mips@vger.kernel.org>; Fri,  7 Nov 2025 10:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762512600; cv=none; b=jhbh0WNPjed8lGbgDhe2tKqhrGgMZTr/hmwAqbPHWHf0vpB8mkfpGKnOT53lleStvYuC9qQsgX5IUIMZu90XLqfZxROkpXEBWe4UpofA/50++1rohyOCl8wCK75Qn56Tb3hlx6WdBQ/pwB5uksxByqhERdRx4dB/2r9Xj12XwLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762512600; c=relaxed/simple;
	bh=k6CWVoo79rJIhFxcP1Zi6lbWRJyVheMfi9XXd+LkGTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZvnEGE2XnL9d/inR1bIq528MJSthDNSNWTgTSXlkfUPIt7MDGVR7PnjQCG+1yQW8v82YquIE/2GXqC5j6f6rthrhK3RqauN3R+6n2EXdKrLeAcxKTsmPVEeZZlTYbVpqOjAFE2Etp8Uk6WfuqOKH1AZhJ5BGOmpX5KiBiuWXxjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j19zi5vc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aVpK38KF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A77FVYh3748959
	for <linux-mips@vger.kernel.org>; Fri, 7 Nov 2025 10:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qy4xZjaDaueCuwPTRvX9IC7D9BFWUmRUOg/PJT9rm94=; b=j19zi5vcZvZc+J3h
	eil5EXgb7o+MHafKBi9Slf1MAsHwht9ShJKuhVBN4IuNbfkFvOasu8HUs+laic1i
	ApQFCQDDkr0nR1Z4s/mFsEJRFNaTWW7B62zkTCNyqa8FVCGzmDgnRi4aJaWpx3yo
	7YBrhqEKVuWBhNuAaoE60NFeKFuxZH+p+rn0tyDvgwMCTDDPUaOdyqcmIN20Yni7
	e+FAQn327eA/EMJkdOZ1oKcI5NWQiBeaIRCP9KmnXRYAWj3UM/IlF2kolv1vNI8Y
	9Rr7K9olNJaawFxFkksQTdDzKZOepplYR1QpfkBYS3jwKcxtOTKS7ODirqnsgtuo
	rorS0A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8sy6kyrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 07 Nov 2025 10:49:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8906754b823so23149985a.0
        for <linux-mips@vger.kernel.org>; Fri, 07 Nov 2025 02:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762512597; x=1763117397; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qy4xZjaDaueCuwPTRvX9IC7D9BFWUmRUOg/PJT9rm94=;
        b=aVpK38KFUkFW6kHSwtDvmqmr+IpLTyoG+3Gj2IH6kwa7KJ9sRechIttPb6jEiqRkIT
         shiAQol5uzyZL7OUgnKhrLYoTq3W8g+FmNJbcRgmFmtueqEFfXqKIkbSdm79N+EIESeI
         aF+3ys97Ay+qY41i5G/AJleovoe3ssLGjj3GCoyw+2fE9EiRwzWu9P6n2/XX4K/FXjED
         qsJBWCUkM/9u6u8IC4/xzcXdaxlS43MobCRNrBQD58R2Sf8BOZLdDCMqwfNQF/EeLQJB
         5EZ9ecmojBYR+VkpotxpmrkAps9jZPwIdB5DOTLaN0M9TgkFTXgSrepDr+q0gJ9yWJMy
         KY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762512597; x=1763117397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qy4xZjaDaueCuwPTRvX9IC7D9BFWUmRUOg/PJT9rm94=;
        b=A7bZsJkHYaQpdlGkpYZLTTEm6zCvQtDbyRCjhYvSLLsyHrxPiqXijfonwSku7KJOj2
         5oKy8gtx6GdiidAx/MET+xWVfM8j0z7pMqQU46SZ1Z0298f2OHArD+3Mzz0NvAhVlVRD
         2NVDJiAV491j23x4UYgqYXQ+bv1hHDwlPFl3y67UmpIM3NFqIH6oQzBE8DcLbGolD12j
         KiUlmDD0YwC6S+Yzy2cpATJNEcA0YzuuUi9O93/TaJnVZMHNnPkBOaltWX/Su02JEhbg
         qdaVXHDs2m8bjCD/4yitxug47UTKz4kX8zR0B4KlPd6yB0qvAULLanUYDjP+8Tne+YxK
         +M8g==
X-Forwarded-Encrypted: i=1; AJvYcCXSy2zjdbwvGPco2XTrnAXCECDsizPBrG7S/w97xu62ZGy53Gy+mSDey+UUDO535FR2cDQQT9KqYX9K@vger.kernel.org
X-Gm-Message-State: AOJu0YxmieIgOgmRhrGNUiFYPRkJghv76ajhkAZ4YZnxDNaA4a7S7L/s
	bVE09uMBEolnatVH8O24imSOU0GGgC/UT1kfXhmyruMhAVnGMsrWYgHdph1r1tDscfAkV/O+OJG
	aVfyYHcRbC80dN29UeyMLtuYtuPFeefOEc3U0olabvTqnMkLqD8W7ccI84Kf7mjhV
X-Gm-Gg: ASbGncuPP68U523LidkcZVNDFEeKDnKj9hYFFZpZrJd6pJwTVoEqxV1ac86tGhOLVew
	qNrafoThC9rHPN1X/C2DPyONh8wCFgdVs/kkVbrnz18RUHPQzd4dUX2X3rU/K/ZKSqer5BstcmZ
	kApkR6+f1aZlgiuxhSaNiaaM32ReAVa1thAru1UtQ3GxInA0fWNojzyIJLnbIhhV1uUA4L8t/du
	qEMvgAu6Iylue6dPLwb2cHwfaaFhkWv2J4ILrYtZwDLj31RbOZ6VR7U//NAOKeu4eht8sevuf9j
	EPca9vaY+z6vAoOBiyxZzB4WIZoZD03tFCnm7r/WEiIO92kPGUnPe26YYSsP1J76SRobLy+M25q
	DQIG5chnoEIpO2l6KGXdhhTziZU9rLOadsK1ueh9TrdoIyfgTMcG6kcKx
X-Received: by 2002:ac8:5a51:0:b0:4e8:966b:459b with SMTP id d75a77b69052e-4ed949bb0f9mr18063061cf.5.1762512596800;
        Fri, 07 Nov 2025 02:49:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFb3Xbou/G0Zzd63eLA+eutWoqm0V75Q2RL/wdtW4sHDSzQGKhPaQSn2W6oLQojU83FQkCi9A==
X-Received: by 2002:ac8:5a51:0:b0:4e8:966b:459b with SMTP id d75a77b69052e-4ed949bb0f9mr18062921cf.5.1762512596362;
        Fri, 07 Nov 2025 02:49:56 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf9bc2fcsm204678566b.50.2025.11.07.02.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:49:55 -0800 (PST)
Message-ID: <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:49:48 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] net: stmmac: qcom-ethqos: use generic device
 properties
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
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
        Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AYu83nXG c=1 sm=1 tr=0 ts=690dced5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=xTS94RJRWet4TjKJq7QA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4NyBTYWx0ZWRfX0dTZBsvJZDrn
 4P+9gJc5riGBSI/Xa5DErcpIgbd0X/f86oKsAZWyp4oCvBURcUk+eNEvyh1wP80N56D+5OZsiQ0
 fl/YOdsr2a/zktNcrJyhUnfhP2mNku2ZAvgziiMIGdTqbBm7ZkcnK6BhmfcTXhWZrzkTQIB4fS8
 1l+bP6agr0UMnGs8dohCGz1C6wY3TpHHtSxITgCOaMtbRaQn11JeBFDkDiLqHdny9krXmTvZCqI
 d+T+c2Wf5tusevIa5NqxGY9BaCt0uWGVEEJzWOlywZ/WEFwYvEsymKmlCJ3vICw8ZW5KtTphZWh
 xqB9zxlm/5fdVbRrFtyMvasM9oG4irW3/tFj7XTa/Yfc2EFUXAqudpwQEzyKNWyN0MLhchH9zBy
 bVLM0KfBPsGEs6IxflSurrS1JAYaoA==
X-Proofpoint-ORIG-GUID: doGoyfkZEeg1Ri-Ug-hsDcXyTUJLcftF
X-Proofpoint-GUID: doGoyfkZEeg1Ri-Ug-hsDcXyTUJLcftF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070087

On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> In order to drop the dependency on CONFIG_OF, convert all device property
> getters from OF-specific to generic device properties and stop pulling
> in any linux/of.h symbols.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

[...]

> -	if (of_property_read_bool(np, "snps,tso"))
> +	if (device_property_present(dev, "snps,tso"))

This is a change in behavior - "snps,tso = <0>" would have previously
returned false, it now returns true

although it seems like it's the plat driver clunkily working around
not including the common compatible and inlining parts of the common
probe functions..

Konrad


