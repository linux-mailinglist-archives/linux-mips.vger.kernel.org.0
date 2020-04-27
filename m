Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4310A1BA828
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2020 17:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728230AbgD0Piz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 27 Apr 2020 11:38:55 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:47463 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbgD0Piz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Apr 2020 11:38:55 -0400
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2D5C0C0011;
        Mon, 27 Apr 2020 15:38:48 +0000 (UTC)
Date:   Mon, 27 Apr 2020 17:38:46 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
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
Message-ID: <20200427173846.3866c506@xps13>
In-Reply-To: <20200418105533.477ce529@collabora.com>
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200418105533.477ce529@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Boris,

Boris Brezillon <boris.brezillon@collabora.com> wrote on Sat, 18 Apr
2020 10:55:33 +0200:

> On Fri, 17 Apr 2020 16:21:47 +0800
> "Ramuthevar,Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> 
> > From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> > 
> > This patch adds the new IP of Nand Flash Controller(NFC) support
> > on Intel's Lightning Mountain(LGM) SoC.
> > 
> > DMA is used for burst data transfer operation, also DMA HW supports
> > aligned 32bit memory address and aligned data access by default.
> > DMA burst of 8 supported. Data register used to support the read/write
> > operation from/to device.
> > 
> > NAND controller driver implements ->exec_op() to replace legacy hooks,
> > these specific call-back method to execute NAND operations.
> > 
> > Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> > ---
> >  drivers/mtd/nand/raw/Kconfig          |   7 +
> >  drivers/mtd/nand/raw/Makefile         |   1 +
> >  drivers/mtd/nand/raw/intel_lgm_nand.c | 740 ++++++++++++++++++++++++++++++++++  
> 
> I wonder if we shouldn't name the driver infineon-nand-controller.c
> since the original design comes from Infineon IIUC. intel_lgm_nand.c is
> definitely misleading, as we also have a nand_intel.c file which is for
> Intel NAND chips (not NAND controllers). If we keep intel in the name,
> let's at least add a "-controller" suffix to make it clear.
> 
> Side note for Miquel: I guess we would also benefit from having a clear
> core vs controller-drivers split as recently done for spi-nor (a
> controller subdir has been created).

I would even like a core vs controller drivers vs nand chips drivers.

Macronix for instance has a NAND controller driver and a NAND chip
driver, that's why, even if it is a bit long, I enforce the -nfc or
-nand-controller (my favorite) suffix now.

Thanks,
Miquèl
