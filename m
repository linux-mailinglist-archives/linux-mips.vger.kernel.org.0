Return-Path: <linux-mips+bounces-13854-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIY/BFdjvmnDOAMAu9opvQ
	(envelope-from <linux-mips+bounces-13854-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2026 10:22:31 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 793152E4604
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2026 10:22:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8399B305EBA8
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2026 09:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88D2361647;
	Sat, 21 Mar 2026 09:20:55 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA17C35A39B;
	Sat, 21 Mar 2026 09:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774084855; cv=none; b=qxxDJh24ODkYDY45H2X/85yRxkMgQzAslEhXzAv1OVG5RriH1QT4OfZ2gpuN+chKhmg4sxNXTaXDEEbyS+ioooPUF/+9McGYZ9vdXJxKB1eH4XDI+IU63NJSfMCPQgDmPpas+wZDTNvM83cwnECZ+q+rMBul7YFTA1Ogvh6Xak0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774084855; c=relaxed/simple;
	bh=CkKzfm3iwO2EnwTvtdJ9y0D1FjOBc86Yi5K1XFh5vE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J/F9klwWhMlO80Ju26ynHkXoD7QzU8D+2kEJQtt7ZB1a58HKyEgv+eewf+LmyIVdah40IorZb4fo6vPrA8HMTI8fgEJJ93v1O7Ey4jBnU/lP6UclouGM8F5R+tL2WoV4xyb/ES6O/Lew0jw6yCcw+WPljkbLbab00JtIpztid7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.202])
	by APP-01 (Coremail) with SMTP id qwCowAA33mnjYr5p3aWyCg--.465S2;
	Sat, 21 Mar 2026 17:20:36 +0800 (CST)
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
	linux-mips@vger.kernel.org
Subject: [PATCH v4 0/6] Add support for LS7A LPC IRQ for MIPS Loongson systems
Date: Sat, 21 Mar 2026 17:20:26 +0800
Message-ID: <20260321092032.3502701-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAA33mnjYr5p3aWyCg--.465S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCFWDAr43GFW8ZF1DZFyrJFb_yoW5XFy3pr
	W3u3Zxtr48JrW7C3saq3y8ZryfZFZ3Ga9rWanIqw17u39xWF92gFWYyFZ8ZrW3Jrs3Ww12
	qFy093W8WFyjkaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvGb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
	wI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjxUqiFxDUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13854-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,iscas.ac.cn:mid,icenowy.me:email]
X-Rspamd-Queue-Id: 793152E4604
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Icenowy Zheng <uwu@icenowy.me>

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
integrated ones, with some additional patches adding the PCH LPC device
node to the ls7a-pch.dtsi file.

Changes in v4:
- Removed "IRQ" acronym from detailed commit messages (but still kept
  in summary phrases for the length constraint).
- Re-format some patch to utilize 100 columns instead of 80.
- Temporarily removed the DT patches for fitting the whole patchset into
  the irqchip tree.

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

Icenowy Zheng (6):
  MIPS: loongson64: Override arch_dynirq_lower_bound to reserve LPC IRQs
  LoongArch: Override arch_dynirq_lower_bound to reserve LPC IRQs
  dt-bindings: interrupt-controller: add LS7A PCH LPC
  irqchip/loongson-pch-lpc: Extract non-ACPI-related code from ACPI init
  irqchip/loongson-pch-lpc: Add OF init code
  irqchip/loongson-pch-lpc: Enable building on MIPS Loongson64

 .../loongson,pch-lpc.yaml                     | 52 +++++++++++
 arch/loongarch/kernel/irq.c                   |  6 ++
 arch/mips/loongson64/init.c                   |  6 ++
 drivers/irqchip/Kconfig                       |  1 -
 drivers/irqchip/irq-loongson-pch-lpc.c        | 92 +++++++++++++++----
 5 files changed, 136 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,pch-lpc.yaml

-- 
2.52.0


