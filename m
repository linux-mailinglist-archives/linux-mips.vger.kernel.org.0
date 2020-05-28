Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC55D1E618F
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 15:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390053AbgE1NAy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 09:00:54 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:41840 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389878AbgE1NAx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 May 2020 09:00:53 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 1155C80307C7;
        Thu, 28 May 2020 13:00:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id QOYHV0u7-PkZ; Thu, 28 May 2020 16:00:51 +0300 (MSK)
Date:   Thu, 28 May 2020 16:00:50 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Arnd Bergmann <arnd@arndb.de>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "soc@kernel.org" <soc@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/6] bus: Add Baikal-T1 AXI-bus driver
Message-ID: <20200528130050.f7mmznwpbvvasf2w@mobilestation>
References: <20200526125928.17096-1-Sergey.Semin@baikalelectronics.ru>
 <20200526125928.17096-5-Sergey.Semin@baikalelectronics.ru>
 <CAHp75VcfkPPy5YjNrcv8c6doyQz5C47QyREE0v6tfQjXYrBijQ@mail.gmail.com>
 <CAK8P3a2WMqTRitUU86hSV3HSK12-hF_RDoFg51PRGTLmXwznvA@mail.gmail.com>
 <20200528122738.rbl2dkgep4ipr2je@mobilestation>
 <CAK8P3a1ctV8Lj4PGJyzZ_eRMcXxoW1T7Wbk_2wkT4HUcFUTqdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAK8P3a1ctV8Lj4PGJyzZ_eRMcXxoW1T7Wbk_2wkT4HUcFUTqdQ@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 28, 2020 at 02:44:32PM +0200, Arnd Bergmann wrote:
> On Thu, May 28, 2020 at 2:27 PM Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> >
> > On Thu, May 28, 2020 at 02:14:58PM +0200, Arnd Bergmann wrote:
> > > On Thu, May 28, 2020 at 12:01 AM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > On Tuesday, May 26, 2020, Serge Semin <Sergey.Semin@baikalelectronics.ru> wrote:
> > > >>
> > > >> AXI3-bus is the main communication bus connecting all high-speed
> > > >> peripheral IP-cores with RAM controller and MIPS P5600 cores on Baikal-T1
> > > >> SoC. Bus traffic arbitration is done by means of DW AMBA 3 AXI
> > > >> Interconnect (so called AXI Main Interconnect) routing IO requests from
> > > >> one SoC block to another. This driver provides a way to detect any bus
> > > >> protocol errors and device not responding situations by means of an
> > > >> embedded on top of the interconnect errors handler block (EHB). AXI
> > > >> Interconnect QoS arbitration tuning is currently unsupported.
> > > >> The bus doesn't provide a way to detect the interconnected devices,
> > > >> so they are supposed to be statically defined like by means of the
> > > >> simple-bus sub-nodes.
> > > >
> > > >
> > > >
> > > > Few comments in case if you need a new version. Main point is about sysfs_streq().
> > >
> > > I've applied the patch now and folded in fixes for the build warnings and
> > > errors pointed out by the test robot, but I did not include the changes you
> > > suggested.
> >
> > Are you saying that the build-errors and warnings have already been fixed by
> > you, right? If so could you please give me a link to the repo with those
> > commits, so I'd work with the up-to-date code?
> 

> I've pushed it to https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/,
> 
> I made a local "baikal/drivers" branch with just your patches, updated
> to address the build reports. This is merged into the "arm/drivers"
> branch that contains all driver specific changes across all SoCs and
> this is what I'll send to Linus next week.
> 
> There is also the "for-next" branch that contains all arm/* branches,
> and this is what gets pulled into linux-next, so your patches will show
> up there tomorrow as well.

I see. Thanks for explanation. I've monitored the soc/soc.git a few minutes
ago, but the gitolite web-interface showed me that the last update was made
9 hours ago. So I thought you could be using some another repo. Now I see
the fresh updates and the drivers being merges.

I'll address the Andy's comments and send a follow-up patches with fixes shortly
today.

BTW I don't see the next commit:
[PATCH v3 3/6] dt-bindings: memory: Add Baikal-T1 L2-cache Control Block binding
in the baikal/drivers, so the l2-ctl binding hasn't been merged into the
arm/drivers and for-next branches. You must have missed that patch. Could you
please make sure it's also merged in?

Thanks
-Sergey

> 
> You can normally check the status of any submission to soc@kernel.org
> at https://patchwork.kernel.org/project/linux-soc/list/, but it seems that
> has not picked up the status yet, and I'll have to update it manually.
> 
>        Arnd
