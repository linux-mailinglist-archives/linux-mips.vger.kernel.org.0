Return-Path: <linux-mips+bounces-9435-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EF0AE1066
	for <lists+linux-mips@lfdr.de>; Fri, 20 Jun 2025 02:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7750B19E2138
	for <lists+linux-mips@lfdr.de>; Fri, 20 Jun 2025 00:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EACC97485;
	Fri, 20 Jun 2025 00:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DJCimJmD"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69851258A
	for <linux-mips@vger.kernel.org>; Fri, 20 Jun 2025 00:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750379593; cv=none; b=cvLuN9VLklvz3+3vOpftoOyLiNwsigvgEm/jBYlHk/2NzfEFgf9vlhgUCMawLwZbNNzsNwDIEpYerqJI27QTNiZ5gSplme+Fu9q+InAe/7ETKJN5AHkCpzyg14+jxw8jrHGdZEjcccZgtg+DUY7+LzixaTFwYg40nYI6pv956pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750379593; c=relaxed/simple;
	bh=dEjH+FSN3ipBFal1GleYoxDYC0kKtc29ALoxhYDANVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bIK3C4tg8BWPFpNQpZVTtifBdtMpCtP431LfaCHT2Vm6wmswPC26hHX8ku0KIMJ5FMFBC360BQV0A+PmdfhJW1IKFr8Zv0P8Vl/0VFbzq2w5KLIJdQWT7x42aHVyCVssus4UATeEGVtjFYv3zn4Bze3QOUm8W0g7lrXkrzhEdqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DJCimJmD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JN5RA1007447
	for <linux-mips@vger.kernel.org>; Fri, 20 Jun 2025 00:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ksoABJXXvx1N7hucQ6NraV5GRYy+LrljohBAACfBYU8=; b=DJCimJmDniSrnAi/
	lA/7GdTkSTITFfbx7hE+c7yk2g602L6WarirUSqXbmomuzG85xCqRWCm+DqHZvdP
	9sASt+NHpnbS2QAvojqcT7ZWsHG6qS9Ll2Kw3jDSQ1DFddyHWq1irh7NfGXmsIm3
	bo9ZThfwlcLMHlxVGSEF7aQPQyI2skZCgriJk5QZVjRQylrPeE1zixBHplcbbnJu
	2kkHR/gYDYG66WMZBcW2Qnq/m93eZrzpQeBXhuSg/lyH/px2bSHO16IWh0VD1Vi+
	eop16Qi9ZMAncCgq8h0J2r3C3VOo25V7qFUPdU/HDvL7wtwVm7zBldTx4h2sPM0q
	IalWCA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47c9kruc5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 20 Jun 2025 00:33:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b31bc3128fcso1721758a12.0
        for <linux-mips@vger.kernel.org>; Thu, 19 Jun 2025 17:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750379590; x=1750984390;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ksoABJXXvx1N7hucQ6NraV5GRYy+LrljohBAACfBYU8=;
        b=hoCF1IX1C9udZKbRPJn8LozIsqwzIVxFAfXi+BTrI2OwVQSaB77DYk3GFHXIPeqopw
         F1ieUEsG8GUOrBdlyEzsbRmrrLIf/Ma96klLr/3BXQEcmArODANgVg4kFjeel0Z9SDFL
         ELfJ77wiVlUHOUa15SMfQ+69YXtNqs53kWvOB18WyqoSqbN+ezxH0crObr6PjjPorm/j
         GnO1+CK/fEYJU3TA0Gzagnf7t6/CEzQlqvluTzahjRIHO48FcTM+Orc3//8nOBXgtMqn
         l3BtJCGU6+Hb1qgjAF/5RlrKuEktoxSqot2NNmyk2R7DpCL9pZ9/onrjQbdeSatFX4cE
         VPOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9oxRfDzBWkowsfUbxP9wqeNbGnQTbHZm7dOZkmWmzZ3e8J6rl05x7IUDp5Pw62h77DgM48fyOkzB3@vger.kernel.org
X-Gm-Message-State: AOJu0YyDcdhsdV4K4j0irQp/t0nxsqdXW6P3ngg3rtVl4ukOz4p+pT+8
	2M58YeiXaY9ALjFwtWFnCA6dR3AjIm0bR3EnmQFN6ouxMphhEzPrB5fK1Xt3VWoIxT51E0ZlWMd
	3Fgo0/czLM04gwSikaTRTepBlLbtpqXqHvRHZ+N5maA+6/m+czjiz2QssT+oGMQIMLpSYybQO
X-Gm-Gg: ASbGncuTSB3OLaUY7R6rfRD36NzyuCZBLDvEjgPl9xuPpZRKAR9lBCctQtLU6rWfdfD
	lkmeX1ePqhK6o0d0Sv9yBgM1TcfjhQKoHSKo2xfEDaCme8+N+d3Lb81gk2ZoWYImkSLVr5TN8Xq
	YHhzc8Scii69z7sN1lkYQ0DujuuhEUsKyyWsQrBpumezMTi4LfbTpJ5ve+9xfx2++L7EBNZIdXg
	LoVEMI18eAOp3/Zcsj4coNV0jH648SavQ6+kPHI4oYE2MhjhY8gNlo1xobzegQHhx4slfI/Kk4E
	myYnx3HcOA1lrcTbTnB+uDykvgOxF1UqCbmkUQAJFuy09cCPj7ZC677T7wimuNtHrOlJ51aEqxU
	Ih88zZntNHMu6aeU=
X-Received: by 2002:a05:6a20:244e:b0:21f:77e2:13a0 with SMTP id adf61e73a8af0-22026e13231mr1171735637.5.1750379590488;
        Thu, 19 Jun 2025 17:33:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoDIsNEyUlki7ZjrTI9GVJS+GocIYC/rwWPCWnAG3PSWetKeeD6OC1n37shGoNB4dnpm//FA==
X-Received: by 2002:a05:6a20:244e:b0:21f:77e2:13a0 with SMTP id adf61e73a8af0-22026e13231mr1171695637.5.1750379590051;
        Thu, 19 Jun 2025 17:33:10 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a69bb81sm708272b3a.156.2025.06.19.17.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 17:33:09 -0700 (PDT)
Message-ID: <37561ac8-ac0f-4744-9495-c7589544d4bb@oss.qualcomm.com>
Date: Thu, 19 Jun 2025 17:33:08 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv5 0/5] wifi: ath9k: add ahb OF support
To: Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org
Cc: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>, nbd@nbd.name,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
References: <20250609030851.17739-1-rosenp@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250609030851.17739-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dX2FLsxkhrmhFaTTamKET64xXwoUC7xu
X-Authority-Analysis: v=2.4 cv=UPTdHDfy c=1 sm=1 tr=0 ts=6854ac47 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=aMoWnUFRsw3tUzfFL3sA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAwMiBTYWx0ZWRfX2XxteXnfZ0Mz
 BG7uASGboRuspwhWlll7PBZlLH+p+S90kHO8/4drrMWNZ0JDeRHDvXuys+e386TJcIVKG/2n91F
 ZPKQE4PxHOfdJkWHMu0H3tfZTW0qn+DbibRLZZl7FkqvPu10xafEeQq5R7wvyUkb6oq+OBoc58P
 RlnKUZstF+ObXPwaj09mQzR69no+hPnxgXxS93NRHax259LpiLUOQ46o6e/VPKyKULiGB3HYzLc
 Wn5m4xMaTqsvkTaL2+13+Wv+CrPnynD1TgVe/cvhNofGOZiCFZyUF0vBuT4WZhXIIsyiU4wb6cs
 bBMgG5QDIXtpT5CIXJkfotUkpI4Unqz/PtDJdrZHPOyp2zZvRqn3nT63KitFT5B8awE5h6wbyXD
 5+FdJYS5MlX+H1xBfv9cj1H32C9o6m26D4WdReprC1IOw7tOZjCVTqH9xQVeX5BjOkGDMuOU
X-Proofpoint-ORIG-GUID: dX2FLsxkhrmhFaTTamKET64xXwoUC7xu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_08,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 mlxlogscore=773 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200002

On 6/8/2025 8:08 PM, Rosen Penev wrote:
> First two commits are small cleanups to make the changes of the third
> simpler. The fourth actually adds dts definitions to use ahb.
> 
> v2: Add documentation, use kernel_ulong_t, and of_device_get_match_data
> v3: Use qcom prefix and wifi suffix as in other ath drivers.
> v4: fix up dts example in Documentation
> v5: move back to using qca prefix. It makes no sense to diverge between
> all the other drivers for MIPS based qualcomm devices. qcom as a prefix
> is used for Quallcomm's ARM(64) stuff.
> 
> Rosen Penev (5):
>   wifi: ath9k: ahb: reorder declarations
>   wifi: ath9k: ahb: reorder includes
>   wifi: ath9k: ahb: replace id_table with of
>   dt-bindings: net: wireless: ath9k: add OF bindings
>   mips: dts: qca: add wmac support
> 
>  .../bindings/net/wireless/qca,ath9k.yaml      | 23 ++++++-
>  arch/mips/boot/dts/qca/ar9132.dtsi            |  9 +++
>  .../boot/dts/qca/ar9132_tl_wr1043nd_v1.dts    |  4 ++
>  arch/mips/boot/dts/qca/ar9331.dtsi            |  9 +++
>  arch/mips/boot/dts/qca/ar9331_dpt_module.dts  |  4 ++
>  .../mips/boot/dts/qca/ar9331_dragino_ms14.dts |  4 ++
>  arch/mips/boot/dts/qca/ar9331_omega.dts       |  4 ++
>  .../qca/ar9331_openembed_som9331_board.dts    |  4 ++
>  arch/mips/boot/dts/qca/ar9331_tl_mr3020.dts   |  4 ++
>  drivers/net/wireless/ath/ath9k/ahb.c          | 60 +++++++------------
>  10 files changed, 84 insertions(+), 41 deletions(-)
> 

DT team, should I take this series through my tree?
Toke, Ack?

/jeff

