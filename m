Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B35FC1DEC41
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2020 17:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730109AbgEVPlN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 May 2020 11:41:13 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:45460 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727807AbgEVPlN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 May 2020 11:41:13 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 125998029EB7;
        Fri, 22 May 2020 15:41:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8uWzmiuImIaK; Fri, 22 May 2020 18:41:07 +0300 (MSK)
Date:   Fri, 22 May 2020 18:41:05 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 0/8] clocksource: Fix MIPS GIC and DW APB Timer for
 Baikal-T1 SoC support
Message-ID: <20200522154105.6gkutlgi2hxqjjzc@mobilestation>
References: <20200521204818.25436-1-Sergey.Semin@baikalelectronics.ru>
 <211ab91d-6085-3073-1cbc-2300abade1b7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <211ab91d-6085-3073-1cbc-2300abade1b7@linaro.org>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 22, 2020 at 05:28:42PM +0200, Daniel Lezcano wrote:
> On 21/05/2020 22:48, Serge Semin wrote:
> > As for all Baikal-T1 SoC related patchsets, which need this, we replaced
> > the DW APB Timer legacy plain text-based dt-binding file with DT schema.
> > Similarly the MIPS GIC bindings file is also converted to DT schema seeing
> > it also defines the MIPS GIC Timer binding.
> > 
> > Aside from MIPS-specific r4k timer Baikal-T1 chip also provides a
> > functionality of two another timers: embedded into the MIPS GIC timer and
> > three external DW timers available over APB bus. But we can't use them
> > before the corresponding drivers are properly fixed. First of all DW APB
> > Timer shouldn't be bound to a single CPU, since as being accessible over
> > APB they are external with respect to all possible CPUs. Secondly there
> > might be more than just two DW APB Timers in the system (Baikal-T1 has
> > three of them), so permit the driver to use one of them as a clocksource
> > and the rest - for clockevents. Thirdly it's possible to use MIPS GIC
> > timer as a clocksource so register it in the corresponding subsystem
> > (the patch has been found in the Paul Burton MIPS repo so I left the
> > original Signed-off-by attribute). Finally in the same way as r4k timer
> > the MIPS GIC timer should be used with care when CPUFREQ config is enabled
> > since in case of CM2 the timer counting depends on the CPU reference clock
> > frequency while the clocksource subsystem currently doesn't support the
> > timers with non-stable clock.
> > 
> > This patchset is rebased and tested on the mainline Linux kernel 5.7-rc4:
> > base-commit: 0e698dfa2822 ("Linux 5.7-rc4")
> > tag: v5.7-rc4
> 
> Applied patch 1,2,4,5,6,7,8
> 
> Thanks!

Great! Thanks. Am I right to expect the series in: git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
at the branch timers/core?

-Sergey

> 
>   -- Daniel
> 
> 
> -- 
> <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs
> 
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
