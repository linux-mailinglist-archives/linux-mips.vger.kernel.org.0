Return-Path: <linux-mips+bounces-9911-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1918CB10848
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 12:58:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1869189C8F7
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 10:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E1D26A1BB;
	Thu, 24 Jul 2025 10:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MCM9U+EI"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F411D7E4A
	for <linux-mips@vger.kernel.org>; Thu, 24 Jul 2025 10:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753354670; cv=none; b=FTmX40yZlXd472q/ed6ubrhLMT+RKUXVhgjVEHIf21mtZNTjxGyXTD38lQ1xfIJuz2swb4DqZ+NmBFr9ab+B2JHxl+Fi26phNMYF8FDQYLsKvz/KQ7qi0Q6bPdbGWchjOAlgtBuo8Ks2t2d3MLgcbc1xZwfJSdq3YNdcCVTxBSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753354670; c=relaxed/simple;
	bh=FHUm8JgjLCIAyUcbE9ObMrZ2uKu/jiL8r01fKXYzPAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=km7WFrXDIWNkkAP4cK3OkBO5uYDVL6WxpKXks7ZL7FYQpqNJDKGk74G/xwJh9SVPqAYboQ3ijRaVNNWs089+8/+ucFDjNf4KTeY84QolH6N8wlnKF0naxnlFDgJS0AGuN6blxWvN9Z1d4ZN8n+zdwjrWZcbmFAsTGSATE8eYXG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MCM9U+EI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9oZqW031241
	for <linux-mips@vger.kernel.org>; Thu, 24 Jul 2025 10:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	frgttlq1wUpHfs85c6sOB8oFTBM5O4TFBHJ8W4S/2Zg=; b=MCM9U+EIRXdUhkkj
	RnaQHyphmlwj8ufux4uRqT1CeeRyh4WJeQyMhFCoM7HUZE8B54OyMur9MQ7pLAHK
	q7Q1KVrS7BFGTDMUnHwdUrmlCjNOXtf0Rp/Gdwturu54n0TsR+qJU3AtKnFv2WhV
	Ajeq9g9mm1HxhnKm5PMSdv09h5GF5GTeKQLa+UREcjMI+vHbBSZEp5ZsQOJYdrBc
	29cuk/jHFBZqdsYWQeB8ET0R6F2HpIBhXtEQ0eTVFTrqxXZJKuhGlQ4XUWQjybWw
	SQmEEyV1+dpeOxXC5puV3gSzpq8fRjewj3wouaPKzcYBH4zMbbbQ82M9zd+81FQV
	uLJMxQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vet2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Thu, 24 Jul 2025 10:57:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7071696f5eeso693606d6.2
        for <linux-mips@vger.kernel.org>; Thu, 24 Jul 2025 03:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753354666; x=1753959466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=frgttlq1wUpHfs85c6sOB8oFTBM5O4TFBHJ8W4S/2Zg=;
        b=AmlI/wD559dFuJOJCWi88e10WTDvIr8k41UXRh72j8CBSo/wIXLbEtT5l9jDMdspJa
         CkjlrO46FASALlnK6iXX61CEk0vDesppEz7gGTl0LenYHDmNwiYlWwcksRGGo5p/HwdJ
         w4GovKHUEb6iKiZawAbeLQolwpgIOWQOevoQUC+7yR9iQxukLmI/RkpJUz1rJ4YmpGFU
         zabOLPSi5MIO3+sRe79CqGN0/GZsfZq5FIeuhJlAQQH/WPyno3J3Eb3LEjpD2Q7JUpn0
         mN9PR7x7FWj7+SD5E2Gl1q5HXAic8xvaIQX3ooX08lRzHEQCCj1joRlznHFwJvzVmoaB
         U3xQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp8Llzbl+pVWF5itUJRPfLRTsVtgC+q3H8lOmADveki8TneKf0OVrMjLCnDWtenOnj56o+V6bgcShZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc1Mgb7OjW37tbIjJ+IqD2BdhQNFPWCui8N3le6bpvqrJardEB
	zfS6iRa7VVNHpUO2X6H+majEAUmRn2IT1L33VcJYmzxbUBkG68BR242qmPqLyZ0fWlt4yqnw3IX
	XjXcAWO8A/pD1XmZaaUX/9FC3GbdgAZsqNhOxmPVlYVBfUPxpjDSsD/gA8g2iIw6P
X-Gm-Gg: ASbGncsvyel2KdYp0Tqtv27EnG+KWuRz3gr73BHZS1KRU2kI7K/CR5v+qhvswY/dcL/
	+6A8GDeBc9xfjrmKRljtvssoFLNWf+LT32jYAXuJ/SkZu5KaGz4C5rsg5+sU28fh3eWR10RvNOb
	Gfn+ZLDgl4IhUO98NIWYWl8636+TE46Mo6az/puIkJ7VEcwdg12M5dIn5UYEBUtFAwk7FFvwF3B
	qbNwiNjEUfzFqEEV2JxQeQzQUgW1xLnb/wV4pEqCRpd1eDLZKpm7o7Y3Ms4d7M3dXtO0p5ROyPu
	IVsDt7V6dAIgVnQ+DFIpZngJRaxqCJ8QuI2rTrBmy2W48OaltuFkK96EaXzB7Tml6VMoJhBl/kL
	BtaUpkpsqhAU/IgCHOA==
X-Received: by 2002:a05:6214:1d2f:b0:702:d3c5:2bf1 with SMTP id 6a1803df08f44-70700537849mr43874736d6.3.1753354666054;
        Thu, 24 Jul 2025 03:57:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOPUGD8doV9+jglxqU2GB0DYEWEF7aTYg/TWGqOaOfQBWULvPms9oF3r1fFWzU0hBkNoKlEg==
X-Received: by 2002:a05:6214:1d2f:b0:702:d3c5:2bf1 with SMTP id 6a1803df08f44-70700537849mr43874396d6.3.1753354665532;
        Thu, 24 Jul 2025 03:57:45 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47cc6e753sm95191866b.50.2025.07.24.03.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 03:57:44 -0700 (PDT)
Message-ID: <bbb07270-cf7d-4fc6-9a74-334fcaf00f05@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 12:57:39 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/15] pinctrl: qcom: use generic pin function helpers
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Andrew Morton
 <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
        Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP S32 Linux Team <s32@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang
 <haojian.zhuang@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-mm@kvack.org,
        imx@lists.linux.dev, linux-omap@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-11-af4db9302de4@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-11-af4db9302de4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wtIuyYWBH-3f79Ivewz6f0ax3pH3orzN
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=688211ab cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=jpok1_DMC_Ne8w05vhoA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA4MSBTYWx0ZWRfX3sTTw0i30MR1
 NXhXB36H2BsITbEHMbuA4xYKcK4evCD1OuXroJMSsuQ7vxJOCUj0omAHE0uPEaqgNa4vtAaWrEl
 uKaThYLmmnB/WHxIRZySCtrzN0ypFqsERZFqNCLDn1SVdRHnGxj3ukHVwM92pwBsvsg2W5yvEIv
 4qXlitGbhuyIygxFIFTRj37rYOorvykMjY6jpYC1snux8Hzi3mFG8Z20Vy+/H56vWXdfYbVSpq5
 BXI611v+0Ty9XXV9K+KfkhIhsFw5xziatACGk5hwolmtRu7+do1oQoVQlC/qeBMT6Ei/cBLhsAl
 avoT8Uhj1e4zI/iDdlfI7TNGjjNEc3Vh7/V2XtBzhFKg9LvyvXEi8yOuOfqF1WrV2zw4Jgrsrf3
 FpO44Vb8N0rGY9CjqRjM1UeDu8GxAZ1kzsnRaStybCcHxXaYuv/85HZVl2QLLmI5HIs9w/YW
X-Proofpoint-ORIG-GUID: wtIuyYWBH-3f79Ivewz6f0ax3pH3orzN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=439
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240081

On 7/24/25 11:24 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> With the pinmux core no longer duplicating memory used to store the
> struct pinfunction objects in .rodata, we can now use the existing
> infrastructure for storing and looking up pin functions in qualcomm
> drivers. Remove hand-crafted callbacks.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

