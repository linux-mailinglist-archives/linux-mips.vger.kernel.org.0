Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0E291BF843
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 14:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbgD3MgF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Apr 2020 08:36:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726053AbgD3MgF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Apr 2020 08:36:05 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10E99C035494;
        Thu, 30 Apr 2020 05:36:05 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 101482A23DC;
        Thu, 30 Apr 2020 13:36:03 +0100 (BST)
Date:   Thu, 30 Apr 2020 14:36:00 +0200
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
Message-ID: <20200430143600.27031639@collabora.com>
In-Reply-To: <1d5aec11-a7b5-01c2-6614-16e57c64511b@linux.intel.com>
References: <20200429104205.18780-1-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200429104205.18780-3-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200429162249.55d38ee8@collabora.com>
        <9d77c64c-d0f9-7a13-3391-d05bf458bdb1@linux.intel.com>
        <20200429164832.6800fc70@collabora.com>
        <2e83a2f7-853c-f0e2-f686-daf1e0649eae@linux.intel.com>
        <20200429173107.5c6d2f55@collabora.com>
        <1de9ba29-30f1-6829-27e0-6f141e9bb1e6@linux.intel.com>
        <20200430102114.29b6552f@collabora.com>
        <1df71cf7-4cae-4cd0-864c-0812bb2cc123@linux.intel.com>
        <20200430103658.4b0b979e@collabora.com>
        <1d5aec11-a7b5-01c2-6614-16e57c64511b@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 30 Apr 2020 17:07:03 +0800
"Ramuthevar, Vadivel MuruganX"
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote:

> >>> The question is, is it the same value we have in nand_pa or it is
> >>> different?
> >>>      
> >> Different address which is 0xE1400000 NAND_BASE_PHY address.  
> > 
> > Then why didn't you tell me they didn't match when I suggested to pass  
> 
> sorry, because you keep asking nand_pa after that only I realized that.
> 
> > nand_pa? So now the question is, what does this address represent?  
> 
>                 EBU-MODULE
>   _________     _______________________
> |         |   |            |NAND CTRL  |
> | FPI BUS |==>| CS0(0x174) | 0xE100    ( 0xE14/0xE1C) NAND_PHY_BASE
> |_________|   |_CS1(0x17C)_|__________ |
> 
> EBU_CONRTROLLER_BASE : 0xE0F0_0000
> HSNAND_BASE: 0xE100_0000
> NAND_CS0: 0xE140_0000
> NAND_CS1: 0xE1C0_0000
> 
> MEM_REGION_BASE_CS0: 0x17400 (internal to ebu controller )
> MEM_REGION_BASE_CS1: 0x17C00
> 

Hm, I wonder if we shouldn't use a 'ranges' property to describe this
address translation. Something like

	ebu@xxx {
		ranges = <0x17400000 0xe1400000 0x1000>,
			 <0x17c00000 0xe1c00000 0x1000>;
		reg = <0x17400000>, <0x17c00000>;
		reg-names = "cs-0", "cs-1";
	}

The translated address (0xE1X00000) will be available in res->start,
and the non-translated one (0x17X00000) can be retrieved with
of_get_address(). All you'd have to do then would be calculate the
mask:

	mask = (translated_address & original_address) >> 22;
	num_comp_bits = fls(mask);
	WARN_ON(mask != GENMASK(num_comp_bits - 1, 0));

Which allows you to properly set the ADDR_SEL() register without
relying on some hardcoded values:

	writel(original_address | EBU_ADDR_SEL_REGEN |
	       EBU_ADDR_COMP_BITS(num_comp_bits),
	       ebu_host->ebu + EBU_ADDR_SEL(csid));

That's quite important if we want to merge the xway NAND driver with
this one.
