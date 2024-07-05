Return-Path: <linux-mips+bounces-4159-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDF3928A85
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 16:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17D252867B9
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 14:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64AA316B397;
	Fri,  5 Jul 2024 14:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="XPJcFh4q";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="khH93IFn"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95FF16B38F;
	Fri,  5 Jul 2024 14:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720189056; cv=none; b=qYzNN268UYgfnUBGYnsH497j6Muoegf2LQBbiFJ2/GdGMpQyRUi89Le7Y0NJtwnzpQsvKZIHLXJYmTxKm1KdmzOgmfyN60vdIiamvo3xHThH1EXV+5o4RP/HQM76nVA2Jk6O/FIi/zBnweVSj+8KbdLCZOdh7OTC9NsCRqXEovw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720189056; c=relaxed/simple;
	bh=pkTb9ZrA+jNYT1SUqR3EAOxZwBarpbO5ne+aLusK+J8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OXgEWNS8BbsYOKEKF+COs5scsgAo6ActX6H+4F4UAluHdRNb96VW+Q16PYyL2xTn3iRjD8LmlCQAFWQddS39GJVhs12HMDKW7ekdyT3i7j6YhTGPD/Ni11JKKAbY5cXKcc2V8eLsof/Jj/lL49KKrNHZl6HqqgQYPrNqQxn/MfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=XPJcFh4q; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=khH93IFn; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 0C6AC114012F;
	Fri,  5 Jul 2024 10:17:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 05 Jul 2024 10:17:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720189054;
	 x=1720275454; bh=vOqH4swpVxiGjhFEjcycoSM2yvtG7Krg9TnYMF+1RBA=; b=
	XPJcFh4qlxX3Xgl3O9N7s0+KCDJtIeJ7W4H6W9Cml7pJDLx2JPceMtz0tgwdk/J1
	8n/dkJNaNHrBG8j/qAB01A3ebcJiAcQMrBBgnyLLIbwG6gnHLjVsf1czbRhiqSoz
	ivUPymhIsucyMBlHj9L8aeggId6UMqkJVUzHWUY7SKkK9eBURFdGHSabah/a/EvW
	I7s+3oxGnt8WeKrpdbuF9yCZ8ozSY/oFK4BWiu2QJ26a4np4aM+ADuJCBJ18cu/W
	JDqwMX5Lt4lyO4S4BvmuuXG6JZnz9c/6I2EHDE9i3zJ6PBjnedbjd1qjjqrpknOW
	HZvLNaVojBK64XdMqzEysg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720189054; x=
	1720275454; bh=vOqH4swpVxiGjhFEjcycoSM2yvtG7Krg9TnYMF+1RBA=; b=k
	hH93IFnlI3GXhehp845rNHLe23Dg0vO/vS0zgSrz+1sD7ki7ATzuGr8tUVLmKnxw
	hX/0hNMf7lA24Sl+yNl5hZ9drz6ZPrRCASM0QiSFGGBMucVf4FXOEy+o5Wlbj3jj
	eSs8warVKxAHW6uvhDh4DW9HcDF78S3fQxpqOkMrehpjg25y87FgSx0tcZMz86m3
	AF9y+i4O5okPo1e9e9h9qQwo5eNwXJAcXDjl8mdSgTstdxEreiq4RwkIl/ASirlW
	/aTWrJc31ccKmKXb+fHVM6LRU8TJUbyDXwfFpZ2OBX39NeTylohEycjRu0IwlMdI
	k1FsbiMklVE5ClCQ4VL7w==
X-ME-Sender: <xms:fQCIZsxqfBiiyEn-GpS3Sj7eQCpSBVxOrEPH4RlWB8D095sycwzdnQ>
    <xme:fQCIZgTd8ti1gRN3b0toNuMoD0Y_UQtFT9Wl5gJ_JbVnifH3zINmg0UW4JNfvq7AC
    ZQiNpru9wIQZivGITE>
X-ME-Received: <xmr:fQCIZuUKCsGi0j1I6cYPgW4VkXhtedAD2mOWWvj8dYUkHwP0RksRrwlFyciPqilB2Xc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddugdejfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefhueev
    geffgedukeejleenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:fQCIZqjNDx3PSduyU8WhHlb3AOAXl1QRBD1HCEV3RTquCD4rmrVUgw>
    <xmx:fQCIZuBEoxWVpk3twUSsLz9T886WCJuw80U_VtDQ-bL9EH9lEyUwoQ>
    <xmx:fQCIZrIvzCW0bGV-qA_Q9mOA3UK4fMZ1cGfbjI12iQsFTaUPdRLG1A>
    <xmx:fQCIZlDMf1GN-XchMw7VTV1fvjLyCVURiyrKy7WV19jBLObSd4cnsQ>
    <xmx:fgCIZi7P5IqaszXSNfdHthcWBS1xxde80uhguhpGRuJT4R8uHkXXhBPJ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jul 2024 10:17:30 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 05 Jul 2024 22:16:56 +0800
Subject: [PATCH v2 04/10] MIPS: Move mips_smp_ipi_init call after
 prepare_cpus
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-b4-mips-ipi-improvements-v2-4-2d50b56268e8@flygoat.com>
References: <20240705-b4-mips-ipi-improvements-v2-0-2d50b56268e8@flygoat.com>
In-Reply-To: <20240705-b4-mips-ipi-improvements-v2-0-2d50b56268e8@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Serge Semin <fancer.lancer@gmail.com>, Paul Burton <paulburton@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=pkTb9ZrA+jNYT1SUqR3EAOxZwBarpbO5ne+aLusK+J8=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrQOhvTMK3/vz7nKISvy4Xfvqqk6s/dXcPzk2LJt9ZqOS
 onvPCu/d5SyMIhxMciKKbKECCj1bWi8uOD6g6w/MHNYmUCGMHBxCsBE9p1k+F/ZuMywl73lTnOW
 RZ5cR1akyv2NFgVnZfzP757rs/NT22KGn4zHTI+WP9v5doW8Ie8R0bnfToh8fZKeszxnw6c9B7x
 K7TgB
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

This will give platform code a genuine chance to setup
IPI IRQ in prepare_cpus.

For most systems IPI should be registered by irqchip drivers
fairly early, but if IPI IRQ is tightly coupled with platform's
SMP implementation it makes sense to do it here.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/smp.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index fe053fe52147..f29259d16a37 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -375,7 +375,6 @@ static int __init mips_smp_ipi_init(void)
 
 	return 0;
 }
-early_initcall(mips_smp_ipi_init);
 #endif
 
 /*
@@ -466,6 +465,13 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	set_cpu_sibling_map(0);
 	set_cpu_core_map(0);
 	calculate_cpu_foreign_map();
+#ifdef CONFIG_GENERIC_IRQ_IPI
+	if (mips_smp_ipi_init()) {
+		pr_err("Failed to initialize IPI - disabling SMP");
+		init_cpu_present(cpumask_of(0));
+		return;
+	}
+#endif
 #ifndef CONFIG_HOTPLUG_CPU
 	init_cpu_present(cpu_possible_mask);
 #endif

-- 
2.45.2


