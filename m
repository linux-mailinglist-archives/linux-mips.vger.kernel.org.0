Return-Path: <linux-mips+bounces-8908-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B49AA93C8
	for <lists+linux-mips@lfdr.de>; Mon,  5 May 2025 14:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D398D1886387
	for <lists+linux-mips@lfdr.de>; Mon,  5 May 2025 12:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFDE424EA9D;
	Mon,  5 May 2025 12:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DIp7zi41"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CD5204F73;
	Mon,  5 May 2025 12:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746449896; cv=none; b=YWhdmXIOPPA0SymwCxeJUXoLiyo87/1ybLM24iT70Ey9SvSPkA8+krPYSdwwhZvyZNlhIHh2Zlz8MilLLtO94GNSPdpyv+DlXZETc3f3d+syEGdX9FhqLx5soUkB+9uUT0/ay1hGrxpTX5nwDCeXVNOQhgRxYbFqEHoDqnXZqB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746449896; c=relaxed/simple;
	bh=ghnAz5DXlB0g4w6x8ho8LIhTH3b9+CDKZZq/V5v6C78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eur6BmaUQ4xvYYpD8htwjqTkvFgDJmuncGPVvtltsZ1y0E0IvBh0hozZwebZ9U8uMfNOXG5N0zdFHuAEw/aBS1VwnU0AGAESpyovURqxa2nzHyoSJCRdwUyoKhdCult+ejVkuWp9kh72bgWcmIpN87T9HSDzwlwksijs4H4Fxs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DIp7zi41; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBCCA43B15;
	Mon,  5 May 2025 12:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746449886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DKscAiFBmnThbRC5lnXUx/DegagPTUs6LxbTAP23cNk=;
	b=DIp7zi41TqP9EbaCTyEGOS4dyXCCaXUq34CwIlXowL3fXfXA9TnmPhH7Z+XIlHvc9p79yR
	z0kbigfBTF3ZjSOisMPKwv+CP0qPFvZPnMuOxcIjCGpLmlMLG5LyfwXnRZsqjx8gFyUIKd
	bSjCYpcsI+1kYjAOFbeGtrMPaQm2I1GEDFtiQ81evhkr3/Z3FFW1Belc1Y1dqqVNthqpxz
	rMJXdki5q987bA8G6zo4hsyDJZLNje5PURtzht0zHzlWfS1DypdrDKyyaDZ8l5+9HYFkXk
	PCAacNCkfHjttegq8Oqr9tBxygVX2NepiS8Mwlxs6R+LV9xUZ/UbhT9tlkmJdg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Mon, 05 May 2025 14:57:58 +0200
Subject: [PATCH] MIPS: SMP: Move the AP sync point before the non-parallel
 aware functions
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250505-hotplug-paralell-fix-v1-1-86f222cb6d90@bootlin.com>
X-B4-Tracking: v=1; b=H4sIANW1GGgC/x2MQQqAMAwEv1JyNqDBCvoV8VDaqIGipVURxL8bZ
 E4zsPtA4SxcYDAPZL6kyL6pNJUBv7ptYZSgDlSTrRVc9yPFc8HksoscI85yI1mi1gei3neg05R
 Z8387Tu/7AfpoAI9mAAAA
X-Change-ID: 20250505-hotplug-paralell-fix-25224cd229c6
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Huacai Chen <chenhuacai@kernel.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeduudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthekredtredtjeenucfhrhhomhepifhrvghgohhrhicuvefngffogffpvfcuoehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetleefudeikeetjeejkeeuleeuvefhhfduudehjeefudfgtdeufeegheeggfevteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfeekfeekmeekhegvleemfhgsuddvmeehleelrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfeekfeekmeekhegvleemfhgsuddvmeehleelrgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkv
 ghnrdguvgdprhgtphhtthhopegthhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhlrgguihhmihhrrdhkohhnughrrghtihgvvhesmhhosghilhgvhigvrdgtohhm
X-GND-Sasl: gregory.clement@bootlin.com

When CONFIG_HOTPLUG_PARALLEL is enabled, the code executing before
cpuhp_ap_sync_alive() is executed in parallel, while after it is
serialized. The functions set_cpu_sibling_map() and set_cpu_core_map()
were not designed to be executed in parallel, so by moving the
cpuhp_ap_sync_alive() before cpuhp_ap_sync_alive(), we then ensure
they will be called serialized.

The measurement done on EyeQ5 did not show any relevant boot time
increase after applying this patch.

Reported-by: Huacai Chen <chenhuacai@kernel.org>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
Hello,

As discussed last week [1], this is the patch that fixes the potential
issue with the functions set_cpu_sibling_map() and set_cpu_core_map().

Gregory

[1]: https://lore.kernel.org/all/aBVBHFGH2kICjnT3@alpha.franken.de/
---
 arch/mips/kernel/smp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 1726744f2b2ec10a44420a7b9b9cd04f06c4d2f6..7901b59d8f60eddefc020cf2a137716af963f09e 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -374,13 +374,13 @@ asmlinkage void start_secondary(void)
 	calibrate_delay();
 	cpu_data[cpu].udelay_val = loops_per_jiffy;
 
+#ifdef CONFIG_HOTPLUG_PARALLEL
+	cpuhp_ap_sync_alive();
+#endif
 	set_cpu_sibling_map(cpu);
 	set_cpu_core_map(cpu);
 
 	cpumask_set_cpu(cpu, &cpu_coherent_mask);
-#ifdef CONFIG_HOTPLUG_PARALLEL
-	cpuhp_ap_sync_alive();
-#endif
 	notify_cpu_starting(cpu);
 
 #ifndef CONFIG_HOTPLUG_PARALLEL

---
base-commit: 3b3704261e851e25983860e4c352f1f73786f4ab
change-id: 20250505-hotplug-paralell-fix-25224cd229c6

Best regards,
-- 
Grégory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


