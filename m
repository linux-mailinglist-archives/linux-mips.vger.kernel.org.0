Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90DEA1C7C9F
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2020 23:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730038AbgEFVlY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 May 2020 17:41:24 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:33802 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728621AbgEFVlY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 May 2020 17:41:24 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 8867D803087B;
        Wed,  6 May 2020 21:41:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id hYhsMsirV777; Thu,  7 May 2020 00:41:18 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/7] clocksource: Fix MIPS GIC and DW APB Timer for Baikal-T1 SoC support
Date:   Thu, 7 May 2020 00:41:00 +0300
Message-ID: <20200506214107.25956-1-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200324174325.14213-1-Sergey.Semin@baikalelectronics.ru>
References: <20200324174325.14213-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Serge Semin <fancer.lancer@gmail.com>

As for all Baikal-T1 SoC related patchsets, which need this, we replaced
the DW APB Timer legacy plain text-based dt-binding file with DT schema.
Similarly the MIPS GIC bindings file is also converted to DT schema seeing
it also defines the MIPS GIC Timer binding.

Aside from MIPS-specific r4k timer Baikal-T1 chip also provides a
functionality of two another timers: embedded into the MIPS GIC timer and
three external DW timers available over APB bus. But we can't use them
before the corresponding drivers are properly fixed. First of all DW APB
Timer shouldn't be bound to a single CPU, since as being accessible over
APB they are external with respect to all possible CPUs. Secondly there
might be more than just two DW APB Timers in the system (Baikal-T1 has
three of them), so permit the driver to use one of them as a clocksource
and the rest - for clockevents. Thirdly it's possible to use MIPS GIC
timer as a clocksource so register it in the corresponding subsystem
(the patch has been found in the Paul Burton MIPS repo so I left the
original Signed-off-by attribute). Finally in the same way as r4k timer
the MIPS GIC timer should be used with care when CPUFREQ config is enabled
since in case of CM2 the timer counting depends on the CPU reference clock
frequency while the clocksource subsystem currently doesn't support the
timers with non-stable clock.

This patchset is rebased and tested on the mainline Linux kernel 5.7-rc4:
0e698dfa2822 ("Linux 5.7-rc4")
tag: v5.7-rc4

Changelog v2:
- Fix the SoB tags.
- Our corporate email server doesn't change Message-Id anymore, so the
  patchset is resubmitted being in the cover-letter-threaded format.
- Convert the "snps,dw-apb-timer" binding to DT schema in a dedicated
  patch.
- Convert the "mti,gic" binding to DT schema in a dedicated patch.

Changelog v3:
- Make the MIPS GIC timer sub-node name not having a unit-address number.
- Discard allOf: [ $ref: /schemas/interrupt-controller.yaml# ] from MIPS
  GIC bindings.
- Add patch moving the "snps,dw-apb-timer" binding file to the directory
  with timers binding files.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
Cc: Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: linux-rtc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Paul Burton (1):
  clocksource: mips-gic-timer: Register as sched_clock

Serge Semin (6):
  dt-bindings: rtc: Convert snps,dw-apb-timer to DT schema
  dt-bindings: timer: Move snps,dw-apb-timer DT schema from rtc
  dt-bindings: interrupt-controller: Convert mti,gic to DT schema
  clocksource: dw_apb_timer: Set clockevent any-possible-CPU mask
  clocksource: dw_apb_timer_of: Fix missing clockevent timers
  clocksource: mips-gic-timer: Set limitations on
    clocksource/sched-clocks usage

 .../interrupt-controller/mips-gic.txt         |  67 --------
 .../interrupt-controller/mti,gic.yaml         | 148 ++++++++++++++++++
 .../devicetree/bindings/rtc/dw-apb.txt        |  32 ----
 .../bindings/timer/snps,dw-apb-timer.yaml     |  88 +++++++++++
 drivers/clocksource/dw_apb_timer.c            |  18 +--
 drivers/clocksource/dw_apb_timer_of.c         |   9 +-
 drivers/clocksource/mips-gic-timer.c          |  30 +++-
 include/linux/dw_apb_timer.h                  |   2 +-
 8 files changed, 272 insertions(+), 122 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/dw-apb.txt
 create mode 100644 Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml

-- 
2.25.1

