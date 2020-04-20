Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 173CA1B056C
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 11:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbgDTJSA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 05:18:00 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46976 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbgDTJSA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Apr 2020 05:18:00 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0CDDE2A0A3B;
        Mon, 20 Apr 2020 10:17:58 +0100 (BST)
Date:   Mon, 20 Apr 2020 11:17:54 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, arnd@arndb.de,
        brendanhiggins@google.com, tglx@linutronix.de,
        anders.roxell@linaro.org, masonccyang@mxic.com.tw,
        piotrs@cadence.com, robh+dt@kernel.org, linux-mips@vger.kernel.org,
        hauke.mehrtens@intel.com, qi-ming.wu@intel.com,
        cheol.yong.kim@intel.com
Subject: Re: [PATCH v2 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200420111754.5863324b@collabora.com>
In-Reply-To: <20200419222040.GJ185537@smile.fi.intel.com>
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200418105533.477ce529@collabora.com>
        <20200419222040.GJ185537@smile.fi.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 20 Apr 2020 01:20:40 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Sat, Apr 18, 2020 at 10:55:33AM +0200, Boris Brezillon wrote:
> > On Fri, 17 Apr 2020 16:21:47 +0800
> > "Ramuthevar,Vadivel MuruganX"
> > <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> >   
> > > From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>  
> 
> > > +static const struct of_device_id lgm_nand_match[] = {
> > > +	{ .compatible = "intel,lgm-nand", },
> > > +	{}
> > > +};
> > > +MODULE_DEVICE_TABLE(of, lgm_nand_match);  
> > 
> > You probably have a missing "depends on OF" in your Kconfig.  
> 
> Since it's using device property API, dependency is not needed.
> 

There's no compile-time dependency, but this driver will be pretty
useless if all its users have the NAND controller node defined in their
DT and CONFIG_OF is not enabled. I guess the OF option is selected by
arches, so explicitly depending on OF is only relevant if you change
the dependency rules as suggested in my other reply.
