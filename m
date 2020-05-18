Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BAD61D7BD8
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 16:51:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727954AbgEROvS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 10:51:18 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:48492 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726918AbgEROvS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 18 May 2020 10:51:18 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 127628030875;
        Mon, 18 May 2020 14:51:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id h93v5wIYCrJM; Mon, 18 May 2020 17:51:14 +0300 (MSK)
Date:   Mon, 18 May 2020 17:51:13 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        <linux-rtc@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        <linux-kernel@vger.kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Paul Burton <paulburton@kernel.org>
Subject: Re: [PATCH v3 3/7] dt-bindings: interrupt-controller: Convert
 mti,gic to DT schema
Message-ID: <20200518145113.2ndiinqkjculiqmx@mobilestation>
References: <20200324174325.14213-1-Sergey.Semin@baikalelectronics.ru>
 <20200506214107.25956-1-Sergey.Semin@baikalelectronics.ru>
 <20200506214107.25956-4-Sergey.Semin@baikalelectronics.ru>
 <20200514190632.GA9943@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200514190632.GA9943@bogus>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Thomas, Jason, Marc
Could you take a look at this patch and merge it in if you are ok with its
content. We've got Rob's Reviewed-by tag here, so it's only waiting for your
acceptance.

-Sergey

On Thu, May 14, 2020 at 02:06:32PM -0500, Rob Herring wrote:
> On Thu, 7 May 2020 00:41:03 +0300, Serge Semin wrote:
> > Modern device tree bindings are supposed to be created as YAML-files
> > in accordance with DT schema. This commit replaces MIPS GIC legacy bare
> > text binding with YAML file. As before the binding file states that the
> > corresponding dts node is supposed to be compatible with MIPS Global
> > Interrupt Controller indicated by the "mti,gic" compatible string and
> > to provide a mandatory interrupt-controller and '#interrupt-cells'
> > properties. There might be optional registers memory range,
> > "mti,reserved-cpu-vectors" and "mti,reserved-ipi-vectors" properties
> > specified.
> > 
> > MIPS GIC also includes a free-running global timer, per-CPU count/compare
> > timers, and a watchdog. Since currently the GIC Timer is only supported the
> > DT schema expects an IRQ and clock-phandler charged timer sub-node with
> > "mti,mips-gic-timer" compatible string.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Paul Burton <paulburton@kernel.org>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > Cc: Alessandro Zummo <a.zummo@towertech.it>
> > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: linux-mips@vger.kernel.org
> > Cc: linux-rtc@vger.kernel.org
> > 
> > ---
> > 
> > I don't really know who is the corresponding driver maintainer, so I
> > added Paul to the maintainers property since he used to be looking for the
> > MIPS arch and Thomas looking after it now. Any idea what email should be
> > specified there instead?
> > 
> > Changelog v3:
> > - Since timer sub-node has no unit-address, the node shouldn't be named
> >   with one. So alter the MIPS GIC bindings to have a pure "timer"
> >   sub-node.
> > - Discard allOf: [ $ref: /schemas/interrupt-controller.yaml# ].
> > - Since it's a conversion patch use GPL-2.0-only SPDX header.
> > ---
> >  .../interrupt-controller/mips-gic.txt         |  67 --------
> >  .../interrupt-controller/mti,gic.yaml         | 148 ++++++++++++++++++
> >  2 files changed, 148 insertions(+), 67 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
