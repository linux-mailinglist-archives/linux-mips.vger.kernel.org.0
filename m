Return-Path: <linux-mips+bounces-13243-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMu7CEdMoGnvhwQAu9opvQ
	(envelope-from <linux-mips+bounces-13243-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 26 Feb 2026 14:36:07 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 848A31A6A94
	for <lists+linux-mips@lfdr.de>; Thu, 26 Feb 2026 14:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AD79300052D
	for <lists+linux-mips@lfdr.de>; Thu, 26 Feb 2026 13:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9DE336CDF2;
	Thu, 26 Feb 2026 13:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rcg7/vgo"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE7B36C0A8
	for <linux-mips@vger.kernel.org>; Thu, 26 Feb 2026 13:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772112867; cv=none; b=WvtTzbmGAovTvryMbJQUKRakd0mB0wMfE+Ab5xl+VzPH1nfvSrtJOdmB4d/tzHFrtrpLRo9zzdNhfR8v8L8DEMm3fKTA/1qW4bWDwyoPBuaRoeCH1QValpS8N8W3PzSJSWS6a+3f5dyFVAqEFOSSw9vTw+BGHrv06WYLKF8jdh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772112867; c=relaxed/simple;
	bh=9zkekABcAlg8YMMkj/L/dt3L6sYyji1eB7+IH2fyS2s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NKOIWGTHWFWiZ8POe3WLMpul64wzIw/z8dV+JrxWgYEkJfjj4FCsLDbMVnjVis//6L7e7TQ1CEV3vrLZyAe+YNiD1u/VrOqbuGQyvavzNRni5PUE8/xxSYMzSrYxW57p8o006kAzfNF8f7P2sjCthP22tzoqYjuLd3DYo1/7I/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rcg7/vgo; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 91B311A147E;
	Thu, 26 Feb 2026 13:34:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 60F7F5FDEB;
	Thu, 26 Feb 2026 13:34:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 293891036938A;
	Thu, 26 Feb 2026 14:34:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772112861; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bMU1zdQY7oxfR3rDnGue/fO4nWAsw/nZQUBlMCuYV9E=;
	b=rcg7/vgoQNAs2mFI3hRXLd+oeXWwWeqc4cYEgC7oem3c/JVzwtTAF0XIvUfDX9i+SVZPeb
	vZ4WhTfLOmNXgDWy8P2mfTpn/Fkc14oY1YnoOGG+CcwE97qIsnIa7A5AK+r/GSPmcOofS2
	VUJZDZvjndSBD7BK+2NDT/nioXKlSoabrz9kVog1TB8gLN9h6PcacMHyfzfH+HrRcInUAa
	vbWEdoq1ezgEFqqYoSbles/xJHY1b58KEknHT9+5LV0EnjRMuKYh9LG31giSmZKS4h1+fe
	LAH0mffKW3//whJXyxhlYDqlAZwBGYvW68dw3Veo2lOlopE7EwDZ/g61urZ9FQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Thu, 26 Feb 2026 14:33:51 +0100
Subject: [PATCH v3 07/13] clk: eyeq: Skip post-divisor when computing PLL
 frequency
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260226-eyeq6lplus-v3-7-9cbeb59268b0@bootlin.com>
References: <20260226-eyeq6lplus-v3-0-9cbeb59268b0@bootlin.com>
In-Reply-To: <20260226-eyeq6lplus-v3-0-9cbeb59268b0@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linusw@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13243-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:mid,bootlin.com:dkim,bootlin.com:email]
X-Rspamd-Queue-Id: 848A31A6A94
X-Rspamd-Action: no action

The output of the PLL is routed before the post-divisor so it should be
ignored when computing the frequency of the PLL, functional change is
implemented to reflect how the clock signal is wired internally.

For the PLL of the EyeQ5, EyeQ6L, and EyeQ6H, this change has no impact
as the post-divisor is either reported as disabled or set to 1. The PLL
frequency is the same before and after the post-divisor.

For the PLL in EyeQ6Lplus, however, the post-divisor is not 1, so it must
be ignored to compute the correct frequency.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index b17f47fda1da..904d7d77d415 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -178,8 +178,6 @@ static int eqc_pll_parse_registers(u32 r0, u32 r1, unsigned long *mult,
 
 	*mult = FIELD_GET(PCSR0_INTIN, r0);
 	*div = FIELD_GET(PCSR0_REF_DIV, r0);
-	if (r0 & PCSR0_FOUTPOSTDIV_EN)
-		*div *= FIELD_GET(PCSR0_POST_DIV1, r0) * FIELD_GET(PCSR0_POST_DIV2, r0);
 
 	/* Fractional mode, in 2^20 (0x100000) parts. */
 	if (r0 & PCSR0_DSM_EN) {

-- 
2.53.0


