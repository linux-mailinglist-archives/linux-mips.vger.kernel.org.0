Return-Path: <linux-mips+bounces-5420-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A1F970672
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 12:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DA261F21E57
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 10:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD88150989;
	Sun,  8 Sep 2024 10:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="df7sPxmy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Wa4IMDfw"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D21514EC53;
	Sun,  8 Sep 2024 10:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725790826; cv=none; b=Om2gEt2H+iDflWE5CbKRHw10Oo7G7IipKn2QS3Fb2jnUv8qoQYH647wpI7f6ojwd4XZ1t4SyB3GBTaeLbmz5kuiUltCqykZ7d0fRXn+3mcQ0AgTTdLzHTM4eRN89xzQpkLA8S32e0a/2vYn/zIlxAD5wFw5ipuyNnc1LQrT7NQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725790826; c=relaxed/simple;
	bh=h1CQghwYCPF+SPQ/gns7o2gvkxa6sP1KKjEjw9Zu6Ww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H0jm2I1cy55NtMQXCNbAPjpwzSlHtEeluBzApMjcPuH2AxZv0SAcO8Pj5raUp7G+b5ZsrS///8Gt+8KPDCZM0iSnf/84hp5K5jyMaA+GvX9uncXJ1PxK5+9Ml+G2Nluz8gE7T6KghNs3eFsIX7RNWbWUBqZD8QKuqoVMi1A42yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=df7sPxmy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Wa4IMDfw; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 91B541140297;
	Sun,  8 Sep 2024 06:20:23 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Sun, 08 Sep 2024 06:20:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725790823;
	 x=1725877223; bh=UYj2B4lpikMda7PIIE6TQxRt02SlCYsTBh0EWJX+0Ok=; b=
	df7sPxmyr02bY6p/+tW0JAubQ3wakkhWJ7NTX3wRtlCw2KTTdq0Ql/rUIQItgzCH
	h8NqJLiqjDDhuWL9aypsPddtB9WWHi5pv5M4FdcJs9NdSAvTs7tARnAvGht9oiNe
	yFRAcsW8Hh3Z+VcApO+HDaOrSh33PQIF7Bm8PqUzZ2DKg1cr+7MY9Y4IV3lWnCB1
	6i+wcCUawSxXjFd2QnNolpukTjbtlGVN6x4rqgHciMBgJfrS1wgYdkLhTQLd5g+5
	137WYkqiIPDiE2OqIdmvhXEEtQuE6PfZz/gwY93BH1NO9aiViRSQHE24J3Cd8z7o
	b86ZSOlptzI4J5f4MyeEvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725790823; x=
	1725877223; bh=UYj2B4lpikMda7PIIE6TQxRt02SlCYsTBh0EWJX+0Ok=; b=W
	a4IMDfwsxn9Ptitbak9wEqQ+WuhrHCeRWxT9ocoZ2IQFBQFXBd0pYH9a7Bj13vFm
	Nwh5c7uhzbJ1ySGRSCWA2xCHBpt/y2Hd0xNf0D9f6NKPBm6ZVXSbJz9SyBS+oyVJ
	DtPhtw6NfwOoI0gZKmJpVIdJEV4g7+SRHaSTGkp6yT9bIyz/4EWjP/awajXYS06v
	P2iSPHsF9Xxi8lSERY7loR0TrbHFwHZLEkZA1my2rVTuAiacM/v1RJhZ2YjrcnyD
	IG9GIUC8RRyDQZxLJZBzgnId5CY4q4FU8/Zhbc3jQPm9aihElyGsQzoEZe1j4mSp
	SrWF455zjp51/tXsVIZQg==
X-ME-Sender: <xms:Z3rdZs9KyHt5f7v_ggxpvmWw-dcSgavOuYZp91NK2ZHHeBdtDlO8rg>
    <xme:Z3rdZkvwR2gUoSMTUtTOuq5pX0V9MOdX-l5KHGbUCeS8PZhm9lReiZXsvhyUAUdPK
    z4pT4LEnfhUc64gl6E>
X-ME-Received: <xmr:Z3rdZiAKCY8rwZyBZmIP41kTqmXgq9NtjXxTteshCW3WVLHnyoDSOi_3hHKOElsH93Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeihedgvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
    necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffek
    gedugefhtdduudeghfeuveegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdr
    tghomhdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopehfrghntggvrhdrlhgrnhgtvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhhi
    rgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehflhhorhhi
    rghnrdhfrghinhgvlhhlihessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepphgruh
    hlsghurhhtohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmihhp
    shesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtshgsohhgvghnugesrg
    hlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepsggtmhdqkhgvrhhnvghlqdhf
    vggvuggsrggtkhdqlhhishhtsegsrhhorggutghomhdrtghomhdprhgtphhtthhopegthh
    gvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Z3rdZsd7VWAED22GVBIMcJY3zYBlpyxEIp9XSQY20JRyVDNiraz_oQ>
    <xmx:Z3rdZhNCUrt8xNA46aID0N8YuQY9pQ4ptzz1QxZJ75BD5-pD8z3ETg>
    <xmx:Z3rdZmnQzY0EB_JwV1I3IIuOY_P-yMZM1pKdV1lmb4rahniUDnt3PQ>
    <xmx:Z3rdZjukSetWRX7Jd0yr1VabuoBbofPZgavM05LY2T3VSsK4PW8Fmw>
    <xmx:Z3rdZiF_adVGlPN55EQUNWkoR03bdzqwTyNMOzZ8lO8AD24WgKtta6Qh>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Sep 2024 06:20:22 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 08 Sep 2024 11:20:15 +0100
Subject: [PATCH v5 04/10] MIPS: Move mips_smp_ipi_init call after
 prepare_cpus
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240908-b4-mips-ipi-improvements-v5-4-be8617dd2e53@flygoat.com>
References: <20240908-b4-mips-ipi-improvements-v5-0-be8617dd2e53@flygoat.com>
In-Reply-To: <20240908-b4-mips-ipi-improvements-v5-0-be8617dd2e53@flygoat.com>
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
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrS7VQlLJMRnPHXs4qjmYZwqlMF9dFm3VfPPhOUm22Q3S
 ItUe13oKGVhEONikBVTZAkRUOrb0HhxwfUHWX9g5rAygQxh4OIUgIlEb2L4w8cUpHtnVvKq2Exu
 2/+eUUcv78i6PJn9bl/1/Y8hn5Z7MDIy3HtTua1J9uCcunpd85NCTg86ZzyabBx6Qbuy8nV2cKc
 qKwA=
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


