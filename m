Return-Path: <linux-mips+bounces-12731-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BF60ACEFEC8
	for <lists+linux-mips@lfdr.de>; Sat, 03 Jan 2026 13:38:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F24F2300B038
	for <lists+linux-mips@lfdr.de>; Sat,  3 Jan 2026 12:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C896E1D5CD9;
	Sat,  3 Jan 2026 12:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yz0s4NPV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d7LyjEfH"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB4127456
	for <linux-mips@vger.kernel.org>; Sat,  3 Jan 2026 12:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767443921; cv=none; b=XJ2Vat9rmQnnuxIp4+G+8oZq6QL82JxUHGXurL5S1G24FXT+YYR3HAIjO8RQQ39l0Y5MeTjtQTK03XfypLEipXYOeD5FBvPSKOyCpjrcE2B6/Zo8i+uF5G8h/V1LWxdhhsGpJvLokY1aPbbASK+0NaAfwh7NE7W02NNnp3BFlq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767443921; c=relaxed/simple;
	bh=4htUXGojMQA88jExOZmdbcfB086K1N9ZciZUecN+H10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=txkevL3LN7wjqWjV+65dj0vFjhPt9Dslk/l1KoMsLbX2FaqNCoHPVF5F+8QQI+vtqEHfwWrDlNImqwL0Y9t/3tuRbGjryXvo3fksFwmLs21AO87E8ivVlREq8zbplp9axh24loETHek/9vcjuqphke3rzdB7Qe/aPkUW9eYayOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yz0s4NPV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d7LyjEfH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6032Xbf02261090
	for <linux-mips@vger.kernel.org>; Sat, 3 Jan 2026 12:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l+JdtHXgUK5tKB6FrzQLQS8THzcimqUqNRaIrJsb3AE=; b=Yz0s4NPV57i1ZihS
	WOCh9vS4i7/YfLg4vzngSjQQ1FyRqWGUBiQKZyIGWY10ynGkAEJaykPWezSCvNGB
	U6tJdCNZ33wJDwNo94DYojZkqfLa9AbRJHjPDnPkFGO3fB3g5uldqXrrvIsG5ifR
	MKaHAJOmuSDZdlPQ2MjHbq2iOJeGudLZ1+uisV8O2isuXBh1Mz3vs8wl7MiJqV2x
	br5BOz0igBwnRYismktwJ6yAgbe1+mLs9F59cffpP3ZlMfoquHg5WmhTueAtiaup
	QorhF0lqH07OxZF6YuFEgRZKocVX2oFtnPBJ/8DaetIeMprqNHYpcUX9zqNuQ5ED
	eQd1aQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4betefrm4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Sat, 03 Jan 2026 12:38:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0488e746so16523951cf.0
        for <linux-mips@vger.kernel.org>; Sat, 03 Jan 2026 04:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767443918; x=1768048718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l+JdtHXgUK5tKB6FrzQLQS8THzcimqUqNRaIrJsb3AE=;
        b=d7LyjEfHkdxmZy5m24AT0bca6PRSVv/S5i68NW4u2VoPkr/5T7ISIq/RcRKKojLz/V
         S/xFtfh3uQAaDzfFGxB3ZJxwhL5stCcepsh6BinACwwli1G1yQkmzxcMDMdDuogml2Xf
         QEPxf3XtaRAln8Wc1AVpOh6uYS0k22MvgZt4PwzSPYZtEprjS9QbqUOxJRcM+Gv3esOI
         xlFN3StnJWk6G+kMrWd6wNpyC+XHNO+5FW/Tk7pZQ6pPvX2Y7FSHfO5weIrsTrxgZsHr
         vlesUn2q1Io9dYotn1r77GFmrs212NWwgdmSjnZAY8Jq9/dyu3zLx7xod+6WS8tgfQNz
         gzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767443918; x=1768048718;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+JdtHXgUK5tKB6FrzQLQS8THzcimqUqNRaIrJsb3AE=;
        b=aJ5vE7EIRk7e4Jn1W5yRbEliYau9BchQ5MUhP8sW9eet+oy0bGzj3RGa9pepPX6tKS
         Ou7BBcPCyHIxa1QwQZSyPX4M/tdrFoLkYXxC1BHch4mhEpEszIsoFh9isH0qhYB83/cJ
         YXbZcFTNKIy8GLRt7QzsTAkLBXPwPR+cKSIon0TYGjIGFdLV5iFJTK7/4wNMny6Dpprx
         KMOWmXWYfP1W1g+Yly3x6JRZ0eYlbv1Z3IVERAID+F6mvorB2qBAcH/ay+N/zqxf/DoK
         TsyIlmDrjT69HHX2V7TnJeQIApmj9Ql4HLWikayzDM23ht1+L5gKi181VgM/nklrILgR
         SdOw==
X-Forwarded-Encrypted: i=1; AJvYcCUnnlY82/oXjT4ciftaPQKc3J/2N1F++luBKOmTUf01kIAoz/Fs6HTEGGOhxbWv2O3pDlOAANadzF9A@vger.kernel.org
X-Gm-Message-State: AOJu0YxP9ZvphGy99qYSG4OyP9qH1XFg53ShPFhGmYuEcHoLytim31j3
	bQ7b8BqHRV2N/U+OjUFg0wEO+4YCSQHh3qVgctJj+JSPAcrYOQjopqx1IeMw5zJ1QzFf1YIoZSp
	i2Uu9ElT76JbXSC+CoAGWQxeEzi6jhL3+FePYzCWKgqoNcj3AXa9DLds7UocEqCB9
X-Gm-Gg: AY/fxX5l3K19NzxBRL641nD4+fzJS+l1/ybWuVr6Kq19/zfDC0AmM18ghBVoO8MN0iv
	sGszRbKwpB7jP2R2YH8ukwg606dnWP6i06GT7YFcgyU4A0JN0nhbN5G8uttOrxsCMliqu7SB/6J
	tzzV2VpESjRpEN/wg+EmQoFYy0IhTdvOtvtLECcKCmo3T3ytStu1EK8HkkmeEJ/XfgFbjUce7CS
	D1a4uvDwEWRBcpVQnB1V1gBSW7HpShh0FTjS+Fo7VyfrKblc0SMgqTCqfExmhIoRBfSd+4Fj41f
	1fUt9VSobK7Jd3tNAcByXOYe+kc0OvuZ8eztBgzmggMTOUf8fMxlP+eScWJzrromkDVWS1tqcAR
	4bnMP95fXwgaqmjPJpWyPkCKiFoihjmnGLV2BlA==
X-Received: by 2002:a05:622a:4d2:b0:4ee:1ec6:aeda with SMTP id d75a77b69052e-4ff472d336amr38212141cf.34.1767443918463;
        Sat, 03 Jan 2026 04:38:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+IkaHveGttYEdIkr4gj7LQeV3maNqbEyN4ReCR0MZJgN47NujIPEtRPhCrd9cYtAzFyFfbw==
X-Received: by 2002:a05:622a:4d2:b0:4ee:1ec6:aeda with SMTP id d75a77b69052e-4ff472d336amr38211751cf.34.1767443918005;
        Sat, 03 Jan 2026 04:38:38 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a60551sm5054037966b.5.2026.01.03.04.38.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Jan 2026 04:38:37 -0800 (PST)
Message-ID: <e2e72720-5541-44cc-a000-c469d7873c06@oss.qualcomm.com>
Date: Sat, 3 Jan 2026 13:38:34 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] mtd: spi-nor: hisi-sfc: Simplify with scoped for each
 OF child loop
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Paul Cercueil
 <paul@crapouillou.net>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Michael Walle <mwalle@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
 <20260102124927.64703-14-krzysztof.kozlowski@oss.qualcomm.com>
 <86a4yw87g8.fsf@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <86a4yw87g8.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Hq572kTS c=1 sm=1 tr=0 ts=69590dcf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=BVFu3abGlNSLOwFpleUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 00goHFLDuIkOQOKndSwlHwlGKceFRxv2
X-Proofpoint-GUID: 00goHFLDuIkOQOKndSwlHwlGKceFRxv2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAzMDExNCBTYWx0ZWRfX7AYmPTSKWZ6V
 nkbOWIh9RdjNUoZGIIaa/wvRphwSQVaajWvC54h1+bHQmrsgdJ0U7avsLsc0ruc3buTolG5iaL8
 gyYs42/n4izd88IAvW4T9PwmSNJ+n6bWDD7goXCKMF0NsUgf+rkTZkeZsSYKRy7VctQW3vvcO6J
 w/APBkvkbmyLPPfCJjfXBZdA8WU0BpB+tiZp35ukXd8j+7gwGBly4rR39f/RgZeJZY5+kCpr4tT
 58L6kCPNe7GH4KUO7EtDV53K+oV6b3PlsqxMXPNdBtVdkUfd5JQ6wSHv0r7mzIlP8+TG7mMsNTN
 PTm/tDUy9abtzawvTR9tRmDC3w1SJnddAUjwHMV32rPyN7A5zRI39TeD+5RoqRVFcMpU6VMkvMi
 AFfRPCpzFTeGTD5fTsLLWxSOU/ZobsImJyM4CTBZVDAvxxaihBiGkILur8iHimzNgr1IhvE3n8V
 pc0Q46miw/CoIr0X8+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-03_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601030114

On 02/01/2026 14:33, Pratyush Yadav wrote:
> Hi Kyzystof,
> 
> Thanks for the cleanup.
> 
> On Fri, Jan 02 2026, Krzysztof Kozlowski wrote:
> 
>> Use scoped for-each loop when iterating over device nodes to make code a
>> bit simpler.
> 
> Nit: the commit message is a bit too dry. I had to go and look what the
> difference between the two variants was. I could make an educated guess
> by looking at the patch, but still.

Really? That's old and widely used syntax, replaced so many times and
sorry, but really obvious.

We should not explain core kernel API in commit msgs, except maybe first
months of usage.

> 
> If you end up doing a v2, a one-liner explanation of the difference
> between the two loop variants would be nice to have.



Best regards,
Krzysztof

