Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DADD73546
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jul 2019 19:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727604AbfGXRQq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jul 2019 13:16:46 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:49238 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfGXRQq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Jul 2019 13:16:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1563988601; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JnUi6nVD+Fp3HtmDnWczHwA5HEoGiDoWhWzL0X4G9FM=;
        b=RNi7odr0SAuT1+46Hl3TkDA+Hz7jn1Ah0vAcmGInuYlNR18DyDBM+dxcZLVj9pe0In5MkJ
        2nck/k1N94mYFUwzaLHcS6SDEwp8reVCNEI2CMwWk5m3kFhJMnkfL2tJ3V76mE/Pml+vU+
        KHjd+9Nz3m3jMMncvNkk5ZgkFYhmLOE=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Lee Jones <lee.jones@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-clk@vger.kernel.org, od@zcrc.me,
        Mathieu Malaterre <malat@debian.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH v15 02/13] doc: Add doc for the Ingenic TCU hardware
Date:   Wed, 24 Jul 2019 13:16:04 -0400
Message-Id: <20190724171615.20774-3-paul@crapouillou.net>
In-Reply-To: <20190724171615.20774-1-paul@crapouillou.net>
References: <20190724171615.20774-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add documentation about the Timer/Counter Unit (TCU) present in the
Ingenic JZ47xx SoCs.

The Timer/Counter Unit (TCU) in Ingenic JZ47xx SoCs is a multi-function
hardware block. It features up to to eight channels, that can be used as
counters, timers, or PWM.

- JZ4725B, JZ4750, JZ4755 only have six TCU channels. The other SoCs all
  have eight channels.

- JZ4725B introduced a separate channel, called Operating System Timer
  (OST). It is a 32-bit programmable timer. On JZ4770 and above, it is
  64-bit.

- Each one of the TCU channels has its own clock, which can be reparented
  to three different clocks (pclk, ext, rtc), gated, and reclocked, through
  their TCSR register.
  * The watchdog and OST hardware blocks also feature a TCSR register with
    the same format in their register space.
  * The TCU registers used to gate/ungate can also gate/ungate the watchdog
    and OST clocks.

- Each TCU channel works in one of two modes:
  * mode TCU1: channels cannot work in sleep mode, but are easier to
    operate.
  * mode TCU2: channels can work in sleep mode, but the operation is a bit
    more complicated than with TCU1 channels.

- The mode of each TCU channel depends on the SoC used:
  * On the oldest SoCs (up to JZ4740), all of the eight channels operate in
    TCU1 mode.
  * On JZ4725B, channel 5 operates as TCU2, the others operate as TCU1.
  * On newest SoCs (JZ4750 and above), channels 1-2 operate as TCU2, the
    others operate as TCU1.

- Each channel can generate an interrupt. Some channels share an interrupt
  line, some don't, and this changes between SoC versions:
  * on older SoCs (JZ4740 and below), channel 0 and channel 1 have their
    own interrupt line; channels 2-7 share the last interrupt line.
  * On JZ4725B, channel 0 has its own interrupt; channels 1-5 share one
    interrupt line; the OST uses the last interrupt line.
  * on newer SoCs (JZ4750 and above), channel 5 has its own interrupt;
    channels 0-4 and (if eight channels) 6-7 all share one interrupt line;
    the OST uses the last interrupt line.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Mathieu Malaterre <malat@debian.org>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
---

Notes:
    v4: New patch in this series
    
    v5: Added information about number of channels, and improved
        documentation about channel modes
    
    v6: Add info about OST (can be 32-bit on older SoCs)
    
    v7-v11: No change
    
    v12: Add details about new implementation
    
    v13: No change
    
    v14: Convert to ReStructured Text
    
    v15: Remove info about MFD driver

 Documentation/index.rst            |  1 +
 Documentation/mips/index.rst       | 11 +++++
 Documentation/mips/ingenic-tcu.rst | 71 ++++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+)
 create mode 100644 Documentation/mips/index.rst
 create mode 100644 Documentation/mips/ingenic-tcu.rst

diff --git a/Documentation/index.rst b/Documentation/index.rst
index 70ae148ec980..87214feda41f 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -143,6 +143,7 @@ implementation.
    arm64/index
    ia64/index
    m68k/index
+   mips/index
    riscv/index
    s390/index
    sh/index
diff --git a/Documentation/mips/index.rst b/Documentation/mips/index.rst
new file mode 100644
index 000000000000..321b4794f3b8
--- /dev/null
+++ b/Documentation/mips/index.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========================
+MIPS-specific Documentation
+===========================
+
+.. toctree::
+   :maxdepth: 1
+   :numbered:
+
+   ingenic-tcu
diff --git a/Documentation/mips/ingenic-tcu.rst b/Documentation/mips/ingenic-tcu.rst
new file mode 100644
index 000000000000..c4ef4c45aade
--- /dev/null
+++ b/Documentation/mips/ingenic-tcu.rst
@@ -0,0 +1,71 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===============================================
+Ingenic JZ47xx SoCs Timer/Counter Unit hardware
+===============================================
+
+The Timer/Counter Unit (TCU) in Ingenic JZ47xx SoCs is a multi-function
+hardware block. It features up to to eight channels, that can be used as
+counters, timers, or PWM.
+
+- JZ4725B, JZ4750, JZ4755 only have six TCU channels. The other SoCs all
+  have eight channels.
+
+- JZ4725B introduced a separate channel, called Operating System Timer
+  (OST). It is a 32-bit programmable timer. On JZ4760B and above, it is
+  64-bit.
+
+- Each one of the TCU channels has its own clock, which can be reparented to three
+  different clocks (pclk, ext, rtc), gated, and reclocked, through their TCSR register.
+
+    - The watchdog and OST hardware blocks also feature a TCSR register with the same
+      format in their register space.
+    - The TCU registers used to gate/ungate can also gate/ungate the watchdog and
+      OST clocks.
+
+- Each TCU channel works in one of two modes:
+
+    - mode TCU1: channels cannot work in sleep mode, but are easier to
+      operate.
+    - mode TCU2: channels can work in sleep mode, but the operation is a bit
+      more complicated than with TCU1 channels.
+
+- The mode of each TCU channel depends on the SoC used:
+
+    - On the oldest SoCs (up to JZ4740), all of the eight channels operate in
+      TCU1 mode.
+    - On JZ4725B, channel 5 operates as TCU2, the others operate as TCU1.
+    - On newest SoCs (JZ4750 and above), channels 1-2 operate as TCU2, the
+      others operate as TCU1.
+
+- Each channel can generate an interrupt. Some channels share an interrupt
+  line, some don't, and this changes between SoC versions:
+
+    - on older SoCs (JZ4740 and below), channel 0 and channel 1 have their
+      own interrupt line; channels 2-7 share the last interrupt line.
+    - On JZ4725B, channel 0 has its own interrupt; channels 1-5 share one
+      interrupt line; the OST uses the last interrupt line.
+    - on newer SoCs (JZ4750 and above), channel 5 has its own interrupt;
+      channels 0-4 and (if eight channels) 6-7 all share one interrupt line;
+      the OST uses the last interrupt line.
+
+Implementation
+==============
+
+The functionalities of the TCU hardware are spread across multiple drivers:
+
+===========  =====
+clocks       drivers/clk/ingenic/tcu.c
+interrupts   drivers/irqchip/irq-ingenic-tcu.c
+timers       drivers/clocksource/ingenic-timer.c
+OST          drivers/clocksource/ingenic-ost.c
+PWM          drivers/pwm/pwm-jz4740.c
+watchdog     drivers/watchdog/jz4740_wdt.c
+===========  =====
+
+Because various functionalities of the TCU that belong to different drivers
+and frameworks can be controlled from the same registers, all of these
+drivers access their registers through the same regmap.
+
+For more information regarding the devicetree bindings of the TCU drivers,
+have a look at Documentation/devicetree/bindings/mfd/ingenic,tcu.txt.
-- 
2.21.0.593.g511ec345e18

