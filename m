Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E96521B070B
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 13:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgDTLGy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 07:06:54 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48182 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbgDTLGx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Apr 2020 07:06:53 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E80452A0C6A;
        Mon, 20 Apr 2020 12:06:50 +0100 (BST)
Date:   Mon, 20 Apr 2020 13:06:21 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "Ramuthevar,Vadivel MuruganX" 
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
Message-ID: <20200420130621.165c8d7f@collabora.com>
In-Reply-To: <20200420104128.GL185537@smile.fi.intel.com>
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200418105533.477ce529@collabora.com>
        <20200419222040.GJ185537@smile.fi.intel.com>
        <20200420111754.5863324b@collabora.com>
        <CAHp75VeOH+DC362tsEo13gr9fJpeCHXok=7O19B3njbxCOzd2A@mail.gmail.com>
        <20200420115256.3a0ff647@collabora.com>
        <CAHp75Vfp_WYNR8kHVsSVumGzuVbGEGpAjfXVvJAV7t6zXXY+HA@mail.gmail.com>
        <20200420122859.2a210268@collabora.com>
        <20200420104128.GL185537@smile.fi.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 20 Apr 2020 13:41:28 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Mon, Apr 20, 2020 at 12:28:59PM +0200, Boris Brezillon wrote:
> > On Mon, 20 Apr 2020 13:14:42 +0300
> > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:  
> > > On Mon, Apr 20, 2020 at 12:53 PM Boris Brezillon
> > > <boris.brezillon@collabora.com> wrote:  
> > > > On Mon, 20 Apr 2020 12:44:51 +0300
> > > > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:  
> > > > > On Mon, Apr 20, 2020 at 12:21 PM Boris Brezillon
> > > > > <boris.brezillon@collabora.com> wrote:    
> > > > > > On Mon, 20 Apr 2020 01:20:40 +0300
> > > > > > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:    
> > > > > > > On Sat, Apr 18, 2020 at 10:55:33AM +0200, Boris Brezillon wrote:    
> > > > > > > > On Fri, 17 Apr 2020 16:21:47 +0800
> > > > > > > > "Ramuthevar,Vadivel MuruganX"
> > > > > > > > <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:  
> 
> ...
> 
> > > > > > > > > +static const struct of_device_id lgm_nand_match[] = {
> > > > > > > > > + { .compatible = "intel,lgm-nand", },
> > > > > > > > > + {}
> > > > > > > > > +};
> > > > > > > > > +MODULE_DEVICE_TABLE(of, lgm_nand_match);    
> > > > > > > >
> > > > > > > > You probably have a missing "depends on OF" in your Kconfig.    
> > > > > > >
> > > > > > > Since it's using device property API, dependency is not needed.
> > > > > > >    
> > > > > >
> > > > > > There's no compile-time dependency, but this driver will be pretty
> > > > > > useless if all its users have the NAND controller node defined in their
> > > > > > DT and CONFIG_OF is not enabled.    
> > > > >
> > > > > No, it's not.
> > > > > See [1] for the details how ACPI may utilize this table.
> > > > >
> > > > > [1]: https://www.kernel.org/doc/html/latest/firmware-guide/acpi/enumeration.html#device-tree-namespace-link-device-id    
> > > >
> > > > Except the NAND framework does use the OF lib when parsing common DT
> > > > properties (like nand-ecc-mode, etc), so it does depend on OF if you
> > > > want those props to be parsed, which, according to the DT binding patch,
> > > > is the case.    
> > > 
> > > I see, so, NAND framework can be transformed at some point. In any
> > > case, from driver perspective it's OF independent.
> > >   
> > 
> > Well, it uses it only if the driver passes an OF node which this driver
> > does (see the nand_set_flash_node() call), so no, it's really a driver
> > dependency.  
> 
> Look like still it's framework dependency which driver has to rely on.
> Means more work would be needed in case NAND to convert to fwnode API.
> 

Sorry, but I'm lost here. The patch series contains a DT bindings doc,
meaning that it's using a DT representation no matter where it comes
from (the fact that it might be embedded in an ACPI table doesn't
matter, right?). The framework just provides convenient DT parsing
helpers, but they are not mandatory since they are only called if the
NAND is attached a DT node (some drivers extract those info from
driver-specific pdata structs).

To me, the lack of support of a generic fwnode parsing logic in the
NAND framework is orthogonal to this "depend on OF" problem, since, no
matter what abstraction you use to parse the DT node (fwnode would just
be a wrapper around DT parsing in this specific case), the fact
remains, for this driver, in its current state, you need OF support to
make it useful.
