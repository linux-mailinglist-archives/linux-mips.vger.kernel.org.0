Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD1D21F201
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2020 14:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728456AbgGNM6N (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jul 2020 08:58:13 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:33292 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728049AbgGNM6C (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Jul 2020 08:58:02 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 3F1268040A7B;
        Tue, 14 Jul 2020 12:58:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id r2vTuNbBRxgJ; Tue, 14 Jul 2020 15:57:59 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Gleixner <tglx@linutronix.de>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, James Hogan <jhogan@kernel.org>,
        <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 6/6] MAINTAINERS: Add maintainers for MIPS core drivers
Date:   Tue, 14 Jul 2020 15:57:52 +0300
Message-ID: <20200714125753.22466-7-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200714125753.22466-1-Sergey.Semin@baikalelectronics.ru>
References: <20200714125753.22466-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add Thomas and myself as maintainers of the MIPS CPU and GIC IRQchip, MIPS
GIC timer and MIPS CPS CPUidle drivers.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Acked-by: Marc Zyngier <maz@kernel.org>

---

Changelog v3:
- Keep the files list alphabetically ordered.
- Add Thomas as the co-maintainer of the designated drivers.
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2926327e4976..20532e0287d7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11278,6 +11278,17 @@ F:	arch/mips/configs/generic/board-boston.config
 F:	drivers/clk/imgtec/clk-boston.c
 F:	include/dt-bindings/clock/boston-clock.h
 
+MIPS CORE DRIVERS
+M:	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
+M:	Serge Semin <fancer.lancer@gmail.com>
+L:	linux-mips@vger.kernel.org
+S:	Supported
+F:	drivers/bus/mips_cdmm.c
+F:	drivers/clocksource/mips-gic-timer.c
+F:	drivers/cpuidle/cpuidle-cps.c
+F:	drivers/irqchip/irq-mips-cpu.c
+F:	drivers/irqchip/irq-mips-gic.c
+
 MIPS GENERIC PLATFORM
 M:	Paul Burton <paulburton@kernel.org>
 L:	linux-mips@vger.kernel.org
-- 
2.26.2

