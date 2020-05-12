Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9D2F1CFBCD
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2020 19:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgELRQq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 May 2020 13:16:46 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:54462 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbgELRQq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 12 May 2020 13:16:46 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id AAD07803080B;
        Tue, 12 May 2020 17:16:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id nQAwNaAOJaKm; Tue, 12 May 2020 20:16:42 +0300 (MSK)
Date:   Tue, 12 May 2020 20:16:41 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <linux-mips@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: watchdog: dw-wdt: Support devices
 with asynch clocks
Message-ID: <20200512171641.vfrrqo54dii2yuur@mobilestation>
References: <20200306132758.703FC8030704@mail.baikalelectronics.ru>
 <20200510105807.880-1-Sergey.Semin@baikalelectronics.ru>
 <20200510105807.880-3-Sergey.Semin@baikalelectronics.ru>
 <f065ff5f-af86-4293-b208-766e41699436@cogentembedded.com>
 <477b9f75-485c-3208-b58c-56a5c13e15bb@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <477b9f75-485c-3208-b58c-56a5c13e15bb@cogentembedded.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Sergei

On Mon, May 11, 2020 at 11:28:00AM +0300, Sergei Shtylyov wrote:
> On 11.05.2020 11:25, Sergei Shtylyov wrote:
> 
> > > DW Watchdog IP core can be synthesised with asynchronous timer/APB
> > > clocks support (WDT_ASYNC_CLK_MODE_ENABLE == 1). In this case
> > > a separate clock signal is supposed to be used to feed watchdog timer
> > > and APB interface of the device. Lets along with the watchdog timer
> >                                         ^ verb missing? or comma?
> 
>    Oh, and probably "Let's" too. :-)
> 
> > 
> > > reference clock expect to have the optional APB3 bu interface clock
> > > sepcified in a DW WDT dt node.
> > 
> >     Specified.

Thanks for noticing this. I'll just change the sentence to: "Let's update
the DW Watchdog DT node schema so it would support the optional APB3 bus
clock specified along with the mandatory watchdog timer reference clock."

-Sergey

> > 
> > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > > Cc: Paul Burton <paulburton@kernel.org>
> > > Cc: Ralf Baechle <ralf@linux-mips.org>
> > > Cc: Arnd Bergmann <arnd@arndb.de>
> > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > Cc: linux-mips@vger.kernel.org
> > [...]
> 
> MBR, Sergei
