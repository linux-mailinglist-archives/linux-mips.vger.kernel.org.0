Return-Path: <linux-mips+bounces-4155-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4839B928A7A
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 16:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 747C71C234B4
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 14:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9925B16B392;
	Fri,  5 Jul 2024 14:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="ihOCk3pr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jeAdMkyP"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC6516A954;
	Fri,  5 Jul 2024 14:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720189040; cv=none; b=sZDVb2BTYt1l0hzCkNvhLcvEKK1+Z048N43VjtcsqeR8B6LpJCg/3r8cgG/rqm7JukCvq2irKLPAeBfG7nzYEqAgdfBVwjNUodKI3ZCAX6OxjsHjBxKuJxGSSGaKfTA9gRKV3FUVvnktUO+ZsJEVF/dW4F4orwtSmhaONtdO9aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720189040; c=relaxed/simple;
	bh=WNu6YnIpjmhZP5sFZYTEwWoNdzLX/he1ifvQopC1xF0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IrvCc/f5kGLtRx6LbZPgqE45lseVlFMPAdfE77+O7xNbA9ZnS1AXQagUZYTkXY3OkmT9OeqQwe/ABVNmoGkuAPgY1QYha16PfJMDiZUniBK3GUrFyc8PN6cSHm6TjHif5yM415v7NQMdpV/9df7kcxxikdmIvnQ7x3FQcuXusGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=ihOCk3pr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jeAdMkyP; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id A2FC9114014B;
	Fri,  5 Jul 2024 10:17:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 05 Jul 2024 10:17:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1720189037; x=1720275437; bh=7R
	O+MTkGcDJKgN6KlbDx7YR+VtmqHM5rQXYYsbr80ZA=; b=ihOCk3prBk9+VP2PHy
	JNTnw8VXXc+iEZcAdmfTPzxTauhz41h7qZIAYNaPq+p0Sg/fa3n6CuRh2rGaRf3d
	QTWT/Bw4m0mQ8ICwQ7wejIYx7fTzkCIRA3Ojkj/vsBJa68ikdzswh7W/cePWBdxI
	+qSxI3UsDcnlirYd9LC5p5evkK6sh3i7PgvtZ7i87/fsi278B2MaIkXQRA2SkcFA
	iir8X7BRrMKKXT6FqJ6SSavWpavo3pLvoXn4gpxesjg9gslYqSI+ShuH2hsUDZL+
	wTCQTO3gvdGqZ2tFJiEVwTa4y4yqObzKr8kN57qx07Fh+upu9LfkgP4prul4Xl7u
	h7Tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1720189037; x=1720275437; bh=7RO+MTkGcDJKg
	N6KlbDx7YR+VtmqHM5rQXYYsbr80ZA=; b=jeAdMkyPwsrcEv83W8wFD5Svuvske
	RHLNk1kCSaSE5CCkdffjCxh5c4ozhVOD022vA+hvCfccrj4ehkQdDldyYFSihlyt
	SamBgFszFHd/AlHdKo9viYyHBs6W3d2sfHJfcdgJrRF829kBA0hjVl+dhUzphaHX
	N1UzPLTSjE8/TTMka8Q/GCbFn83eArFtrodgK6NJ9Sw5AcDoVgwjjSBclvhyfSDE
	QeOtNDFWVsVV5nSGC3POO9PGc93vuKwhu4GFEFqFcjq0tQG5iz3pnZ7nRBtyfDIQ
	AwkEKq1f3LKvZWleKoe9+4Tbuu5aNF3Ac8cEPuAhbJKpmnjgYld7WgUVQ==
X-ME-Sender: <xms:bACIZosAYQKia0iHXWDmAEoeWAXG034OgVmL1Dv47sOs7cGsukfvug>
    <xme:bACIZlc55Hs9XYlwXNfDUM8Eik3NmUQZfWThuNaB8m9xSb8n6-JD-ZDM0HFtzUzDI
    FtNBE0_x4rXKZoZYEQ>
X-ME-Received: <xmr:bACIZjzsRBFCKpIizpZ5LHnA516NLsfJy5d-OIsWCzuYIGb3WkbV3_hYFvzkz0vlr6I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddugdejfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheplfhirgiguhhn
    ucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenucggtf
    frrghtthgvrhhnpefgveffjeetgeejfeelgfekteelkefhuefggedvueeujeekjeetkeek
    vdffffefudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhl
    hihgohgrthdrtghomh
X-ME-Proxy: <xmx:bACIZrPpyVqCD4S6PsS_eFYh9isjAN_WXLXeVZGhZqan0hB2idAUEg>
    <xmx:bACIZo8XN_fi_QacwtxPKl0171OEmb7YE2FHawVmOzms91VzwDZnpg>
    <xmx:bACIZjUeWvyua12NWAHtDLygtjwKax_VkI_9X5vR9UhgdX1ZHOTakg>
    <xmx:bACIZhcM_Krgd6_4edLYi_M3PXwlsT_YoIpal0EgtqaymdY7ox-WzQ>
    <xmx:bQCIZp2rXhBuZd-94KAw5czZGvsNH3i_Ml57Yk6pQ0YJIGcNPkGAi5Eb>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jul 2024 10:17:13 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 00/10] MIPS: IPI Improvements
Date: Fri, 05 Jul 2024 22:16:52 +0800
Message-Id: <20240705-b4-mips-ipi-improvements-v2-0-2d50b56268e8@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFUAiGYC/42NQQqDMBBFryKz7hQTJdquvEdxoXGiA40JiYSKe
 PemnqDL9+C/f0CkwBThWRwQKHFkt2aQtwL0MqwzIU+ZQZayLpVQONZo2Udkz8jWB5fI0rpFNK1
 u1SgmrZoG8twHMvy50q8+88Jxc2G/npL42T+iSWCJVFVStY0R6iE7895nN2x37Sz053l+AU1AB
 q7CAAAA
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Serge Semin <fancer.lancer@gmail.com>, Paul Burton <paulburton@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2940;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=WNu6YnIpjmhZP5sFZYTEwWoNdzLX/he1ifvQopC1xF0=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrQOhvTEuaUSqyTMo5/dfa54ZulMrmc/lB3evXmd6W77s
 nzr7t83O0pZGMS4GGTFFFlCBJT6NjReXHD9QdYfmDmsTCBDGLg4BWAikicZGVr7c+pNXON4rln+
 Mnqzw/Zz0XO+C8J3DWxqrI5qtXDdE2VkuJ79/OnusukbVtSFxF3UcT/f6L1quY2TcKBc627daTZ
 beAE=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Hi all,

This series improved general handling to MIPS IPI interrupts, made
IPI numbers scalable, and switch to IPI-MUX for all GERNERIC_IPI
users on mux.

It is a prerequisite for enabling IRQ_WORK for MIPS.

It has been tested on MIPS Boston I6500, malta CoreFPGA3 47K MT/
interAPtiv MPF, Loongson-2K, Cavium CN7130 (EdgeRouter 4), and an
unannounced interaptiv UP MT platform with EIC.

I don't really know broadcom platforms and SGI platforms well so
changes to those platforms are kept minimal (no functional change).

Please review.
Thanks

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Changes in v2:
- Build warning fixes
- Massage commit messages
- Link to v1: https://lore.kernel.org/r/20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com

---
Jiaxun Yang (10):
      MIPS: smp: Make IPI interrupts scalable
      MIPS: smp: Manage IPI interrupts as percpu_devid interrupts
      MIPS: smp: Provide platform IPI virq & domain hooks
      MIPS: Move mips_smp_ipi_init call after prepare_cpus
      MIPS: smp: Implement IPI stats
      irqchip: irq-mips-gic: Switch to ipi_mux
      MIPS: Implement get_mips_sw_int hook
      MIPS: GIC: Implement get_sw_int hook
      irqchip: irq-mips-cpu: Rework software IRQ handling flow
      MIPS: smp-mt: Rework IPI functions

 arch/mips/Kconfig                     |   2 +
 arch/mips/cavium-octeon/smp.c         | 111 ++++++------------
 arch/mips/fw/arc/init.c               |   1 -
 arch/mips/generic/irq.c               |  15 +++
 arch/mips/include/asm/ipi.h           |  71 ++++++++++++
 arch/mips/include/asm/irq.h           |   1 +
 arch/mips/include/asm/irq_cpu.h       |   3 +
 arch/mips/include/asm/mips-gic.h      |  10 ++
 arch/mips/include/asm/octeon/octeon.h |   2 +
 arch/mips/include/asm/smp-ops.h       |   8 +-
 arch/mips/include/asm/smp.h           |  42 +++----
 arch/mips/kernel/irq.c                |  21 ++++
 arch/mips/kernel/smp-bmips.c          |  43 ++++---
 arch/mips/kernel/smp-cps.c            |   2 +
 arch/mips/kernel/smp-mt.c             |  70 +++++++++++
 arch/mips/kernel/smp.c                | 213 +++++++++++++++++++++-------------
 arch/mips/loongson64/smp.c            |  52 +++++----
 arch/mips/mm/c-octeon.c               |   3 +-
 arch/mips/sgi-ip27/ip27-smp.c         |  15 ++-
 arch/mips/sgi-ip30/ip30-smp.c         |  15 ++-
 arch/mips/sibyte/bcm1480/smp.c        |  19 +--
 arch/mips/sibyte/sb1250/smp.c         |  13 ++-
 drivers/irqchip/Kconfig               |   2 +-
 drivers/irqchip/irq-mips-cpu.c        | 180 ++++++++--------------------
 drivers/irqchip/irq-mips-gic.c        | 213 +++++++++++++---------------------
 25 files changed, 596 insertions(+), 531 deletions(-)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240616-b4-mips-ipi-improvements-f8c86b1dc677

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


