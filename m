Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED11C1B0603
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 11:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgDTJxC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 05:53:02 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47324 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbgDTJxC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Apr 2020 05:53:02 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 478942A0BBF;
        Mon, 20 Apr 2020 10:52:59 +0100 (BST)
Date:   Mon, 20 Apr 2020 11:52:56 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh R <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
        Brendan Higgins <brendanhiggins@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Anders Roxell <anders.roxell@linaro.org>,
        masonccyang@mxic.com.tw, piotrs@cadence.com,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        "hauke.mehrtens" <hauke.mehrtens@intel.com>, qi-ming.wu@intel.com,
        cheol.yong.kim@intel.com
Subject: Re: [PATCH v2 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200420115256.3a0ff647@collabora.com>
In-Reply-To: <CAHp75VeOH+DC362tsEo13gr9fJpeCHXok=7O19B3njbxCOzd2A@mail.gmail.com>
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200418105533.477ce529@collabora.com>
        <20200419222040.GJ185537@smile.fi.intel.com>
        <20200420111754.5863324b@collabora.com>
        <CAHp75VeOH+DC362tsEo13gr9fJpeCHXok=7O19B3njbxCOzd2A@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 20 Apr 2020 12:44:51 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Mon, Apr 20, 2020 at 12:21 PM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> > On Mon, 20 Apr 2020 01:20:40 +0300
> > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:  
> > > On Sat, Apr 18, 2020 at 10:55:33AM +0200, Boris Brezillon wrote:  
> > > > On Fri, 17 Apr 2020 16:21:47 +0800
> > > > "Ramuthevar,Vadivel MuruganX"
> > > > <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> > > >  
> > > > > From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>  
> > >  
> > > > > +static const struct of_device_id lgm_nand_match[] = {
> > > > > + { .compatible = "intel,lgm-nand", },
> > > > > + {}
> > > > > +};
> > > > > +MODULE_DEVICE_TABLE(of, lgm_nand_match);  
> > > >
> > > > You probably have a missing "depends on OF" in your Kconfig.  
> > >
> > > Since it's using device property API, dependency is not needed.
> > >  
> >
> > There's no compile-time dependency, but this driver will be pretty
> > useless if all its users have the NAND controller node defined in their
> > DT and CONFIG_OF is not enabled.  
> 
> No, it's not.
> See [1] for the details how ACPI may utilize this table.
> 
> [1]: https://www.kernel.org/doc/html/latest/firmware-guide/acpi/enumeration.html#device-tree-namespace-link-device-id

Except the NAND framework does use the OF lib when parsing common DT
properties (like nand-ecc-mode, etc), so it does depend on OF if you
want those props to be parsed, which, according to the DT binding patch,
is the case.
