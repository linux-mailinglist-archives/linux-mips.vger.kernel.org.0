Return-Path: <linux-mips+bounces-5399-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 223709701FA
	for <lists+linux-mips@lfdr.de>; Sat,  7 Sep 2024 13:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CA31283797
	for <lists+linux-mips@lfdr.de>; Sat,  7 Sep 2024 11:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98DE158861;
	Sat,  7 Sep 2024 11:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="HBFu0ijK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DYiS5ayR"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBD328E8;
	Sat,  7 Sep 2024 11:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725709699; cv=none; b=bJurF+jQh/nJf6dnio946sJjXWh9LD5CGHD+rfP8RBUp3IWqA9F8i10g0tGPd4phIcQzqDesgZ1dtYcVAtiZ86wqzHVSAe41bWVLy0QGbltPml2rPgUfeEgjA5YFuBZSfIk8VOvIVydjgxr3DFwBan3pop9cNL2eD+1wM9l5/ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725709699; c=relaxed/simple;
	bh=PmAGKSwGl76zi+G1PbtMvOPAuS89QgMjreCZ4L6IRNU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=POQNEm5jc4mCv2qCKDItaGCpJsqT7ZyRgasdbGfX9mbooTacEoWbYWIqpWV3lOfE8Df3GfZzGMBDUCgL9EXFBL154zd4d3ak79N3j/u15nRN3ExCsb4hQF0sZk2s4dPnPX5XFQw7yWf5aRMVky5fp1fVzruPKmZgTS0FuA1K/Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=HBFu0ijK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DYiS5ayR; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DDECB114037E;
	Sat,  7 Sep 2024 07:48:16 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Sat, 07 Sep 2024 07:48:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1725709696; x=1725796096; bh=oM
	+8W7fOIoXuQyMhY1HkpQFNYcEtKU3/NYEG9W20KVg=; b=HBFu0ijKTBrrqSM4id
	Pd6I1dRwAIzMcoNIclpuLUeuT910V1M+q6EPGOULWCWUItFyX7JbSN+6/6dBllm1
	9FjrA+8Hz38kqrCZ89b1jAs+wd0EDGkrxLTYAJvVBBMmLzKvdPk2kHqgm0ew2uvD
	LNfvdLeLE8xcDqL6EN5p8FJTIC52/INyC4PU/yvarcBrWyRHJ8bZREwkXtjO61GB
	U98CzXBeEJjooOpvsPzqV9TQ/5N8yOkL/3kD/OLqhMCMo34Jde/jeVT+1qmXXQE7
	Gs7r7JElkpJicDLNMKD09DNQjC3HBvqGHtNxZSCyVAptyZl8ZyOj8gb9M086J1Wz
	eqYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1725709696; x=1725796096; bh=oM+8W7fOIoXuQ
	yMhY1HkpQFNYcEtKU3/NYEG9W20KVg=; b=DYiS5ayRCjyldKh9SHUFcsNj/L0C3
	f1clSZY+0yxqKvbLaSslgXoi59eaI3DJJcX2tA7+P8IZJVpbBsAztVXkqL9pOCDu
	YqcVmIufYaQwHHshwcjriw6/9K3FpEtzRgQBNPWXvLU24q5peNvb1ywhCqAeck60
	+xHhe/8TBqoH3pXpptogUbCQXI5kTdErqJ0VLBEPBSgs2fWLxpQZMimTzcOI3Hgk
	PDwQOWYYhd6TBRsVGSqDLCd7+WVmMBAi0/rBy94rE80/cHYs1usyVfJVFlAQ3R+Y
	YCu4M7brSTg6Zdf8fsZenBAo7gRMMy6xH5OisM3ztRdcbfrCpCCIqf2uw==
X-ME-Sender: <xms:gD3cZne00ORSJCT9iJiXFUsbauK85Uu9WpWJF0CINvXcBcq2vO4XyQ>
    <xme:gD3cZtPcqcbwaT_XvYCGwFj4T39ud5Amgpb_lMfi2KWEJwCdMIg76v7YpBVe88WAm
    VY32YKZw9cmkwpal-4>
X-ME-Received: <xmr:gD3cZgjwnLb1NvvgiuMJVYPTXeRySt3mQf45kb6LjKYd_NuJBNREM4e-bCsjv6IfvLQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeifedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecu
    hfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomheqnecuggftrfgrthhtvghrnhepgfevffejteegjeeflefgkeetleekhfeu
    gfegvdeuueejkeejteekkedvfffffedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgr
    gihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphhtthhopedutddpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepsggtmhdqkhgvrhhnvghlqdhfvggvuggs
    rggtkhdqlhhishhtsegsrhhorggutghomhdrtghomhdprhgtphhtthhopehtghhlgieslh
    hinhhuthhrohhnihigrdguvgdprhgtphhtthhopehjihgrgihunhdrhigrnhhgsehflhih
    ghhorghtrdgtohhmpdhrtghpthhtoheptghhvghnhhhurggtrghisehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehprghulhgsuhhrthhonheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepfhhlohhrihgrnhdrfhgrihhnvghllhhisegsrhhorggutghomhdrtghomhdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehfrghntggvrhdrlhgrnhgtvghrsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:gD3cZo_PvDziGpjTCQy9oUstsL86cpYurSrJ5N1zVYCISuUEbgFm2A>
    <xmx:gD3cZjue9hT6f7ctMgX2Ywx3229hzpu0CXaA2K6A3ME0QhRND6iSUw>
    <xmx:gD3cZnH9dAhsl8zVfkFWBgVzNuMm4C9CfiPmF34urYnjr_cmd-EQug>
    <xmx:gD3cZqMATcp2dUp0IEC3Muq1rdI8TxmlhEDgjOWFuwMnKmPpeRAJuQ>
    <xmx:gD3cZkk1_aJlldjXDbwuZAbv4nM6-tYMkQElJauasrXYY7Ax2OeXOkbA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Sep 2024 07:48:14 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v4 00/10] MIPS: IPI Improvements
Date: Sat, 07 Sep 2024 12:48:06 +0100
Message-Id: <20240907-b4-mips-ipi-improvements-v4-0-ac288f9aff0b@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHY93GYC/43NQQrCMBCF4atI1kaSaZpEV95DXNh0ogO2KUkJF
 undTbsREcTl/2C+ebKEkTCxw+bJImZKFPoSarth7nbpr8ipLc1AgBJaat4o3tGQOA3EqRtiyNh
 hPyburbO6ka3TxrByPkT09Fjp07n0jdIY4rR+ynJZ/0Cz5IJjVYG2xku9h6O/T9dwGXcudGxhM
 7wpI+ofFBQK2lo0tS4c2m+qelNWih9UVSgJoHxrnBJ7/UnN8/wC3PYlblgBAAA=
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Serge Semin <fancer.lancer@gmail.com>, Paul Burton <paulburton@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3307;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=PmAGKSwGl76zi+G1PbtMvOPAuS89QgMjreCZ4L6IRNU=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrQ7tnX3ZEJfGwvc/v49V3cn+7YLVrxzDHIn9NSralyI6
 368njuxo5SFQYyLQVZMkSVEQKlvQ+PFBdcfZP2BmcPKBDKEgYtTACZSuJmRYT3vXdVsCf6gLAfx
 MPeQD2tSJc5kJvBv0nISCdMtfZBWzPDP7FPf25f1pssvLDS45nRm3UT2/1rFq6V+HUl6nlV79mM
 MJwA=
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


