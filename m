Return-Path: <linux-mips+bounces-9716-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61222B001A7
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jul 2025 14:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F7095A6B7B
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jul 2025 12:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6986D2561D9;
	Thu, 10 Jul 2025 12:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXEEgYd+"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0892505BA
	for <linux-mips@vger.kernel.org>; Thu, 10 Jul 2025 12:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752150375; cv=none; b=KYxHsjv4s2Z/XvERGXfonnZInxlsPjXdyYlyEllY7WcNC20Zxv3VHVWij/2DnuXQFmv8FNamOmQI7j2jGY90XdutKlRXS6LuIlForKdN50x+g3x5dRsEDDKtPqZvANBnGrEzQeNIYVCXafBCGtG7YXpRSfHl29+NbA7vI7BeJNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752150375; c=relaxed/simple;
	bh=at4PJj61Rjxc4Od3ayPh5DnmEL4cEmAZ23qhK0P61rI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dAOjpgEQgexnGMoykiWl0a/ze3woZ+Kob5Taapk5mWBCGoGqcpDU063b5GtSztnd46zg/VbgIAgg0MsXm2Yl3GWcEZ8Sxt5Uf2QS9Yy9fdwvZ/IvFjeCaNwK124aoqSIyjRmXqy8ty4uRA/f4B9ILED4zJwzvsEwKTcIBIFps50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NXEEgYd+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A93UlW016276
	for <linux-mips@vger.kernel.org>; Thu, 10 Jul 2025 12:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FbtxCizFqVmxij5XWo+R6iw22/lNiJfKJkPmSZ113lM=; b=NXEEgYd+NswWueGn
	kf2mUE+Mon8YCT33JJSf3IUKY+Olh1LlhK/jbirwF37334gq2xwKoISTazBhDzbc
	2jf0GtiCng+vWYoa+5lP+i+2sNVux0VqjycX6naffBY11yn/U/GiGy80suvXD+Kp
	kUm3VQKes3tTfVGzPTfOozQo0wWqPESkeiof9+y7g7RgSegZ15SJaqUNtBcsCL36
	Jqr6N6nVO1FHS+dxW/12MeWC89YXJ5BlZI5Pcp5OrJZ3HlqEYJRvNnviBAMlHdXa
	HNsmoI/u3yfzKsl5BbUf2XJ3BZ2L2k0zw7zpMEA/ZRmYI0QlGKYLgiQgjIn0lLOc
	1fm1ig==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvefrcfp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Thu, 10 Jul 2025 12:26:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a804126ed6so3943501cf.1
        for <linux-mips@vger.kernel.org>; Thu, 10 Jul 2025 05:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752150371; x=1752755171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FbtxCizFqVmxij5XWo+R6iw22/lNiJfKJkPmSZ113lM=;
        b=Qbt6zSOEV7pHIUX0SDZRozGkdXDh78bo5w1Nv4Nwn9TR1YcnQzxpho0INCGJao8MLH
         d+RYQhyas82LVb0h9Zv+0VPvNkJ8q2Lto260dvAKgfWi9vV6M4j+L0aqLjB+g1R+2TCz
         NHNXk6idW0OA0tCW1VTuFXb3eMELeIPO07yJllI3IjeXXdfT0ovLA8773R3E//oXLBYy
         Tb3hq7sKERcANjtIe9EU6EaZ/crURH6omyF53czrROKnu+OhapN+4Zie8vW0hX8nVmHa
         rqjDTupEq9chlBGOMZYPcAc5zvUFMkdTbgQ5A8+hw4dpONULuutI+kaGMQ7DZALJRRcS
         kYUw==
X-Forwarded-Encrypted: i=1; AJvYcCXzObzjZYak5CJIihzvVpdF9wKZqvcqmZ/IrjTwLwcG9rrczFLVhJrket1AAWOsrOO9fLBTc1bpKNEY@vger.kernel.org
X-Gm-Message-State: AOJu0YwDN9iKJcX+Qlfw9hHZj3YlUjHx83qgZuIXwc+AZ0FRQSl4mtbk
	iw/e/zdOVHBnIj6ZQlu+cqJQVsIi9i9bUTxNpur7frddeCa7fBU87xsrGL6Z5xRqTuPfK+QBNks
	Bv4rF0rnTmnTfm9GVsStYkpyuxahItMpISiLLapat9lH8q9JZaxFb0BHn8wHYadTarLkEW/RG
X-Gm-Gg: ASbGncvYVhLBrLEe7DtLiCUe7r5WIQ/o8A2ReeoQ+/syB/J+2i1fX9XueqjRABbi7vF
	ebx3ZuurEAqhaKTo2fsxpTIwLgi6wUSGYcNmJZv/iMJnhEgZMpV+YGo8yG3NTuvfaIIfb1oJ+4B
	kiMymHLkqYg5/FP8nLUYQJx7IkCnMmDI/pYPuEgW3S8F9zneRvirXDDClc1H0eqKzsuFqBbe8ce
	ZCI1vHqclzY1Ww4exIacTU1ntFFD3LC8kam3dFRpgY11hb7OeDXCa81AMOdRwlh/LnQTKfJD0Jn
	H+6yhH6awtam/vVfgCfbOaHJd6CTKXIt4H5AUOsuvVHvi0AqDsVT0gZ99Sy4MOVwcEdPbB5+VJK
	4+kw=
X-Received: by 2002:a05:622a:148a:b0:4a4:323a:2d76 with SMTP id d75a77b69052e-4a9decf6af5mr34077071cf.10.1752150371460;
        Thu, 10 Jul 2025 05:26:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6rD3KBw+n4YbMxLbNBGM2hSLhxtVZ+IZYWVEKjer3BHqjIzVfrtLkflN1y+COvTFzgl5lDA==
X-Received: by 2002:a05:622a:148a:b0:4a4:323a:2d76 with SMTP id d75a77b69052e-4a9decf6af5mr34076541cf.10.1752150370531;
        Thu, 10 Jul 2025 05:26:10 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c95242e4sm821075a12.26.2025.07.10.05.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 05:26:09 -0700 (PDT)
Message-ID: <1f0debc7-bde0-404b-a395-dc72ca4c82c2@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:26:07 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] pinctrl: qcom: make the pinmuxing strict
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
 <20250709-pinctrl-gpio-pinfuncs-v2-12-b6135149c0d9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-12-b6135149c0d9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEwNiBTYWx0ZWRfX0wfjFIrnVDP/
 /pWdiqrVOTkG34dkE8YuRfqOQ1+NpRekIiBzShaQUMD6D4XaZgCYIDodIzQ5CLrQ1je7mti/4l4
 4XsGZyYZJHLhy6nCAUTJYy9SFMH0rEdKhYTvQPzWpbRrgjLedRwXD+axLXRekXcNy047zFFjfUy
 07LWrwlWuthXXifwBKA7hEBbCt3CypexW3eRIuD8kydSefdcvFSQFdQ2yZ31ix49KTmCYJoIIhK
 83Gnn8q6nYbTDej9hX+n3AL0rda9zSBU3EaiknOmCr7vvy1msqhDHwKSk2Upr+02T1LeA6YBxvw
 3Wpj1jpuF8KCJE0jhiZPqAvvUjfkBICer0Q+YZkvQ/4CE2vRjjrTAuqMsW6MQcPBE7bCAD2Bf3u
 RDDGRGV8BZm9xAXnrgfvo8N8DC4vv2mW0RHlvahegMVb0V/vddkDegP4WakTEG5QtGG67fL8
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686fb164 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=sOBEMjS50dyNa0exkEgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: LLkSoZGMccYFClgF82mUm4uOHGxTomGg
X-Proofpoint-ORIG-GUID: LLkSoZGMccYFClgF82mUm4uOHGxTomGg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=825 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100106

On 7/9/25 4:39 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The strict flag in struct pinmux_ops disallows the usage of the same pin
> as a GPIO and for another function. Without it, a rouge user-space
> process with enough privileges (or even a buggy driver) can request a
> used pin as GPIO and drive it, potentially confusing devices or even
> crashing the system. Set it globally for all pinctrl-msm users.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

