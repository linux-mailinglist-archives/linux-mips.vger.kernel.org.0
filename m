Return-Path: <linux-mips+bounces-9500-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90773AEA1D0
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 17:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C375C1C436E4
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 14:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7772F4305;
	Thu, 26 Jun 2025 14:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="czaI2DSB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="psVI2LjH"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF612F3C13;
	Thu, 26 Jun 2025 14:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949372; cv=none; b=K+tlh465XTOJpbP+yJ/AZyADOmwl698jHefY94Wv/1uIlIruaBHvsP18+3NKqMm6vmKwi/l3xJ1voVMhM8lP2OUo9Co5S+zF9RvYe0iFUVGWraTgm7/FG85/S4NWLf0SFx7vzdQOjV9qVt0fHyezbwnhuDgOfQ+M4Oit8o3H2NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949372; c=relaxed/simple;
	bh=3c7vs8Cm8xKVUdvXoMQb0+CBp/UzsXS8rN6WJvQ1oek=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kNemfdeH/j4yrcp80TsvP/4UkzJysMbjqTxZbsZJvnN0WWh9WLMtNclawhd/EkfgcTjXqvZBfILq4GpTgYRoUoH9jUVpf30tKdz8zlFg9wWYyHHLmhPEd1gCxzXRhXBU+P9rSxAmAh8s/8r7QWKjGRZCC63jUHTMzs6ELBD1fKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=czaI2DSB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=psVI2LjH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RH4Oypq2KUDQkhJZzAt8JVIWri/iIyk+GulHVMw8GJw=;
	b=czaI2DSBz6lv453TNMwhAu26IwFz1BOoWFI49qdBHgvJndJ7A+gK6ojqrK1HnfjGXuz17+
	4Wuz0KYBKa1I2pk0/mfDJJxSnvY+p4Wbmm+IbJlukddbCxUshXcBP3t7CpmcasNzvVQxX4
	VtMF9rbnmKc1lfvRsU2yYmsCdDudNWLz2KQmA8rUpwvP9biyrYKuUnw/fYWwfdAcqQiHPG
	skQFntKLytgiyj9iW2LuPqkkbcC8f3R5e6b8EiH3LFRbcpKEOVGcj+NZ1uK/PlcKWvwF4H
	66+ARZm2c8+m5rMvuG2rTeAkaK6QYZRQBKiVct0HkLubGJWu7G9hY3zRpXFUQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RH4Oypq2KUDQkhJZzAt8JVIWri/iIyk+GulHVMw8GJw=;
	b=psVI2LjHAPIUXeFXC3qVXazEejx7vgLn8YmfK3c6xPNOeqTwCFROQJgUanCk0avAHuqWR5
	SEtZrEmwxGV9x1DA==
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Antoine Tenart <atenart@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 00/12] irqchip: MSI cleanup and conversion to MSI parent domain
Date: Thu, 26 Jun 2025 16:48:57 +0200
Message-Id: <cover.1750860131.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The initial implementation of PCI/MSI interrupt domains in the hierarchical
interrupt domain model used a shortcut by providing a global PCI/MSI
domain.

This works because the PCI/MSI[X] hardware is standardized and uniform, but
it violates the basic design principle of hierarchical interrupt domains:
Each hardware block involved in the interrupt delivery chain should have a
separate interrupt domain.

For PCI/MSI[X], the interrupt controller is per PCI device and not a global
made-up entity.

Unsurprisingly, the shortcut turned out to have downsides as it does not
allow dynamic allocation of interrupt vectors after initialization and it
prevents supporting IMS on PCI. For further details, see:

https://lore.kernel.org/lkml/20221111120501.026511281@linutronix.de/

The solution is implementing per device MSI domains, this means the
entities which provide global PCI/MSI domain so far have to implement MSI
parent domain functionality instead.

Aside from that, the creation of MSI parent domains has been simplified by
new helper functions, which are not yet used by all drivers.

This series addresses this by:

   - Converting the remaining global PCI/MSI domain providers to MSI parent
     domains

   - Converting the existing MSI parent domain implementations to the
     simplified setup function

 drivers/irqchip/Kconfig                    |   3 +
 drivers/irqchip/irq-alpine-msi.c           | 155 ++++++++-------------
 drivers/irqchip/irq-armada-370-xp.c        |  48 ++++---
 drivers/irqchip/irq-bcm2712-mip.c          |  20 +--
 drivers/irqchip/irq-imx-mu-msi.c           |  14 +-
 drivers/irqchip/irq-loongson-pch-msi.c     |  25 ++--
 drivers/irqchip/irq-ls-scfg-msi.c          |  49 +++----
 drivers/irqchip/irq-riscv-imsic-platform.c |  12 +-
 drivers/irqchip/irq-sg2042-msi.c           |  20 ++-
 include/linux/irqdomain.h                  |   2 +
 include/linux/msi.h                        |   2 +
 kernel/irq/irqdomain.c                     |   1 +
 kernel/irq/msi.c                           |   3 +-
 13 files changed, 155 insertions(+), 199 deletions(-)

--=20
2.39.5


