Return-Path: <linux-mips+bounces-3683-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D42BF908F1A
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2024 17:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAF5E1C252AD
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2024 15:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F47619CD0F;
	Fri, 14 Jun 2024 15:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="uo+LB/0o";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Bb9wFZrx"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout4-smtp.messagingengine.com (wfout4-smtp.messagingengine.com [64.147.123.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CA619B5A0;
	Fri, 14 Jun 2024 15:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718379641; cv=none; b=RzXO7pTrAVoRfKn1735JLnU36oOI4AfA3S5KhrUvSZzwBPbGO4dmBWg1L6vhB1RZ90DCkxW3j7oX49Dws8CjFhDYpMIhEXu9bWqQwHyrfsA+Td0bs9+AE2nQL9WeSB2sFFFkR8yBMPkN5e6/+anrmZWsIMj4DVqTCfQ2eB2YIm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718379641; c=relaxed/simple;
	bh=h0j/eGweOgNTckuuKZNfGTEjwI9pyLKstxVo9oNxw8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sYE4nhBarcct5Kb+dAoNjmnbpbKG1C9E/S1q4fOFwRenxCQcgKrP7QG9P0RRj+Y85ghqtApWWavhA1Fj5SzkM0czVdtMXdLolF+LU3B3jG4/SM9WA32uNEaFe815+E2GxSLQQwWenQ+KXuA5Jt/q7bnTFFB4PTG18JJ3tZU/0hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=uo+LB/0o; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Bb9wFZrx; arc=none smtp.client-ip=64.147.123.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.west.internal (Postfix) with ESMTP id 52F0D1C0012E;
	Fri, 14 Jun 2024 11:40:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 14 Jun 2024 11:40:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718379637;
	 x=1718466037; bh=Ao9NuSqyWqT33ZW5b1oeExjBsYxzXhWwoNTOqiALXkc=; b=
	uo+LB/0oq5X9sRawUxzAq/24zgPPQRW9eJgbBKCIyGhQsUU1YElYJ94IU8l7EIfS
	sVqcwCsh2hYBhJGUnaGXrUwLIQMC8eVFbxHC3i9Tk/FU14+2iAEWxiQAD2UCyiDh
	C26qJjCzGk4EbPLM58iyCMP49rBukJirn/xQD40mCJH50hLBRSKqd0eSQb807l8h
	xG9FUtiThWErmrSE5G2m1HBOXkSDRMeBVXL7RZAtShvpQhrhhKmgCaYY4hQvQXl9
	nPzl8IUSlsfBp4NyEoylSnJ/ZAJ462e2+853qWjboyLuBOxLp0LGWua9KmOxsZmA
	JGKOz1Y3JdSbkJnr6M1+Eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718379637; x=
	1718466037; bh=Ao9NuSqyWqT33ZW5b1oeExjBsYxzXhWwoNTOqiALXkc=; b=B
	b9wFZrxIAqm4J0zJW/wUlcY01CdEcq836viUKRAsXpapzuqfLQ8mMnbsJrDXjHih
	WheTbYg6oBZrDQ2aZsn9XhPNIN3b55HaaUSa0PHNw+13yiUlOI4/1FG18bYbYU+y
	+GCRuKmZCOwwI4UOwLkS3bSMU6ok6nwLgmrBBIh9T800Shd1A2M0463X2yzx/Fql
	fZKFoye7OXRuJ0413Rc/Oz4zXGKcOQdueYpoNsvAk5iAd/QazWG5U1UMJ9VwyqZ6
	4LOY+iGhJtX1cNg+3ZgDYRo+lFWLxYQKEkJHA+GS6UbzICEuLeQv3b6+gh4laIGP
	CsNZabD2Z0sJ8u8yyb5TQ==
X-ME-Sender: <xms:dWRsZpzWnYk1XVatglefl3vz1oCpYpPIR4ATd8ImtDXp8HmbzUNtGQ>
    <xme:dWRsZpSkys55bmXl3s-Mjusn1V6gRvFGy6P_SaT7LmhNu6XpKTxBh5Sw3fBmc-vWx
    oSFNc71Wwi1YGWA8D4>
X-ME-Received: <xmr:dWRsZjVj9SPti_O7L9PU0Uvbv8Z2yadM_I57vTuFE9F3WU3DuXPxbpQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduledgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:dWRsZrhHXHY0iIMR3sYxkiwYwgo12aPgijlDKfZH2L-pXUEdLVtrdw>
    <xmx:dWRsZrCdnTfDbydbPIw6TeleB22gJNZiNMJlSMF4R4ggY27lG5GTzQ>
    <xmx:dWRsZkLg7sh3sQuRkhtleIJKmDrPiLuX_v2VhNpLcuEULvlSkePYBw>
    <xmx:dWRsZqBZppai_AAfltzOM4yhsXkydSSrWCVPvSWZzp4tVUGxZS2bGQ>
    <xmx:dWRsZv4BHNBn7JY8mSy_OJuDf4fIiocS7PRy5EgfA3_ceWa7BxjwhnkF>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jun 2024 11:40:35 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 14 Jun 2024 16:40:14 +0100
Subject: [PATCH 06/10] MIPS: Loongson64: Test register availability before
 use
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-ls3k-mips-v1-6-7614340ace7d@flygoat.com>
References: <20240614-ls3k-mips-v1-0-7614340ace7d@flygoat.com>
In-Reply-To: <20240614-ls3k-mips-v1-0-7614340ace7d@flygoat.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Qing Zhang <zhangqing@loongson.cn>, Binbin Zhou <zhoubinbin@loongson.cn>, 
 Huacai Chen <chenhuacai@kernel.org>
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2569;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=h0j/eGweOgNTckuuKZNfGTEjwI9pyLKstxVo9oNxw8k=;
 b=kA0DAAoWQ3EMfdd3KcMByyZiAGZsZF6i3ObVUEFbsxB87BHECIzzv/5ukMZ8ccp4fg9YgZ5F5
 Ih1BAAWCgAdFiEEVBAijrCB0aDX4Gr8Q3EMfdd3KcMFAmZsZF4ACgkQQ3EMfdd3KcPS5QEA2tN7
 slt0qEWxk5FsOn0HxljZTIvitblJP7x8DJh/abgA/jxeTw3zWw1IZNLvgZy2Taek4SPtLOplrg1
 l6LFuXhEP
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Some global register address variable may be missing on
specific CPU type, test them before use them.

Cc: stable@vger.kernel.org
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/loongson64/smp.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index 5a990cdef91a..66d049cdcf14 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -466,12 +466,25 @@ static void loongson3_smp_finish(void)
 static void __init loongson3_smp_setup(void)
 {
 	int i = 0, num = 0; /* i: physical id, num: logical id */
+	int max_cpus = 0;
 
 	init_cpu_possible(cpu_none_mask);
 
+	for (i = 0; i < ARRAY_SIZE(smp_group); i++) {
+		if (!smp_group[i])
+			break;
+		max_cpus += loongson_sysconf.cores_per_node;
+	}
+
+	if (max_cpus < loongson_sysconf.nr_cpus) {
+		pr_err("SMP Groups are less than the number of CPUs\n");
+		loongson_sysconf.nr_cpus = max_cpus ? max_cpus : 1;
+	}
+
 	/* For unified kernel, NR_CPUS is the maximum possible value,
 	 * loongson_sysconf.nr_cpus is the really present value
 	 */
+	i = 0;
 	while (i < loongson_sysconf.nr_cpus) {
 		if (loongson_sysconf.reserved_cpus_mask & (1<<i)) {
 			/* Reserved physical CPU cores */
@@ -492,14 +505,14 @@ static void __init loongson3_smp_setup(void)
 		__cpu_logical_map[num] = -1;
 		num++;
 	}
-
 	csr_ipi_probe();
 	ipi_set0_regs_init();
 	ipi_clear0_regs_init();
 	ipi_status0_regs_init();
 	ipi_en0_regs_init();
 	ipi_mailbox_buf_init();
-	ipi_write_enable(0);
+	if (smp_group[0])
+		ipi_write_enable(0);
 
 	cpu_set_core(&cpu_data[0],
 		     cpu_logical_map(0) % loongson_sysconf.cores_per_package);
@@ -818,6 +831,9 @@ static int loongson3_disable_clock(unsigned int cpu)
 	uint64_t core_id = cpu_core(&cpu_data[cpu]);
 	uint64_t package_id = cpu_data[cpu].package;
 
+	if (!loongson_chipcfg[package_id] || !loongson_freqctrl[package_id])
+		return 0;
+
 	if ((read_c0_prid() & PRID_REV_MASK) == PRID_REV_LOONGSON3A_R1) {
 		LOONGSON_CHIPCFG(package_id) &= ~(1 << (12 + core_id));
 	} else {
@@ -832,6 +848,9 @@ static int loongson3_enable_clock(unsigned int cpu)
 	uint64_t core_id = cpu_core(&cpu_data[cpu]);
 	uint64_t package_id = cpu_data[cpu].package;
 
+	if (!loongson_chipcfg[package_id] || !loongson_freqctrl[package_id])
+		return 0;
+
 	if ((read_c0_prid() & PRID_REV_MASK) == PRID_REV_LOONGSON3A_R1) {
 		LOONGSON_CHIPCFG(package_id) |= 1 << (12 + core_id);
 	} else {

-- 
2.43.0


