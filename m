Return-Path: <linux-mips+bounces-13162-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULNzELVPjGkmlAAAu9opvQ
	(envelope-from <linux-mips+bounces-13162-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 11 Feb 2026 10:45:25 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD47122E0F
	for <lists+linux-mips@lfdr.de>; Wed, 11 Feb 2026 10:45:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D4D5301BCC2
	for <lists+linux-mips@lfdr.de>; Wed, 11 Feb 2026 09:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1D635D5F4;
	Wed, 11 Feb 2026 09:44:40 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CFE35D612;
	Wed, 11 Feb 2026 09:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770803079; cv=none; b=kjRiPhUn0xYhrprImndPHBQ8nqJkAqH0qUZEkPP6xi/FcpeLkQPwRfjsVlFRF9mwGJtOzJfTRanUNPUbb2e9WOyoKolaN89JoH2S10TDmYEPtyX8QSFMdwY49oeKiNxrnn5HIHDaDEvaWhoonGAMZEAZy5Ry+DR7lQqyttpVs4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770803079; c=relaxed/simple;
	bh=J1qbu7/0uhg077I1uWZKsaMAmR3jRq08P7DU7hqbtZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sz984tdnrCXwBOYxYI/tyUIOH2jPgO1Koo9MgZ8bRoPW9CHWQ47io+MNAAgAp3V5eMdBbH39s17j1jr9ZcXbE2qg6FDOGNRb2uEfWxrqI5KnBL81EgdHEYSESxGSj3Rpz+UxgBgoP6ZG3nLgxz6O1SBK1d2fjXGsoEFdMPehzDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.168])
	by APP-01 (Coremail) with SMTP id qwCowAAHsm1rT4xph_KtBw--.27918S2;
	Wed, 11 Feb 2026 17:44:13 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Yao Zi <me@ziyao.cc>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v2 0/7] Add support for LS7A LPC IRQ for MIPS Loongson systems
Date: Wed, 11 Feb 2026 17:44:01 +0800
Message-ID: <20260211094408.3463916-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAHsm1rT4xph_KtBw--.27918S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFy3KrWkuFyfJw48Ar4xJFb_yoW8tFy5pa
	y3C3Wftr48JrW7C3s3Aa48Wr1rAFZ5JFsrGanxtr17X3s8WF92gF17KFn8XrW7Cr9aq3Wj
	vry093WUWFyjk3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	TAGGED_FROM(0.00)[bounces-13162-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BAD47122E0F
X-Rspamd-Action: no action

This patchset tries to add support for Loongson 7A1000 PCH's LPC
interrupt controller to MIPS-based Loongson systems.

LPC, from software's perspective of view, is just ISA, so the interrupts
should be handled as legacy ones occupying the lowest 0-15 IRQ numbers.
Despite the current PCH LPC driver for ACPI-based LoongArch Loongson
machines handled it, the setup is fragile and depends on its specific
setup sequence (allocating the LPC IRQs first, and then allocate the
parent IRQ at PCH PIC). The refactor of extracting parent IRQ allocation
breaks this fragile sequence, so the first commit is created to address
for this issue (by reserving ISA interrupts from the dynamic allocation
space).

Then the remaining commits are just adding OF(DT) based initialization
of PCH LPC interrupt controller, like what happened on PCH PIC.

Tested on a Haier Boyue G51 system with legacy i8042 keyboard/mouse as
integrated ones, and patchset v1 is regression tested by Yao Zi on a
LoongArch laptop with similar legacy i8042 via LPC.

Changes in v2:
- Rebased on top of `irq-drivers-2026-02-09` tag.
- Compatible changed to `loongson,ls7a-lpc` .
- Merged the patch for conditionally build of ACPI code to the patch
  introducing OF code.
- Sorted function variable definitions.
- Reworded some commit messages as Thomas Glexiner suggests.
- Added __init to the LPC irqchip OF initialization code to prevent
  section mismatch.

Icenowy Zheng (7):
  genirq: reserve NR_IRQS_LEGACY IRQs in dynirq by default
  dt-bindings: interrupt-controller: add LS7A PCH LPC
  irqchip/loongson-pch-lpc: extract non-ACPI-related code from ACPI init
  irqchip/loongson-pch-lpc: add OF init code
  irqchip/loongson-pch-lpc: enable building on MIPS Loongson64
  MIPS: Loongson64: dts: sort nodes
  MIPS: Loongson64: dts: add node for LS7A PCH LPC

 .../loongson,pch-lpc.yaml                     | 52 +++++++++++
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     | 17 +++-
 drivers/irqchip/Kconfig                       |  1 -
 drivers/irqchip/irq-loongson-pch-lpc.c        | 87 ++++++++++++++-----
 kernel/softirq.c                              |  2 +-
 5 files changed, 133 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,pch-lpc.yaml

-- 
2.52.0


