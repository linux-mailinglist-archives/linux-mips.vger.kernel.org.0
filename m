Return-Path: <linux-mips+bounces-3120-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D5A8BDDAA
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 11:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B78851C2375C
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 09:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E05414E2C9;
	Tue,  7 May 2024 09:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="sthPRXB6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="O0LCCEua"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B06014D6FA;
	Tue,  7 May 2024 09:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715072518; cv=none; b=lwW41enECWLD15tbBzJYCP+IqrVwliWuv6U+7N3aK0tJ/2sZiEqHTnxJjSHwT4RF1o8lCZHarViuwPqmwM8/huMci2csc3gzxCqKqy8SDWz9DSp2nfNsAxTtcaCDCrcJseMVpOf7NxDo1JLaZn9B7QQ0NUFt1R+L7Ul80/Giewc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715072518; c=relaxed/simple;
	bh=/VhFjeCllbEn45e0h4OgjSs8v3tfHTymSKkW07Ck+7g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q78ibnZf1gRpUGAQ1qFVUt9esHs5voOAs91U51UFMAshhB5PgwICmj0Qt3uIEH8wVq2Qms/oqGw3OAyVfGVT+NFgVRjXRF0hdKGakA4qp5XYXDU7gWYkn7DCXF9EAMac64+s1MXvVZygQMS+6UWtSrF2koHtbJAyVX/UzLX+gWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=sthPRXB6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=O0LCCEua; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 46C341140198;
	Tue,  7 May 2024 05:01:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 07 May 2024 05:01:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715072516;
	 x=1715158916; bh=qMWpBw7dBrEtj2ZiveBPMxKysfGcJC68PvIKkv0L3vM=; b=
	sthPRXB6il2IBCemH+281D/+u9rWlaoz04vzBnkboQAzSuz+vAOO75VvZ9Wpzcn+
	bkduBq48BDORKFzIefjPKJu5XkD5qPpcW2Vxh/P3N7QckopfCOtXmtCTBM/iSpNh
	AD85DKSLRJGveN60N8AO70y91GQoR1NOUX+3Ev+DwNtDvRAqJqc9a5vwMreFlo6M
	tKdg+n6BWvRxCrvun9avYHNUg5/qRDQFGwkH25JeF3BEPjbvU92UDjmR6uHq5/wm
	Y1bBMWYS8dtqSakzqs8eH+sNmIQIDmuuF0M+2INLimqs5099364w8tdlCa1nOwy/
	RV/axPIQwWbtCQj9UtzLOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715072516; x=
	1715158916; bh=qMWpBw7dBrEtj2ZiveBPMxKysfGcJC68PvIKkv0L3vM=; b=O
	0LCCEuaU07BM9WDq7FN/C7sP/1KC5tsIbvUTkRsKVrJZnuoD6sPw+FagO/MrdAsp
	yHWNl1GgnZS1amRwB2y9HTeEuLa0lEmffaK3/uoSvrOfqKCcIqsJnu/Z5jefPw4w
	ZFzDLjpJ16VXsVrBh0nZxfAViWprLfil/3W2u0EtuBQog/qngJWEwC6RHaSnkWm7
	EyW2hpOhUFlCHSPu4EK8s4uyhBVzIwq5OdiNS1rf2nRzSFi3cle/TvR4/NFzBA6G
	JbrHHL/4p3yddwIFwNKd9zJ8gCG5I0lhnTC0gB4V5AkiNVVc2vrQVqjPnbgSvfLV
	0J0ZSvDlrzLpShB9ZVVfA==
X-ME-Sender: <xms:BO45ZtWEsP4pXFNGM-8dBN4n2m0u1Jdbw07MrJPx9YntTQVKcBVJCw>
    <xme:BO45ZtkI0nrSvg6FsCHQBcXiEbLfWrDqVOKuQmjFOljkPzVAjNJhgZjrbjC9A4QTV
    5jtSyyAGJ1UlWaP3h8>
X-ME-Received: <xmr:BO45ZpYSzUy2CbuMa0Huxq2ItMWo37_KeMxaIycsGnllCczxoroVGYM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:BO45ZgUaL23NPqsy_hldebpCbK0MSd9nxS5ZgEafDR1JvyNCNXDkAQ>
    <xmx:BO45ZnlWTl39ZbMtKCTKQ2uoOI-y-k2WlNE9n7bp_hKuGStaVXWVhg>
    <xmx:BO45ZtcjfkIV77QkH8y4Fm50sz2a66Ou49JN7VSjkprLydj3mEGueg>
    <xmx:BO45ZhH-uZI-pxyeJq5NZsr4HATi4JM3LChgqkzgsvPmcmdfwBQjBA>
    <xmx:BO45ZgjGgt5XsX_M6SIBiSSWxD5n0A4IYeIqzDRwdV9cFp4uBvbGb3kf>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 May 2024 05:01:54 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Tue, 07 May 2024 10:01:51 +0100
Subject: [PATCH 3/5] MIPS: Move mips_cm_probe after prom_init
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cm_probe-v1-3-11dbfd598f3c@flygoat.com>
References: <20240507-cm_probe-v1-0-11dbfd598f3c@flygoat.com>
In-Reply-To: <20240507-cm_probe-v1-0-11dbfd598f3c@flygoat.com>
To: Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=983;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=/VhFjeCllbEn45e0h4OgjSs8v3tfHTymSKkW07Ck+7g=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhjTLt//nTL2zKDP+/xfmtr7GXwe0yjWOWSccs/WZxbvss
 tb818lTOkpZGMQ4GGTFFFlCBJT6NjReXHD9QdYfmDmsTCBDGLg4BWAiZu2MDE/7ndknT3+712VJ
 9bvoTJGX129z7kk7J//N4ZTIWZ4228MMv1nd7me82T2Zbab9SrYbims3zTilqSbS7XDaz/Rj9dY
 1/xkA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Move mips_cm_probe after prom_init so we can use fdt functions
in mips_cm_probe to obtain essential information.

Impat for all systems that may have CM in system:
- geneirc: Adjusted code to accommodate this change
- Lantiq: No impact, CM configuration won't be changed at all
- ralink: Called mips_cm_probe on it's own, in prom_init->prom_soc_init
- malta: No impact, CM address comes from CP0_CMGCR

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 12a1a4ffb602..732579c8f4f8 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -773,8 +773,8 @@ static void __init setup_rng_seed(void)
 void __init setup_arch(char **cmdline_p)
 {
 	cpu_probe();
-	mips_cm_probe();
 	prom_init();
+	mips_cm_probe();
 
 	setup_early_fdc_console();
 #ifdef CONFIG_EARLY_PRINTK

-- 
2.34.1


