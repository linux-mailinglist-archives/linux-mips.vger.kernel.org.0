Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8882C1B0699
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 12:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbgDTK3F (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 06:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725865AbgDTK3E (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 06:29:04 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B85CC061A0C;
        Mon, 20 Apr 2020 03:29:04 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9AA0B2A0057;
        Mon, 20 Apr 2020 11:29:02 +0100 (BST)
Date:   Mon, 20 Apr 2020 12:28:59 +0200
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
Message-ID: <20200420122859.2a210268@collabora.com>
In-Reply-To: <CAHp75Vfp_WYNR8kHVsSVumGzuVbGEGpAjfXVvJAV7t6zXXY+HA@mail.gmail.com>
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200418105533.477ce529@collabora.com>
        <20200419222040.GJ185537@smile.fi.intel.com>
        <20200420111754.5863324b@collabora.com>
        <CAHp75VeOH+DC362tsEo13gr9fJpeCHXok=7O19B3njbxCOzd2A@mail.gmail.com>
        <20200420115256.3a0ff647@collabora.com>
        <CAHp75Vfp_WYNR8kHVsSVumGzuVbGEGpAjfXVvJAV7t6zXXY+HA@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 20 Apr 2020 13:14:42 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Mon, Apr 20, 2020 at 12:53 PM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> > On Mon, 20 Apr 2020 12:44:51 +0300
> > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> >  
> > > On Mon, Apr 20, 2020 at 12:21 PM Boris Brezillon
> > > <boris.brezillon@collabora.com> wrote:  
> > > > On Mon, 20 Apr 2020 01:20:40 +0300
> > > > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:  
> > > > > On Sat, Apr 18, 2020 at 10:55:33AM +0200, Boris Brezillon wrote:  
> > > > > > On Fri, 17 Apr 2020 16:21:47 +0800
> > > > > > "Ramuthevar,Vadivel MuruganX"
> > > > > > <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> > > > > >  
> > > > > > > From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>  
> > > > >  
> > > > > > > +static const struct of_device_id lgm_nand_match[] = {
> > > > > > > + { .compatible = "intel,lgm-nand", },
> > > > > > > + {}
> > > > > > > +};
> > > > > > > +MODULE_DEVICE_TABLE(of, lgm_nand_match);  
> > > > > >
> > > > > > You probably have a missing "depends on OF" in your Kconfig.  
> > > > >
> > > > > Since it's using device property API, dependency is not needed.
> > > > >  
> > > >
> > > > There's no compile-time dependency, but this driver will be pretty
> > > > useless if all its users have the NAND controller node defined in their
> > > > DT and CONFIG_OF is not enabled.  
> > >
> > > No, it's not.
> > > See [1] for the details how ACPI may utilize this table.
> > >
> > > [1]: https://www.kernel.org/doc/html/latest/firmware-guide/acpi/enumeration.html#device-tree-namespace-link-device-id  
> >
> > Except the NAND framework does use the OF lib when parsing common DT
> > properties (like nand-ecc-mode, etc), so it does depend on OF if you
> > want those props to be parsed, which, according to the DT binding patch,
> > is the case.  
> 
> I see, so, NAND framework can be transformed at some point. In any
> case, from driver perspective it's OF independent.
> 

Well, it uses it only if the driver passes an OF node which this driver
does (see the nand_set_flash_node() call), so no, it's really a driver
dependency.
