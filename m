Return-Path: <linux-mips+bounces-8477-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CF3A7C4EB
	for <lists+linux-mips@lfdr.de>; Fri,  4 Apr 2025 22:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93EF6172F5F
	for <lists+linux-mips@lfdr.de>; Fri,  4 Apr 2025 20:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D84721D599;
	Fri,  4 Apr 2025 20:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VEtxvX0y"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909641917D0
	for <linux-mips@vger.kernel.org>; Fri,  4 Apr 2025 20:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743798655; cv=none; b=OE9tG5NjcMcMCLpgvHwp62knL+O8b8+SYdqagzBE2+SQsmEKv2CgYyHECyN8p6UsLFZldCpkEL1q3DNmFdoMvis0pWe/lpOdc6dDZibcW/XdxfYCpPxl9L+N9LxdWf0CJGNienqsvQCryZZ7Il5bWYrpi8+b+PuRqUHsSIkKf9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743798655; c=relaxed/simple;
	bh=oBT4dqU35i3jNYaDg/R08akXO2az0Oc76Luk1EkR+II=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tGSJAq5ixgGFGzlLSeI7xGzRBFj5atO48lztRd5usmyZgAGp+JH+PMYHRb2CbxBtINm48O8mzwG2DqmPdBRWT7pFis6DgYz2MX/7jXSXPPl/MpugHTAoceC1ObHPAkT/tOimGWgs4eZb3b1ElG6a7D9aMclRBNg+1xUjuQCGq/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VEtxvX0y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JEXMG005292
	for <linux-mips@vger.kernel.org>; Fri, 4 Apr 2025 20:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7hWRzIPdUXdKBlWVaK7wwLn27NVVJ/zKlX8uz3CkEsU=; b=VEtxvX0y4phHJf4s
	ehGLNsWkMXWxhM24EkpJXM1djb9W9Wd/DqXBlImXSexeCSqf0aHinkAWtpXeOUhm
	T+bWRnySeVvjcmTbRvIJomfylivgX/XwN/q3x4eAIK9k4UaX83gwQivU0WML71ri
	uFCGE35Hcpe1+xzY3YzLhY2hpPMu3O7nqNlV4ZL258Gxr+ppYvexR29GlatgQ0sD
	7hYD1Gz4H4T4IIH/iI7zM9TDUKiPJxWmkmlOgCw/HyhoKDcF2jHiWzj94JFbf2dG
	q5YHPB+Jn3QTgI3w5YXw0TPSfNoPfRjQr/xuuyhR2pi32nZy1WHUqP8XyES3Pwhj
	MYhTyA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d9ay1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 04 Apr 2025 20:30:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476a4a83106so1028761cf.2
        for <linux-mips@vger.kernel.org>; Fri, 04 Apr 2025 13:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743798650; x=1744403450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7hWRzIPdUXdKBlWVaK7wwLn27NVVJ/zKlX8uz3CkEsU=;
        b=oKbkc+hx9LTBlNr3oQc+4knYhaLO71/fEwyKKvl/y9SUUNzg4wAbDrv6kUrmQKAtEI
         PJvV2G21QVOboPksF4Gp57/AGm6sDrT5qEncJHgaGJMscUYVqtmniM+TuzkVFp5K9guc
         eEfycLifDOn8jtt9OsA6+dCGHLYtrhdQ+qaEMdzi0nOaiGoTDB05HKM+1wLWtp7bouKM
         liWMKCfHQ5JpRVGBAXl70OsDUwHm4HVwSsZjMjZx6Ie9q2h37V58neQkTOO/0Ich0zX9
         vZ5Ogxu3W/G4NRiWifGOlr3BNcAeQi8iO6UpyVvXR03BB2C1NdIwPnJ5tMCVFN+yc/Xe
         4Rag==
X-Forwarded-Encrypted: i=1; AJvYcCU0B5chOe7RN7llnoBWFMk/IdAwvNLdq6qh9A7TdAngpALm57nXSXX0L9FLOCMEvlDyOMnyzJnX1PYl@vger.kernel.org
X-Gm-Message-State: AOJu0YyPgf8plMh5lqm9r+nGMJjiNcLMhgsb9/TGhSld3ttr8J08e8kx
	aH6RNkixFsfciy4aRH1Kf5wLcssqyMh2MVogiiq6qkxj+Z3PRolZ8LX4rM2RHZJrhn7xBRlJRwG
	5F18eaSzKRqrnTUJrjLq0brtrRHT0VCXg3Ucn9B+vImQG4UIUX7M95ExuS8Pb
X-Gm-Gg: ASbGnctC2ISGM62MJLgcKJeUw9xljX6iSehseqJYMk2/aVK4m0p66mc6ZmOimmk6SmR
	Lo/zZWdFMl78Sghl8t83VX6o6I88oTOWInwmf4CbwI5ekylb2Jbwd7fqMt/EP1q2jUhFnlEhuGW
	BRDSwZjpqBCXyiE0MDXL1SuO+5WalkytwoW4At/898GtiVL4JyzIP4YmZysyWsUpnzg5563C0Rt
	JSUJYRDJ8hLlAFP7zLW6Fj9BmcCL9hrCcnUgYStlHnAUdL61vOTPZTKLeVmQNQn2sh/bFLNnbZC
	RPUQZM7LFTXM3QC6FDjQHlhPDyBMamhrFbUn8KBQbTa0Ub5ZXV2g3qAGhikpeiiLtbEAuw==
X-Received: by 2002:a05:622a:2c3:b0:474:e4bd:834 with SMTP id d75a77b69052e-4792490427fmr26497511cf.2.1743798650346;
        Fri, 04 Apr 2025 13:30:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuSVd6Czwiac8qs9SQtzY9AT0v4N+1AWxlKTXMwazPDheG9mDDd7uUgjlpULwCLJqJUrfzww==
X-Received: by 2002:a05:622a:2c3:b0:474:e4bd:834 with SMTP id d75a77b69052e-4792490427fmr26497151cf.2.1743798649900;
        Fri, 04 Apr 2025 13:30:49 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a4027sm2911588a12.73.2025.04.04.13.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 13:30:48 -0700 (PDT)
Message-ID: <470e2155-7145-44ab-9d6d-117a2d98d7f8@oss.qualcomm.com>
Date: Fri, 4 Apr 2025 22:30:43 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/19] arm64: dts: qcom: msm8992-lg-h815: Fix CPU node
 "enable-method" property dependencies
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
        Conor Dooley <conor@kernel.org>,
        Nicolas Ferre
 <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-7-076be7171a85@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250403-dt-cpu-schema-v1-7-076be7171a85@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5uv8zgaennuybcDpV6uskhNpGGwJZUi2
X-Authority-Analysis: v=2.4 cv=cpybk04i c=1 sm=1 tr=0 ts=67f0417b cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=HGLQH7UMpQlDbUUNBC0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 5uv8zgaennuybcDpV6uskhNpGGwJZUi2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_09,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 malwarescore=0 clxscore=1011
 phishscore=0 suspectscore=0 mlxlogscore=718 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040140

On 4/4/25 4:59 AM, Rob Herring (Arm) wrote:
> The "spin-table" enable-method requires "cpu-release-addr" property,
> so add a dummy entry. It is assumed the bootloader will fill in the
> correct values.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

This looks good to me without knowing any better about the specifics
of this device..

+Alexander - does the bootloader you use take care of this? Otherwise
we can just do what Sony devices do and stop on removing the psci node

Konrad

