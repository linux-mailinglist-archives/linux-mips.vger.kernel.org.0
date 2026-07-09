Return-Path: <linux-mips+bounces-15664-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Rc3pMCNAT2qLcwIAu9opvQ
	(envelope-from <linux-mips+bounces-15664-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 08:30:59 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3A872D2A9
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 08:30:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="TO/+YiWH";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BvQFJSxS;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15664-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15664-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98DC6309EAB9
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 06:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A5D3CC7CE;
	Thu,  9 Jul 2026 06:26:55 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB0B3C343A
	for <linux-mips@vger.kernel.org>; Thu,  9 Jul 2026 06:26:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578414; cv=none; b=J0YO+DlhFrTiqDyGnVjCkzu++NliVcgguO2EbSJ8m0Qq5BlEKmpvILK9hRfR6WqUl3ZX+Bijz8swq0FOtEpd6XAFYJSsqxgZxspDMtG31vTm25vxMvM8Lt2CcMclYJV7MVMzl71NxUqI3rX5mGPNspstPxKlWQI191KVPmwMszw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578414; c=relaxed/simple;
	bh=aLKsWDAwz2GNv0and/N/QxAf4HluEjygqicLIneo6A8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ed+Uw1g87bZAmcTyAzTNkoJ3K55O8KfwHI4GCXQePm/pruNVTQ+eaoBd+YCZpk5xjXf9XAV4vSAPpzDV4IADS8kjlqIq3CG3AIKBSLDgJSVi3FCyNFkAm7z+H4XXE+JQ0ioXT7BpA1HEvWx80ZOB+h8zXLMcl8TTrv+S5G13oxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TO/+YiWH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BvQFJSxS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960IPn972678
	for <linux-mips@vger.kernel.org>; Thu, 9 Jul 2026 06:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FUNYYkOrLEAjmX4TG3ez/Z/YI7BUz6Ijll5yCR5/a/M=; b=TO/+YiWHz6cxuFqq
	qzv+0B/gddlxjqw7W5u6QCi1+Q5k7D63FXxoFjj3t8O5SZsGfAp8aaF/BMzqjznH
	/0XgRQPo8+dmjJw6HU0nFMFl1NGXVT/G+NG6pAQW7ZepcQjzKr4KZI/cmcxp/3z/
	URT5MLHK4BjfJR0WyIzO+4iDnxM/yxuDsXKDylNQlXfixTpLeIT4Qi5M5YiiWdxB
	q3p0z4G/ZWfnUmdky0Elzu6CqhWcrdafuMKBiH0UzjXrMBF1WsSQV+aDeY3hzKVO
	xEXKkRTV6KNjNkAA+Tcd7H4+mAM7DrCWVvRm6E85kQrm6DeB4uDJrBJ1bKiCV4b8
	7aXVVw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vt5ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Thu, 09 Jul 2026 06:26:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so10976785ad.1
        for <linux-mips@vger.kernel.org>; Wed, 08 Jul 2026 23:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783578404; x=1784183204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FUNYYkOrLEAjmX4TG3ez/Z/YI7BUz6Ijll5yCR5/a/M=;
        b=BvQFJSxSvhYnyTc71TMsJ03yaggkDLpbcsC2+XZwCU+yJMJ3lh4WyaCNkzNNFspLnV
         LnuJOB2tlkYZ47Slx07OycRZDAYuI25CWA5aDmswbkqYZrgQtXUVCLzRB+GuSFfQlKUr
         mPfZEyXduxod+cgPqBN16cEeA6mXcVBkMBHM7S8hsicyaCSGmjbH9+KX+xOm93ELg/dL
         2DltPGrUY1QFcyBJ412L4wZK56NwYweambtVgR1oAtiMgQK2ekT2p0HBX+1aZZbVumPw
         8+cSrGMol4PpH4sOk3tBNiLQlRin9m1WWNS7/dy2EMRq1Ia7RnoqVUMWoE8fXp6m8xO+
         S83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783578404; x=1784183204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FUNYYkOrLEAjmX4TG3ez/Z/YI7BUz6Ijll5yCR5/a/M=;
        b=rUS1NDisxZGbHMswVGrJCoGdq2wdTeRvod/xfmW7GlHjYjjdqvxcG2XBvk8j64jhl7
         aSkstCZ8bxCspmrwGWMUC+1qHFLHYFODgllOOyCMiD8oqW0ZhZgNGAVseD/K4OEioirp
         mv85naAvSxBQvD+LHYXFKXjGwnr3nO+EO9szjiXfX0QVjtsWU5Lunj/tstpoYqYbjd6f
         sCjbE0XyEQFyr5Sx3a9vQ8lXnuO//i/BJixZdXnRopFdvVnUNz0KHyd0qRPpR+6SK4MX
         PdeYyU0JRBilnvhfOgEO7JtZAZ1GgLO8t8y6bDQaS/abf23WActGfLz5x/yJqTjPJe92
         NXVg==
X-Forwarded-Encrypted: i=1; AHgh+RrYNxgd3QApK61V8mGD3dKF/sXNaDMs/qhulxjW4p9U9rPyfUHZHOiGql2cHdIJB32VvTkihyfL09qI@vger.kernel.org
X-Gm-Message-State: AOJu0YzaCIweL37J61MoBGR3j3cjbxvUoKXlO9wT8raOTwGalkpzz7Zw
	ni40ST0QRhaZeC4FG0xb4YFttgDg0RIIQV7AuLPCccQOD1xMFDTe0aV2o9LvjQ9NhZCtWuARVhg
	3OgBVzf8OaVzQ7gp1B/fM6bIBNzXt38tAL5Bw31G6h9lQv9AfCDKNGjadhY3PKOEz
X-Gm-Gg: AfdE7clJzP89EtaQjcQmHJuQeGMDRarnmPatpsEQnvIJmIFDdDRaSoTrOHqYmTAYKiB
	d0i3GzBMl42L3IqL5J4/WWJriUj3NnyNR5uqTKG/Gowo7mck2zAGdpJpj0ieLQ05iYbXOU+FOTk
	w+R1S95Ht7lHHrRYjG+gcTQoN7v29Qbvnu3ktYwjAV8v5X/hTD/ThJE/qBsW8MJhVnh81MiodU4
	Kyc/dRfqq0c8DFqLwQ5vFxgiol9EI4ZOp9agPGbxW59LRWDG+f++m1zK9VlEmtGo2hjFv4z083z
	1rcQk9tXhX0oPPS/3LWqQS2UH3ue97vJMVug6l7g5rqo7pMB0IEeuJLQLOBIZoEBH6MmH/QqRgb
	ejleZBhWEuuXpVGiW2G7Dzo91Vc1cIzsWQey2j5FTN3cr
X-Received: by 2002:a17:902:ec87:b0:2ca:16:c169 with SMTP id d9443c01a7336-2cdd8a8446bmr16030405ad.12.1783578403738;
        Wed, 08 Jul 2026 23:26:43 -0700 (PDT)
X-Received: by 2002:a17:902:ec87:b0:2ca:16:c169 with SMTP id d9443c01a7336-2cdd8a8446bmr16029695ad.12.1783578403107;
        Wed, 08 Jul 2026 23:26:43 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf74cbsm37986405ad.18.2026.07.08.23.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 23:26:42 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 11:55:18 +0530
Subject: [PATCH 6/6] serial: qcom-geni: check return value of
 pm_runtime_resume_and_get()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-add_return_check_for_uart_change_pm-v1-6-e85c6ffa8ec4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783578321; l=1832;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=aLKsWDAwz2GNv0and/N/QxAf4HluEjygqicLIneo6A8=;
 b=Hx8QUSLFIpbdbLJRMgaFZQcfWKI4SYHgH+sbG/r5N+1eUuprXpiRnOv/uNONREm1aauXqcg5E
 vvr6LWy+bUWDhuqdCnrvTyC5LuYYyp0okWLAMvA7Bc49vRU5kMASEqP
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: fCWvi1ykrGJUqy7p1fFk2kDozal_rob-
X-Proofpoint-ORIG-GUID: fCWvi1ykrGJUqy7p1fFk2kDozal_rob-
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4f3f24 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=f88WUc_itYv57WQCX9cA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfXyUK8iLOVLnpO
 1P56EpVcN8SxzVLeiNesJ44o/ielneKjt+yHXKfMmvqQ0fAWkFKyegt6ylJ0FD1WCiHN4yh2kYh
 IRVb5flzSOT/mDnEOwm9zHGIFe/BgbvWacaPDTAwLNaKBZorkmiG+sY6D301uLSjdB2p2Cf0XWL
 RoKNKaOehGftiXxM9JV0sq63yodlZnW5fZV1jYIgrCTm89exxLbhfhdtiV4RoHuMVJxvLyi5xK+
 m/IIOG/rx5eAPoz09G0fP54SvuYHCfUM4EdxLurl4AN/n+6rzShLlorF51AVxDeAaZIsqqIiMI9
 fNsl+Sc0yX2lRIGHFtx9CN1bPSu+fKCrJMpy8eVZMmbMTbt+Nunj09z3qlVcLYnkgEmPZHJpxkg
 du+SJENGBuFFD6+b175js39V1ihB9u90qe/rmlE53tj0MTR8el5qcMlC1lzbKaFosGniz+FlSUS
 FDMyl86AxFvBbvB8rRg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfXyWLD1fabUWO9
 Xd3VayonHlqtHrxNNNX/mOSc12pryVwnN50O5+icdYO5bpfgmXQTNuDVpFC5ElcHtn6agb4rav1
 HmYO+PBYiL58gXSatXEt1Xh70xBFeu8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090058
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
	TAGGED_FROM(0.00)[bounces-15664-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,linux.intel.com,gmail.com,collabora.com,bootlin.com,microchip.com,tuxon.dev,linaro.org,samsung.com,linux.alibaba.com,foss.st.com,sunsite.dk,amd.com,iki.fi,atomide.com,armlinux.org.uk,alpha.franken.de,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:andriy.shevchenko@linux.intel.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:richard.genoud@bootlin.com,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:patrice.chotard@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jacmet@sunsite.dk,m:michal.simek@amd.com,m:aaro.koskinen@iki.fi,m:jmkrzyszt@gmail.com,m:tony@atomide.com,m:linux@armlinux.org.uk,m:tsbogend@alpha.franken.de,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-samsung-soc@vger.kernel.or
 g,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-omap@vger.kernel.org,m:linux-mips@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,m:matthiasbgg@gmail.com,m:zhanglyra@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,uart_ops.pm:url,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 7F3A872D2A9

The .pm uart_ops callback calls pm_runtime_resume_and_get() but
discards its return value.  Failures such as -EAGAIN or -EACCES go
unnoticed and the driver continues as though the device is active,
which can lead to register accesses on an unsuspended device.

Check the return value and propagate the error to the caller.  The
.pm callback now returns int (since commit 6ffcacf023cb ("tty: serial:
change uart_ops.pm callback to return int")), so returning the error
code is sufficient for the serial core to handle the failure.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 17ab8acb3b8e..1ed09ac0af0c 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1727,14 +1727,19 @@ static int geni_serial_resource_init(struct uart_port *uport)
 static int qcom_geni_serial_pm(struct uart_port *uport,
 			       unsigned int new_state, unsigned int old_state)
 {
+	int ret;
 
 	/* If we've never been called, treat it as off */
 	if (old_state == UART_PM_STATE_UNDEFINED)
 		old_state = UART_PM_STATE_OFF;
 
-	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
-		pm_runtime_resume_and_get(uport->dev);
-	else if (new_state == UART_PM_STATE_OFF &&
+	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF) {
+		ret = pm_runtime_resume_and_get(uport->dev);
+		if (ret < 0) {
+			dev_err(uport->dev, "Failed to resume and get %d\n", ret);
+			return ret;
+		}
+	} else if (new_state == UART_PM_STATE_OFF &&
 		 old_state == UART_PM_STATE_ON)
 		pm_runtime_put_sync(uport->dev);
 

-- 
2.34.1


