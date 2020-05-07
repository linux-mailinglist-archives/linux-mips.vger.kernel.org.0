Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0EB1C827F
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 08:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbgEGG1i (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 02:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgEGG1i (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 May 2020 02:27:38 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45649C061A10;
        Wed,  6 May 2020 23:27:38 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6BD222A2798;
        Thu,  7 May 2020 07:27:33 +0100 (BST)
Date:   Thu, 7 May 2020 08:27:30 +0200
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
Message-ID: <20200507082730.6425cd96@collabora.com>
In-Reply-To: <440c0002-e572-7b8b-ba08-773932370eb0@linux.intel.com>
References: <20200507001537.4034-1-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200507001537.4034-3-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200507072831.1bf7f784@collabora.com>
        <440c0002-e572-7b8b-ba08-773932370eb0@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 7 May 2020 14:13:42 +0800
"Ramuthevar, Vadivel MuruganX"
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote:

> Hi Boris,
> 
>     Thank you very much for the review comments and your time...
> 
> On 7/5/2020 1:28 pm, Boris Brezillon wrote:
> > On Thu,  7 May 2020 08:15:37 +0800
> > "Ramuthevar,Vadivel MuruganX"
> > <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> >   
> >> +	reg = readl(ebu_host->ebu + EBU_ADDR_SEL(ebu_host->cs_num));
> >> +	writel(reg | EBU_ADDR_MASK(5) | EBU_ADDR_SEL_REGEN,
> >> +	       ebu_host->ebu + EBU_ADDR_SEL(ebu_host->cs_num));  
> > 
> > Seriously, did you really think I would not notice what you're doing
> > here?  
> Yes , I know that you have very good understanding about this.
>   You're reading the previous value which either contains a default
> > mapping or has the mapping set by the bootloader, and write it back to
> > the register along with a new mask and the REGEN bit set (which
> > BTW is wrong since you don't mask out other fields before updating
> > them).  
> There is no other field get overwritten
>   This confirms that this Core -> FPI address translation exists
> > and has to be set properly, so please stop lying about that.  
> 
> Sorry, there is no SW translation, as I have mentioned that it's 
> optional only, for safer side , reading and writing the default values.

Then write EBU_ADDR_SEL_REGEN and we'll if see that works. I suspect it
won't.

> The memory region to enabled that's my concern so written the same 
> register values.

I don't buy that, sorry.

> 
> This will not be impact other fields, so please see below for reference
> 
> The EBU Address Select Registers EBU_ADDR_SEL_0 to EBU_ADDSEL3 establish 
> and control memory regions for external accesses.
> 
> Reset Value: 17400001H

See, as suspected the reset value is exactly what you expect.

