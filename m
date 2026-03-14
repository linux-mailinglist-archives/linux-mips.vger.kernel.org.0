Return-Path: <linux-mips+bounces-13629-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKQLKtGMtWmN1wAAu9opvQ
	(envelope-from <linux-mips+bounces-13629-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 14 Mar 2026 17:29:05 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FAA28DE13
	for <lists+linux-mips@lfdr.de>; Sat, 14 Mar 2026 17:29:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E87B63025282
	for <lists+linux-mips@lfdr.de>; Sat, 14 Mar 2026 16:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E272836B5;
	Sat, 14 Mar 2026 16:28:56 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B06272E56;
	Sat, 14 Mar 2026 16:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773505735; cv=none; b=WYzbsdl0ps83kGdadH0T+RzBR3Xy79Oi2TcqyCp1V1EdXROJdgbeffoMw+iGZMsDrxZ4ReqUJEAqfAuL5rBJ9Yrp9oQ/f0YmxkfGZDdXGX31JwjbzkMyKzAe+RlneXKMbKi0qkr2MFpomHhghSMMeKReRg0SPc38jIcDVqHtp4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773505735; c=relaxed/simple;
	bh=fFVepg2Wl75Yf2JJDEIXm+4/5C5inV2EAKG0Z/pf/I4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ixDD6ujffMNtK2e+uiNXlRLIHrsY3MTlniDIK9MmvQJGRc0TNw47RE3tYEw1drwkhmgNcquciPoolAbqGdIyJi7zdCaFJTcpcfRRlrquX4/kqE5e1agqzUrbQpsQMYVbKI38SMm+M6ISZS6l4TIcdCUTJjXBjiNmph+Nicb92OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.43])
	by APP-03 (Coremail) with SMTP id rQCowAB3ktmwjLVpHpqpCg--.41252S2;
	Sun, 15 Mar 2026 00:28:34 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Icenowy Zheng <uwu@icenowy.me>,
	Yao Zi <me@ziyao.cc>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v3 0/8] Add support for LS7A LPC IRQ for MIPS Loongson systems
Date: Sun, 15 Mar 2026 00:28:20 +0800
Message-ID: <20260314162828.1055188-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAB3ktmwjLVpHpqpCg--.41252S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFy3KrWkuFyfJw48Ar4xJFb_yoW5JF1Up3
	y3u3W3tr48JFW7C3saya48ZryfZFWfJa9rGanxXr17X3s0gF9Fg3WYyFs8XrW7Crs3Xw1j
	vFy093WUWFyjkaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13629-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iscas.ac.cn:mid]
X-Rspamd-Queue-Id: 56FAA28DE13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patchset tries to add support for Loongson 7A1000 PCH's LPC
interrupt controller to MIPS-based Loongson systems.

LPC, from software's perspective of view, is just ISA, so the interrupts
should be handled as legacy ones occupying the lowest 0-15 IRQ numbers.
Despite the current PCH LPC driver for ACPI-based LoongArch Loongson
machines handled it, the setup is fragile and depends on its specific
setup sequence (allocating the LPC IRQs first, and then allocate the
parent IRQ at PCH PIC). The refactor of extracting parent IRQ allocation
breaks this fragile sequence, so the first two commits is created to
address this issue (by reserving ISA interrupts from the dynamic
allocation space).

Then the remaining commits are just adding OF(DT) based initialization
of PCH LPC interrupt controller, like what happened on PCH PIC.

Tested on a Haier Boyue G51 system with legacy i8042 keyboard/mouse as
integrated ones.

Changes in v3:
- Override arch_dynirq_lower_bound() in MIPS Loongson64 / LoongArch
  instead of modifying the global version of function.
- Added Rob's R-b to the binding patch.

Changes in v2:
- Rebased on top of `irq-drivers-2026-02-09` tag.
- Compatible changed to `loongson,ls7a-lpc` .
- Merged the patch for conditionally build of ACPI code to the patch
  introducing OF code.
- Sorted function variable definitions.
- Reworded some commit messages as Thomas Glexiner suggests.
- Added __init to the LPC irqchip OF initialization code to prevent
  section mismatch.

Icenowy Zheng (8):
  MIPS: loongson64: Override arch_dynirq_lower_bound to reserve LPC IRQs
  LoongArch: Override arch_dynirq_lower_bound to reserve LPC IRQs
  dt-bindings: interrupt-controller: add LS7A PCH LPC
  irqchip/loongson-pch-lpc: extract non-ACPI-related code from ACPI init
  irqchip/loongson-pch-lpc: add OF init code
  irqchip/loongson-pch-lpc: enable building on MIPS Loongson64
  MIPS: Loongson64: dts: sort nodes
  MIPS: Loongson64: dts: add node for LS7A PCH LPC

 .../loongson,pch-lpc.yaml                     | 52 +++++++++++
 arch/loongarch/kernel/irq.c                   |  6 ++
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     | 17 +++-
 arch/mips/loongson64/init.c                   |  6 ++
 drivers/irqchip/Kconfig                       |  1 -
 drivers/irqchip/irq-loongson-pch-lpc.c        | 87 ++++++++++++++-----
 6 files changed, 144 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,pch-lpc.yaml

-- 
2.52.0


