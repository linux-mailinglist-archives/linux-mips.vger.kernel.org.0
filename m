Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6AF925FC60
	for <lists+linux-mips@lfdr.de>; Mon,  7 Sep 2020 16:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730075AbgIGO41 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 7 Sep 2020 10:56:27 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:41665 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730068AbgIGO4Z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 7 Sep 2020 10:56:25 -0400
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4ED6660006;
        Mon,  7 Sep 2020 14:56:14 +0000 (UTC)
Date:   Mon, 7 Sep 2020 16:56:13 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, richard@nod.at, vigneshr@ti.com,
        arnd@arndb.de, brendanhiggins@google.com, tglx@linutronix.de,
        boris.brezillon@collabora.com, anders.roxell@linaro.org,
        masonccyang@mxic.com.tw, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, hauke.mehrtens@intel.com,
        andriy.shevchenko@intel.com, cheol.yong.kim@intel.com,
        qi-ming.wu@intel.com
Subject: Re: [RESEND PATCH v12 2/2] mtd: rawnand: Add NAND controller
 support on Intel LGM SoC
Message-ID: <20200907165613.79f44c58@xps13>
In-Reply-To: <20200907152025.66c18f5e@xps13>
References: <20200817052709.47035-1-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200817052709.47035-3-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200907152025.66c18f5e@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


Miquel Raynal <miquel.raynal@bootlin.com> wrote on Mon, 7 Sep 2020
15:20:25 +0200:

> Hi Murugan,
> 
> A few more comments below, but I guess the driver looks better now.
> 
> > +struct ebu_nand_controller {
> > +	struct nand_controller controller;
> > +	struct nand_chip chip;
> > +	struct device *dev;
> > +	void __iomem *ebu;
> > +	void __iomem *hsnand;
> > +	struct dma_chan *dma_tx;
> > +	struct dma_chan *dma_rx;
> > +	struct completion dma_access_complete;
> > +	unsigned long clk_rate;
> > +	struct clk *clk;
> > +	u32 nd_para0;
> > +	u8 cs_num;
> > +	struct ebu_nand_cs cs[MAX_CS];
> > +};
> > +
> > +static inline struct ebu_nand_controller *nand_to_ebu(struct nand_chip *chip)
> > +{
> > +	return container_of(chip, struct ebu_nand_controller, chip);
> > +}
> > +
> > +static u8 ebu_nand_readb(struct nand_chip *chip)  
> 
> Can't you prefix with intel_ instead of ebu_ ?

Actually not, as the IP is shared with MIPS IIUC, just ignore this
comment.

Thanks,
Miquèl
