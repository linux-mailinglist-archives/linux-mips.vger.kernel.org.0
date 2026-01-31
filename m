Return-Path: <linux-mips+bounces-13062-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bo4qMGTPfWlQTwIAu9opvQ
	(envelope-from <linux-mips+bounces-13062-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 31 Jan 2026 10:46:12 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21030C1633
	for <lists+linux-mips@lfdr.de>; Sat, 31 Jan 2026 10:46:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0A48300B077
	for <lists+linux-mips@lfdr.de>; Sat, 31 Jan 2026 09:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7A92EA73D;
	Sat, 31 Jan 2026 09:46:07 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369ED21D3F5;
	Sat, 31 Jan 2026 09:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769852767; cv=none; b=giXtbtdyj65AY42muy+3FX2pKxS1M4HVJaSww3aUcy9WMpAR7XO0je0x8WYVt7IYGYq5L46eJxidXbAliTWa4OMvSRYSlzfo3jv/gkrKxImWY4iKxDbEdiiYAJYkUY/KxRSLlRLoosVT6Zl2nh9/mfrbhjDktAxDKJlvIN70A6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769852767; c=relaxed/simple;
	bh=JON1t9ASgos+dJNVQ057s+nR9haUTNxsvNUYH/Agmzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BvT9vDnT9omc1/tqbQIEzpZSOWEIbkOh93DjcnajTdBmm/MfwrNo8ytCJ/YmfIEkHTRJ3y3UiFwJDybpm0T3PYFqMjf1dfoymwASkJPgmBPcaIcKU6WRkpcy3SfSXfcmHPoCfQXXsr7P8LtSVvYWGFPEbg42VqdlzKRC4n+VezI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.235])
	by APP-05 (Coremail) with SMTP id zQCowAC3Sw9Rz31p9UgiBw--.57463S2;
	Sat, 31 Jan 2026 17:45:54 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH 0/8] Add support for LS7A LPC IRQ for MIPS Loongson systems
Date: Sat, 31 Jan 2026 17:45:39 +0800
Message-ID: <20260131094547.455916-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAC3Sw9Rz31p9UgiBw--.57463S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF4UGrW3Jw4xJF13urWfKrg_yoW8CFy7pF
	Wak3WSgr48CrW7CryfA3WFgr13AFZ5JFsrKwsxt3WIgrZ5Was2g3W7AFs8ZrW3Ar9Iq3Wj
	vry0g3W7WFyakaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13062-lists,linux-mips=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iscas.ac.cn:mid]
X-Rspamd-Queue-Id: 21030C1633
X-Rspamd-Action: no action

This patchset tries to add support for Loongson 7A1000 PCH's LPC IRQ
controller to MIPS-based Loongson systems.

LPC, from software's perspective of view, is just ISA, so the IRQs
should be handled as legacy ones occupying the lowest 0-15 IRQ numbers.
Despite the current PCH LPC driver for ACPI-based LoongArch Loongson
machines handled it, the setup is fragile and depends on its specific
setup sequence (allocating the LPC IRQs first, and then allocate the
parent IRQ at PCH PIC). The refactor of extracting parent IRQ allocation
breaks this fragile sequence, so the first commit is created to address
for this issue (by reserving ISA IRQs from the dynamic IRQ allocation
space).

Then the remaining commits are just adding OF(DT) based initialization
of PCH LPC IRQ controller, like what happened on PCH PIC.

Tested on a Haier Boyue G51 system with legacy i8042 keyboard/mouse as
integrated ones. I don't own a LoongArch-based device with LPC
peripherals, so test on LoongArch machines are welcomed.

Icenowy Zheng (8):
  genirq: reserve NR_IRQS_LEGACY IRQs by default
  dt-bindings: interrupt-controller: add LS7A PCH LPC
  irqchip/loongson-pch-lpc: extract non-ACPI-related code from ACPI init
  irqchip/loongson-pch-lpc: guard ACPI init code with CONFIG_ACPI
  irqchip/loongson-pch-lpc: add OF init code
  irqchip/loongson-pch-lpc: enable building on MIPS Loongson64
  MIPS: Loongson64: dts: sort nodes
  MIPS: Loongson64: dts: add node for LS7A PCH LPC

 .../loongson,pch-lpc.yaml                     | 52 +++++++++++
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     | 17 +++-
 drivers/irqchip/Kconfig                       |  1 -
 drivers/irqchip/irq-loongson-pch-lpc.c        | 86 ++++++++++++++-----
 kernel/softirq.c                              |  2 +-
 5 files changed, 132 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,pch-lpc.yaml

-- 
2.52.0


