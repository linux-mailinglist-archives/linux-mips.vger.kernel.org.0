Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8341C82D4
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 08:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725819AbgEGGsg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 02:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725763AbgEGGsg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 May 2020 02:48:36 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62CA6C061A10;
        Wed,  6 May 2020 23:48:36 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4FF7D2A27B2;
        Thu,  7 May 2020 07:48:34 +0100 (BST)
Date:   Thu, 7 May 2020 08:48:31 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, arnd@arndb.de,
        brendanhiggins@google.com, tglx@linutronix.de,
        anders.roxell@linaro.org, masonccyang@mxic.com.tw,
        robh+dt@kernel.org, linux-mips@vger.kernel.org,
        hauke.mehrtens@intel.com, andriy.shevchenko@intel.com,
        qi-ming.wu@intel.com, cheol.yong.kim@intel.com
Subject: Re: [PATCH v5 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200507084831.1483b19a@collabora.com>
In-Reply-To: <69a06362-1f9d-bf65-4a9b-98fc6b63a391@linux.intel.com>
References: <20200507001537.4034-1-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200507001537.4034-3-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200507072831.1bf7f784@collabora.com>
        <440c0002-e572-7b8b-ba08-773932370eb0@linux.intel.com>
        <20200507082730.6425cd96@collabora.com>
        <69a06362-1f9d-bf65-4a9b-98fc6b63a391@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 7 May 2020 14:38:52 +0800
"Ramuthevar, Vadivel MuruganX"
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote:

> Hi Boris,
> 
>    Thank you very much for the review comments and your time...
> 
> On 7/5/2020 2:27 pm, Boris Brezillon wrote:
> > On Thu, 7 May 2020 14:13:42 +0800
> > "Ramuthevar, Vadivel MuruganX"
> > <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> >   
> >> Hi Boris,
> >>
> >>      Thank you very much for the review comments and your time...
> >>
> >> On 7/5/2020 1:28 pm, Boris Brezillon wrote:  
> >>> On Thu,  7 May 2020 08:15:37 +0800
> >>> "Ramuthevar,Vadivel MuruganX"
> >>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> >>>      
> >>>> +	reg = readl(ebu_host->ebu + EBU_ADDR_SEL(ebu_host->cs_num));
> >>>> +	writel(reg | EBU_ADDR_MASK(5) | EBU_ADDR_SEL_REGEN,
> >>>> +	       ebu_host->ebu + EBU_ADDR_SEL(ebu_host->cs_num));  
> >>>
> >>> Seriously, did you really think I would not notice what you're doing
> >>> here?  
> >> Yes , I know that you have very good understanding about this.
> >>    You're reading the previous value which either contains a default  
> >>> mapping or has the mapping set by the bootloader, and write it back to
> >>> the register along with a new mask and the REGEN bit set (which
> >>> BTW is wrong since you don't mask out other fields before updating
> >>> them).  
> >> There is no other field get overwritten
> >>    This confirms that this Core -> FPI address translation exists  
> >>> and has to be set properly, so please stop lying about that.  
> >>
> >> Sorry, there is no SW translation, as I have mentioned that it's
> >> optional only, for safer side , reading and writing the default values.  
> > 
> > Then write EBU_ADDR_SEL_REGEN and we'll if see that works. I suspect it
> > won't.  
> 
> You mean, without reading just writing EBU_ADDR_SEL_REGEN bit alone in 
> EBU_ADDR_SELx , as you said it won't work because it overwrites 0x174 
> with 0x0 values so BASE is lost.

Which confirms that this mapping has to be defined.

> either we can leave it or read & write with ORed | EBU_ADDR_SEL_REGEN

None of this is acceptable IMO. You have to build the value based on the
address translation described in the DT. Why are you so reluctant to
this approach?

> 
> Please correct me if anything is wrong, Thanks!
> >   
> >> The memory region to enabled that's my concern so written the same
> >> register values.  
> > 
> > I don't buy that, sorry.
> >   
> >>
> >> This will not be impact other fields, so please see below for reference
> >>
> >> The EBU Address Select Registers EBU_ADDR_SEL_0 to EBU_ADDSEL3 establish
> >> and control memory regions for external accesses.
> >>
> >> Reset Value: 17400001H  
> > 
> > See, as suspected the reset value is exactly what you expect.  
> 
> Yes , that's the reason said being optional.

Then it's not optional. It just works because you use the default
value.
