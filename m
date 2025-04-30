Return-Path: <linux-mips+bounces-8885-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8585AA4DB8
	for <lists+linux-mips@lfdr.de>; Wed, 30 Apr 2025 15:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AA761BC4B71
	for <lists+linux-mips@lfdr.de>; Wed, 30 Apr 2025 13:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD9425DCF8;
	Wed, 30 Apr 2025 13:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="FAqiWrIA"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38A3254AE1;
	Wed, 30 Apr 2025 13:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746020506; cv=none; b=b3J25g/0Ff2x1FTHbSC3A6Cx/NPVq95zgVpT6Yb7RZGq7q2wczqL3G1u7ZqfPTUGsGFesuX9ac4zmJS7dPi4lohuYr74JXRx0fgOPILIydEA/8VujW+IR23JyWDatQ8YScNkyuAys5Wx3+Fa9K0EfFF5V2griyPdWoHoig+h0X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746020506; c=relaxed/simple;
	bh=LvMip3OfBr8sJvx4onRHGXMJc2kv9XIfa5+0XEBGYow=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kln1z+AhIaUt9K1SF4CMps58duvlCiGPrmlYCp0x99SylTrlsmZIROisCNj8rengmxw2Hw4c5fOcDfNFePe9CnPGjLxFJoSYA1SwcbUdqDXwL5HiZy18/dvLF/hOJ/aqJbSqkdgd9OVg6EznS6VS0mB9MXdiDbJe8dtQO+83x+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=FAqiWrIA; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F4EB90C65;
	Wed, 30 Apr 2025 15:34:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1746020087; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=/36ujSLIAfT1/bczMYnnhA2ecNfiw2Pfe9nP6xpk+jc=;
	b=FAqiWrIAIiODWGrPVUG5Vg9b+hG2ncDybQkKTcP2PcNzfpDKszMTRDNFNDqPVAmNrQG+XN
	IkfckDQOA7DFa0+HN33OxV/dA6/KLDmh71aNPWkV4OpJ9HVKh9iFF+VUEaErL1nr0f/Ygo
	ZWc/Rfy+kmWB/Mucvsr1vJcSPnzJLdIt87KbZQFlycctPGQtLIiredNBia3mDabaC1u16a
	IrpE4RfimtdY3WJlkzbxtX//dM8Q+n5Zs0G/OJ+5HCnf9Pd7uM0bLgyhj2guiouNQRS7NJ
	j7Y/cw72OlfZ4Z8bkpysxPqy/nUD6ATouCwOltQ74ppqVHApjODu63fSYsSqIg==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	linux-mediatek@lists.infradead.org,
	cjd@cjdns.fr
Subject: [PATCH v4 0/7] Add EcoNet EN751221 MIPS platform support
Date: Wed, 30 Apr 2025 13:34:26 +0000
Message-Id: <20250430133433.22222-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

EcoNet MIPS SoCs are big endian machines based on 34Kc and 1004Kc
processors. They are found in xDSL and xPON modems, and contain PCM
(VoIP), Ethernet, USB, GPIO, I2C, SPI (Flash), UART, and PCIe.

The EcoNet MIPS SoCs are divided broadly into two families, the
EN751221 family based on the 34Kc, and the EN751627 family based on
the 1004Kc. Individual SoCs within a family are very similar, only
with different peripherals.

This patchset adds basic "boots to a console" support for the EN751221
family and adds SmartFiber XP8421-B, a low cost commercially available
board that is useful for testing and development.

Note that Airoha (AN7523, AN7581) is similar to EcoNet in terms of
peripherals, and for historical reasons Airoha chips are sometimes
referred to with the EN75xx prefix. However this is a different
platform because Airoha chips are ARM based.

This patchset is against mips-next.

v3 -> v4
* Rebase to 3b3704261e851e25983860e4c352f1f73786f4ab
* Omit already accepted patches (thanks guys!):
  - https://patchwork.kernel.org/project/linux-mips/patch/20250330170306.2584136-2-cjd@cjdns.fr/
  - https://patchwork.kernel.org/project/linux-mips/patch/20250330170306.2584136-3-cjd@cjdns.fr/
  - https://patchwork.kernel.org/project/linux-mips/patch/20250330170306.2584136-4-cjd@cjdns.fr/

v2 -> v3
* econet,en751221-timer.yaml -> Improve code style
* vendor-prefixes.yaml -> Correct alphabetic order
* en751221.dtsi
  - interrupt-controller code style
  - serial: Explain reason for clock-frequency = <1843200>
* v3->v3 diff provided for reference
  - https://gist.github.com/cjdelisle/21c9f0cd225f499bdff3c574c7f185f2
* CC: linux-mediatek@lists.infradead.org who may be interested.

v1 -> v2
* Codestyle
  - Apply codestyle from "The tip tree handbook" and recommendations
  - Remove "_rai" and "_m" symbol suffixes which are not standard
* irq-econet-en751221.c
  - Use cleanup.h _guard() and _free()
  - Separate irq_domain_ops from irq_chip, eliminating econet_intc struct
  - Remove irqsave in econet_wreg, irqs are already disabled in mask/unmask
  - Add explainatory comments
  - Refactor shadow logic for clarity, e.g. INTC_NO_SHADOW -> NOT_PERCPU
  - Improve error handling in case of invalid DTS
* econet,timer-hpt.yaml
  - Rename to econet,timer-en751221.yaml
  - Impose rule: "reg" must have 1 item on EN751221 and 2 on EN751627
* timer-econet-hpt.c
  - Rename to timer-econet-en751221.c to follow naming scheme from DT
* econet,en751221-intc.yaml
  - Fix validation error from required: interrupt-parent
  - shadow-interrupts -> switch to uint32-matrix for list of pairs
* MAINTAINERS -> Fixed accidental F: MAINTAINERS
* Replace "test image" with device SmartFiber-XP8421-B
* Restructure arch/mips/econet/Kconfig per arch/mips/ralink example
* v1->v2 diff is offered for reference:
  - https://gist.github.com/cjdelisle/bb3acab78b5f70dcdfe5dd6338293efe


Caleb James DeLisle (7):
  dt-bindings: timer: Add EcoNet EN751221 "HPT" CPU Timer
  clocksource/drivers: Add EcoNet Timer HPT driver
  dt-bindings: mips: Add EcoNet platform binding
  mips: Add EcoNet MIPS platform support
  dt-bindings: vendor-prefixes: Add SmartFiber
  mips: dts: Add EcoNet DTS with EN751221 and SmartFiber XP8421-B board
  MAINTAINERS: Add entry for newly added EcoNet platform.

 .../devicetree/bindings/mips/econet.yaml      |  26 +++
 .../bindings/timer/econet,en751221-timer.yaml |  80 +++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  12 +
 arch/mips/Kbuild.platforms                    |   1 +
 arch/mips/Kconfig                             |  25 ++
 arch/mips/boot/compressed/uart-16550.c        |   5 +
 arch/mips/boot/dts/Makefile                   |   1 +
 arch/mips/boot/dts/econet/Makefile            |   2 +
 arch/mips/boot/dts/econet/en751221.dtsi       |  67 ++++++
 .../econet/en751221_smartfiber_xp8421-b.dts   |  19 ++
 arch/mips/econet/Kconfig                      |  48 ++++
 arch/mips/econet/Makefile                     |   2 +
 arch/mips/econet/Platform                     |   5 +
 arch/mips/econet/init.c                       |  78 +++++++
 drivers/clocksource/Kconfig                   |   8 +
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/timer-econet-en751221.c   | 216 ++++++++++++++++++
 18 files changed, 598 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/econet.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
 create mode 100644 arch/mips/boot/dts/econet/Makefile
 create mode 100644 arch/mips/boot/dts/econet/en751221.dtsi
 create mode 100644 arch/mips/boot/dts/econet/en751221_smartfiber_xp8421-b.dts
 create mode 100644 arch/mips/econet/Kconfig
 create mode 100644 arch/mips/econet/Makefile
 create mode 100644 arch/mips/econet/Platform
 create mode 100644 arch/mips/econet/init.c
 create mode 100644 drivers/clocksource/timer-econet-en751221.c

-- 
2.39.5


