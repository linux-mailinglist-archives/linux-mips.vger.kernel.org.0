Return-Path: <linux-mips+bounces-15662-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iNKlNpg/T2pocwIAu9opvQ
	(envelope-from <linux-mips+bounces-15662-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 08:28:40 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F8472D256
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 08:28:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Mkog3pYJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=C3Bzu1EG;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15662-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15662-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7546D3075807
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 06:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A633C454E;
	Thu,  9 Jul 2026 06:26:36 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ECB3C13EF
	for <linux-mips@vger.kernel.org>; Thu,  9 Jul 2026 06:26:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578395; cv=none; b=oJji3jb5M+Aii2Jn3LenPqRNUWV4HRESzCu9BIFalVw3z+TKCpm1lBuPi4DZVUneLZDdOFkJS6nlLZ1983qcoQqRCN+hsUl2gMeI75PYxSg6PB5CsUXGvHKh12vqPhdc0MpWUmAIAHMYt9HO35oRPvzi8602MalpZJCUuqk2DdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578395; c=relaxed/simple;
	bh=ICa2ixYXQCQShcbLWiANred4DfWKjbRwuNEMyfbpR5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h1DhILBJenNtl7yY5tZUEo/9qVi2FKWHOBGmn5nN0HQyR7P5YAlCd1//5U2Lfl+Q+f/Kzrnb4XYbadvLxwI+QrKDmqifxQeZnmII6DBzQdJon865HhL/NTqdbuR3d499mDXWULp5llcXD16hg7/Le2Icw9Kx2hjGYPnWfulp/gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mkog3pYJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C3Bzu1EG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960a61837439
	for <linux-mips@vger.kernel.org>; Thu, 9 Jul 2026 06:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TnjvUz+tLyUI32WEpJbsvsuJ+c/cX/I/b+xJ3yrgkM4=; b=Mkog3pYJ7tn+zULJ
	/fo3Qw4k4eJPYDjH2q/dFwCBWtPnM9WhyDO4TrahAY2DyjQ0R92BRwz8BJTwDiEv
	5m78QVX5wPfAokWCYhjEylaSPfV7EY3kdMzHE1ltpMS8qtzGADMUGX8br4SsVHab
	AomcKTPm4hNZ3UtEFAoOM+nNEwY3TBKEhKHhbQNMuS2C1S8awHurYL4fQ89L4vi/
	7GylYylnGfHZ64eH/lYr6WIHsmzFhzxYIFQhY9E7po+mMDyCKpsfGsUqtA5C2ONm
	My0pMQO1XGNi+OAXeoMIP7+hMh/OdHbVHWv1FuctA18OEvxe6FDjoHat385USL3f
	RHfwRQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwap5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Thu, 09 Jul 2026 06:26:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cce406883eso15527035ad.2
        for <linux-mips@vger.kernel.org>; Wed, 08 Jul 2026 23:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783578380; x=1784183180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TnjvUz+tLyUI32WEpJbsvsuJ+c/cX/I/b+xJ3yrgkM4=;
        b=C3Bzu1EGa2hBpWErkVaSFKl4A9qMIopBIws1FPlS4rGk5LIdRiX021hWaMQBQ18W6Q
         3xjm+trhrPkJ/9e+QcVs6ErFSWNUza6LmPZ5OZE4mr9w89ZvNRuMr5RQn/8E0lerN8HD
         /7lzsQLGSfN1irGFCfubruNH9C8aNkRAnMG2Ur5sAH3vKyj9Fax29oedDi7lDTM6Fwd8
         0v1ZpYLbgVHENwEQtC4zUc+amQJKBOWEQhZDJvwiG11cflb7B2DLhuTSAJEnvHD3KThT
         +OVs7t6uiujvY7O0cj+21eIt1LPQbvzV199T2oXsjF18FN7M4akcqJAIOhnGdsVR925y
         CLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783578380; x=1784183180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TnjvUz+tLyUI32WEpJbsvsuJ+c/cX/I/b+xJ3yrgkM4=;
        b=RoLkacuqB+EbvWJwFUVJyY7yB5rVcHfx7NaDn2MywGDxOrG6wJPQyP7HP2CNeB7lq6
         eFEhmuWQqxb/MCMhZ9gFmrbp0R9yYDoNmBvBXbl02aQEQpxhk8kyJvrFSMG5ltmc2IuY
         4dtwm+xHt0riQrUvv21V7QVhTpV1N0FxXrdBybFFZ/s63mzWaj2Y+8yqcwKzqOUpFa9/
         JD+/G5NxFD8wPJ9x2YYbP1L6pmgW92W5vp6wgnIR+8tXj41LdMkZ0g1maLYvrArTxcql
         H3pftTEdT4B/mj5xaGfPutyoJKqvu2vNgSWIrSqZqO/+KyAvtkAKkkiwrWDIkefzoPW8
         HL1g==
X-Forwarded-Encrypted: i=1; AHgh+RoDDKbyNAib4HFibmkyEYU0R2h8+JZniYRUyT9a55pO/npdL//PbG/oLg/TkFj8Cgw6ozvL00AInxPj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7MJY2LRgNP3Vh5Ewv5xV7XWre3v3fW7spJ3ySAw0Xqd4tIWno
	PIemUb/Hg9vBkjfkAK3YYj8Cq5qnkZVVOu1GRcq37siqJLxXo5ZROA6BdMna8MCQXxnIgUqQmrV
	I1CPsXzFDM5kaphL3cVjHCvrZVS6cVD8kolWMr9klYbnov6wvD9krPN8tINTHK52k
X-Gm-Gg: AfdE7ckZ9n3O2nf+KuxPgAyAL880aprmsFaRJ0k1c1i74eexbINWVEbAR6hW9Xgtdpr
	lRGSoAiEfGVyt83G+b8v0y807DE8M6+ytOuGaLV7/RUpzA2fMGwFgeQgtuP/Jo+XwGAAIS/qxLJ
	rs93HMKdR+HSbqFzR4bloycpPeD6OfWskSrDiD4JFDbEqfzbd5owz46nUxeo/o0Y48l5ZsZ6xDS
	/q6YzTxGuhcdHze4JO+HhB8pnGArhxJpfdQ12G6BRkOAElhYU1oO2uceB18Olz5pjRipC1QpSB7
	WboqG5TBU/7YQBb1Ovh01rTi0JjLRtewELdqx0vNQsvs1+Ll9rddzdtQNeryngquEJfS7+vfPsD
	lM62nlZdIez9Djf9d0o11WU6dIj8G4PzXnqKtrZtNRk5M
X-Received: by 2002:a17:902:ce0d:b0:2c9:b8b7:5d1c with SMTP id d9443c01a7336-2ccea3b5089mr59093945ad.16.1783578379914;
        Wed, 08 Jul 2026 23:26:19 -0700 (PDT)
X-Received: by 2002:a17:902:ce0d:b0:2c9:b8b7:5d1c with SMTP id d9443c01a7336-2ccea3b5089mr59093555ad.16.1783578379292;
        Wed, 08 Jul 2026 23:26:19 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf74cbsm37986405ad.18.2026.07.08.23.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 23:26:18 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 11:55:16 +0530
Subject: [PATCH 4/6] arch: update uart pm callbacks to return int
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-add_return_check_for_uart_change_pm-v1-4-e85c6ffa8ec4@oss.qualcomm.com>
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
In-Reply-To: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
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
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783578321; l=5267;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=ICa2ixYXQCQShcbLWiANred4DfWKjbRwuNEMyfbpR5M=;
 b=CBJQcr1StBfCKgCiFExqiQ7M8QhGHy52FU0kMlsvUYVyqZjr7DQWWJDaIF8hjah1SmBoEdoNw
 jckAiu0TkLbBx+pz4ekuZMMx6564yLJV/1h1ccPX1qXYkBxB0kccnis
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfXwGO9YvNq3+9W
 e3fg35MhLUAqXtOXQuHCh4HVo8oIi+WldxJa3wG9ZQZ6HpdZBKKa7cDLuDpksw5JxI2bHXTsTzG
 pdjVGtwiESLmm/DOWcIUYeq2IBbC7Zg8J1cMJ+6BBhUjgBi44zkiiHyH0RwFhaUIBtDR1J4UO9m
 0nqZSkLWBJbKvez5V/nCEGixbZ0HsXN3B2reH/BkdM7UHVUTdldwsYS/2Vpv8QsFosyN5GACdf1
 U5+y3U1N40vtgMdLjudHyZC6FYzo/i8QOIXhKasMbfUMZ1SWrT4BmAjoiea/+E2fintScYNkSqa
 oFiZkKqxGgqpIN5rT692zuA1LzXG6XYeYbFtXpQImkhsJzfT+30Cbz1pvNBe+xHZLCe3ED17Nf1
 8EktGYcBXFCtxuyune6EjkFBMiXPKU8sg1PCRRP8jLXgs2A4atGDMhal6nCLrQio4V7bveyWv4m
 lEp1YN9xAPx+tgQieNA==
X-Proofpoint-GUID: cxjlZuZUatcCGT3vMYFOI4e8mXh0RBIV
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f3f0c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=B5ILv1Qk_D0jGc0hQdkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: cxjlZuZUatcCGT3vMYFOI4e8mXh0RBIV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfX2DKOdaeFm2md
 N3BTS0JsfiH0dzQ/DwwMtxTKdnpWRgANxvtuKAylONMBVlTWh7rINB68luxGJJeeSFa+MwZsMkq
 UEwebDVys1BgsusaptY9FxVZVgoWwwc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090058
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15662-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,linux.intel.com,gmail.com,collabora.com,bootlin.com,microchip.com,tuxon.dev,linaro.org,samsung.com,linux.alibaba.com,foss.st.com,sunsite.dk,amd.com,iki.fi,atomide.com,armlinux.org.uk,alpha.franken.de,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:andriy.shevchenko@linux.intel.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:richard.genoud@bootlin.com,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:patrice.chotard@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jacmet@sunsite.dk,m:michal.simek@amd.com,m:aaro.koskinen@iki.fi,m:jmkrzyszt@gmail.com,m:tony@atomide.com,m:linux@armlinux.org.uk,m:tsbogend@alpha.franken.de,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-samsung-soc@vger.kernel.or
 g,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-omap@vger.kernel.org,m:linux-mips@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,m:matthiasbgg@gmail.com,m:zhanglyra@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uart_ops.pm:url,sa1100_port_fns.pm:url,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 95F8472D256

The uart_ops.pm and plat_serial8250_port.pm callback signatures have
been changed from void to int. Update all arch-level implementations
that register a uart pm callback to match.

SA1100 (arch/arm/mach-sa1100/):
  Update sa1100_port_fns.pm in include/linux/platform_data/sa11x0-serial.h
  to return int. Update the two board-level implementations:
    assabet.c: assabet_uart_pm() - controls RS-232 transceiver via GPIO
    h3xxx.c:   h3xxx_uart_pm()   - controls RS-232 transceiver via GPIO
  Both have no error path; they return 0.

OMAP1 (arch/arm/mach-omap1/board-ams-delta.c):
  modem_pm() controls a regulator and already captures the regulator
  enable/disable return value. Update it to return int and propagate
  the regulator error instead of only logging it.

Alchemy MIPS (arch/mips/alchemy/common/platform.c):
  alchemy_8250_pm() wraps serial8250_do_pm() with UART clock gating.
  Update it to return int; return 0 since the clock and pm operations
  have no error path here.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 arch/arm/mach-omap1/board-ams-delta.c       | 10 ++++++----
 arch/arm/mach-sa1100/assabet.c              |  3 ++-
 arch/arm/mach-sa1100/h3xxx.c                |  3 ++-
 arch/mips/alchemy/common/platform.c         |  5 +++--
 include/linux/platform_data/sa11x0-serial.h |  2 +-
 5 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index 1bec4fa0bd5e..5cc8274013b1 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -758,19 +758,20 @@ static void __init ams_delta_init(void)
 	omapfb_set_lcd_config(&ams_delta_lcd_config);
 }
 
-static void modem_pm(struct uart_port *port, unsigned int state, unsigned old)
+static int modem_pm(struct uart_port *port, unsigned int state,
+		    unsigned int old)
 {
 	struct modem_private_data *priv = port->private_data;
 	int ret;
 
 	if (!priv)
-		return;
+		return 0;
 
 	if (IS_ERR(priv->regulator))
-		return;
+		return 0;
 
 	if (state == old)
-		return;
+		return 0;
 
 	if (state == 0)
 		ret = regulator_enable(priv->regulator);
@@ -783,6 +784,7 @@ static void modem_pm(struct uart_port *port, unsigned int state, unsigned old)
 		dev_warn(port->dev,
 			 "ams_delta modem_pm: failed to %sable regulator: %d\n",
 			 state ? "dis" : "en", ret);
+	return ret;
 }
 
 static struct plat_serial8250_port ams_delta_modem_ports[] = {
diff --git a/arch/arm/mach-sa1100/assabet.c b/arch/arm/mach-sa1100/assabet.c
index 2b833aa0212b..48c3372a0f4f 100644
--- a/arch/arm/mach-sa1100/assabet.c
+++ b/arch/arm/mach-sa1100/assabet.c
@@ -649,7 +649,7 @@ fixup_assabet(struct tag *tags, char **cmdline)
 }
 
 
-static void assabet_uart_pm(struct uart_port *port, u_int state, u_int oldstate)
+static int assabet_uart_pm(struct uart_port *port, u_int state, u_int oldstate)
 {
 	if (port->mapbase == _Ser1UTCR0) {
 		if (state)
@@ -657,6 +657,7 @@ static void assabet_uart_pm(struct uart_port *port, u_int state, u_int oldstate)
 		else
 			ASSABET_BCR_set(ASSABET_BCR_RS232EN);
 	}
+	return 0;
 }
 
 static struct sa1100_port_fns assabet_port_fns __initdata = {
diff --git a/arch/arm/mach-sa1100/h3xxx.c b/arch/arm/mach-sa1100/h3xxx.c
index d685f03f51f3..8a307c7ad9de 100644
--- a/arch/arm/mach-sa1100/h3xxx.c
+++ b/arch/arm/mach-sa1100/h3xxx.c
@@ -83,7 +83,7 @@ static struct resource h3xxx_flash_resource =
 /*
  * H3xxx uart support
  */
-static void h3xxx_uart_pm(struct uart_port *port, u_int state, u_int oldstate)
+static int h3xxx_uart_pm(struct uart_port *port, u_int state, u_int oldstate)
 {
 	if (port->mapbase == _Ser3UTCR0) {
 		if (!gpio_request(H3XXX_EGPIO_RS232_ON, "RS232 transceiver")) {
@@ -94,6 +94,7 @@ static void h3xxx_uart_pm(struct uart_port *port, u_int state, u_int oldstate)
 				__func__);
 		}
 	}
+	return 0;
 }
 
 /*
diff --git a/arch/mips/alchemy/common/platform.c b/arch/mips/alchemy/common/platform.c
index 02bf02164752..ef39cf52b168 100644
--- a/arch/mips/alchemy/common/platform.c
+++ b/arch/mips/alchemy/common/platform.c
@@ -28,8 +28,8 @@
 
 #include <prom.h>
 
-static void alchemy_8250_pm(struct uart_port *port, unsigned int state,
-			    unsigned int old_state)
+static int alchemy_8250_pm(struct uart_port *port, unsigned int state,
+			   unsigned int old_state)
 {
 #ifdef CONFIG_SERIAL_8250
 	switch (state) {
@@ -46,6 +46,7 @@ static void alchemy_8250_pm(struct uart_port *port, unsigned int state,
 		break;
 	}
 #endif
+	return 0;
 }
 
 #define PORT(_base, _irq)					\
diff --git a/include/linux/platform_data/sa11x0-serial.h b/include/linux/platform_data/sa11x0-serial.h
index a88096bc74e4..be14a0152787 100644
--- a/include/linux/platform_data/sa11x0-serial.h
+++ b/include/linux/platform_data/sa11x0-serial.h
@@ -18,7 +18,7 @@ struct uart_port;
 struct sa1100_port_fns {
 	void	(*set_mctrl)(struct uart_port *, u_int);
 	u_int	(*get_mctrl)(struct uart_port *);
-	void	(*pm)(struct uart_port *, u_int, u_int);
+	int	(*pm)(struct uart_port *port, u_int state, u_int oldstate);
 	int	(*set_wake)(struct uart_port *, u_int);
 };
 

-- 
2.34.1


