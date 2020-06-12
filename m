Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3931F7446
	for <lists+linux-mips@lfdr.de>; Fri, 12 Jun 2020 09:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgFLHC7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 12 Jun 2020 03:02:59 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:47283 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgFLHC7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Jun 2020 03:02:59 -0400
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id EE08910000A;
        Fri, 12 Jun 2020 07:02:53 +0000 (UTC)
Date:   Fri, 12 Jun 2020 09:02:52 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>, tsbogend@alpha.franken.de,
        bcm-kernel-feedback-list@broadcom.com, richard@nod.at,
        vigneshr@ti.com, Jonas Gorski <jonas.gorski@gmail.com>,
        linus.walleij@linaro.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: parsers: bcm63xx: simplify CFE detection
Message-ID: <20200612090252.02581c21@xps13>
In-Reply-To: <7DC0E349-1319-47FE-8565-9B30C190EACB@gmail.com>
References: <20200608094053.3381512-1-noltari@gmail.com>
        <20200608160649.3717152-1-noltari@gmail.com>
        <20200611095540.250184d2@xps13>
        <779D37C7-58CB-49AF-8739-C34295B86FC4@gmail.com>
        <715b0947-f4dd-0c04-5c52-5da06c04d665@gmail.com>
        <7DC0E349-1319-47FE-8565-9B30C190EACB@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Álvaro,

Álvaro Fernández Rojas <noltari@gmail.com> wrote on Thu, 11 Jun 2020
18:14:20 +0200:

> Hi Florian,
> 
> > El 11 jun 2020, a las 17:42, Florian Fainelli <f.fainelli@gmail.com> escribió:
> > 
> > 
> > 
> > On 6/11/2020 8:16 AM, Álvaro Fernández Rojas wrote:  
> >> Hi Miquel,
> >>   
> >>> El 11 jun 2020, a las 9:55, Miquel Raynal <miquel.raynal@bootlin.com> escribió:
> >>> 
> >>> Hi Álvaro,
> >>> 
> >>> Álvaro Fernández Rojas <noltari@gmail.com> wrote on Mon,  8 Jun 2020
> >>> 18:06:49 +0200:
> >>>   
> >>>> Instead of trying to parse CFE version string, which is customized by some
> >>>> vendors, let's just check that "CFE1" was passed on argument 3.
> >>>> 
> >>>> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> >>>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> >>>> ---
> >>>> v2: use CFE_EPTSEAL definition and avoid using an additional funtion.
> >>>> 
> >>>> drivers/mtd/parsers/bcm63xxpart.c | 29 ++++-------------------------
> >>>> 1 file changed, 4 insertions(+), 25 deletions(-)
> >>>> 
> >>>> diff --git a/drivers/mtd/parsers/bcm63xxpart.c b/drivers/mtd/parsers/bcm63xxpart.c
> >>>> index 78f90c6c18fd..493a75b2f266 100644
> >>>> --- a/drivers/mtd/parsers/bcm63xxpart.c
> >>>> +++ b/drivers/mtd/parsers/bcm63xxpart.c
> >>>> @@ -22,6 +22,9 @@
> >>>> #include <linux/mtd/partitions.h>
> >>>> #include <linux/of.h>
> >>>> 
> >>>> +#include <asm/bootinfo.h>
> >>>> +#include <asm/fw/cfe/cfe_api.h>  
> >>> 
> >>> Are you sure both includes are needed?  
> >> 
> >> asm/bootinfo.h is needed for fw_arg3 and asm/fw/cfe/cfe_api.h is needed for CFE_EPTSEAL.
> >>   
> >>> 
> >>> I don't think it is a good habit to include asm/ headers, are you sure
> >>> there is not another header doing it just fine?  
> >> 
> >> Both are needed unless you want to add another definition of CFE_EPTSEAL value.
> >> There are currently two CFE magic definitions, the one in asm/fw/cfe/cfe_api.h and another one in bcm47xxpart.c:
> >> https://github.com/torvalds/linux/blob/master/arch/mips/include/asm/fw/cfe/cfe_api.h#L28
> >> https://github.com/torvalds/linux/blob/master/drivers/mtd/parsers/bcm47xxpart.c#L33  
> > 
> > The caveat with that approach is that this reduces the compilation
> > surface to MIPS and BMIPS_GENERIC and BCM63XX only, which is a bit
> > small. If we could move the CFE definitions to a shared header, and
> > consolidate the value used by bcm47xxpart.c as well, that would allow us
> > to build the bcm63xxpart.c file with COMPILE_TEST on other
> > architectures. This does not really have functional value, but for
> > maintainers like Miquel, it allows them to quickly test their entire
> > drivers/mtd/ directory.  
> 
> I don’t think fw_arg3 available on non mips archs, is it?
> I’m happy to move it to a shared header (which would be a good location for this?), but if I’m right it would still be restricted to MIPS.

Restricting a definition to MIPS, even if it makes sense for you is
very limiting for me. I need to be able to build as much drivers as I
can from my laptop and verify they at least compile correctly. If I need
a MIPS toolchain, an ARC toolchain, a PowerPC, an ARM, an ARM64 and
whatever other funky toolchain to do just that in X steps: it's very
painful. We have been adding COMPILE_TEST dependencies on as much
drivers as we could and we want to continue moving forward. Using such
include would need to drop the COMPILE_TEST condition from Kconfig and
this is not something I am willing to do.

Thanks for your understanding :)
Miquèl
