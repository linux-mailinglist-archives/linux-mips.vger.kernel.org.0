Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 323411E2388
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 16:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731888AbgEZODD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 10:03:03 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:57868 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729443AbgEZODC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 10:03:02 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 76A3B803086B;
        Tue, 26 May 2020 14:02:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7xyqdPmWs9B7; Tue, 26 May 2020 17:02:57 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paul.burton@imgtec.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        James Hogan <jhogan@kernel.org>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/6] mips: Add DT bindings for MIPS CDMM and GIC
Date:   Tue, 26 May 2020 17:02:37 +0300
Message-ID: <20200526140243.21946-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Recently I've submitted a series of patchset's which provided multiple fixes
for the MIPS arch subsystem and the MIPS GIC and DW APB Timer drivers, which
were required for the Baikal-T1 SoC correctly working with those drivers.
Mostly those patchsets have been already merged into the corresponding
subsystems, but several patches have been left floating since noone really
responded for review except Rob provided his approval regarding DT
bindings. So here in this patchset I've collected all the leftovers so not
to loose them in a pale of the maintainers email logs.

The patchset includes the following updates: MIPS CPC and GIC DT bindings
legacy text-based file are converted to the DT schema (Rob has already
reviewed them), add MIPS CDMM DT node support to place the CDMM block at
the platform-specific MMIO range, make sure MIPS CDMM is available for
MIPS_R5 CPUs.

Seeing the series concerns the MIPS-related drivers it's better to merge
it in through the MIPS repository:
https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/

This patchset is rebased and tested on the mainline Linux kernel 5.7-rc4:
base-commit: 0e698dfa2822 ("Linux 5.7-rc4")
tag: v5.7-rc4

Suggestion.
Since Paul isn't looking after the MIPS arch code anymore, Ralf hasn't
been seen maintaining MIPS for a long time and Thomas is only responsible
for the next part of it:
	F:      Documentation/devicetree/bindings/mips/
	F:      Documentation/mips/
	F:      arch/mips/
	F:      drivers/platform/mips/
the MIPS-specific drivers like:
	F:	drivers/bus/mips_cdmm.c
	F:	drivers/irqchip/irq-mips-cpu.c
	F:	drivers/irqchip/irq-mips-gic.c
	F:	drivers/clocksource/mips-gic-timer.c
	F:	drivers/cpuidle/cpuidle-cps.c
seem to be left for the subsystems maintainers to support. So if you don't
mind or unless there is a better alternative, I can help with looking
after them since I'll be working on our MIPS-based SoC drivers integrating
into the mainline kernel repo anyway. It's Baikal-T1 SoC based MIPS Warrior
P5600 CPU core (you might have noticed a lot of drivers/patches I've
recently submitted for review). If you don't like this idea, please just
decline the last patch in the series.

Previous patchsets:
mips: Prepare MIPS-arch code for Baikal-T1 SoC support:
Link: https://lore.kernel.org/linux-mips/20200306124807.3596F80307C2@mail.baikalelectronics.ru
Link: https://lore.kernel.org/linux-mips/20200506174238.15385-1-Sergey.Semin@baikalelectronics.ru
Link: https://lore.kernel.org/linux-mips/20200521140725.29571-1-Sergey.Semin@baikalelectronics.ru

clocksource: Fix MIPS GIC and DW APB Timer for Baikal-T1 SoC support:
Link: https://lore.kernel.org/linux-rtc/20200324174325.14213-1-Sergey.Semin@baikalelectronics.ru
Link: https://lore.kernel.org/linux-rtc/20200506214107.25956-1-Sergey.Semin@baikalelectronics.ru
Link: https://lore.kernel.org/linux-rtc/20200521005321.12129-1-Sergey.Semin@baikalelectronics.ru

Changelog prev:
- Add yaml-based bindings file for MIPS CDMM dt-node.
- Convert mti,mips-cpc to DT schema.
- Use a shorter summary describing the bindings modification patches.
- Rearrange the SoBs with adding Alexey' co-development tag.
- Lowercase the hex numbers in the dt-bindings.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <maz@kernel.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: James Hogan <jhogan@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (6):
  dt-bindings: power: Convert mti,mips-cpc to DT schema
  dt-bindings: interrupt-controller: Convert mti,gic to DT schema
  dt-bindings: bus: Add MIPS CDMM controller
  mips: cdmm: Add mti,mips-cdmm dtb node support
  bus: cdmm: Add MIPS R5 arch support
  MAINTAINERS: Add maintainers for MIPS core drivers

 .../bindings/bus/mti,mips-cdmm.yaml           |  35 +++++
 .../interrupt-controller/mips-gic.txt         |  67 --------
 .../interrupt-controller/mti,gic.yaml         | 148 ++++++++++++++++++
 .../bindings/power/mti,mips-cpc.txt           |   8 -
 .../bindings/power/mti,mips-cpc.yaml          |  35 +++++
 MAINTAINERS                                   |  10 ++
 drivers/bus/Kconfig                           |   2 +-
 drivers/bus/mips_cdmm.c                       |  15 ++
 8 files changed, 244 insertions(+), 76 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/mti,mips-cdmm.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml
 delete mode 100644 Documentation/devicetree/bindings/power/mti,mips-cpc.txt
 create mode 100644 Documentation/devicetree/bindings/power/mti,mips-cpc.yaml

-- 
2.26.2

