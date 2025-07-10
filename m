Return-Path: <linux-mips+bounces-9715-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9CCB0019E
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jul 2025 14:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA6337A4697
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jul 2025 12:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FED253925;
	Thu, 10 Jul 2025 12:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BCBl8BQn"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534E62512D5
	for <linux-mips@vger.kernel.org>; Thu, 10 Jul 2025 12:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752150320; cv=none; b=seLjgHcWTAzKHZ25347T1CNMnRXZojrwk1rGldatLNSPbsuzfI592t+WQfnoP38o53Wed7Ftmb0QbbqmVklH4CJ9nui4nCd+5bocl8w/mCvXgAIlQ7RvWq1XU1wv9L1m39+ZuWH9gHg0PkgYTsaEWepu0PQHqdCyJdELtMx/0Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752150320; c=relaxed/simple;
	bh=FgzRt8ZR7RE+rp15IyUmQeD1Nnm06vrWcpPbcGFEZc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qt/p6hdX6p5TopzfS/5FQvwvzT9lvAKu9RJQLpYftaThxIGYxG/BKkwKv1DmgGtiXTjPVmX+gS45oiQAAtjvP+qYPBvZRxY4oqLjgkMT6f1FVtKAOr2S9iYSq16dgr5I0NZpHYoxCkQE81P4OmXaA+twspw8OJ7qsvY1rVAMZ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BCBl8BQn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A94uak009951
	for <linux-mips@vger.kernel.org>; Thu, 10 Jul 2025 12:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ytbTCzKHlppw2SwuVFycJKbJ22dHTAoFO6LLPths6vk=; b=BCBl8BQnoib8Svq+
	gfbo5fvs1mFg9wD06+fQV4mO1Yujoh6bcMlpk5i47P8zlnXcU5yE4ZPwbEecRf7z
	HReJSijPmv9Gp6e0mRCjmIfajjbIqmhe3BWdIlgQb6g38Hx/ZsuGU9wx4aia/xCq
	t65mAn4ocuHMxGM3JMLfvliRQ5mq3GSqvx+vUYklz9zLmSMOwausfZgxwXWK+7pV
	ascfe6QsPtHKFrGuwBjcVjOkEd5w391snbN4+StyJ49NENL9SDRm9P/7M6Jw740Y
	ZM2RR9kJr6fV2QFImPUZcizk7Q6lu8vj3hI3OZxb1BKUqfpC/fc5ge10boKpxYZ6
	dv6zdA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47sm9dvwds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Thu, 10 Jul 2025 12:25:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a804126ed6so3940501cf.1
        for <linux-mips@vger.kernel.org>; Thu, 10 Jul 2025 05:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752150317; x=1752755117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytbTCzKHlppw2SwuVFycJKbJ22dHTAoFO6LLPths6vk=;
        b=RfhIsLQBeDQU5TbsXAxtmaNJWaLIGJ4i+nmnuU9eIu32Zn62uTf7fBwjbRol+aCnm8
         7a3mmWk8fTryeE5JdX9GCTylRptNaD1SGR89gZ62lkeha0SBu8rwyvprfNgQfCwBi/dQ
         Acebjrh1d7E3sUZ1+CQKLj81+v+ANyFmCti5OmwYAbC+PumRn9SX6s8r13rqDowSAqig
         WRfEgtOWOWTVvf5hi3Jrpo4ZGloh6PiO0rvjtQ1crjXffl9LTxsYGYlvwwJrDsk38Wzu
         8//R2aDKRRCjgvYnCTgo2374cTJ9PPgUV93Q+ZJ2wISP5r8renFZHm5eoOaZ9CRLMK/p
         VKSg==
X-Forwarded-Encrypted: i=1; AJvYcCVJnHd+aCmGbCiH7nTkT/wwC7BgNVJ/tdKnik8QO7/0WtR11TlmYwBzGnarImjklwZ7zZ4AUfStRhCc@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuv93jSEyZbze/JRBw/Bnm1bdGUecJkQrZNk5DqhO8pyfA9D12
	oNgkPoas6AmmmPtRa4tnALLkkQMmDMY5Dta08lBKrj37r7sQwH79HGSkpE82UJN/7PbLua22V65
	vGrHcPuZYMFtFE20dDWEStdEiWiMcu/7nX0fbKf6MJKYoeq7YgcqEmmlpblv1OA0j
X-Gm-Gg: ASbGncv1zhiq6cpKvMaSPf4SMXQ94OKGyWQ6TAgB3ial6U2RrKxHoqCUZAEemq2BbWU
	OkVBI5fDdN7RPKuNbuhe/ip3GktyuBj8Re8xZoqWv+AVXyI1M5WOzPnNpGK5xoWgqKLOfnvcyrR
	Mf/N93vNR3Eey1j5pmJj2xW1XM6W6NBYHMr3JJeIUIkyX3fDQiKErfb59ZAXdoPWnLf3pKycUj/
	zkt9LGTT8L9JCikHNo0ni5RgHNDRSYV6um7VJ7hIqgKL+LfYe6tFlK1HcobgB8J5IKLJJGLPq3d
	p5chFmRM/KgUFUH1dCbNbL4vFLDr3kgL2sSqFDDev/Hy4eYhhsWqayjruwbtXXEM4TqZzb8iHFh
	oU90=
X-Received: by 2002:a05:622a:18a9:b0:474:faeb:50aa with SMTP id d75a77b69052e-4a9e72c759dmr23061861cf.5.1752150317027;
        Thu, 10 Jul 2025 05:25:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL2upV2JP4A2q8XY4xH5jOb8YXZErvSG6S/PQkLmFjLIJfoL6nTfAPNahLLoITNqEwR13IJQ==
X-Received: by 2002:a05:622a:18a9:b0:474:faeb:50aa with SMTP id d75a77b69052e-4a9e72c759dmr23061571cf.5.1752150316273;
        Thu, 10 Jul 2025 05:25:16 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611d1062950sm455639a12.65.2025.07.10.05.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 05:25:15 -0700 (PDT)
Message-ID: <46a506ee-0472-4c7a-8fd8-b3a1f39105b5@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:25:12 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: use generic pin function helpers
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _dstZNVXr4XeXlIn_ihIUPpCgpvJhwyW
X-Authority-Analysis: v=2.4 cv=W7k4VQWk c=1 sm=1 tr=0 ts=686fb12e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=SCCoO-_AHFKZ3jW1OIgA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _dstZNVXr4XeXlIn_ihIUPpCgpvJhwyW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEwNiBTYWx0ZWRfX0PUgadQvz6pg
 MmUiH+OVHzitUcJi/LWkfd3onN3zowAi9bObYMoCJPhc7unAIT+2ithbwll2AHT4Jtc1utrrRu7
 MS3bMTRQWPuc2mWiWPxFTckVR9OC4rb8KmJzPKuXlewndIzrpcZKBC+MacNZPGl/aDF7Hzx5sB3
 qxZwf3/PfNct+W4oQsG4RxKX2wqpOB4Ji8BfAJgK+9kJ9dNSfjNUcQC8P/Rio/lqr2nybweT4pw
 EI/PRxj6kbJNMCdibJiHGC0NEtgKyw/uRcEAZW/nD/eDBEVCoXG1/XiLRzC9zpp5dJkM2Jggzob
 6Tv8TLpholyusDhLHoQ8QrN9ZP7wopGPET3Qg0050F5Eg2drth9FkFmdZRkR0RrQM1dV7/GGm4h
 ix+eo7KnPzUgY1KVelXEMOvhpbDKC0p68RqNO6R1nrQ7TTtFvk16p3CRvXDC0+GMN9gqiha3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=738 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100106

On 7/9/25 4:39 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Use the existing infrastructure for storing and looking up pin functions
> in pinctrl core. Remove hand-crafted callbacks.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

[...]

>  int msm_pinctrl_probe(struct platform_device *pdev,
>  		      const struct msm_pinctrl_soc_data *soc_data)
>  {
> +	const struct pinfunction *func;
>  	struct msm_pinctrl *pctrl;
>  	struct resource *res;
>  	int ret;
> @@ -1606,6 +1581,14 @@ int msm_pinctrl_probe(struct platform_device *pdev,
>  		return PTR_ERR(pctrl->pctrl);
>  	}
>  
> +	for (i = 0; i < soc_data->nfunctions; i++) {
> +		func = &soc_data->functions[i];
> +
> +		ret = pinmux_generic_add_pinfunction(pctrl->pctrl, func, NULL);
> +		if (ret < 0)
> +			return ret;
> +	}

It's good in principle, but we're now going to house two copies of
the function data in memory... Can we trust __initconst nowadays?

Konrad

