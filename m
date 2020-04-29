Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8D241BE18F
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 16:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726456AbgD2Osh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 10:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726348AbgD2Osh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 10:48:37 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B450C03C1AD;
        Wed, 29 Apr 2020 07:48:37 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 632B52A224A;
        Wed, 29 Apr 2020 15:48:35 +0100 (BST)
Date:   Wed, 29 Apr 2020 16:48:32 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>, qi-ming.wu@intel.com
Cc:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, cheol.yong.kim@intel.com,
        hauke.mehrtens@intel.com, anders.roxell@linaro.org,
        vigneshr@ti.com, arnd@arndb.de, richard@nod.at,
        brendanhiggins@google.com, linux-mips@vger.kernel.org,
        robh+dt@kernel.org, miquel.raynal@bootlin.com, tglx@linutronix.de,
        masonccyang@mxic.com.tw, andriy.shevchenko@intel.com
Subject: Re: [PATCH v4 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200429164832.6800fc70@collabora.com>
In-Reply-To: <9d77c64c-d0f9-7a13-3391-d05bf458bdb1@linux.intel.com>
References: <20200429104205.18780-1-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200429104205.18780-3-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200429162249.55d38ee8@collabora.com>
        <9d77c64c-d0f9-7a13-3391-d05bf458bdb1@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 29 Apr 2020 22:33:37 +0800
"Ramuthevar, Vadivel MuruganX"
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote:

> Hi Boris,
> 
> On 29/4/2020 10:22 pm, Boris Brezillon wrote:
> > On Wed, 29 Apr 2020 18:42:05 +0800
> > "Ramuthevar, Vadivel MuruganX"
> > <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> >   
> >> +
> >> +#define EBU_ADDR_SEL(n)		(0x20 + (n) * 4)
> >> +#define EBU_ADDR_MASK		(5 << 4)  
> > 
> > It's still unclear what ADDR_MASK is for. Can you add a comment
> > explaining what it does?  
> 
> Thank you Boris, keep review and giving inputs, will update.

Can you please explain it here before sending a new version?

> >   
> >> +#define EBU_ADDR_SEL_REGEN	0x1  
> > 
> >   
> >> +
> >> +	writel(lower_32_bits(ebu_host->cs[ebu_host->cs_num].nand_pa) |
> >> +	       EBU_ADDR_SEL_REGEN | EBU_ADDR_MASK,
> >> +	       ebu_host->ebu + EBU_ADDR_SEL(reg));
> >> +
> >> +	writel(EBU_MEM_BASE_CS_0 | EBU_ADDR_MASK | EBU_ADDR_SEL_REGEN,
> >> +	       ebu_host->ebu + EBU_ADDR_SEL(0));
> >> +	writel(EBU_MEM_BASE_CS_1 | EBU_ADDR_MASK | EBU_ADDR_SEL_REGEN,
> >> +	       ebu_host->ebu + EBU_ADDR_SEL(reg));  
> > 
> > That's super weird. You seem to set EBU_ADDR_SEL(reg) twice. Are you
> > sure that's needed, and are we setting EBU_ADDR_SEL(0) here?  
> 
> You are right, its weird only, but we need it, since different chip 
> select has different memory region access address.

Well, that doesn't make any sense, the second write to
EBU_ADDR_SEL(reg) overrides the first one, meaning that nand_pa is
actually never written to ADDR_SEL(reg).

> 
> Yes , we are setting both CS0 and CS1 memory access region, if you have 
> any concern to optimize, please suggest me, Thanks!

If you want to setup both CS, and the address written in EBU_ADDR_SEL(x)
is really related to the nand_pa address, then retrieve resources for
all CS ranges. If it's not related, please explain what those
EBU_MEM_BASE_CS_X values encode.
