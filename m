Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 162581BACAB
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2020 20:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726580AbgD0SaG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Apr 2020 14:30:06 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40228 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbgD0SaG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Apr 2020 14:30:06 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E82952A0D29;
        Mon, 27 Apr 2020 19:30:03 +0100 (BST)
Date:   Mon, 27 Apr 2020 20:30:01 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, richard@nod.at, vigneshr@ti.com,
        arnd@arndb.de, brendanhiggins@google.com, tglx@linutronix.de,
        anders.roxell@linaro.org, masonccyang@mxic.com.tw,
        piotrs@cadence.com, robh+dt@kernel.org, linux-mips@vger.kernel.org,
        hauke.mehrtens@intel.com, andriy.shevchenko@intel.com,
        qi-ming.wu@intel.com, cheol.yong.kim@intel.com
Subject: Re: [PATCH v2 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200427203001.1d583322@collabora.com>
In-Reply-To: <20200427173846.3866c506@xps13>
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200418105533.477ce529@collabora.com>
        <20200427173846.3866c506@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 27 Apr 2020 17:38:46 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@collabora.com> wrote on Sat, 18 Apr
> 2020 10:55:33 +0200:
> 
> > On Fri, 17 Apr 2020 16:21:47 +0800
> > "Ramuthevar,Vadivel MuruganX"
> > <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> >   
> > > From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> > > 
> > > This patch adds the new IP of Nand Flash Controller(NFC) support
> > > on Intel's Lightning Mountain(LGM) SoC.
> > > 
> > > DMA is used for burst data transfer operation, also DMA HW supports
> > > aligned 32bit memory address and aligned data access by default.
> > > DMA burst of 8 supported. Data register used to support the read/write
> > > operation from/to device.
> > > 
> > > NAND controller driver implements ->exec_op() to replace legacy hooks,
> > > these specific call-back method to execute NAND operations.
> > > 
> > > Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> > > ---
> > >  drivers/mtd/nand/raw/Kconfig          |   7 +
> > >  drivers/mtd/nand/raw/Makefile         |   1 +
> > >  drivers/mtd/nand/raw/intel_lgm_nand.c | 740 ++++++++++++++++++++++++++++++++++    
> > 
> > I wonder if we shouldn't name the driver infineon-nand-controller.c
> > since the original design comes from Infineon IIUC. intel_lgm_nand.c is
> > definitely misleading, as we also have a nand_intel.c file which is for
> > Intel NAND chips (not NAND controllers). If we keep intel in the name,
> > let's at least add a "-controller" suffix to make it clear.
> > 
> > Side note for Miquel: I guess we would also benefit from having a clear
> > core vs controller-drivers split as recently done for spi-nor (a
> > controller subdir has been created).  
> 
> I would even like a core vs controller drivers vs nand chips drivers.
> 
> Macronix for instance has a NAND controller driver and a NAND chip
> driver, that's why, even if it is a bit long, I enforce the -nfc or
> -nand-controller (my favorite) suffix now.

Maybe we can make it happen. I mean, moving drivers to a sub-dir is
pretty easy ;).
