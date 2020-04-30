Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 397851BF293
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 10:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgD3IVV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Apr 2020 04:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgD3IVU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Apr 2020 04:21:20 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B0E3C035495;
        Thu, 30 Apr 2020 01:21:20 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6F5E22A23E2;
        Thu, 30 Apr 2020 09:21:18 +0100 (BST)
Date:   Thu, 30 Apr 2020 10:21:14 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc:     qi-ming.wu@intel.com, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        cheol.yong.kim@intel.com, hauke.mehrtens@intel.com,
        anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
        richard@nod.at, brendanhiggins@google.com,
        linux-mips@vger.kernel.org, robh+dt@kernel.org,
        miquel.raynal@bootlin.com, tglx@linutronix.de,
        masonccyang@mxic.com.tw, andriy.shevchenko@intel.com
Subject: Re: [PATCH v4 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200430102114.29b6552f@collabora.com>
In-Reply-To: <1de9ba29-30f1-6829-27e0-6f141e9bb1e6@linux.intel.com>
References: <20200429104205.18780-1-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200429104205.18780-3-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200429162249.55d38ee8@collabora.com>
        <9d77c64c-d0f9-7a13-3391-d05bf458bdb1@linux.intel.com>
        <20200429164832.6800fc70@collabora.com>
        <2e83a2f7-853c-f0e2-f686-daf1e0649eae@linux.intel.com>
        <20200429173107.5c6d2f55@collabora.com>
        <1de9ba29-30f1-6829-27e0-6f141e9bb1e6@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 30 Apr 2020 15:50:30 +0800
"Ramuthevar, Vadivel MuruganX"
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote:

> Hi Boris,
> 
>    Thank you very much for keep reviewing the patches and more queries...
> 
> On 29/4/2020 11:31 pm, Boris Brezillon wrote:
> > On Wed, 29 Apr 2020 23:18:31 +0800
> > "Ramuthevar, Vadivel MuruganX"
> > <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> >   
> >> Hi Boris,
> >>
> >> On 29/4/2020 10:48 pm, Boris Brezillon wrote:  
> >>> On Wed, 29 Apr 2020 22:33:37 +0800
> >>> "Ramuthevar, Vadivel MuruganX"
> >>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> >>>      
> >>>> Hi Boris,
> >>>>
> >>>> On 29/4/2020 10:22 pm, Boris Brezillon wrote:  
> >>>>> On Wed, 29 Apr 2020 18:42:05 +0800
> >>>>> "Ramuthevar, Vadivel MuruganX"
> >>>>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> >>>>>         
> >>>>>> +
> >>>>>> +#define EBU_ADDR_SEL(n)		(0x20 + (n) * 4)
> >>>>>> +#define EBU_ADDR_MASK		(5 << 4)  
> >>>>>
> >>>>> It's still unclear what ADDR_MASK is for. Can you add a comment
> >>>>> explaining what it does?  
> >>>>
> >>>> Thank you Boris, keep review and giving inputs, will update.  
> >>>
> >>> Can you please explain it here before sending a new version?  
> >>
> >> Memory Region Address Mask:
> >> Specifies the number of right-most bits in the base address that should
> >> be included in the address comparison. bits positions(7:4).  
> > 
> > Okay, then the macro should be
> > 
> > #define EBU_ADDR_MASK(x)	((x) << 4)
> > 
> > And now I'd like you to explain why 5 is the right value for that field
> > (I guess that has to do with the position of the CS/ALE/CLE pins).  
> 
> 5 : bit 26, 25, 24, 23, 22 to be included for comparison in the 

That's 6 bits to me, not 5.

> ADDR_SELx , it compares only 5 bits.

Definitely not what I would qualify as right-most bits. So, you say the
comparison always starts at bit 22, and ends at 22+<num-addr-bits>?

> >>>> Yes , we are setting both CS0 and CS1 memory access region, if you have
> >>>> any concern to optimize, please suggest me, Thanks!  
> >>>
> >>> If you want to setup both CS, and the address written in EBU_ADDR_SEL(x)
> >>> is really related to the nand_pa address, then retrieve resources for
> >>> all CS ranges.  
> >> If it's not related, please explain what those  
> >>> EBU_MEM_BASE_CS_X values encode.  
> >>
> >> Memory Region Base Address
> >> FPI Bus addresses are compared to this base address in conjunction with
> >> the mask control(EBU_ADDR_MASK). Driver need to program this field!  
> > 
> > That's not explaining what the base address should be. Is 'nand_pa' the
> > value we should have there?  
> 
> The one prorgrammed in the addr_sel register is used by the HW 
> controller, it remaps to  0x174XX-> CS0 and 0x17CXX->CS1.
> The hardware itself, decodes only for 1740xx/17c0xx, other random values 
> cannot be programmed

The question is, is it the same value we have in nand_pa or it is
different?
