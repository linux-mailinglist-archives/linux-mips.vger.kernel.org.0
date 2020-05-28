Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0013E1E6277
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 15:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390425AbgE1Nkv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 09:40:51 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:42070 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390335AbgE1Nkv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 May 2020 09:40:51 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 76FA480307C0;
        Thu, 28 May 2020 13:40:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id i8BwLYz9B2fO; Thu, 28 May 2020 16:40:47 +0300 (MSK)
Date:   Thu, 28 May 2020 16:40:46 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "soc@kernel.org" <soc@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/6] bus: Add Baikal-T1 AXI-bus driver
Message-ID: <20200528134046.scxig3she3wyjyko@mobilestation>
References: <20200526125928.17096-1-Sergey.Semin@baikalelectronics.ru>
 <20200526125928.17096-5-Sergey.Semin@baikalelectronics.ru>
 <CAHp75VcfkPPy5YjNrcv8c6doyQz5C47QyREE0v6tfQjXYrBijQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHp75VcfkPPy5YjNrcv8c6doyQz5C47QyREE0v6tfQjXYrBijQ@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 28, 2020 at 01:00:57AM +0300, Andy Shevchenko wrote:
> On Tuesday, May 26, 2020, Serge Semin <Sergey.Semin@baikalelectronics.ru>
> wrote:
> 
> > AXI3-bus is the main communication bus connecting all high-speed
> > peripheral IP-cores with RAM controller and MIPS P5600 cores on Baikal-T1
> > SoC. Bus traffic arbitration is done by means of DW AMBA 3 AXI
> > Interconnect (so called AXI Main Interconnect) routing IO requests from
> > one SoC block to another. This driver provides a way to detect any bus
> > protocol errors and device not responding situations by means of an
> > embedded on top of the interconnect errors handler block (EHB). AXI
> > Interconnect QoS arbitration tuning is currently unsupported.
> > The bus doesn't provide a way to detect the interconnected devices,
> > so they are supposed to be statically defined like by means of the
> > simple-bus sub-nodes.
> 
> 
> 
> Few comments in case if you need a new version. Main point is about
> sysfs_streq().

Hello, Andy. Thanks for your comments. I'll address most of them in a follow-up
patches. See just one note below.

> 
> 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Paul Burton <paulburton@kernel.org>
> > Cc: Olof Johansson <olof@lixom.net>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: linux-mips@vger.kernel.org
> > Cc: soc@kernel.org
> > Cc: devicetree@vger.kernel.org
> >

[nip]

> > +
> > +static void bt1_axi_clear_data(void *data)
> > +{
> > +       struct bt1_axi *axi = data;
> > +       struct platform_device *pdev = to_platform_device(axi->dev);
> > +
> > +       platform_set_drvdata(pdev, NULL);
> 
> 

> Doesn't device driver core do this already?

It doesn't on remove. This cleanups the drvdata pointer when the driver is
unloaded at the moment of remove() callback calling. This is a good
practice to leave the device the same as it has been before usage including
the pointer value. In this case if theoretically someone (though very
unlikely, but anyway) would try to use the pointer without having it
initialized, the NULL-dereference would pop up, otherwise we may
corrupt someones memory, which is very nasty.

-Sergey
