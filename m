Return-Path: <linux-mips+bounces-3595-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D5F904E8B
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 10:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5358A1C2190B
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 08:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE30E16DEB7;
	Wed, 12 Jun 2024 08:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="P9PC9Bo1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hpvO1o8B"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4878116D9A1;
	Wed, 12 Jun 2024 08:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718182476; cv=none; b=c4i66cU0wN1YA5JviFz81Sqw2ptFAxLC749t409ou/qEWG+XWju3PntDC4Pl3esT5cRREA6buKXXUXj4+V8KBnIHiyeZ22g6RyVFcHTFIkrwp+XXk2r+TwgcKjeCy5F+vmV7fnXdt1gR9ure218I9ONBCgacnp6/w7PxH61gtCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718182476; c=relaxed/simple;
	bh=HlsMz4irpGQHhXBogt5PnjuY/xW84KRG9P+0pPj829g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i13TVZq0o1Z8SNln16u0EDpASsBNyAqIs3kkYtMPqYaVmXSEDwhFKX+sAYfCTmNyHFtUixGW/vSX/lXAd6p9vukO9YX82ToEpXmPCrYDqvcHNrcLe7GKgWWf9DZp6Y44toOEswS11jC56UKPlMBEsWauxMXEtiy622/+0uKLdEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=P9PC9Bo1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hpvO1o8B; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 638AD138006A;
	Wed, 12 Jun 2024 04:54:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 12 Jun 2024 04:54:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718182474;
	 x=1718268874; bh=qq5phRqJvtRHtSHmkhaoyUkGaIs6cBNpExoO11sQiEE=; b=
	P9PC9Bo1ZE+B4G1Z5AnR/uGMmcUw8f2wNz9wwuVJtYnWeHiVcnDpvF4Ka8XWvMza
	bpvcuePT6uVGXQ7x8m6VUKCifmsba5up8ldnvCcn2aRdu02Y2/tjCTXjZ7rMiFzk
	uNisYS/WxbBZpWPx1rQENToLMBLeNFH41zusnTAeza8jAv2zk8+l3oCXYDnrrSSA
	TWzTUuh/7Mzy8jlioxKjLs/d9DlbBDRHuIvknpWnIYQsuUYNNqz+kWYs23Y6hiZT
	zojNBsa2UfARu4OoX1YWDO/txzuIqMqoT8bI8Qt6kpyttYb1TLm2QEIHEBUlqTKz
	fF1B6rLzDsoZyLWT3EuihA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718182474; x=
	1718268874; bh=qq5phRqJvtRHtSHmkhaoyUkGaIs6cBNpExoO11sQiEE=; b=h
	pvO1o8BABR4nKRjg08RZFbqLNZ5q6oZ1BHXCONAhulOduDNeX1ow/UVDh8t1AxYe
	7VtjhJP85lhUZ/VvjVWrEqTbsPHjbX2IXheFAHjWpVsA/NcbDUAdo1lnujmBuyLQ
	t1gBaEiJMMvkNiiO+BgGkkyHpYPtwNitDr8uxyyLbGJfyZGPziWxG1IzSMZGCJa9
	/3GUvYgz+4RPMv+VZo8VJFdWWiQGgb4yrppJky5D80t6RgZiF+KTTyM9ERk7FL6J
	t75vUs/XRbWtJ6NsGbb+crXA9TAg5Z+6eV9SaN0EOQS4q8tsMmwh5RF7iDzVekb0
	0hZq5C6BXjfKmsRf8aV5Q==
X-ME-Sender: <xms:SmJpZnWIjFt3TcJ_rgC8V9Ayn5pKxIQ9Nzo_Il5_F6hSZ_P_95M2iA>
    <xme:SmJpZvlTQcfVYuWhP-iTsXodsONsm_cOGzgZ3SYhGjuLRKDAhe_20TX6WRurh8DF6
    RAZNcZ-9mwdBNwPlIo>
X-ME-Received: <xmr:SmJpZjbPLtdzX9kkQkNMDxSFguRysHqjG1WgIyjAWNUd36A3CUjTZps>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:SmJpZiUqxMuT2tb_yokoDsz95NLF3Akt9R8NZ0HK3Lv4G-QtJVgvkg>
    <xmx:SmJpZhn0wixTYMjsEFRLHStAmfclFZqgfKHzLqVv30P5gR8oBSVn3w>
    <xmx:SmJpZvcAQ2zdkiixJo1pVfRANYtiN8llpzNphscW5Y1g5IaZzJDA4Q>
    <xmx:SmJpZrHkttPi-LOEOxR_Sc8LQ4G2PQEiU62WUnnG8CT-vTp8uwGOGA>
    <xmx:SmJpZj7xp1yOR_6gERBDBOY1EkiiOgijQov62dDyjvT4u8Lv99aFa8b5>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 04:54:33 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 12 Jun 2024 09:54:28 +0100
Subject: [PATCH v2 1/7] MIPS: csrc-r4k: Refine rating computation
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-mips-clks-v2-1-a57e6f49f3db@flygoat.com>
References: <20240612-mips-clks-v2-0-a57e6f49f3db@flygoat.com>
In-Reply-To: <20240612-mips-clks-v2-0-a57e6f49f3db@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1085;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=HlsMz4irpGQHhXBogt5PnjuY/xW84KRG9P+0pPj829g=;
 b=kA0DAAoWQ3EMfdd3KcMByyZiAGZpYkegzN7T0kZ1f0Umu6LlQMQvmIIND+o50wHSC/vA89Zbj
 Ih1BAAWCgAdFiEEVBAijrCB0aDX4Gr8Q3EMfdd3KcMFAmZpYkcACgkQQ3EMfdd3KcMEBAEAzrsw
 dG+lT1qiTlr3PUPDNYjvF/4Qz8Nal696U78Mo7MA/2KExIY0xLGEFEH85f3RTQasM9C34eS/46Y
 7pAk9UZIC
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Increase frequency addend dividend to 10000000 (10MHz) to
reasonably accommodate multi GHz level mips_hpt_frequency.

Cap rating of csrc-r4k into 299 to ensure it doesn't go into
"Desired" range, given all the drama we have with CP0 count
registers (SMP sync, behaviour on wait etc).

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2: Fix up number of zeros for 10 MHz (Maciej)
---
 arch/mips/kernel/csrc-r4k.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/csrc-r4k.c b/arch/mips/kernel/csrc-r4k.c
index edc4afc080fa..f02ae333f4f9 100644
--- a/arch/mips/kernel/csrc-r4k.c
+++ b/arch/mips/kernel/csrc-r4k.c
@@ -111,7 +111,8 @@ int __init init_r4k_clocksource(void)
 		return -ENXIO;
 
 	/* Calculate a somewhat reasonable rating value */
-	clocksource_mips.rating = 200 + mips_hpt_frequency / 10000000;
+	clocksource_mips.rating = 200;
+	clocksource_mips.rating += clamp(mips_hpt_frequency / 10000000, 0, 99);
 
 	/*
 	 * R2 onwards makes the count accessible to user mode so it can be used

-- 
2.43.0


