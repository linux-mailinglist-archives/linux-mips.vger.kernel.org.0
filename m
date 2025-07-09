Return-Path: <linux-mips+bounces-9711-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05783AFF06B
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 20:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40208564F95
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 18:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E94E237162;
	Wed,  9 Jul 2025 18:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VkHrX/iB"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5228B224AFB
	for <linux-mips@vger.kernel.org>; Wed,  9 Jul 2025 18:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752084285; cv=none; b=QP9UFprWxeXLjz5dL3mPTVp/Q+u616KJHf6B1sPBb/VXPXME5j7vWQKuR/+7EhA9vClbopfbryEPY7xbVUcH4n/3V/RToN/FOKy3DbPYkl4MumMdRDLOPkKGqDp0OiBY4yip6KzGkAb4t8nZsJaKMNJz+43wgDLsGD9NyyfH1tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752084285; c=relaxed/simple;
	bh=BwEHDnFF8g9BwbRZ7s5wgYOhw4vNQlfGkcQ79zkRIZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h7dSdYiN74GX7TdX1LZZsOaepIprzIgGNxt8Obodi7LYBdw+gthqDXbP361aOWBBV/z+qzydWReuUHh8Z7rZRCEdN+sxr/XMFngPjr1Z3VncgxUcd8w6HbIiy470a/YFNBfbbfItKSUdF9FjySMVUyl6YI5aDaQhHqhH2kcVb+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VkHrX/iB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569ComY4002907
	for <linux-mips@vger.kernel.org>; Wed, 9 Jul 2025 18:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A2ietRUbMDbJ4mE4kCJF5gt9v+ZI/BJHpjh+AfLfssc=; b=VkHrX/iB1owUSxld
	0k+fbo6IcOvwtEYGSSRlKjHpAinC0RiWd73EPPUC6SOM4iBvvYejo9Hir/sSs1M+
	BimAHnZ5h1Bm7K6EukFdGpofuYt4/4mVpL2Pvk1zuKqdOPMAEA0hUXCuPSLOmkJI
	uxhP+dVMdAmPY42H33WwyFKvhLTjLI7hykoi46pR/kn5Hgzte68IRcBVaBSbbEgM
	cHTfSuCq3FFJOsKCluYO73ZuMuweN68F4RZKBYnZjt9JHLQRIPG83VqGx6D6sB7x
	NYtuDq+MO3CE2+WCNg0do2owYKfya9Fs8n2UT5JIvD2kgG7SZnFYVVqX1VOzqctq
	+OrFUw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2bdctp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 09 Jul 2025 18:04:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d094e04aa4so3597285a.1
        for <linux-mips@vger.kernel.org>; Wed, 09 Jul 2025 11:04:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752084280; x=1752689080;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A2ietRUbMDbJ4mE4kCJF5gt9v+ZI/BJHpjh+AfLfssc=;
        b=Wz0U/MHKz1ALFL/vNLJaNYLswedY/X1Lb7JrQgk0bhOlAPgeWTeJL0wB6zukRRwOp6
         Fex3H/6uQgnEZthEfneeC6AQUgDbXPHbAM6exPv57yPY/ecEtWU4pj2XZCec8MQAWTl/
         4xbtTYpg681TpYq1cgqrtPrlbY9iwntBGoq/DEFmTnAqk7mubodsXnQr0KpFMPvoN/Na
         IH3ZPrgQ2dZr50MP8Rl1L7RseY8zjnXvKjQdyLeyFSyTIXMo/K0jRRf6VJ1838DwsR7C
         BgnhyUCZ5S8j8wWgq+1tCUduvOH3ZSUKLgGlXwm4Dk4+klWeibiFa7FebIRJQIeTbGoo
         w0tw==
X-Forwarded-Encrypted: i=1; AJvYcCXhZ+u40JPizMvhz9A57j0OSlibFQ7rMfjdqoMi9k9QowhXJhSxrhg2Qj7l2JiEZdWurkAcHPOarXIO@vger.kernel.org
X-Gm-Message-State: AOJu0YypCwyyn99Szbio7RvzfTV0gt2U4Xuk2q0WReoQ8TrASgQAtptn
	yrZak6j07OFirW6Hx41jqgHASP9hjeaqfSJD39A7C2DJlsRS98xOnHNMl43rsTSNn1VlpqTNkDr
	B7aWBHF9qpKqtKE8eembXiZ15vzxukC+Y+ocaLrcbnVhXoI62m+PU+2PQGuDFzXUq
X-Gm-Gg: ASbGncu8DAQ/H+Lllb7VePhng3ZokUjm5wqHqGCnRPniYbfr5jQpoU90jTaQBvOCYR8
	+oYTN8pvNbO1yUexYMBKKv9gqLi2cX3Pueo1m3zWtaeGTGelynKUNfNRFP0+Xlzma8YKqDPb/g3
	PSPsJe0Vb8mOP8jiLyTsKZD2eMDpp3jc0HDJo1YMgweEjxU+GmtZnDY7zWLGOuW/ezT4Dadzn4o
	VN0uJXEa0iBAoG1ZmEPyJjyJhZtvVlivT4/9xChJGFqYkUzElm55LwMnVcnMaSBFojL04BE6geu
	pneFSEpyzYjJ6YtqBA8QWVg5tVDQ9cW+Az4TKsb46LA+ZBXNJx+AAFc+SIikk4ifHTOZAqkLotS
	ptAk=
X-Received: by 2002:a05:620a:2681:b0:7db:3fbc:d71f with SMTP id af79cd13be357-7db8b3307c8mr183721785a.0.1752084279992;
        Wed, 09 Jul 2025 11:04:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRdyICFCZxRrKtqyaPtAi/LxAqDz5IEHfkpkf3qpn9haIG2NUFS9hpsW2SKi6yjsOjwAtEOw==
X-Received: by 2002:a05:620a:2681:b0:7db:3fbc:d71f with SMTP id af79cd13be357-7db8b3307c8mr183718485a.0.1752084279403;
        Wed, 09 Jul 2025 11:04:39 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f692f555sm1156700766b.60.2025.07.09.11.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 11:04:38 -0700 (PDT)
Message-ID: <256e01fc-fdba-4006-be8b-236fbbdf9f25@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 20:04:36 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] pinctrl: qcom: add infrastructure for marking
 pin functions as GPIOs
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
 <20250709-pinctrl-gpio-pinfuncs-v2-10-b6135149c0d9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-10-b6135149c0d9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDE2MyBTYWx0ZWRfXzJ5gOqgP7MBk
 Nz9G5qpEy6WdNLTf8CuXaBXK7kH7xVRBpCo7UKRgmS4S9j/nVTkB47tKMLwM35sSREHS0oRx2lJ
 wKTqI3M1Dri/FEWiMmw2kqPae6kWrbO1yY4C8HPmh6Q1XBBXaYs8VsP4VY7zMwW9TO9JPuvtCxt
 hroqC2Fs+VnWaHb1mRvk74dS4kfPaSTvyOCASX1vucZ/6gwuib3GHiQBmbH0TxrByFKInVLRVcu
 nEhvi6zRRRxh6Rd4hdbcIDI9gCR+m1epFV6RzpUtSKlNsGnI1BAOyoq71ey4rWtRKhi6kdAeJV1
 rnu+2JWw1zWYhfQehJdH8vEuTVZkQTiqSeDavXWhh/NgWoeCw5d0fZut2U5dy/aQrkGLUVEtZ8F
 dTVArr4GyBoh82sr0jQJdAimGs+DWsOCJUMwvdneURD/32fZGgeZHc0wLoWq7w4b5TWwup3m
X-Proofpoint-ORIG-GUID: 8v1XjQz0Z5jJ6aK2K-UQdpZK3FMbgMRY
X-Proofpoint-GUID: 8v1XjQz0Z5jJ6aK2K-UQdpZK3FMbgMRY
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686eaf39 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=NA2ShB3TTlD8ZNnRZVMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=975 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090163

On 7/9/25 4:39 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add a helper macro that wraps PINCTRL_GPIO_PINFUNCTION() for pinctrl-msm
> pin functions and assign the .function_is_gpio() callback in pinmux_ops.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

