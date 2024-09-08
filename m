Return-Path: <linux-mips+bounces-5416-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D19797066A
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 12:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AC5D1C20C3C
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 10:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3830414A0A0;
	Sun,  8 Sep 2024 10:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="Y0/xPvFs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E4rIQSNX"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8548E13BAC2;
	Sun,  8 Sep 2024 10:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725790820; cv=none; b=dKFtWo/73B6Qlis39GVOAnLlBCzQ6iCpdTXo9yFnYXzh+X6Zjm9toQtcO4n+Sduc8CTUIIfamuC53HkuB2sT2lLmUbXrid1r/VlK/FUuSaasdELD+vOeMw2LRz3z4Xhaolp6+54maJIb2OE/cgWBy+QT+pKaT2mLZnptjj2yZNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725790820; c=relaxed/simple;
	bh=aXx5MqD9+K2h3R9X1our/w8nZIq6lWFvAt9iZvdXlvM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qrnm1WpZS/fYZzOZDx4ip54sOilr3mLdaqL4zcNV8wNfRhpQ3mG/fRNPm8iOfzXD4BAq6l8yzHAvWPdXUoW3bY5+XTx+DuPP/ByCAtbvRQhJnrKorOpWRcxOdyLakVKuDnYT8BvpLiYgjtDfDds1crEmqVGkmFLefgcaEEbvDxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=Y0/xPvFs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E4rIQSNX; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 9439813802FB;
	Sun,  8 Sep 2024 06:20:17 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Sun, 08 Sep 2024 06:20:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1725790817; x=1725877217; bh=hQ
	oc5KrThSTJ0MbCp5+fBQzMyUtoQbboBi8fRtQIF/c=; b=Y0/xPvFsCJBS0UhkE9
	ZVv6whAno4NUP9TnMlYPXHo6oNs2prWgWLG2RVxCP6/ufW7HyQhVag0n0C5VSIYx
	A4/LcLmqLPJwkizyNxCNsX1SFwOZFDcNF7UBF+S9wfSbEw99zwPRDWCDk1z3XD/R
	PxcOwNglGk1a9F94WBRQ08qB5ZVmukxe7JU0kkA2LF//+6u31bX5C0jlrIC3xUcl
	w68r+onNihgjhRJb2yHAdXBZ/00Com1J/ebtUvnYPVQYuL5yiyt6U0vkemNeEdRa
	v8KtSgvyYaOmj5RBNG4lU9QevmZxc6Oc3rUazniUHTHI1TLKIQWFB3L6jj+JDEn3
	Thmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1725790817; x=1725877217; bh=hQoc5KrThSTJ0
	MbCp5+fBQzMyUtoQbboBi8fRtQIF/c=; b=E4rIQSNXmE+NMkh197BmW5X87Rk+L
	21tPQxrtiXRQ8UowpUX0nLWjT5BDKUUK6pddLX7YGv7pUlbUQXKlV6kPee9Z+zmv
	fLFj3WcfpCbxMrKJS52qFWh6i78Yr95u1gpomDcgqMNrOH+N6vZM+HWwmmdVRHe5
	gCpn3wfRE32qvDQywqJluOw6G5ZjrA8urb7+a4mRfXMOa35aMuoY91NDt+keGVZs
	SCGAQZfvtwb6oWnT3xIA2a32V9fiPUMJJoKnp/K6FaHASMxxKbU6gDWfQTLlgdZs
	i89CDel0OCJlRh5ITkTe/J5N01Jv4XyZZl/bwV5eYn7fBtoCu7tlWjgeQ==
X-ME-Sender: <xms:YXrdZhHocwjHOOhvHALpAV38vsVe5vamCS-_xOZcG6RfcpEC3ktDtQ>
    <xme:YXrdZmUxe7HeEx68phJN0IxXKxYpHPCZ1djZBb_WqVMQLiPdEtyuxm7k_488AMXQo
    4hbdLC7a03-hPrwhas>
X-ME-Received: <xmr:YXrdZjIeUVZRQjU9fDrUr7Px_8sNBZq4G41e3d9M2OtZBGzwT463PQh2TtyMecdvUuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeihedgvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecu
    hfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomheqnecuggftrfgrthhtvghrnhepgfevffejteegjeeflefgkeetleekhfeu
    gfegvdeuueejkeejteekkedvfffffedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgr
    gihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphhtthhopedutddpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepfhgrnhgtvghrrdhlrghntggvrhesghhm
    rghilhdrtghomhdprhgtphhtthhopehjihgrgihunhdrhigrnhhgsehflhihghhorghtrd
    gtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepfhhlohhrihgrnhdrfhgrihhnvghllhhisegsrhhorggutg
    homhdrtghomhdprhgtphhtthhopehprghulhgsuhhrthhonheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgt
    phhtthhopegstghmqdhkvghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghrohgrug
    gtohhmrdgtohhmpdhrtghpthhtoheptghhvghnhhhurggtrghisehkvghrnhgvlhdrohhr
    gh
X-ME-Proxy: <xmx:YXrdZnEzphg2kCA8MwZ2Ud9RM30Dp5XggUbCTVDGAMfSWsu_ZlucsA>
    <xmx:YXrdZnUxa3c238MbA8uYidEl5jAq5CGShhsbVqyJHDiij0nz00wADw>
    <xmx:YXrdZiPJ1bVNsp6DLEI5RNz7hZQb_C8bkfVhT_JVwhlKW_Gx3zYOeA>
    <xmx:YXrdZm2nnbc-yr-aDUwNZFUK2ijevNttRKxA1U1TWdGS5x7YZFaceQ>
    <xmx:YXrdZgMLBQIlOuZQ0823J-XF-W7wnm44vbgDPVbhFt8LEZ4qnCQTLMYu>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Sep 2024 06:20:16 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v5 00/10] MIPS: IPI Improvements
Date: Sun, 08 Sep 2024 11:20:11 +0100
Message-Id: <20240908-b4-mips-ipi-improvements-v5-0-be8617dd2e53@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFt63WYC/43NQWrDMBCF4asErasyGsuSnFXvUbqw5VEyUFtGM
 qIh+O5VsjElYLr8H8w3d5EpMWVxPt1FosKZ41yjfTsJf+3nC0keawsE1GCUkYOWEy9Z8sKSpyX
 FQhPNa5bBeWcGNXpjrajnS6LAP0/686v2lfMa0+35qajH+g+0KAmSmgaNs0GZDj/C9+0S+/Xdx
 0k82II7ZaE9oLBSOLYwtKZy5F6pZqecggOqqZRC1GG0XkNnXim9Ux3YA0pXqvfoXOj6EGD4S23
 b9gugvK3LowEAAA==
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Serge Semin <fancer.lancer@gmail.com>, Paul Burton <paulburton@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3467;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=aXx5MqD9+K2h3R9X1our/w8nZIq6lWFvAt9iZvdXlvM=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrS7VQnHq46VMJ28umC6gXXVfe6nc/4K3pgpcyjI8OPBN
 Ztd9zV3dJSyMIhxMciKKbKECCj1bWi8uOD6g6w/MHNYmUCGMHBxCsBENs9kZNjiUJGayqWUHKLM
 VOT75HXeFJl1KpEL71fabgtcu+9eZh3DX9lPGw4e/JF5Xnm6V86sgGiZuqwGc89nzW/f3iu9dHX
 5FS4A
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Hi all,

This series improved general handling to MIPS IPI interrupts, made
IPI numbers scalable, and switch to IPI-MUX for all GERNERIC_IPI
users on mux.

It is a prerequisite for enabling IRQ_WORK for MIPS.

It has been tested on MIPS Boston I6500, malta CoreFPGA3 47K MT/
interAptiv MPF, Loongson-2K, Cavium CN7130 (EdgeRouter 4), and an
unannounced interaptiv UP MT platform with EIC.

I don't really know broadcom platforms and SGI platforms well so
changes to those platforms are kept minimal (no functional change).

Please review.
Thanks

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Changes in v5:
- Actual v4, v4 was sent in mistake
- Link to v4: https://lore.kernel.org/r/20240907-b4-mips-ipi-improvements-v4-0-ac288f9aff0b@flygoat.com

Changes in v4:
- irqchip commit message and code style fixes (tglx)
- Link to v3: https://lore.kernel.org/r/20240810-b4-mips-ipi-improvements-v3-0-1224fd7c4096@flygoat.com

Changes in v3:
- Fix build errors reported by kernel test bot
- Rebasing to current next
- Link to v2: https://lore.kernel.org/r/20240705-b4-mips-ipi-improvements-v2-0-2d50b56268e8@flygoat.com

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
      irqchip/irq-mips-gic: Switch to ipi_mux
      MIPS: Implement get_mips_sw_int hook
      MIPS: GIC: Implement get_sw_int hook
      irqchip/irq-mips-cpu: Rework software IRQ handling flow
      MIPS: smp-mt: Rework IPI functions

 arch/mips/Kconfig                     |   2 +
 arch/mips/cavium-octeon/smp.c         | 111 ++++++-----------
 arch/mips/fw/arc/init.c               |   1 -
 arch/mips/generic/irq.c               |  15 +++
 arch/mips/include/asm/ipi.h           |  71 +++++++++++
 arch/mips/include/asm/irq.h           |   1 +
 arch/mips/include/asm/irq_cpu.h       |   3 +
 arch/mips/include/asm/mips-gic.h      |  10 ++
 arch/mips/include/asm/octeon/octeon.h |   2 +
 arch/mips/include/asm/smp-ops.h       |   8 +-
 arch/mips/include/asm/smp.h           |  41 +++----
 arch/mips/kernel/irq.c                |  21 ++++
 arch/mips/kernel/smp-bmips.c          |  43 ++++---
 arch/mips/kernel/smp-cps.c            |   2 +
 arch/mips/kernel/smp-mt.c             |  70 +++++++++++
 arch/mips/kernel/smp.c                | 213 ++++++++++++++++++++-------------
 arch/mips/loongson64/smp.c            |  24 ++--
 arch/mips/mm/c-octeon.c               |   3 +-
 arch/mips/sgi-ip27/ip27-smp.c         |  15 ++-
 arch/mips/sgi-ip30/ip30-smp.c         |  15 ++-
 arch/mips/sibyte/bcm1480/smp.c        |  19 +--
 arch/mips/sibyte/sb1250/smp.c         |  13 +-
 drivers/irqchip/Kconfig               |   2 +-
 drivers/irqchip/irq-mips-cpu.c        | 191 +++++++++---------------------
 drivers/irqchip/irq-mips-gic.c        | 217 +++++++++++++---------------------
 25 files changed, 590 insertions(+), 523 deletions(-)
---
base-commit: 61c01d2e181adfba02fe09764f9fca1de2be0dbe
change-id: 20240616-b4-mips-ipi-improvements-f8c86b1dc677

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


