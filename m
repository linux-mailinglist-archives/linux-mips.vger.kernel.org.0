Return-Path: <linux-mips+bounces-15680-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gzIoKyJlT2qcfwIAu9opvQ
	(envelope-from <linux-mips+bounces-15680-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 11:08:50 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF8072EB45
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 11:08:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Vzmdtsv4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="f0/m848K";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15680-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15680-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1F4E430E9849
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 08:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA9F405C54;
	Thu,  9 Jul 2026 08:52:39 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3B73FE671
	for <linux-mips@vger.kernel.org>; Thu,  9 Jul 2026 08:52:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587159; cv=none; b=m7y0V5dAz4vQCVgAucJyEzfkYt4moNyov/PczcOmA8eQ3scPRoLhnELG2umZhd4L6Kxa0RR8mspPbHHrs3pai1wtniGbkSdeV3lR2fsJV5myvkU9gnKSfNrry2SWMTQ9ODgXgdjOxOpjBbcF8C29nMBbp01vYDv1rmN5luBDUGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587159; c=relaxed/simple;
	bh=2YWoTGdh1uPJDsAWXvdO2XY3imgG92dVuK6XwOuZ5cY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PMBPnBnD6DHjNYh+hvF8KW7GJBoPr2ZSeipOH3A1xzgniejt87NWWs3IybQ/a1OZwcJgo1iw0rvq7IghynxuzlEbPBwAih+tryPDDTa+DUIAQolsUt3ex0X4nmxZJSunDzsnefvoPIGMhs15E7CTikGn2ofX93BARf/9UEz+xHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vzmdtsv4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f0/m848K; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960GeI887934
	for <linux-mips@vger.kernel.org>; Thu, 9 Jul 2026 08:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Voq3Sg1/b718gexVzD9pZPvNMxe2Vpa+Z96N1Vl0ne0=; b=Vzmdtsv4Src4CMvg
	+mFiVwhDKpcjFXB+283QlPlKGH7IQKguo85jTg+HFc3wFGFSuuFLnxHQD9qv13PT
	7S/sayDY1+nx3mQ+hrAmpfkiafgteB8eT/y1X7YqJ+Eba5l+mKRfu78/Ot+e4G0l
	EhYIj072MvUflHuGCsTuuAjTg9QPrN2PiP8PCLjsPtjtqSZPvSc7kU0DnOE0ve+K
	Qq48+7qHO0c6pa/Qvx74sBAV2AN0fhnLy5O6H80paJOOaM4aoupOkuMRcTkk/itQ
	bnQYmf71v/cDQDxbjQ4xbE3vJX/+XYZFx1EUV5VsL/gdRSaIpkx/6CXvCjuAEvU/
	amWFRA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq33ngd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Thu, 09 Jul 2026 08:52:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cce14a21faso14653455ad.0
        for <linux-mips@vger.kernel.org>; Thu, 09 Jul 2026 01:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783587156; x=1784191956; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Voq3Sg1/b718gexVzD9pZPvNMxe2Vpa+Z96N1Vl0ne0=;
        b=f0/m848K2KD2l/X1dgmMU/dTJwJpfpO1GjJ0y7zrdsCYwxab948JT/SR/TdRSY4h3f
         BJBYjUoQi6oXvJqAlwdgySgJ/NCCM59qMAYp/uSIb1HDRvJ0lJb8RdQaCnwoRzVJc07R
         Jj65TBAS19pJrYMtXtO2tO+hYNcU//sHnhnn58ENxt75qpQNK/7Sy4Ez5pddqkGEuny8
         3Ud6c88h9+1Ft7kG4m+g5kl8de7gshyBYazapcrtlx7haXf6HIFK2J9iCp2hOFB4eeEA
         Cqx3iCBGypN1oUF/EkBEsF4x0g3pz4ceeOXOmWnxMedqKSjzFQlso6CEtCM00WoPmt4r
         2ivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587156; x=1784191956;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Voq3Sg1/b718gexVzD9pZPvNMxe2Vpa+Z96N1Vl0ne0=;
        b=XUkOBjyBLqhqZqva2wBL8gCh/l3m02rIirzXIRD4NWtRmXn+ZSBY4s165W6ViQ0pAw
         f5k9Ow5+kDNojDCRzOTIVSox+pg+NY8WqFKqqPT8tHS6RFmuyL/QpFQTH8QTVO5qSR80
         7lQ69DY3lVwZqjMhttzw/vZ8tTSP4et1zijJxzuE54ROYXhCY+1WGw2bTVVqc1obu2dT
         inGdI0YdMzPg+4yvcQrE4Shr4ER9vDVCS1DfUZ1bM7r+rxkmImy8SEB+/vIPmnKd2/jb
         sK+zehfog7HaRh3MGK+QdeUK1BkxLye8AkjbVzfJGHxGh8csnpfbPivvZL9H9B1gX3zn
         uVDA==
X-Forwarded-Encrypted: i=1; AHgh+RoZkAPRkS4Bebv902jdM+JXHHLbMH945RoroEUh/Qhjc3XSL9/K4j6hz5AsTaeploSiVfXXuxrzMqxJ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrwq7IKCGbL/hIpW3WbYxJgsR1gECkTGTPfdUIkOJwokXxS78S
	CJc5gk+71NWdtxXNDkwxi9iIF7RXXKy1fV3pHiwHW8eb7bHAPcQKcy0XWlnan48nbk5Ako4ZWk4
	L9w6R/u1tZWv5zYVik6mTqHG8zMIVeMtrNlbVK7+Ij8ImiP5K2A0e7J0Qs658N3lrMu3k0jzF
X-Gm-Gg: AfdE7cl4FGzqYOdnm9Rc04v3brzsQUh3GlK5XZ2rhh27D4DE3a+sXahqOlYSWbbN7nQ
	cCJ4hyG3sq5A2wkI0Wext4zcd30pUA0xeoWfD050ftZWKwxmV7k1hSmal2V8Kr6L+3mVr3Fv2Pg
	QuvtQSLAV/VAA7LVKJ5eD6mS6uESvMv3d+d1nhP11e0Lc9T6pmVyLBgvi+YjLW0o0VSOwJJ2Ika
	cUATZI4Ws2pwrZTBdoroYraJh/PKcwMaaqzUdi/yF1rvKt7cYQBIUjSYdd6U4Lbi9+sbRlqsdlI
	1lavEgBBkuNJFNV4liXY5CixR7xiZjBOcFxWiqVzWL12B5GPep29gzbro/vA0qEGtGiv+OI0CDj
	zP6nrbXwKIEoUs3OTTWrOm96dU8LdBm65BXKtq9av/0g=
X-Received: by 2002:a17:902:d2c1:b0:2c9:b2c1:1401 with SMTP id d9443c01a7336-2cdd8a16112mr22278545ad.5.1783587155506;
        Thu, 09 Jul 2026 01:52:35 -0700 (PDT)
X-Received: by 2002:a17:902:d2c1:b0:2c9:b2c1:1401 with SMTP id d9443c01a7336-2cdd8a16112mr22277765ad.5.1783587154710;
        Thu, 09 Jul 2026 01:52:34 -0700 (PDT)
Received: from [10.92.212.146] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d946sm40530765ad.66.2026.07.09.01.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:52:33 -0700 (PDT)
Message-ID: <5eecf3a0-b608-4057-b400-236f6952b380@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 14:22:17 +0530
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] tty: serial: propagate errors from uart_ops.pm
 callback
To: Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Richard Genoud <richard.genoud@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Peter Korsgaard <jacmet@sunsite.dk>,
        Michal Simek <michal.simek@amd.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
        linux-mips@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
 <9320a573-ebf8-459b-a313-3a8b73a6180b@kernel.org>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <9320a573-ebf8-459b-a313-3a8b73a6180b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lNN1roWuNDDVRxVPa2WeenStJ7QmYal4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX9nYxAXV8THco
 C8zEfwoS6INIs1S6nUMLrOe4WFlqZIjsxX6lvoXk09o0S9qQCE1a56a15xYcjpAA3CXO7hQQk2N
 82o+HFn60iCyioyowPrVuihORhlax8QAq4mMkSOInw1csy/EXb++TzIeZl5EIEhJGm7VUubykph
 DkkkSTlrfVFUpKccqGJQqM+HW1X1kdAmRXSunkMfJ63y8pjVYP7yW75VOPq2lBcZ6ju32L2mWui
 I8I+J3efN4BywMMdFWGQkCzUrSliLu0tiaXVlOBBooooSC6rvFdqb0h1AIeved9SaDlK67V0yKU
 qoEaoU9FxAxdzHp+jzNHStNhxBKEwa4se1UrR2JTopkbN+0zxb35leuw9Xwbz1greokyHyYqAwn
 F1p7GRCGtZZnSMvpUe8s0UW6uYQFRayo/8euqp5Re6AupL2tCnUJpCh90LfoR2KMo5H45dL39Bm
 gy1bbnCuVwRdQJ5U+uA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX1AfkzAzc02Ey
 TXf7FGAL7UdnoA2JyENlMDNcJO9pKxgXHcd1MhPNrDB9muUSvIZZIiKy0yz3qcZE0w2SviJsUWW
 IYNyI8eAOqVmSMcFiVK3VediTitOxWo=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f6154 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=yxy72PdV_TLAuk9cO2cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: lNN1roWuNDDVRxVPa2WeenStJ7QmYal4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15680-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,linux.intel.com,gmail.com,collabora.com,bootlin.com,microchip.com,tuxon.dev,linaro.org,samsung.com,linux.alibaba.com,foss.st.com,sunsite.dk,amd.com,iki.fi,atomide.com,armlinux.org.uk,alpha.franken.de,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:jirislaby@kernel.org,m:gregkh@linuxfoundation.org,m:ilpo.jarvinen@linux.intel.com,m:andriy.shevchenko@linux.intel.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:richard.genoud@bootlin.com,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:patrice.chotard@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jacmet@sunsite.dk,m:michal.simek@amd.com,m:aaro.koskinen@iki.fi,m:jmkrzyszt@gmail.com,m:tony@atomide.com,m:linux@armlinux.org.uk,m:tsbogend@alpha.franken.de,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-samsung-soc@vger.kernel.or
 g,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-omap@vger.kernel.org,m:linux-mips@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:matthiasbgg@gmail.com,m:zhanglyra@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,uart_ops.pm:url];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ADF8072EB45

HI Jiri

On 09-07-2026 12:23, Jiri Slaby wrote:
> On 09. 07. 26, 8:25, Praveen Talari wrote:
>> The uart_ops.pm callback has been declared void since its introduction,
>> which means any error from a driver's power management implementation is
>> silently discarded by uart_change_pm(). Beyond losing the error
>> information, uart_change_pm() unconditionally updates state->pm_state
>> even when the underlying hardware transition failed. This causes the
>> serial core to track a power state that does not reflect reality:
>> subsequent calls to uart_change_pm() see the stale cached state as
>> matching the requested state and skip the callback entirely, leaving the
>> hardware permanently stuck with no further recovery attempt.
>>
>> On modern platforms where the .pm callback performs real work —
>> enabling clock trees, interacting with runtime PM, asserting voltage
>> regulators — this is a correctness gap. Failures are invisible to the
>> PM framework, the port proceeds to call ops->startup() on potentially
>> unpowered hardware, and suspend/resume errors are hidden from the core
>> that needs to handle them.
>>
>> This series fixes the problem in four steps:
>>
>>    Patch 1 changes the uart_ops.pm callback signature from void to int,
>>    updates uart_change_pm() to propagate errors and only commit
>>    state->pm_state on success, and handles the return value at every
>>    call site in serial_core.c with appropriate policy per context
>>    (propagate, log, or skip-on-failure).
>
> So does this break build without the below applied? IOW: breaks 
> bisectability?

You are right, patch 1 alone breaks the build since the driver 
implementations are still void until patches 2–4. The series as 
structured is not bisect-safe.

Do you have any suggestions on how to fix this issue?

>
>>    Patch 2 updates the 8250 driver family: serial8250_do_pm() and
>>    serial8250_pm() are updated to return int (with the exported symbol
>>    declaration updated in serial_8250.h), and the 8250 sub-driver
>>    pm callbacks are updated to return 0.
>>
>>    Patch 3 updates the remaining non-8250 serial drivers. All .pm
>>    implementations are updated to return 0. The sh-sci forward
>>    declaration shared with rsci is also updated.
>>
>>    Patch 4 updates arch-level implementations: SA1100 (assabet, h3xxx),
>>    OMAP1/ams-delta (modem_pm, now propagates regulator errors), and
>>    MIPS/Alchemy (alchemy_8250_pm).
>>
>> All existing .pm implementations return 0, so there is no functional
>> change for any current driver. The series purely adds the infrastructure
>> for drivers to report errors going forward, with the serial core ready
>> to handle them correctly.
>
> OK, now I miss the rationale behind the patchset. Neither there is a 
> possible code path to actually test this?
The rationale is that qcom_geni_serial_pm() calls 
pm_runtime_resume_and_get() which can fail, but its return value is 
currently discarded because the callback is void. Patch 6 in this series 
is the concrete user: it makes qcom_geni_serial_pm() propagate the 
pm_runtime_resume_and_get() error so that a failure to resume the UART 
power domain is visible at uart_port_startup() time rather than silently 
proceeding to call ops->startup() on an unpowered port.

A code path to test: on qcom platforms with CONFIG_SERIAL_QCOM_GENI 
enabled, if pm_runtime_resume_and_get() fails during 
uart_configure_port() or uart_port_startup(), the error now propagates 
to the caller instead of being dropped. The test case from development 
was injecting a failure in qcom_geni_serial_pm() and observing that 
uart_add_one_port() returns an error rather than proceeding silently.

Thanks,

Praveen Talari

>
> thanks,

