Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 586571E61E6
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 15:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390244AbgE1NNM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 09:13:12 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:41922 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390241AbgE1NNL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 May 2020 09:13:11 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 94FCE80307C0;
        Thu, 28 May 2020 13:13:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id U40uSsS2PPMI; Thu, 28 May 2020 16:13:08 +0300 (MSK)
Date:   Thu, 28 May 2020 16:13:07 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Arnd Bergmann <arnd@arndb.de>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        SoC Team <soc@kernel.org>, DTML <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/6] bus: Add Baikal-T1 APB-bus driver
Message-ID: <20200528131307.phopcjymtqhl2jyr@mobilestation>
References: <20200526125928.17096-1-Sergey.Semin@baikalelectronics.ru>
 <20200526125928.17096-6-Sergey.Semin@baikalelectronics.ru>
 <CAK8P3a1KT6G0pcLt56spm2O_Q5m_s+cdHfUrp2YUStS0wGigwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAK8P3a1KT6G0pcLt56spm2O_Q5m_s+cdHfUrp2YUStS0wGigwQ@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 28, 2020 at 02:17:17PM +0200, Arnd Bergmann wrote:
> On Tue, May 26, 2020 at 2:59 PM Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> >
> > Baikal-T1 AXI-APB bridge is used to access the SoC subsystem CSRs.
> > IO requests are routed to this bus by means of the DW AMBA 3 AXI
> > Interconnect. In case if an attempted APB transaction stays with no
> > response for a pre-defined time an interrupt occurs and the bus gets
> > freed for a next operation. This driver provides the interrupt handler
> > to detect the erroneous address, prints an error message about the
> > address fault, updates an errors counter. The counter and the APB-bus
> > operations timeout can be accessed via corresponding sysfs nodes.
> > A dedicated sysfs-node can be also used to artificially cause the
> > bus errors described above.
> >
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Paul Burton <paulburton@kernel.org>
> > Cc: Olof Johansson <olof@lixom.net>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: linux-mips@vger.kernel.org
> > Cc: soc@kernel.org
> > Cc: devicetree@vger.kernel.org
> >
> > ---
> 
> Applied with this fixup:

I'm afraid linux/io.h is also needed here.(

-Sergey

> 
> --- a/drivers/bus/bt1-apb.c
> +++ b/drivers/bus/bt1-apb.c
> @@ -16,6 +16,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/interrupt.h>
>  #include <linux/nmi.h>
> +#include <linux/of.h>
>  #include <linux/regmap.h>
>  #include <linux/clk.h>
>  #include <linux/reset.h>
> @@ -309,13 +310,13 @@ static ssize_t timeout_store(struct device *dev,
>  }
>  static DEVICE_ATTR_RW(timeout);
> 
> -static int inject_error_show(struct device *dev, struct device_attribute *attr,
> +static ssize_t inject_error_show(struct device *dev, struct
> device_attribute *attr,
>                              char *buf)
>  {
>         return scnprintf(buf, PAGE_SIZE, "Error injection: nodev irq\n");
>  }
> 
> -static int inject_error_store(struct device *dev,
> +static ssize_t inject_error_store(struct device *dev,
>                               struct device_attribute *attr,
>                               const char *data, size_t count)
>  {
