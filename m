Return-Path: <linux-mips+bounces-3611-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D5E905021
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 12:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6AAFB26D47
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 10:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59C716F284;
	Wed, 12 Jun 2024 10:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="yN8eyLO/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fGd6rxNx"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BEF16F0F3;
	Wed, 12 Jun 2024 10:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186944; cv=none; b=rTPwx7YTDDoNyhn+DG4FDHMCcppz0V6lZS31fufYdhWNQQr7PX5mjFDjYmT7bnsvnAmh7qs/0Nyd1V8gNPt395uXTZXxXg687OQxO0JftxTtCAjkXYUZVQxf/iY1POPi8rk6CGtND4VpHxwNk2s/nc5HPgHsOReSxS6JX5aNxP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186944; c=relaxed/simple;
	bh=KuQOrkXjo/A7IZ7qIqgIRj2Axa7d+P9UF5/rZtbi+pw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GBmCxto4DzSpjc4mgys/fawapYu/IfPIhK5nHfjhExdnKL3+vV4cJmeXHgRYomSzYfeIShoqVRCgG98NMxTjORz2Dgm0g5nLV3aydmkn/qbK3aPhD3Jjuv5cM9KFxZINR37mRIUt+VxHZIUtrbRtDVwvG4YVLCZE4gah+er7mdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=yN8eyLO/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fGd6rxNx; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 67FEA11401D4;
	Wed, 12 Jun 2024 06:09:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 12 Jun 2024 06:09:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718186942;
	 x=1718273342; bh=wLj493SWdo5j4DBwjfdHV9ZZ5JW4G8Z6NpCIOJtkW64=; b=
	yN8eyLO/NbnG3Z+NMqb5uKHGfW7XJDSGBTYD3290xXm7poEYfwI3wUI4UIQ5Rpff
	ALJkTZquILyjt1I6SoTGv5CfY7v0dtb99kxyYT/FIzK1m6tU25rhsn3LpacyCtDX
	LUqw3pIkwEsvu5emfJ/Zv2oBVNeDp85314KuBq9PLFQ1JLKf73UBdW/0ZA25Zypd
	D6mX6ch8zfklselPjwxD5b8vl/EVE67Ia5h3U8gDFLr0/u/gV7USR49kGS+8QJgw
	8d9BasJqmVtHcp7MqeyrFFiijETClMaDkFxG5Yf8SsXQ0TqddtlVhYoQW0Rzv/Ib
	qFevkuEZ10uKat0Rypx14Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718186942; x=
	1718273342; bh=wLj493SWdo5j4DBwjfdHV9ZZ5JW4G8Z6NpCIOJtkW64=; b=f
	Gd6rxNxUwsOJGMeLs0uDUM8wi2EbE6ShnpUZbMSW/DyBTREAGxezeOGiBiykryVj
	12FXpPMgIpBae8yH5ze9q6TjwjEdZ3QXdDWTbJnRjF0mGuBHNsZIVWrm4ALlkp5J
	wfnMVh2KR03VA5+QkXgnZvqKs6ka+b4VuZL89YdHzoppFHf3z9C5flClMOQq8JTc
	GM/cY2AXViLpRh1aVwixaWH9ka6cM7NqECF92/lU9cB/xdw1mH1rH7id/cE9zqr/
	fdr02Bx+2kY/ISBpVnCSwufVXRrKkumFIPDhdstGUoIPH6Y2zY8LIXjgxWSrhIB3
	4Eb9FzrHGLCFWH8nbMxaQ==
X-ME-Sender: <xms:vnNpZoMcXaYvZxrYgV0bzOIjUhbGIPEFfOdfW-vP7zm9ekO1G8qZog>
    <xme:vnNpZu_x_KeG71fbpEpMMqbNFyHNDqrXAyfJtvC9lXEsEyZ7TBOywcnJABtvcvjgc
    5GGn9b6eRxJA4YRmU8>
X-ME-Received: <xmr:vnNpZvQUxAnMc6KiCAmZxahRPcuHMkye1ERSl_EJm12p51Gb2U27qLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:vnNpZguQI4Hpbplcy0nRaqlFKPLPKiNKUkqwlQUS7Vy0KQoJtSaLfw>
    <xmx:vnNpZgf79X9gSDt9Xj19rsS5dBRicXTpfGz8KdPrwVdCB_bF-FAmtA>
    <xmx:vnNpZk3InniY65oesGX8vVLnXMq5wldTnn80jCwak1AGes-kRvfsbg>
    <xmx:vnNpZk8IKuP6sE3F0WJSB_kSb8LD30z7AOfoyj0XQeaEG1GD4MmxjQ>
    <xmx:vnNpZhVd_VhEBEawU_XMQJ-j-kPH9FbEP-x2zkrRY40508CMNa_jc398>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 06:09:00 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 12 Jun 2024 11:08:56 +0100
Subject: [PATCH v2 4/6] MIPS: Move mips_cm_probe after prom_init
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-cm_probe-v2-4-a5b55440563c@flygoat.com>
References: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>
In-Reply-To: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>
To: Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=968;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=KuQOrkXjo/A7IZ7qIqgIRj2Axa7d+P9UF5/rZtbi+pw=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTM4m3lm1pM3RVNhW0Wd16zVvn5/cg06cglNVN+H2VXy
 2c6+Le/o5SFQYyLQVZMkSVEQKlvQ+PFBdcfZP2BmcPKBDKEgYtTACZSMp/hf9mhlJzG6eq6gi9z
 Ww26ZReed5vr8edfpOMUMUaDVyviTzH8D1vo+OZzmeZrLt4AkXuTDtQuiMitc7AR8Fj70WhtBfc
 RJgA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Move mips_cm_probe after prom_init so we can use fdt functions
in mips_cm_probe to obtain essential information.

Impat for all systems that may have CM in system:
- geneirc: Adjusted code to accommodate this change
- Lantiq: No impact, CM configuration won't be changed at all
- ralink: Called mips_cm_probe on it's own, in prom_init->prom_soc_init
- malta: Addressed in previous patch

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
2.43.0


