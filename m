Return-Path: <linux-mips+bounces-3781-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDC7910E93
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 19:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E0231F22DA4
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 17:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600621B3F33;
	Thu, 20 Jun 2024 17:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JQcKX1kz"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EBE1DDEE;
	Thu, 20 Jun 2024 17:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718904705; cv=none; b=T3iLENnB+mRz/XrmwTq5kKqbp713TdRZBVj7Y5HrSELHLLNC/CK02jMvN2LhKCzSIJadhNC3C2hQlD69r+YXamKYQDL4t5VXmQmop7N9ECMYfpSXzv2sqajPLEVyJW8u5MzCC0osKfSmoKpI+1l2KXjnPOlRfR3s2mLEPNuA5HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718904705; c=relaxed/simple;
	bh=2msHhaArGXUII7vZvDX3RYqIVT0kPBHzS6JmMaEg6GE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BBTB4Jef+egVrkJRGzCZ72aIKLW/y2buj/uhLiafPTgytbrv89tHcMDubGf/WpcbGCWd9NK+ynsuqGuD6fteQjv7wm9KcfIptM0Z0efWkIXZ5i6Gwu9BYrYNhIlSuC/HtJpEClSyWHjPnHZOGGpR6A5lARNuH/VGdorQhsyJJEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JQcKX1kz; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C1B11C0002;
	Thu, 20 Jun 2024 17:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718904700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5jSCf/ll+OHO3qhGzh3F7nih4V1BJIM+0UihWsXUkgU=;
	b=JQcKX1kzSltdO6ex4hv/5gRrFQNcH1sKg05NfkmPYeH6lXHOf1hOxvhY3gpTY1DXVmnU8S
	PtRx55Iv3Bdf/h0HM49kb31L3/CUuaLsz3C9JC5qXCZL6QHuhyQaqk9ArmOFdsl7/xGU2z
	7sRLTr1scLtERtmvGeCYdgZMcNjXVcpntSHHAeDQiG69/+1kf0EwG/5p8A8KjXVZ5OAdps
	v2yVJJH5OFd2pdDSrLx3/8HjkgEiRDW3eBeeDSt9p9UEtY/RAHIXS/82ju/vHgtYRIKYw8
	8K/WiXByCjpXAkZ6bJyWSIj137L0gnI4k5ON9dLaqgQ6E1JFfkkxsCHCK9hp8A==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH v3 0/9] Add Mobileye EyeQ system controller support (clk,
 reset, pinctrl)
Date: Thu, 20 Jun 2024 19:30:52 +0200
Message-Id: <20240620-mbly-olb-v3-0-5f29f8ca289c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAExndGYC/1WMywqDMBQFf0Xuuil5mKpd9T9KFybe1ICakkioS
 P69UQq2yzmcmRUCeosBrsUKHqMN1k0ZxKkA3bfTE4ntMgOnvKQlrcmohoW4QZFKtrU0UpsOBeT
 7y6Ox7z11f2TubZidX/ZyZNv6jTB6RCIjlAghsWwuXaVQ3JRz82Cns3YjbJnID1VS8aPyrDZSo
 2wZstrgv5pS+gCcsC7Q3QAAAA==
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.0
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

This builds on previous Mobileye EyeQ system-controller revisions,
supporting EyeQ5, EyeQ6L and EyeQ6H. We expose a few OLB
system-controller features here:
 - Clocks: some read-only PLLs derived from main crystal and some
   divider clocks based on PLLs.
 - Resets.
 - Pin controller, only on EyeQ5 (others will use pinctrl-single).

EyeQ6H is special in that it has seven instances of this
system-controller. Those are spread around and cannot be seen as a
single device, hence are exposed as seven DT nodes and seven
unique compatibles.

Following feedback (that took time to reach my brain, sorry about that):
 - We expose each system-controller as a single devicetree node. This
   means reverting previously accepted dt-bindings that described a
   one-node-per-feature approach.
 - We use auxiliary devices infrastructure to split functionality into
   separate drivers. Clock is the platform driver that spawns child
   auxdevs. They get an iomem pointer to the OLB region as
   platform_data. They know which behavior to implement by matching
   compatible on their parent device's OF node.

Patches are targeting MIPS, clk, reset and pinctrl:

MIPS:
 - dt-bindings: soc: mobileye: add EyeQ OLB system controller
 - MIPS: mobileye: eyeq5: add OLB system-controller node

clk:
 - Revert "dt-bindings: clock: mobileye,eyeq5-clk: add bindings"
 - clk: divider: Introduce CLK_DIVIDER_EVEN_INTEGERS flag
 - clk: eyeq: add driver

reset:
 - Revert "dt-bindings: reset: mobileye,eyeq5-reset: add bindings"
 - reset: eyeq: add platform driver

pinctrl:
 - Revert "dt-bindings: pinctrl: mobileye,eyeq5-pinctrl: add bindings"
 - pinctrl: eyeq5: add platform driver

Have a nice day,
Théo

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Changes in v3:
- Drivers: Switch to using auxiliary devices. Drop the MFD patches.
  Consequent changes to the clk driver that now spawns its auxdevs.
  Reset and pinctrl switch from being platform driver to auxdevs.
- dt-bindings and EyeQ5 DTS: remove "simple-mfd" compatible from all OLB
  nodes.
- dt-bindings: rewrite commit title and messages. Title now takes the
  standard revert format.
- dt-bindings: revert pinctrl dt-bindings as well; this was forgotten in
  the previous revision.
- clk driver: fix overflow of factors; they get stored in 32-bit ints in
  fixed-factor which we overflowed when spread-spectrum is enabled.
- Link to v2: https://lore.kernel.org/r/20240503-mbly-olb-v2-0-95ce5a1e18fe@bootlin.com

Changes in v2:
- dt-bindings:
  - Drop mobileye,eyeq5-clk and mobileye,eyeq5-reset bindings.
  - Update OLB bindings to handle clk/reset/pinctrl from OLB node.
- MFD:
  - Add core driver and MFD patches to allow setting sub-devices names
    from MFD cell.
  - Add MFD OLB driver.
- clk:
  - Change type of eqc_pll->reg64 from u32 to unsigned int.
  - Use resource indexes rather than names for iomem resources.
  - Put early PLLs into a separate match data table. Also, have store
    number of late clocks in early match data to properly alloc cells.
  - Pre-acquire all divclk resources first, then register them.
    This simplifies code.
  - Extract PLLs and divclks init to two separate functions.
  - Avoid variable declarations in loop bodies.
  - Do not register match data table to platform driver. It gets probed
    as MFD sub-device matching on driver name. Match data table is
    matched against parent OF node compatible.
  - Fix ugly memory corruption bug when clk count == 1.
- reset:
  - EQR_EYEQ5_SARCR and EQR_EYEQ6H_SARCR did not use offset 0x0: do
    minus four to all their offsets and reduce resource sizes.
  - Remove resource names. Reset i uses iomem resource index i.
  - Simplify xlate: have two implementations for of_reset_n_cells==1 and
    of_reset_n_cells==2. Both call the same helper internal function.
  - Do not register match data table to platform driver. It gets probed
    as MFD sub-device matching on driver name. Match data table is
    matched against parent OF node compatible.
- pinctrl:
  - Remove match data table to platform driver. It gets probed as MFD
    sub-device matching on driver name. Driver has single compatible.
  - Drop "Reviewed-by: Linus Walleij" as driver changed approach.
- MIPS DTS:
  - Squash all commits together into a single one.
  - Adapt to new approach: OLB is now a single OF node.
- Link to v1: https://lore.kernel.org/r/20240410-mbly-olb-v1-0-335e496d7be3@bootlin.com

---
Théo Lebrun (9):
      Revert "dt-bindings: clock: mobileye,eyeq5-clk: add bindings"
      Revert "dt-bindings: reset: mobileye,eyeq5-reset: add bindings"
      Revert "dt-bindings: pinctrl: mobileye,eyeq5-pinctrl: add bindings"
      dt-bindings: soc: mobileye: add EyeQ OLB system controller
      clk: divider: Introduce CLK_DIVIDER_EVEN_INTEGERS flag
      clk: eyeq: add driver
      reset: eyeq: add platform driver
      pinctrl: eyeq5: add platform driver
      MIPS: mobileye: eyeq5: add OLB system-controller node

 .../bindings/clock/mobileye,eyeq5-clk.yaml         |  51 --
 .../bindings/reset/mobileye,eyeq5-reset.yaml       |  43 --
 .../mobileye/mobileye,eyeq5-olb.yaml}              | 168 ++++-
 MAINTAINERS                                        |   5 +
 .../{eyeq5-fixed-clocks.dtsi => eyeq5-clocks.dtsi} |  54 +-
 arch/mips/boot/dts/mobileye/eyeq5-pins.dtsi        | 125 ++++
 arch/mips/boot/dts/mobileye/eyeq5.dtsi             |  22 +-
 drivers/clk/Kconfig                                |  12 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-divider.c                          |  12 +-
 drivers/clk/clk-eyeq.c                             | 789 +++++++++++++++++++++
 drivers/pinctrl/Kconfig                            |  15 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-eyeq5.c                    | 576 +++++++++++++++
 drivers/reset/Kconfig                              |  14 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-eyeq.c                         | 563 +++++++++++++++
 include/dt-bindings/clock/mobileye,eyeq5-clk.h     |  21 +
 include/linux/clk-provider.h                       |  11 +-
 19 files changed, 2326 insertions(+), 158 deletions(-)
---
base-commit: 061f2865f17c038f04a71ccdd6c90746381d63a8
change-id: 20240408-mbly-olb-75a85f5cfde3

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


