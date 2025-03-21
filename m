Return-Path: <linux-mips+bounces-8261-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A64A6BC1B
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 14:54:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E89433B82D8
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 13:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613FA42A94;
	Fri, 21 Mar 2025 13:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="kitbI1UX"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CA814A60C;
	Fri, 21 Mar 2025 13:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742565183; cv=none; b=eyG6uNREuXzRVFfM5LGcY3J75NfKmQdB2LwVps/hx/DDq9a53jpwWJIkAJJQo3rnAeg5JZlmtdQrEPe4MVTnVQyhKKt26I2fGyV6A0eU316ZQPh7vpC06X5uQpJrt0+e4UEbccNJ2T3tq1zBrjN/OkVBoSaf+5VUHa4DTk3PSos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742565183; c=relaxed/simple;
	bh=2pk0/It5rjP4m3WAEt+BBvZT/V+Mz5SRBUK9mIUx5Q0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SsV9eidFOvRrMGJNUsLpOm+OSoPb/7SdtjAxe9iEOMHa+SyStFNnWlmNjy+m7yRHtrhFB6QrqR1ISB4fWEhXdfk2S4A+RbjWuGIdKzIMZoxgwqXrd0Kugza7+OqJg4aespdTmsqjuDg/zxC4Qed0JAIaCOx9kKN4/1AcPNDR6gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=kitbI1UX; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A5952A42B3;
	Fri, 21 Mar 2025 14:46:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1742564815; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=8ZqrnR8XejsmERmIr/d7LBRx7KeXVDQjbownC4iKAdQ=;
	b=kitbI1UX1wHyLKPpm0KA3EjbEU/mZid9jkwA5yUFXzGcZ6uO/G177ytryw4K5yW9oqNl4l
	IKd9XiH4oKB8D7OzzJ2DB9qbp8qmFWpa9k+bvAx1x66ab1J4ca6HLO1DTPVtMrQfeIsfcp
	OdXeeZpVr0s652tyzKL9IVAGfZs5s3hnqOIwGgFcHn1QfiXiQ8y1QZtMZT4ACs7mWSPsYR
	50f7FAopcR/zSPFwpR6PIR5z4Z5tl6oTkqd3+yLsAfOKRXe687qqWSg5xxhk+GjnWSoQLe
	mD25bxHjxhXdrQIhzBxReUFNQZXSG7CCwWMmXYZ7bBZ/7Tnjw0+IATvHcfqSiA==
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
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v1 0/8] Add EcoNet EN751221 MIPS platform support
Date: Fri, 21 Mar 2025 13:46:25 +0000
Message-Id: <20250321134633.2155141-1-cjd@cjdns.fr>
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
the 1004Kc. Individual SoCs within a family are roughly the same, but
with different peripherals.

This patchset adds very basic "boots to a console" support for the
EN751221 family. EN751627 support and additional drivers will come in
a future patchset.

Note that while EcoNet is similar to Airoha (AN7513, AN7581) in terms
of peripherals, it is different because Airoha is based on ARM.

This patchset is against mips-next.

Caleb James DeLisle (8):
  dt-bindings: vendor-prefixes: Add EcoNet
  dt-bindings: interrupt-controller: Add EcoNet EN751221 INTC
  irqchip: Add EcoNet EN751221 INTC
  dt-bindings: timer: Add EcoNet HPT CPU Timer
  clocksource/drivers: Add EcoNet Timer HPT driver
  dt-bindings: mips: Add EcoNet platform binding
  mips: Add EcoNet MIPS platform support
  MAINTAINERS: Add EcoNet MIPS platform entry

 .../econet,en751221-intc.yaml                 |  77 +++++
 .../devicetree/bindings/mips/econet.yaml      |  27 ++
 .../bindings/timer/econet,timer-hpt.yaml      |  58 ++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  12 +
 arch/mips/Kbuild.platforms                    |   1 +
 arch/mips/Kconfig                             |  25 ++
 arch/mips/boot/compressed/uart-16550.c        |   5 +
 arch/mips/boot/dts/Makefile                   |   1 +
 arch/mips/boot/dts/econet/Makefile            |   2 +
 arch/mips/boot/dts/econet/en751221.dtsi       |  62 ++++
 .../boot/dts/econet/en751221_test_image.dts   |  19 ++
 arch/mips/econet/Kconfig                      |  42 +++
 arch/mips/econet/Makefile                     |   2 +
 arch/mips/econet/Platform                     |   5 +
 arch/mips/econet/init.c                       |  78 +++++
 drivers/clocksource/Kconfig                   |   8 +
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/timer-econet-hpt.c        | 221 ++++++++++++++
 drivers/irqchip/Kconfig                       |   5 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-econet-en751221.c         | 280 ++++++++++++++++++
 22 files changed, 934 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
 create mode 100644 Documentation/devicetree/bindings/mips/econet.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/econet,timer-hpt.yaml
 create mode 100644 arch/mips/boot/dts/econet/Makefile
 create mode 100644 arch/mips/boot/dts/econet/en751221.dtsi
 create mode 100644 arch/mips/boot/dts/econet/en751221_test_image.dts
 create mode 100644 arch/mips/econet/Kconfig
 create mode 100644 arch/mips/econet/Makefile
 create mode 100644 arch/mips/econet/Platform
 create mode 100644 arch/mips/econet/init.c
 create mode 100644 drivers/clocksource/timer-econet-hpt.c
 create mode 100644 drivers/irqchip/irq-econet-en751221.c

-- 
2.30.2


