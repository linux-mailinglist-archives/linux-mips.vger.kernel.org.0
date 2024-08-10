Return-Path: <linux-mips+bounces-4842-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6203594DCDA
	for <lists+linux-mips@lfdr.de>; Sat, 10 Aug 2024 14:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE3961F2193C
	for <lists+linux-mips@lfdr.de>; Sat, 10 Aug 2024 12:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8CE15FA8A;
	Sat, 10 Aug 2024 12:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="f41G6bqb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CE2v9nKj"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA4C158A3D;
	Sat, 10 Aug 2024 12:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723293562; cv=none; b=Qjzk+C3euxqnIsDodH7jUAYV9qe+WjIKBC5cIfpvyYQ/jioujoGB+pdwpQ8nyfpqvWGduYZY6v9n/bRdvABrgqHee8wt6nDtNVjFbFov5NnvUU9hg6i5GI7/F1CxfevGSAULhyVfrYyM7f6HYb+i6yz5wNbQH2dobyxLmqeYwYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723293562; c=relaxed/simple;
	bh=h1CQghwYCPF+SPQ/gns7o2gvkxa6sP1KKjEjw9Zu6Ww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rJTfbeFi52tfT7ceC0RDI0AzNNeBt173F+zY7M4cbbzqj+5GcMQ7s4NKpA4A4YnfNR/Jm3jmapSErxp+y/mn8kXdeUTWWKMooGa6NG6jozRcz15pmuezcm1jvtlyB/3Mt4lH/JBhN7dW+7G3lTSJ6PlaNdICf/kAGSB58cWwL+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=f41G6bqb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CE2v9nKj; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id 7B89D1390487;
	Sat, 10 Aug 2024 08:39:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sat, 10 Aug 2024 08:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1723293559;
	 x=1723379959; bh=UYj2B4lpikMda7PIIE6TQxRt02SlCYsTBh0EWJX+0Ok=; b=
	f41G6bqbvS0fgG7jtaacb4sEw+UbTzl2dAgCvLBLT7y3KbDHm0G88NHLpXfEiZpq
	7ZEcHxdIkO1RHuyE2NEZsNVEsXKUCw+3VhL7K9RWWs/RV5SKQQ/qXcp8x8Kh2u2E
	SGuZz1VObSmLkd8g6TWejVfLh5XV1vfRClm6ZjJylgesvzzvYaO9IrcaJZfPSyLx
	W4Jm0geYrDiedPwfJlV9AjIZeBmj6rD4k0ODNfpNDRH/nOIHAN66HY3gFswn13gb
	yagZc+n0+qv62eV5uL1FwvaaeuKKFqX6dxWrVT76mZAUMzDbdmx6UqIdLTMYIoPM
	zniO5aPu6ddE0sKHpcgfhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723293559; x=
	1723379959; bh=UYj2B4lpikMda7PIIE6TQxRt02SlCYsTBh0EWJX+0Ok=; b=C
	E2v9nKjOem95h7F9xxUgQrlF1YGxQsLcsBhnB8PjvdbF4LaLyjluNIloTZcsaYJ6
	Yl8wIa6idrx66pd6NkERl0Vwlz9PiiasuqUE3cdeKv5ZR9S4R/aAm4pPvtGVgjg5
	sjGCN7KJxIJLLtxfuY6MJjk0Q260/ZYAkY4sK6Ws2FeVJt7zN4sBNLJS0AlYxchD
	JpTskrr4QpmJTOh4Xb0/Z9+pFuCyXmnhB6OTrFbZ3Zuo4vgMWqrMEQWQvrBUn2e+
	z01JvB7R/P10q6XgKo3yK61i+dTRmTY73Hpbah8cGESNdZ30ohIDzBbjI/X0KPpX
	AAYHdQWW0wT2B7IbjY7iw==
X-ME-Sender: <xms:d1-3Zo1v2N8d9eLK8AO5vOz7gSKDz1Z_C_olL_VMCaDwi8em9S0G7g>
    <xme:d1-3ZjFJUie7wMCtfnyrnAwt8c_0XhK4ZBwB5kyChKXQdBUOPb045reFZPsRMzAOK
    vhPXpDSl14D3DNn-A8>
X-ME-Received: <xmr:d1-3Zg6IV5rPDIY1pZ7yAVary9gOVRNinvTTkQ1VfhCN5BI42Tu772CQocH8awn_-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrleeigdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeen
    ucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihgh
    horghtrdgtohhmqeenucggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeeg
    udeghfdtuddugefhueevgeffgedukeejleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgt
    ohhmpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    eptghhvghnhhhurggtrghisehkvghrnhgvlhdrohhrghdprhgtphhtthhopegstghmqdhk
    vghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghrohgruggtohhmrdgtohhmpdhrtg
    hpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphht
    thhopehlihhnuhigqdhmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhrtghpthhtohepthhg
    lhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepfhhlohhrihgrnhdrfhgrih
    hnvghllhhisegsrhhorggutghomhdrtghomhdprhgtphhtthhopehprghulhgsuhhrthho
    nheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:d1-3Zh3uTDF0mfvOFezheDmGSm18cvS5t-a9Q6DzTiMVK4z-U0D9cA>
    <xmx:d1-3ZrE0rwCuQjRchXnPcWKcetiP2NUtD_J_zHWiOKh8GMAG0ci85w>
    <xmx:d1-3Zq8RA0aXswSC9BXPQKM39DV4dEa4Ps95VK4wtXqE0booB_8i1g>
    <xmx:d1-3ZglTIxO-Tvps8rmtn_JxVSdsTnzNjhAb9HYWT53xdLP7CrtJig>
    <xmx:d1-3Zj9VgFvAHksbofniyi1hIsLZgbTcq6GAeGZbloWCLH40gHtXZ5so>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Aug 2024 08:39:18 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 10 Aug 2024 13:39:09 +0100
Subject: [PATCH v3 04/10] MIPS: Move mips_smp_ipi_init call after
 prepare_cpus
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240810-b4-mips-ipi-improvements-v3-4-1224fd7c4096@flygoat.com>
References: <20240810-b4-mips-ipi-improvements-v3-0-1224fd7c4096@flygoat.com>
In-Reply-To: <20240810-b4-mips-ipi-improvements-v3-0-1224fd7c4096@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Serge Semin <fancer.lancer@gmail.com>, Paul Burton <paulburton@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1192;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=h1CQghwYCPF+SPQ/gns7o2gvkxa6sP1KKjEjw9Zu6Ww=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTt8flLrrQfujr3SevU709/HTlcFrNU7PSDY2ovG1WrT
 /l7RXTe6ChlYRDjYpAVU2QJEVDq29B4ccH1B1l/YOawMoEMYeDiFICJPH7PyLBLcv+jLVIr8nY7
 dJ2y2Niov0Os4+KbidbF5+tNHCI5vj1i+KdawnkmxuNB/mPNwonTC7YIR80R6sreN833QrDzF7/
 fj3kB
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

This will give platform code a genuine chance to setup
IPI IRQ in prepare_cpus.

For most systems IPI should be registered by irqchip drivers
fairly early, but if IPI IRQ is tightly coupled with platform's
SMP implementation it makes sense to do it here.

Tested-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/smp.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index d3c7486fee3d..81ae65f21f73 100644
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
2.46.0


