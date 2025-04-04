Return-Path: <linux-mips+bounces-8478-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E2CA7C4F4
	for <lists+linux-mips@lfdr.de>; Fri,  4 Apr 2025 22:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B29F1739B6
	for <lists+linux-mips@lfdr.de>; Fri,  4 Apr 2025 20:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415E020ADE9;
	Fri,  4 Apr 2025 20:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iz052oQg"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8165921D3E2
	for <linux-mips@vger.kernel.org>; Fri,  4 Apr 2025 20:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743798769; cv=none; b=Up2rKP9yb8zYcviSi+odq0akYREW6sdZkrbGCEOeHAFG9IiaRb3/XVVHEjgze7YcoQjm2/q7Ulv88XhKLK5DNccTgHGR2HU1Ghgy11CR8fv3e37klcTHvogKxvt71pm2/8pBNe0T5SQb+Hi7KZw/RX7VH47SIrhtrZo5Xd+1F58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743798769; c=relaxed/simple;
	bh=LElVHAM9xf/Dy7ylzvkbDBQA7o1vD7xD955A5P8xnEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OxAjq0zPckDENh1yNNqOHmUn39k5Z76DZo73w8r9ctc9VDYBF8jQrMKz9ZIckl9YqiK1vyTl8WqlG02V7u1YxuRt/BG/zaga8m6INU5n0SaLBDSKxZOqPlXHdt22mtgmzaIqQKjjOiIlhvEIkSBqLGMX0cVTPnvK0j8SjonD3wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iz052oQg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JEaGO005331
	for <linux-mips@vger.kernel.org>; Fri, 4 Apr 2025 20:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wOAnLBAJdmL2Wb3sULNUowgzyt+Uj1UkgtRMWgKYGwY=; b=iz052oQgLnMJGQPP
	CErBkb5+kMai2wmrL1VN6aYCv2tNSjmEdIrfLe2CSQfXGDiEFb4OXZOEkTaYZbPR
	s2oHMwQzXNhmk6SUZYgDGSHI+F+YBm/87r/DJurVf0ZzFNC4ot67mrIvW7zyGbGr
	tZrwmJjCSh2aBcHFo9OGDPtXHHuXRis1nGLi6+/UB7OHXPrcGPX//U63Ls94UkLt
	dND0Ti+J34F+JtMUGdIBWvVSCJdsUwwGmSZ9Vhqq7H6+HJDbJf5Oev3LOX3sgkS9
	B71WuA92ekAKJCQDQ2Sp7sD/yQWdIFKTjhAd6eBWWM+UflUROy303DyuHyl4dUJb
	sT2VVQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d9ay5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 04 Apr 2025 20:32:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c7789335f7so9105085a.3
        for <linux-mips@vger.kernel.org>; Fri, 04 Apr 2025 13:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743798765; x=1744403565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wOAnLBAJdmL2Wb3sULNUowgzyt+Uj1UkgtRMWgKYGwY=;
        b=WiX7gBgE+x6VlIWUy0jZd1NLkNE1a9+2a5YRsIRjOX+Iix2rhqFK+h4bZPu6QvTlw4
         cfo+U+r3xTWz0EF9lBTCQ9EGQhS2YZSnFE9XOND8xW6ZqkKtHdSlWHtrL7ZKlmXIVRSV
         Z1TLOSgbTTuf5CnmG26S72OhPD9KvJVRgptD0dYXNTnfDR2g+0tmgTXs/jBKrqmIO1hp
         vzSYJoAi1wyPKiAPtMz5QTRCb7bJ6fvNx48nPVTq1bYHSU+M1YbXFC+WONtp6PfeXt4z
         cJs/4Ll77c7XUWa1r6zkT3Y88o4rAzUCyeO2IIlGe/C0cr3l3/k7q47Dv6nuJS3+6SJc
         U0Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXLELIVJPN8Ri1K/mSCSj1RnvgomoH9sKNcIkLkdhoc1QT7fKC0PiFGrOS0AY2GnyXvDgijvjgcQKM8@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwb0h7gsAH4McyAdCDrMiyc6k/g6ZihOK+QgcL8ujd/oapumEM
	iGST+S5xizPh/18rCpb/M70oZlPAMXhmTZmR9tLwU8T4ASL9r7DuVWTKcn3FzctG9Cdl+qmFS3o
	51/p6jtCcWA7eiGT2C6wE3ok+iWThyz4PAzLwLR0J2dMQ8wzRgXmJEp5SejHH
X-Gm-Gg: ASbGnctcw925GqRw+gRf+rsakhuIamwfK39oio+mOulV60ocp2zej0nXcJ2vrue5XCv
	cxPZULnuATDDXpZh8VhavNwq8wAVvhUUFPUF5FSr8QGrerKk+q0+L7cLp/ewUhWsQeBCibmjsOu
	AMTq29m7LbHOweJJ/K9iYhtTNkSBZ/qDlEok8SzGlIeChgEkze/fr0mvo/VxP7uR4Qvl7i1A09r
	7HM1NH3kXFn/f7SFpE7bN0NoW5ex+kPsp3feS19+Txn4hp/cPksvrd9ACS2mEjKIfeQM4Rv6Hxd
	IcCtJh6wMPafGyUNO0oo7HYNulhdJy1/+McB6cwZf18g17iHK8M64SzQYyND/TVKtigDgQ==
X-Received: by 2002:a05:620a:40c5:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7c774dc4185mr209777585a.10.1743798765410;
        Fri, 04 Apr 2025 13:32:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEszusUf9J+0IEkVjsuj8Y1FnlY8CMQ4G+oamdYonxr6PB4E4ScKqwKTkVXQqlueNvC6p0Aaw==
X-Received: by 2002:a05:620a:40c5:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7c774dc4185mr209772185a.10.1743798764979;
        Fri, 04 Apr 2025 13:32:44 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a405fsm2902483a12.75.2025.04.04.13.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 13:32:42 -0700 (PDT)
Message-ID: <d3592f32-e29c-4b40-b045-7267795a9617@oss.qualcomm.com>
Date: Fri, 4 Apr 2025 22:32:35 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/19] arm64: dts: qcom: msm8992-lg-h815: Fix CPU node
 "enable-method" property dependencies
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rob Herring (Arm)" <robh@kernel.org>,
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
        linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Alexander Reimelt <alexander.reimelt@posteo.de>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-7-076be7171a85@kernel.org>
 <470e2155-7145-44ab-9d6d-117a2d98d7f8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <470e2155-7145-44ab-9d6d-117a2d98d7f8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9hFt-BBDKhI3vqI4VQ17BcNhibMrfu9J
X-Authority-Analysis: v=2.4 cv=cpybk04i c=1 sm=1 tr=0 ts=67f041ee cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=vHGDO5lFCXZzE5S5F1YA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 9hFt-BBDKhI3vqI4VQ17BcNhibMrfu9J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_09,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 phishscore=0 suspectscore=0 mlxlogscore=669 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040140

On 4/4/25 10:30 PM, Konrad Dybcio wrote:
> On 4/4/25 4:59 AM, Rob Herring (Arm) wrote:
>> The "spin-table" enable-method requires "cpu-release-addr" property,
>> so add a dummy entry. It is assumed the bootloader will fill in the
>> correct values.
>>
>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
> 
> This looks good to me without knowing any better about the specifics
> of this device..
> 
> +Alexander - does the bootloader you use take care of this? Otherwise
> we can just do what Sony devices do and stop on removing the psci node

I failed to add Alexander to Cc, second time's the charm..

Konrad

