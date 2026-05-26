Return-Path: <linux-mips+bounces-14781-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oH4CB+nOFWrkcAcAu9opvQ
	(envelope-from <linux-mips+bounces-14781-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 18:48:41 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADAF5DA0EC
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 18:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 534AD3033D5B
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312C13D79FF;
	Tue, 26 May 2026 16:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KHF83SmR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ACVb9oHg"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA473D5256
	for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 16:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779813664; cv=none; b=QiPjxmZ3EyQjVQUpCbmCHBuUXbQo/SK8FKAL/O2BbtqB7jfyPp8/hKTESzadripHJHA4qFMmaXGacnqgkEz2xANjg0KGPRIL85hF3gxZLMbjGU1c8nxY/KXimOiXPxDRuNjjWptfhMXwn6hnhoADraRxjMwedMoDBfFFxxxE3To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779813664; c=relaxed/simple;
	bh=QV6iWTbtK/OlzItS9ZezzpfmevMM+h3QUY2TV57FLa8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f/asXeOBYGxZfjirNHZDvHBeIa72QFuZ7BU6a0cU/fP5ldy3hHs5fUfCuOSr3TNRHT1kJKiNq0/O6z45tCWrEGAzmOAYb2c9OROCtkfQ+CIJFl9cQoqhMcs1dct7wDzqgEKEXbe56sE6ZHr4q5qlEbMvi7B2BjQEfI6HlXo5tSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KHF83SmR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ACVb9oHg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QFlAJN2901597
	for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 16:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RPvxYcqqdOnxNfCx92kNUoeDm6Vll5QJXfmp2uruwn4=; b=KHF83SmRbrCEphol
	bHNmDt5Ed8BDN270hipl3mEE85tn/N+a8QVJd23d7wxhTnZ+hyLGirZshGWrx9HA
	H5wx2FjzachJGVX+rz1NampeaCkfv2jiS1qQKiWYBxneBI4oa5LAmwHsw1ENXptF
	nGgav5nqOm2Os/qkJJ+vnIDzkG5zInGiKqTcOUJ7m5SyZoy6g/eKtpP2mXOgZ30j
	OG9hg+GGkx27Rv9xZfTbCgvTiZrs/mM3QOza1jrEap725MRrfutkcYgo4H+eIS9V
	ZOpbpJGi/8A6Gn3VLCHCDO8qqE6OU6khs8pwv6MRxfnaCytOZJ1VCJGp0sNGzDaa
	L4oTBw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edeff09hm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 16:41:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516d19f68acso98933121cf.2
        for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 09:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779813661; x=1780418461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RPvxYcqqdOnxNfCx92kNUoeDm6Vll5QJXfmp2uruwn4=;
        b=ACVb9oHg6/FM7QhFNqlGPf0je6T9sFEfnqzJ5P9qof4eMGxfsBaU+mth7+brQ3UG9n
         MivgoOOFj836SA+gujfOF4Uqbc2IY24HnzHbTV+kesHO1BxSZ15RPqcLFACtm3hKh9jX
         gjh29sP6LdSmgQtJF1PutukunlROoTco61ha5zfR89GFHP98VJed1I6AqS6BP7cIVley
         W33Bs4oigLBBwvVVSNFzbl1rESX8A/0cT2sHKxxphED0mLBR8Xpmg1snCe63MjLl39v5
         MYGu02AE7ZdJmsqT3dDBiaKv8gtr5qF6upgF8IXtLZQm4RcwDroiIKdDMHGXXIO19NWL
         hT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779813661; x=1780418461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RPvxYcqqdOnxNfCx92kNUoeDm6Vll5QJXfmp2uruwn4=;
        b=KRKAiErL0nRIIGRXZeh5sYv0omqFMD881DGfUjP+oJdNrxh6MMoHvfPX8cpPi1v3r1
         VuFBwkHDb0HTY3cDCvjSZETqvCtJUydVpyjmVM8BbkcGdAuut3zskqV/hsBA2knN/3Cj
         7iX/dC4bjckxZ0Qsv7clrRl6dNuYN3+ZIr0UOq8IjK+suIPK19KvNhTjGTbXyzRftFgz
         TiqQTo735URRMApLNkYpJlMjrI/2WaHAWUQXr1BcxhwRqryubkGz7s1GXiO14QiL/rkr
         YwGOua3rZWKtgp8H7AIeTHvGzvMlCtvH68HjEhsrAXNjBJPIECID4F2D8Kl11mbS02X1
         1y1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/bnybCUyXW2OvN++yrN0TgSy4DHMWOG31pH3DEumCL0Qq/8FfagWoVKM0ax2FBgyAl5pGO6sDmSBsA@vger.kernel.org
X-Gm-Message-State: AOJu0YzIofVKH5R0tNP5ucyaoVjMpQFHfxT4nmYC6ns1LDYToZs7MFyg
	/88EF2PsqRi4QS87uFn8FSnpmU+Is2w62ZlSA5WjFE8xa6jR/A9XgNwciIjR6weFmPwWQrhTPBN
	tLkAL3IySbDPsKv8zwYTubF8F1Ezdw0ppg9aoLoja4i0iMNfjV0kraAGPW75WrGsN
X-Gm-Gg: Acq92OEmoxKLPAMpCJW/xebfx5AXzBwq/TYaFRW6i54F8x+smwOiM+eG/RNV/KN9iJu
	t/uVovihUJ1QX3/GUXk8G5wou9lzghh4+4LtLWcQWkpfPxSyxECUbziRvdm+wVkjmtItpPcxUeo
	iCDMssEq+6ZuQxznorjSLYV7oMYupxf96h4hSJg72Z6KnVb4jObHeUCKEDQ3/R/1o5dMkfGNZAE
	xnv6n/9j9TQelX/dFxaiKI3GShLSWN9jKP18SoEJasI7ETCA5auV9FA5f92EoiUzNRswjmZB9s7
	S9Dth2oGmlEtvUkimcal+J73+5m6Wfo1H08Ow3SyQv38F1oaiZPTE9h65sv/KtzqydGlWgqr7Eo
	eORk1iapdn3iqUHgVQoxTfxE95X9yHaXcZvlH0GER4G64Sc3JZME=
X-Received: by 2002:ac8:5d04:0:b0:50d:770f:ad23 with SMTP id d75a77b69052e-516d42ea812mr273223641cf.26.1779813660618;
        Tue, 26 May 2026 09:41:00 -0700 (PDT)
X-Received: by 2002:ac8:5d04:0:b0:50d:770f:ad23 with SMTP id d75a77b69052e-516d42ea812mr273223051cf.26.1779813660041;
        Tue, 26 May 2026 09:41:00 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c518:e53b:f5c3:921d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d48e23sm35605880f8f.20.2026.05.26.09.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 09:40:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 18:40:36 +0200
Subject: [PATCH v3 5/6] MIPS: alchemy: gpr: switch to static device
 properties
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-gpio-swnode-alchemy-v3-5-2aaa1238ae4a@oss.qualcomm.com>
References: <20260526-gpio-swnode-alchemy-v3-0-2aaa1238ae4a@oss.qualcomm.com>
In-Reply-To: <20260526-gpio-swnode-alchemy-v3-0-2aaa1238ae4a@oss.qualcomm.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: brgl@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manuel Lauss <manuel.lauss@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5709;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZN/R2T6+8+Z80D9zim9qIxuHXKBST0XCUBKEL98Tu8Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFc0QlJlCTatO1T8pvp5wEAB8czKFlU3pvTWZX
 9BEqonHvCaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahXNEAAKCRAFnS7L/zaE
 wwvPD/9jxAq99cK0GK/4h8PAgZXBl3c3Tu8y4D5RlqymPtSX4l/gLVZYXM1YJZ2gtsXzRn2adaJ
 9UphGR9Y980DZb+2CVf5wXNkRglLH1OBv7nyWQydM6J4fvpVOp011/LA9uFFLgN096ILVRHvLSN
 1PDYahwYcMOvGowzVIEJcDvgyqE4BGfFTHCHilUjPofdpVm5F+CLEL5ZWphtskLZ7moPVDKfHXF
 WkEnudcaSNAR17Xp/XdGBcI5alyxvUBZ4U8Mr5TKb7Kwc3H/sMjst6dF//MTqbGxQBWnA/+JKgx
 ajtzAoxdcACneGcvhGPL7BBEVBaVif/1m3UiPlkfv6tGhyQnbOwqhO2W0xavt5EaSHYjm5RgM9f
 Exg5dnsExhVirHLkurzVZxB8Du43t91MbVq4YiggiMMCptOLbKlk1D1JN80WEhQB6Lw53xqNo09
 BuAn8pmOkR3ikY6m+hUDizKdZ2CrrEZrZx1HymvuSJmxMTZCzNitM4oIZYn2OV/r8tGMfraPUHu
 jg0WznzraWf51kJoUiq1vGXgGu1/ZdsO623DnfV2HhZpjevJxexE5UhMH4uCqs1/SOIjyn6Zpga
 XlF9P8hB66IXd+PRw/QaKAvz8ykEF0XIhZuL/XPbrqpwRPGHQS3WKVd/9H8KfLDWWE2dZTHuyMk
 hrsJdawS5DtLpzg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ONEXGyaB c=1 sm=1 tr=0 ts=6a15cd1d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=G2kbB0RmGtoI0qVf8F8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 6n2qKZLWZ4GgakiEoN10j1TVNfWk2PWB
X-Proofpoint-GUID: 6n2qKZLWZ4GgakiEoN10j1TVNfWk2PWB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0NCBTYWx0ZWRfX861/H6ZUD4pZ
 YfUZ0ME25+sFbo/mMuHdx7A12/jz3S/HgUbQdlpoToj0n9Hpjyltt027/1dFq4VpvkAEJTwLeLW
 y8CksozJ2tn/xXSUwUosg2e2J/PeX3c+5dcANaVIDx3giOVT0ZbSQ1IkUDLU/D96fHIf9HnsEro
 +E79v27EhsSifkunUveFNAAHF8hC16EsYL4T2b+N2dI3+E6lcb3m7Uro+A2s1Acr81+f2J0B9xF
 FukrB4Pc49luR44riRxqkBEKa9Fd9zmjJa8/DMtCBNfJqncu/1XRsuoYUU0w3jbPb0RKejO00aG
 BFXPxCQaTcG/IlROd7RFPnAvyaY1yHKksyjl8n6JUBm890OklgyJ/l6CLy5/ggwllF9l+XMo9+S
 aTs85i1x6kXAJ4M7qO/6DM1qpBio5Rt6rjt1CDoAtw3j0ly5FN7VM4S9lOzQKPRXi18MqTu6apX
 FNUZKrszqKgre38hv+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260144
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[alpha.franken.de,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14781-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3ADAF5DA0EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Convert I2C-gpio device and GPIO-connected LEDs on GPR board to software
nodes/properties, so that support for platform data can be removed from
gpio-leds driver (which will rely purely on generic device properties
for configuration).

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
[Bartosz: use platform_device_info::swnode]
Tested-by: Manuel Lauss <manuel.lauss@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/mips/alchemy/board-gpr.c | 127 +++++++++++++++++++++++++-----------------
 1 file changed, 75 insertions(+), 52 deletions(-)

diff --git a/arch/mips/alchemy/board-gpr.c b/arch/mips/alchemy/board-gpr.c
index f587c40b6d00a9ce5c25520f31e2b2ca60c80919..387252337a18517c49d37ee8e16116b87a2d39c9 100644
--- a/arch/mips/alchemy/board-gpr.c
+++ b/arch/mips/alchemy/board-gpr.c
@@ -13,11 +13,11 @@
 #include <linux/pm.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
-#include <linux/leds.h>
-#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/platform_data/i2c-gpio.h>
 #include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
+#include <linux/property.h>
 #include <asm/bootinfo.h>
 #include <asm/idle.h>
 #include <asm/reboot.h>
@@ -161,66 +161,90 @@ static struct platform_device gpr_mtd_device = {
 /*
  * LEDs
  */
-static const struct gpio_led gpr_gpio_leds[] = {
-	{	/* green */
-		.name			= "gpr:green",
-		.gpio			= 4,
-		.active_low		= 1,
-	},
-	{	/* red */
-		.name			= "gpr:red",
-		.gpio			= 5,
-		.active_low		= 1,
-	}
+static const struct software_node gpr_gpio_leds_node = {
+	.name = "gpr-leds",
 };
 
-static struct gpio_led_platform_data gpr_led_data = {
-	.num_leds = ARRAY_SIZE(gpr_gpio_leds),
-	.leds = gpr_gpio_leds,
+static const struct property_entry gpr_green_led_props[] = {
+	PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpio1_node, 4, GPIO_ACTIVE_LOW),
+	{ }
 };
 
-static struct platform_device gpr_led_devices = {
-	.name = "leds-gpio",
-	.id = -1,
-	.dev = {
-		.platform_data = &gpr_led_data,
-	}
+static const struct software_node gpr_green_led_node = {
+	.name = "gpr:green",
+	.parent = &gpr_gpio_leds_node,
+	.properties = gpr_green_led_props,
+};
+
+static const struct property_entry gpr_red_led_props[] = {
+	PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpio1_node, 5, GPIO_ACTIVE_LOW),
+	{ }
 };
 
+static const struct software_node gpr_red_led_node = {
+	.name = "gpr:red",
+	.parent = &gpr_gpio_leds_node,
+	.properties = gpr_red_led_props,
+};
+
+static const struct software_node * const gpr_gpio_leds_swnodes[] __initconst = {
+	&gpr_gpio_leds_node,
+	&gpr_green_led_node,
+	&gpr_red_led_node,
+	NULL
+};
+
+static void __init gpr_leds_init(void)
+{
+	const struct platform_device_info pdevinfo = {
+		.name	= "leds-gpio",
+		.id	= PLATFORM_DEVID_NONE,
+		.swnode = &gpr_gpio_leds_node,
+	};
+	struct platform_device *pd;
+	int err;
+
+	err = software_node_register_node_group(gpr_gpio_leds_swnodes);
+	if (err) {
+		pr_err("failed to register LED software nodes: %d\n", err);
+		return;
+	}
+
+	pd = platform_device_register_full(&pdevinfo);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create LED device: %d\n", err);
+}
+
 /*
  * I2C
  */
-static struct gpiod_lookup_table gpr_i2c_gpiod_table = {
-	.dev_id = "i2c-gpio",
-	.table = {
-		/*
-		 * This should be on "GPIO2" which has base at 200 so
-		 * the global numbers 209 and 210 should correspond to
-		 * local offsets 9 and 10.
-		 */
-		GPIO_LOOKUP_IDX("alchemy-gpio2", 9, NULL, 0,
-				GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("alchemy-gpio2", 10, NULL, 1,
-				GPIO_ACTIVE_HIGH),
-	},
+static const struct property_entry gpr_i2c_props[] __initconst = {
+	PROPERTY_ENTRY_GPIO("sda-gpios", &alchemy_gpio2_node, 9, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("scl-gpios", &alchemy_gpio2_node, 10, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_U32("i2c-gpio,delay-us", 2),	/* ~100 kHz */
+	PROPERTY_ENTRY_U32("i2c-gpio,timeout-ms", 1000),
+	PROPERTY_ENTRY_BOOL("i2c-gpio,sda-open-drain"),
+	PROPERTY_ENTRY_BOOL("i2c-gpio,scl-open-drain"),
+	{ }
 };
 
-static struct i2c_gpio_platform_data gpr_i2c_data = {
-	/*
-	 * The open drain mode is hardwired somewhere or an electrical
-	 * property of the alchemy GPIO controller.
-	 */
-	.sda_is_open_drain	= 1,
-	.scl_is_open_drain	= 1,
-	.udelay			= 2,		/* ~100 kHz */
-	.timeout		= HZ,
+static const struct platform_device_info gpr_i2c_pdev_info __initconst = {
+	.name		= "i2c-gpio",
+	.id		= PLATFORM_DEVID_NONE,
+	.properties	= gpr_i2c_props,
 };
 
-static struct platform_device gpr_i2c_device = {
-	.name			= "i2c-gpio",
-	.id			= -1,
-	.dev.platform_data	= &gpr_i2c_data,
-};
+static void __init gpr_i2c_init(void)
+{
+	struct platform_device *pd;
+	int err;
+
+	pd = platform_device_register_full(&gpr_i2c_pdev_info);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create I2C device: %d\n", err);
+}
 
 static struct i2c_board_info gpr_i2c_info[] __initdata = {
 	{
@@ -270,8 +294,6 @@ static struct platform_device gpr_pci_host_dev = {
 static struct platform_device *gpr_devices[] __initdata = {
 	&gpr_wdt_device,
 	&gpr_mtd_device,
-	&gpr_i2c_device,
-	&gpr_led_devices,
 };
 
 static int __init gpr_pci_init(void)
@@ -284,8 +306,9 @@ arch_initcall(gpr_pci_init);
 
 static int __init gpr_dev_init(void)
 {
-	gpiod_add_lookup_table(&gpr_i2c_gpiod_table);
 	i2c_register_board_info(0, gpr_i2c_info, ARRAY_SIZE(gpr_i2c_info));
+	gpr_i2c_init();
+	gpr_leds_init();
 
 	return platform_add_devices(gpr_devices, ARRAY_SIZE(gpr_devices));
 }

-- 
2.47.3


