Return-Path: <linux-mips+bounces-14782-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePwGLwPPFWpKcQcAu9opvQ
	(envelope-from <linux-mips+bounces-14782-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 18:49:07 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8655DA111
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 18:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0AC1F303ABD0
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FBC73D5256;
	Tue, 26 May 2026 16:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGoBWxF7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A+rRT1VS"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888613B19CF
	for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 16:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779813667; cv=none; b=R5zb3rdOGfCBhNBW0MCJEpDj2hxaAIUx/wzN2usXVkTE6rQGaHSX6cFtauu6pNLBh6y7TkWj9l53+/q4+EbZD4E2590SqUYvsTrrafUN4OCKjGt1XnhFwZHAAS01A6GLgjUNw7inNk2MTmWtKdprKaw78HpYufB2D2wjnMgBhiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779813667; c=relaxed/simple;
	bh=K8C5GYLlAxU3WbwtwDtgdk1jR5NFQPJ4WpNEENIbMJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hn16JXAlFfUnBWFpxrWWsD6axqCD0Y9WwchA1ZWzvh5CxZbIvrYz5tnj1jrt2Bx1WYsRdipnZ4TOe1RX/jpxriAZgnbL0Qr6ladlbivaHsg0KPGIBWIAbCFE/Gj0J+5zBmvd5FBWGFL2Zm7AUil2FsIIiWox5OYwWZvYGmxBHHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eGoBWxF7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A+rRT1VS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsPtR2697748
	for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 16:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NA5/DOm2s509z3Nfa+rdC3ZzVNO+AkSHSgjtz2ktqkA=; b=eGoBWxF7lWez9a4i
	iweLa9epGajhpEm3bx8ECEfk5Ui2P8nRCnjfldLg2PP4Qk6smi4j+usb48ytm30S
	7pRRCybx+5MK7JHG2e2x9jgnlfy7WtKnOpios6XfjkL4bEmxG0DFl9XLvjKQa0Q5
	TZ7VGJz1ST2octKhOVLBvCorvufeK2QKcmt1pFtZYnxM0QyEjjMEj439R4bU80R7
	s7Ep4rVq1BQpmnfec0sKTib4ExItf25Y+RBySPlfLy4cvjvsYrJpvr4x5Ws7LFwP
	Rj5nOEJnWdjzRjF6BBRjuy1TConIm+GwWc8GwuMhdb/cCPVfjwOwkq2XooYH5ZsY
	7YDANw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecsm04yg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 16:41:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516879bf1a7so274869661cf.1
        for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 09:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779813662; x=1780418462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NA5/DOm2s509z3Nfa+rdC3ZzVNO+AkSHSgjtz2ktqkA=;
        b=A+rRT1VS/qiAaiywc0q0BD09Z3Seb8Kd6hm7ETaa7RUjIsHdLF5hK2ZRnmCeDXA09E
         WL27fezIp/Lu+EQw4Edu0OFtsNRrxkMT/broOZwldTg1tEhxSTVll34zvMlZ4UQDncWp
         KJsWJ2r5ancM2jz5RnCLCraKBdzF1bvDSqM1na/DLXANux6s7D4EoOtDJrF+OMfI6ZAg
         FcRKM2KQWaz3cdN4YhlS4KMcasvpi/Ib0c2cITQM217/7qLRexZFjZu0l3gsbkXGnX5G
         qPF8FUDH/c1BgsnZaUw6xDGqfOl1O/m3YVsldXliVTYWDYCEPpdh3Nl5mT+81+lh2m4Q
         si1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779813662; x=1780418462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NA5/DOm2s509z3Nfa+rdC3ZzVNO+AkSHSgjtz2ktqkA=;
        b=YMpAXUwgsCmH6YuKUq1L1O69nim+2xalVpsOOo1MeY9lQdP66+NMGF0jBjvfYTwivv
         2P16Gu2ckWxP5FZ5teDzhqMYWdZZ2gdBEv57BxLKORiMomCK/oJuZTGP4vk43Ec4yPiZ
         Hw/xEZbHxEAXGZfBfrhMkn15jt2yW/DIsl2d034Yk7t+K8AF0syv6TPEBXlzIFwuG3ko
         hgaQySldmMuhxsCpPSmJ153onJkuSvr68evBPyRwa7rSQbOqXl9CS+4yL4WuRKkyCsfq
         2rWO/jNN51h1gLtR1OzGA/YcHoMf/Y3+fOJUSuG1M3txh54vROp+MdHbRZNLdGbzkNH7
         eecg==
X-Forwarded-Encrypted: i=1; AFNElJ8tmUfIZeHyJE0K3GuZhvaEoT8E4VEqsxWf2u9JuOSG/sQW+hN6ycTBc5S40yEwbjvSKFPvryNubvTH@vger.kernel.org
X-Gm-Message-State: AOJu0YzQI/fiObw+fZ8qoM5i1KHYCs+4ZKv9Bhg0PhGB9cAhdP8uuYTX
	e8nK7VdR32HRYxNwPqvJMt2GdU30zB2iIASPwT9NfgeKHrvf1pGEHyS56Hi5VQwxZ+mRXwadS5n
	VgWtG1WAQVLFwxKbBWEYQXYTt2WdiQLyXJEtPMd70D0FBM30vvCy2lPc29aEYmwQz
X-Gm-Gg: Acq92OGl9WfxRQLDMnDQCobvjf4i+BwgWDsdn2uMUEI/tmP9OPZJfhzIVBPzNzG6P5C
	iG6Hx/Wa21Ca7XymwtkPKBIkfkbix8tVYaWkx51pT9qWtNrFQNaUvSGTakASqn0nUJskLejhrGd
	ayhoZsmkgP1AoWGl6ZcwyZxYQLvoabvt1f5oXhVzkwoYFunwjcvVn32a/Sphg9bqL+7DPS5o6X9
	tykNHqSEEbYmhsEEzbCCVCLFWkdYEdQApof12TZSAdE26OGW8NWXmSb+P2QtlG+F7KoBec9Q0u+
	BNrGrX0pvqKHvVEjoOvNoXebQ8IPfRXMG+Gyuwf+/wSopLYnzzVNDmQWDaDentSrRxU8MesyBMI
	v8ElmCTGqcCiYt7fMF8zdWJ1BgyoHboc/F3FIPbgcpsTuAs7JhAk=
X-Received: by 2002:a05:622a:4d4f:b0:516:dc75:1aca with SMTP id d75a77b69052e-516dc75415fmr209886341cf.26.1779813662412;
        Tue, 26 May 2026 09:41:02 -0700 (PDT)
X-Received: by 2002:a05:622a:4d4f:b0:516:dc75:1aca with SMTP id d75a77b69052e-516dc75415fmr209885761cf.26.1779813661550;
        Tue, 26 May 2026 09:41:01 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c518:e53b:f5c3:921d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d48e23sm35605880f8f.20.2026.05.26.09.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 09:41:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 18:40:37 +0200
Subject: [PATCH v3 6/6] MIPS: alchemy: db1300: switch to static device
 properties
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-gpio-swnode-alchemy-v3-6-2aaa1238ae4a@oss.qualcomm.com>
References: <20260526-gpio-swnode-alchemy-v3-0-2aaa1238ae4a@oss.qualcomm.com>
In-Reply-To: <20260526-gpio-swnode-alchemy-v3-0-2aaa1238ae4a@oss.qualcomm.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: brgl@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manuel Lauss <manuel.lauss@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10961;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=e0m++1XBgamWekKPUOU22v5LN6WCVsQCLD/ZbidtdXQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFc0RARaqD82nFmi6oMPzegXY3AbRQS1sHYSgL
 mXcO8ZvaPKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahXNEQAKCRAFnS7L/zaE
 wx1pD/9/GlFfE0gXdlWJi0b06rgl9pzyNvBvQrUjb6coZsGqExN+8Rym4k56R/fqZhgl3wE97lj
 wtDvxCFhUzmMtolgCUR6lm8MQZ2Xnw7taUcPFHpXWXPtQ1ago9vUD3Iui2tHOi6GQxhmsiYu8R8
 Xch19A0ym6WCTR3iU6MErt/IAQuc3iUwQpmogrw7k0k5Al0pLu5681yhvmltY9N5U4EWzsAqhzM
 yk8DOh13YoPohSX+8zSmM0jyIasomDJuMutiiM/pT8qbxnshawgGUAtV3NxdKEp9IkOx2tWmCmY
 G34dfEG65YQHqH5Cjr4s5+jYFXAaonahTSYZT6INSgD+uNq20lN341nhqR1WHvsige+W8EcIS16
 snkX8Hj+bOoI62qq80QWW7RGbsGHlzLCYgGIGJkvUPPPfncslCscB1GdpVZ7gv8ij1/Kh2RRc09
 NsFD1vrMOGnfSp1tmciMufkqrq/22ifjDkDY248sqZSsp0c49IHtLfv4x7MIzIU29AWtD10oeXE
 vHgGsOT6SRVPcAwQ8gobVlWrUEN7tnhqcvvcHIbdjY1e+Ot2kzwaCSkgu7iAbGafr++Flg+5W2m
 ecpYTqEvgWQ1wTD7IYvs7L3KPSanlOvILqmKBxnsrkpTLUNofMajTHzYTUP5E9d8+J3Q50gokI1
 as3Kh0NkWVRHiCg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=CLEamxrD c=1 sm=1 tr=0 ts=6a15cd1f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=fwz_8kWlW_JgjtjOTdkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: j6ra3ZfatU_KE3zWFqQqdtGy4dSEOpKb
X-Proofpoint-ORIG-GUID: j6ra3ZfatU_KE3zWFqQqdtGy4dSEOpKb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0NCBTYWx0ZWRfX2/EjdvI+ASLZ
 izZcHdqlrxR5RSo/wbTWquNHiZwwTLZut7GdSI9lgkMUeDHb7uL4horMooHEP5/X6tqMR82L/KN
 pwBKEeXhEP7QgW5IOIQbejoEA/TcDXH5wkqFW5yNnl6jYP+e6xFBSluY1E/YQqlMyW4/gL9i7Gz
 3KIONOiDZV8Q6biGlQcriDXSqISBPDYq6ct+m7T0o/xy7W2/NKaFTPAjaQ+cuMtzcqGery8NlGT
 MpOIpbW3RE1JvxHtbiDn8JZllMZ+eCKy6XHZyZeZ5ez1wnVz884vlW9UpWTGnUF+VxRGq9Mizq4
 mG1JkETo/lAm5X0Vo78cQf8cdJr27ZvAamBnBd2VQWWVZjp909w4ftfdjrswcY2Ei9yGO09xR8f
 gUiXr9h7bfJcUsarHDuWTsy1V7jkPS8ZtnHtAvDMffD57IIfr4XrkJsloJkS2Xm1SQzcFVCRQB2
 NfWqGTtoBUwInyEx41Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260144
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[alpha.franken.de,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14782-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BB8655DA111
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Convert "5way switch" gpio-keys device and smsc911x ethernet controller
to use static device properties instead of bespoke platform data
structures for configuration.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
[Bartosz: use platform_device_info::swnode]
Tested-by: Manuel Lauss <manuel.lauss@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/mips/alchemy/common/gpiolib.c              |   6 +
 arch/mips/alchemy/devboards/db1300.c            | 218 ++++++++++++++++--------
 arch/mips/include/asm/mach-au1x00/gpio-au1300.h |   3 +
 3 files changed, 156 insertions(+), 71 deletions(-)

diff --git a/arch/mips/alchemy/common/gpiolib.c b/arch/mips/alchemy/common/gpiolib.c
index 2141eae5ce4502aad920333cba1f7a6e08411f9e..c926cc13756171e0650eed93ca14ec99c487782f 100644
--- a/arch/mips/alchemy/common/gpiolib.c
+++ b/arch/mips/alchemy/common/gpiolib.c
@@ -104,9 +104,14 @@ const struct software_node alchemy_gpio2_node = {
 	.name = "alchemy-gpio2",
 };
 
+const struct software_node alchemy_gpic_node = {
+	.name = "alchemy-gpic",
+};
+
 static const struct software_node *alchemy_gpio_node_group[] = {
 	&alchemy_gpio1_node,
 	&alchemy_gpio2_node,
+	&alchemy_gpic_node,
 	NULL
 };
 
@@ -189,6 +194,7 @@ static int __init alchemy_gpio_nodes_init(void)
 
 	alchemy_gpio_chip[0].fwnode = software_node_fwnode(&alchemy_gpio1_node);
 	alchemy_gpio_chip[1].fwnode = software_node_fwnode(&alchemy_gpio2_node);
+	au1300_gpiochip.fwnode = software_node_fwnode(&alchemy_gpic_node);
 
 	return 0;
 }
diff --git a/arch/mips/alchemy/devboards/db1300.c b/arch/mips/alchemy/devboards/db1300.c
index b46f5e47da2c32be3b44bcb80ea4b6e2623f735b..a7b8b7e8291f581e30741eca8a567193be8d2559 100644
--- a/arch/mips/alchemy/devboards/db1300.c
+++ b/arch/mips/alchemy/devboards/db1300.c
@@ -7,10 +7,10 @@
 
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
-#include <linux/gpio.h>
-#include <linux/gpio_keys.h>
+#include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
 #include <linux/init.h>
-#include <linux/input.h>	/* KEY_* codes */
+#include <linux/input-event-codes.h>
 #include <linux/i2c.h>
 #include <linux/io.h>
 #include <linux/leds.h>
@@ -20,6 +20,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/platnand.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/smsc911x.h>
 #include <linux/wm97xx.h>
 
@@ -237,23 +238,38 @@ static struct resource db1300_eth_res[] = {
 	},
 };
 
-static struct smsc911x_platform_config db1300_eth_config = {
-	.phy_interface		= PHY_INTERFACE_MODE_MII,
-	.irq_polarity		= SMSC911X_IRQ_POLARITY_ACTIVE_LOW,
-	.irq_type		= SMSC911X_IRQ_TYPE_PUSH_PULL,
-	.flags			= SMSC911X_USE_32BIT,
+static u8 db1300_eth_macaddr[6];
+
+static const struct property_entry db1300_eth_props[] __initconst = {
+	PROPERTY_ENTRY_U32("reg-io-width", 4),
+	PROPERTY_ENTRY_U32("reg-shift", 0),
+	PROPERTY_ENTRY_BOOL("smsc,irq-push-pull"),
+	PROPERTY_ENTRY_STRING("phy-mode", "mii"),
+	PROPERTY_ENTRY_U8_ARRAY("local-mac-address", db1300_eth_macaddr),
+	{ }
 };
 
-static struct platform_device db1300_eth_dev = {
-	.name			= "smsc911x",
-	.id			= -1,
-	.num_resources		= ARRAY_SIZE(db1300_eth_res),
-	.resource		= db1300_eth_res,
-	.dev = {
-		.platform_data	= &db1300_eth_config,
-	},
+static const struct platform_device_info db1300_eth_info __initconst = {
+	.name		= "smsc911x",
+	.id		= PLATFORM_DEVID_NONE,
+	.res		= db1300_eth_res,
+	.num_res	= ARRAY_SIZE(db1300_eth_res),
+	.properties	= db1300_eth_props,
 };
 
+static void __init db1300_eth_init(void)
+{
+	struct platform_device *pd;
+	int err;
+
+	prom_get_ethernet_addr(db1300_eth_macaddr);
+
+	pd = platform_device_register_full(&db1300_eth_info);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create eth device: %d\n", err);
+}
+
 /**********************************************************************/
 
 static struct resource au1300_psc1_res[] = {
@@ -352,67 +368,128 @@ static struct platform_device db1300_i2c_dev = {
 
 /**********************************************************************/
 
+static const struct property_entry db1300_5waysw_props[] = {
+	PROPERTY_ENTRY_BOOL("autorepeat"),
+	PROPERTY_ENTRY_STRING("label", "db1300-5wayswitch"),
+	{ }
+};
+
 /* proper key assignments when facing the LCD panel.  For key assignments
  * according to the schematics swap up with down and left with right.
  * I chose to use it to emulate the arrow keys of a keyboard.
  */
-static struct gpio_keys_button db1300_5waysw_arrowkeys[] = {
-	{
-		.code			= KEY_DOWN,
-		.gpio			= AU1300_PIN_LCDPWM0,
-		.type			= EV_KEY,
-		.debounce_interval	= 1,
-		.active_low		= 1,
-		.desc			= "5waysw-down",
-	},
-	{
-		.code			= KEY_UP,
-		.gpio			= AU1300_PIN_PSC2SYNC1,
-		.type			= EV_KEY,
-		.debounce_interval	= 1,
-		.active_low		= 1,
-		.desc			= "5waysw-up",
-	},
-	{
-		.code			= KEY_RIGHT,
-		.gpio			= AU1300_PIN_WAKE3,
-		.type			= EV_KEY,
-		.debounce_interval	= 1,
-		.active_low		= 1,
-		.desc			= "5waysw-right",
-	},
-	{
-		.code			= KEY_LEFT,
-		.gpio			= AU1300_PIN_WAKE2,
-		.type			= EV_KEY,
-		.debounce_interval	= 1,
-		.active_low		= 1,
-		.desc			= "5waysw-left",
-	},
-	{
-		.code			= KEY_ENTER,
-		.gpio			= AU1300_PIN_WAKE1,
-		.type			= EV_KEY,
-		.debounce_interval	= 1,
-		.active_low		= 1,
-		.desc			= "5waysw-push",
-	},
+static const struct software_node db1300_5waysw_node = {
+	.name = "db1300-5wayswitch",
+	.properties = db1300_5waysw_props,
 };
 
-static struct gpio_keys_platform_data db1300_5waysw_data = {
-	.buttons	= db1300_5waysw_arrowkeys,
-	.nbuttons	= ARRAY_SIZE(db1300_5waysw_arrowkeys),
-	.rep		= 1,
-	.name		= "db1300-5wayswitch",
+static const struct property_entry db1300_5waysw_down_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_DOWN),
+	PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpic_node,
+			    AU1300_PIN_LCDPWM0, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_U32("debounce-interval", 1),
+	PROPERTY_ENTRY_STRING("label", "5waysw-down"),
+	{ }
 };
 
-static struct platform_device db1300_5waysw_dev = {
-	.name		= "gpio-keys",
-	.dev	= {
-		.platform_data	= &db1300_5waysw_data,
-	},
+static const struct software_node db1300_5waysw_down_node = {
+	.name = "5waysw-down",
+	.parent = &db1300_5waysw_node,
+	.properties = db1300_5waysw_down_props,
+};
+
+static const struct property_entry db1300_5waysw_up_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_UP),
+	PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpic_node,
+			    AU1300_PIN_PSC2SYNC1, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_U32("debounce-interval", 1),
+	PROPERTY_ENTRY_STRING("label", "5waysw-up"),
+	{ }
 };
 
+static const struct software_node db1300_5waysw_up_node = {
+	.name = "5waysw-up",
+	.parent = &db1300_5waysw_node,
+	.properties = db1300_5waysw_up_props,
+};
+
+static const struct property_entry db1300_5waysw_right_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_RIGHT),
+	PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpic_node,
+			    AU1300_PIN_WAKE3, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_U32("debounce-interval", 1),
+	PROPERTY_ENTRY_STRING("label", "5waysw-right"),
+	{ }
+};
+
+static const struct software_node db1300_5waysw_right_node = {
+	.name = "5waysw-right",
+	.parent = &db1300_5waysw_node,
+	.properties = db1300_5waysw_right_props,
+};
+
+static const struct property_entry db1300_5waysw_left_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_LEFT),
+	PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpic_node,
+			    AU1300_PIN_WAKE2, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_U32("debounce-interval", 1),
+	PROPERTY_ENTRY_STRING("label", "5waysw-left"),
+	{ }
+};
+
+static const struct software_node db1300_5waysw_left_node = {
+	.name = "5waysw-left",
+	.parent = &db1300_5waysw_node,
+	.properties = db1300_5waysw_left_props,
+};
+
+static const struct property_entry db1300_5waysw_push_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_ENTER),
+	PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpic_node,
+			    AU1300_PIN_WAKE1, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_U32("debounce-interval", 1),
+	PROPERTY_ENTRY_STRING("label", "5waysw-push"),
+	{ }
+};
+
+static const struct software_node db1300_5waysw_push_node = {
+	.name = "5waysw-push",
+	.parent = &db1300_5waysw_node,
+	.properties = db1300_5waysw_push_props,
+};
+
+static const struct software_node * const db1300_5waysw_swnodes[] __initconst = {
+	&db1300_5waysw_node,
+	&db1300_5waysw_down_node,
+	&db1300_5waysw_up_node,
+	&db1300_5waysw_right_node,
+	&db1300_5waysw_left_node,
+	&db1300_5waysw_push_node,
+	NULL
+};
+
+static void __init db1300_5waysw_init(void)
+{
+	const struct platform_device_info pdevinfo = {
+		.name	= "gpio-keys",
+		.id	= PLATFORM_DEVID_NONE,
+		.swnode	= &db1300_5waysw_node,
+	};
+	struct platform_device *pd;
+	int err;
+
+	err = software_node_register_node_group(db1300_5waysw_swnodes);
+	if (err) {
+		pr_err("failed to register 5waysw software nodes: %d\n", err);
+		return;
+	}
+
+	pd = platform_device_register_full(&pdevinfo);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create 5waysw device: %d\n", err);
+}
+
 /**********************************************************************/
 
 static struct pata_platform_info db1300_ide_info = {
@@ -765,9 +842,7 @@ static struct platform_driver db1300_wm97xx_driver = {
 /**********************************************************************/
 
 static struct platform_device *db1300_dev[] __initdata = {
-	&db1300_eth_dev,
 	&db1300_i2c_dev,
-	&db1300_5waysw_dev,
 	&db1300_nand_dev,
 	&db1300_ide_dev,
 #ifdef CONFIG_MMC_AU1X
@@ -805,8 +880,6 @@ int __init db1300_dev_setup(void)
 	/*
 	 * setup board
 	 */
-	prom_get_ethernet_addr(&db1300_eth_config.mac[0]);
-
 	i2c_register_board_info(0, db1300_i2c_devs,
 				ARRAY_SIZE(db1300_i2c_devs));
 
@@ -849,6 +922,9 @@ int __init db1300_dev_setup(void)
 	swapped = bcsr_read(BCSR_STATUS) & BCSR_STATUS_DB1200_SWAPBOOT;
 	db1x_register_norflash(64 << 20, 2, swapped);
 
+	db1300_eth_init();
+	db1300_5waysw_init();
+
 	return platform_add_devices(db1300_dev, ARRAY_SIZE(db1300_dev));
 }
 
diff --git a/arch/mips/include/asm/mach-au1x00/gpio-au1300.h b/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
index b12f37262cfa5466e8d167ca120740b47e61514e..c92d3c2a5ef87e4c21c90f56491d63e4894faba4 100644
--- a/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
+++ b/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
@@ -13,6 +13,9 @@
 #include <asm/mach-au1x00/au1000.h>
 
 struct gpio_chip;
+struct software_node;
+
+extern const struct software_node alchemy_gpic_node;
 
 /* with the current GPIC design, up to 128 GPIOs are possible.
  * The only implementation so far is in the Au1300, which has 75 externally

-- 
2.47.3


