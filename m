Return-Path: <linux-mips+bounces-9738-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D65B01BD6
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jul 2025 14:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C6B47A9E96
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jul 2025 12:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28701293462;
	Fri, 11 Jul 2025 12:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V/6xW1ba"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A523B290092
	for <linux-mips@vger.kernel.org>; Fri, 11 Jul 2025 12:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752236373; cv=none; b=soZ3jcs3t1hvAB1DYbAyL98+qS+mnn5uz1joZX+qUKHXnGYb1Ct/qobhCTkx8ivMvzDp5/I/GsNbN6YC3lWAQTPbVlOeIFkT4nmWQjiCj5H6CDi20O+0PI6vX5H/j678vMwcHblM1FxxcBCEP4hGwh3a6ULMJzILpsLDFuJdquY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752236373; c=relaxed/simple;
	bh=LLrYXoDSk+Z1qUZOicihZi7zP80fK++DmxBSWtA8aw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G290ASgQpcsXxTYNfN/Gigx4ROA2uCM+zN57wl4dPDar0iftHsyNyxh16xHJYrPqeUzefDtLl2Zhus/hI9rXFiKQj7HkDpbRgbcGojGk1u65pR1L1frTkNsG/sUy6R+jYm4NxKU9A4QadxsYxVjRJc2VV+DWlbKLOjW8Rsb7/eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V/6xW1ba; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BBGRdv012022
	for <linux-mips@vger.kernel.org>; Fri, 11 Jul 2025 12:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PgRbANHn+bv7tnW2+OxW/Wh9yvUY2jb9oebM1Hb2GEc=; b=V/6xW1bar7YxpMdz
	jGzXZNSYsgNxdHU8lGqAXSpNawExd/RGkVrqkOD6mtiqWKNQpTilbpx0dNg7SO6l
	b9nQMyOYUC7gVGE0mLzat8eFRnjfLmtjeM+gtdMh394CzMC8P4d9qe0YTEcJ02B6
	v/uY1Vi6z8Qrt8M4SOwcX0n6pgsc4RJQpZmnJauGSFkhqknpoCnUnemdR9Yu5Lmb
	wL2F/UYVdNDaW1+F4MMpprOjkHCy8xxMNtrwPpEYmgT9NYv0drQ0ddQBQ+YzvaS8
	69imad4Z4wJ9MDC86nnIf3ghbFoHog7HnxWd4mZYdREUAvXClnF5q9q6oXEv7rkF
	oSWndg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47sm9e0g12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 11 Jul 2025 12:19:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3ea727700so33057785a.3
        for <linux-mips@vger.kernel.org>; Fri, 11 Jul 2025 05:19:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752236369; x=1752841169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PgRbANHn+bv7tnW2+OxW/Wh9yvUY2jb9oebM1Hb2GEc=;
        b=ScVq4oxUbx+vnmIzFNx65rkq1HIzp/nGNhC3RRai49wdc5kn4lhQLwun5s7n3hrusY
         EQAtTBj+LUttSwAhuxkvAd4W/3Hx9lvJPqb9pSBgmoLDr8wUZ2En8YmdeaU9uIsa92Xb
         kSDxIMPofqxzZM7NHgJ/yDdI6gHk3luiB0Wk5j2AkzpPdB1thzhQGxFgIVieV/v1FyZ6
         761XeyXATrCkcZmx1mVCb4epC0g6poQ+iN3VrtD1VBwexNt1E5glvaeg7XUn74oERDSE
         0OEJiBN5PlZzDE5g7HIrnm/tK2TT7fCDiXXG3ru+VAoXOYCzyqyoUWN99b9/h1QDtQzS
         vxLg==
X-Forwarded-Encrypted: i=1; AJvYcCXcakIsdcnisFASuzBi2DN/k26mdA14ZATawB2e0LUufJ7EAe8FCnAKBcMy8sa1QmpK868w2/tRfHje@vger.kernel.org
X-Gm-Message-State: AOJu0YyESHPugHHZo3Q7uRkRzSoCd+o8HR9eu43TIpK0qRCabZbUuQHt
	PocBriIM91RqkpxS/YTEwMDvvKql1czONojStQdh21AeZEiRv+FtSsye5lDdiACIJtqnFWq5zMf
	rv9U2IgJ2CCEHYCcywnX94Xo3hB/EWCD2vPF2NY+qI7Zd/OUFZamJF78XldReOCVj
X-Gm-Gg: ASbGncszVfUFzJf30hAE/gg3n6+UbQfymwvsM5OrgDVK/ECzNlWzOZj8jrOlfPStxwS
	wEQkY66aaxUXvy5rZIru4f/XpqIeQ+D3VvuKaRnkqyCbqhGh/CmXMz6PZDzw8Ozj8dI3IzeAV/0
	eKP1211UwlI57Oa2aukPIfp6AxfO6ptnvEYI1aSD52IHAVA2HQQLN214cTnrU38T8CGAMMkG0uu
	IMUPOzjnaNR/medejCBKIlI531cGtj6O4ndoLWUa1o7gTrJ+0GEn5lnTAGsvN9Podw4+oz5+3KF
	RvWm/+H1SNPkLZfcmhyIXN/0+xr903FTrPsFgH1GcpF1WRxMBaAch6SZmOcij4tiPbW6Xw42xOV
	B1QbIyDjBSxrAM3jAGrK8
X-Received: by 2002:a05:620a:261e:b0:7d0:9ded:31e0 with SMTP id af79cd13be357-7dde704afd4mr193294085a.0.1752236369442;
        Fri, 11 Jul 2025 05:19:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWdOt+nw01pFgLOuyNAAOJCd4H7cvcLSPFzBJPJCQX8U74WAVdoJLitJFP6NOrfYfrnxfZkw==
X-Received: by 2002:a05:620a:261e:b0:7d0:9ded:31e0 with SMTP id af79cd13be357-7dde704afd4mr193291385a.0.1752236368710;
        Fri, 11 Jul 2025 05:19:28 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e910e8sm292167866b.36.2025.07.11.05.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 05:19:28 -0700 (PDT)
Message-ID: <b9f6f827-78bf-4fee-8be2-74a9c94d9722@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 14:19:26 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: use generic pin function helpers
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
 <46a506ee-0472-4c7a-8fd8-b3a1f39105b5@oss.qualcomm.com>
 <CAMRc=Mc7KSSTF=Jsu-_1C6eWrTXNKB=_Q9fnZor8K_4nnQ5m4g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=Mc7KSSTF=Jsu-_1C6eWrTXNKB=_Q9fnZor8K_4nnQ5m4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2aybWerVlYgrGor3wcR0n-cfedoy4Xn6
X-Authority-Analysis: v=2.4 cv=W7k4VQWk c=1 sm=1 tr=0 ts=68710152 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=RgMTYWP1_r0sjz9xMRoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 2aybWerVlYgrGor3wcR0n-cfedoy4Xn6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA4NyBTYWx0ZWRfXyZx8xCYMEA2D
 UvBBdIeF5iVxawQDgxSZu4RCWGVEvkA/MeS7F99+hKqJ5QcZW3TZZdBuWLt9Iwk4VQtg60Lukn7
 x3oA08jWtmhoWIKXxd/+8+gl8NSBPRef/YJE/DvHdwfMamTkHIltC6fm2mbru9g+UGmJzbIbYr+
 iMwFrmMXu64BAvMJyne+uiwsbQ1fekOF/0TPXbVVgwwvVteOFS2D/bDs8p9V4YcdEwdToN1Za1J
 ac4oscZYt67O2MpkL4B9jubHMzXhapF7XGTSMEslmsRmFNKM6sHBinigOwdM6XJTbwgI8ZU1Vcp
 uKdL4KT9vxtdPNW+wn4CJlXfWOareWmOcnUOq9gGjWUT7MSX0royZIEVSnL2OA3Gq1cvUbxDrV0
 E/q+K6+XVKCGyvllt/paG3GOeFoy7Mk9CSKZm0SCQIZoiFwzfJDrnnf5YLPSvafyISY4jlx4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=860 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110087

On 7/10/25 3:38 PM, Bartosz Golaszewski wrote:
> On Thu, Jul 10, 2025 at 2:25 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 7/9/25 4:39 PM, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> Use the existing infrastructure for storing and looking up pin functions
>>> in pinctrl core. Remove hand-crafted callbacks.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> ---
>>
>> [...]
>>
>>>  int msm_pinctrl_probe(struct platform_device *pdev,
>>>                     const struct msm_pinctrl_soc_data *soc_data)
>>>  {
>>> +     const struct pinfunction *func;
>>>       struct msm_pinctrl *pctrl;
>>>       struct resource *res;
>>>       int ret;
>>> @@ -1606,6 +1581,14 @@ int msm_pinctrl_probe(struct platform_device *pdev,
>>>               return PTR_ERR(pctrl->pctrl);
>>>       }
>>>
>>> +     for (i = 0; i < soc_data->nfunctions; i++) {
>>> +             func = &soc_data->functions[i];
>>> +
>>> +             ret = pinmux_generic_add_pinfunction(pctrl->pctrl, func, NULL);
>>> +             if (ret < 0)
>>> +                     return ret;
>>> +     }
>>
>> It's good in principle, but we're now going to house two copies of
>> the function data in memory... Can we trust __initconst nowadays?
>>
> 
> Well, if I annotate the functions struct with __initconst, then it
> does indeed end up in the .init.rodata section if that's your
> question. Then the kernel seems to be freeing this in
> ./kernel/module/main.c so I sure hope we can trust it.
> 
> Do I understand correctly that you're implicitly asking to also
> annotate all affected _functions structures across all tlmm drivers?
> 
> Alternatively: we can provide another interface:
> pinmux_generic_add_const_pinfunction() which - instead of a deep-copy
> - would simply store addresses of existing pinfunction structures in
> the underlying radix tree.

This option seems like less of a churn

Konrad

