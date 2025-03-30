Return-Path: <linux-mips+bounces-8406-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AF0A75B1F
	for <lists+linux-mips@lfdr.de>; Sun, 30 Mar 2025 19:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C28641888FFB
	for <lists+linux-mips@lfdr.de>; Sun, 30 Mar 2025 17:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA78C1C3C1D;
	Sun, 30 Mar 2025 17:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="gKfMKmWl"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FA535973;
	Sun, 30 Mar 2025 17:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743354226; cv=none; b=P1oIJdHEvCGFc0U6FgUBs6MvahME3+bB2tVS791Ovz40PN/ahxbAfbfE4lhZ26Rv9pTW0e6GTc97inEz1hJgCQAQ6yYAo7MvrS2AG5wt+ddrWGLEisFCYWPU29cjjpPEJ2nuT79EsT8tR4HcwX3lEtvIBxNJPx6J5OrwOYY4yx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743354226; c=relaxed/simple;
	bh=Ze6HuoEyTm/BvTTgYwOUdaRjH2UGGccUI4uJU+Dt5zI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d9b077y/CJiA8yhXxzLET9BN8AyFcp35cG+ijT7DKMGtzUyGI1d0QtWPPuKGLCIOz2TKi6CwRRmspMu1+xcUn2mL+71y73gVDCzS5CxQNxFY7DSc/LNkhrrkPgS6jktzHVq3lofOFZvMafXAqaiXAtxZns1J4Co4o8HBiobr4wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=gKfMKmWl; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1FC4D2FB138;
	Sun, 30 Mar 2025 19:03:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1743354216; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=RsOr/ANURuCU8G01zAMiqsy1ztIBZsaa8Cw6aJOzeJ0=;
	b=gKfMKmWlTLQDHfH9QLJHqd+ppduTiwJkEA6dO/OiUpfibGNn5VQQJUGQeUSNihvsHPUIju
	dYKDtRl+fIPpmub1qDUcc7A0r76jPiA/ED387ofq16WXF5oY/LrSH8rhWPeowgsbucVP4h
	+tkh25cMN+ySZzoEwVx4x+VcH4DfcjF8/00DGxkBJb3VNUIvj6k+ipyXvsQjL7raAypo1n
	h+/7pIYZu2n+9ZomXj7WzVlE+VHJbZ5UMBUs22vpPrg3Vh9D66rLDEM39LNOSQZwa3hKjV
	1oz6pK5eqfbfQ0KnsbYCxnYGwjJl96BY2ULxwNplloWqJosrG9bb9ab9nx5BDg==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	linux-mediatek@lists.infradead.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v3 00/10] Add EcoNet EN751221 MIPS platform support
Date: Sun, 30 Mar 2025 17:02:56 +0000
Message-Id: <20250330170306.2584136-1-cjd@cjdns.fr>
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


Caleb James DeLisle (10):
  dt-bindings: vendor-prefixes: Add EcoNet
  dt-bindings: interrupt-controller: Add EcoNet EN751221 INTC
  irqchip: Add EcoNet EN751221 INTC
  dt-bindings: timer: Add EcoNet EN751221 "HPT" CPU Timer
  clocksource/drivers: Add EcoNet Timer HPT driver
  dt-bindings: mips: Add EcoNet platform binding
  mips: Add EcoNet MIPS platform support
  dt-bindings: vendor-prefixes: Add SmartFiber
  mips: dts: Add EcoNet DTS with EN751221 and SmartFiber XP8421-B board
  MAINTAINERS: Add entry for newly added EcoNet platform.

 .../econet,en751221-intc.yaml                 |  78 +++++
 .../devicetree/bindings/mips/econet.yaml      |  26 ++
 .../bindings/timer/econet,en751221-timer.yaml |  80 +++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   4 +
 MAINTAINERS                                   |  12 +
 arch/mips/Kbuild.platforms                    |   1 +
 arch/mips/Kconfig                             |  25 ++
 arch/mips/boot/compressed/uart-16550.c        |   5 +
 arch/mips/boot/dts/Makefile                   |   1 +
 arch/mips/boot/dts/econet/Makefile            |   2 +
 arch/mips/boot/dts/econet/en751221.dtsi       |  67 ++++
 .../econet/en751221_smartfiber_xp8421-b.dts   |  19 ++
 arch/mips/econet/Kconfig                      |  48 +++
 arch/mips/econet/Makefile                     |   2 +
 arch/mips/econet/Platform                     |   5 +
 arch/mips/econet/init.c                       |  78 +++++
 drivers/clocksource/Kconfig                   |   8 +
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/timer-econet-en751221.c   | 216 ++++++++++++
 drivers/irqchip/Kconfig                       |   5 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-econet-en751221.c         | 309 ++++++++++++++++++
 22 files changed, 993 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
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
 create mode 100644 drivers/irqchip/irq-econet-en751221.c

-- 
2.39.5


