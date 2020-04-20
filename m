Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECFF11B06BF
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 12:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726025AbgDTKli (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 06:41:38 -0400
Received: from mga11.intel.com ([192.55.52.93]:58882 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725773AbgDTKlh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 06:41:37 -0400
IronPort-SDR: /r/BIaDdRf+M7DEfGE/wh2MVvMHhhOVO7ZRAFf5ubowZx7/dIwrzqKKYm/9+oOd1VdEEcAjNwv
 TNc+4YO8j7cA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2020 03:41:37 -0700
IronPort-SDR: CuBgA2GPporm8LwVqOhvXcm/FADyoJq9PhQASrJEFXqPPNOTZpGlNMJkyu0Ed5UErAilfC6YUC
 Atn5n0pRCRzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,406,1580803200"; 
   d="scan'208";a="333883264"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001.jf.intel.com with ESMTP; 20 Apr 2020 03:41:32 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1jQTrk-0020ag-T6; Mon, 20 Apr 2020 13:41:28 +0300
Date:   Mon, 20 Apr 2020 13:41:28 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
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
Message-ID: <20200420104128.GL185537@smile.fi.intel.com>
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200418105533.477ce529@collabora.com>
 <20200419222040.GJ185537@smile.fi.intel.com>
 <20200420111754.5863324b@collabora.com>
 <CAHp75VeOH+DC362tsEo13gr9fJpeCHXok=7O19B3njbxCOzd2A@mail.gmail.com>
 <20200420115256.3a0ff647@collabora.com>
 <CAHp75Vfp_WYNR8kHVsSVumGzuVbGEGpAjfXVvJAV7t6zXXY+HA@mail.gmail.com>
 <20200420122859.2a210268@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420122859.2a210268@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 20, 2020 at 12:28:59PM +0200, Boris Brezillon wrote:
> On Mon, 20 Apr 2020 13:14:42 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Mon, Apr 20, 2020 at 12:53 PM Boris Brezillon
> > <boris.brezillon@collabora.com> wrote:
> > > On Mon, 20 Apr 2020 12:44:51 +0300
> > > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > On Mon, Apr 20, 2020 at 12:21 PM Boris Brezillon
> > > > <boris.brezillon@collabora.com> wrote:  
> > > > > On Mon, 20 Apr 2020 01:20:40 +0300
> > > > > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:  
> > > > > > On Sat, Apr 18, 2020 at 10:55:33AM +0200, Boris Brezillon wrote:  
> > > > > > > On Fri, 17 Apr 2020 16:21:47 +0800
> > > > > > > "Ramuthevar,Vadivel MuruganX"
> > > > > > > <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:

...

> > > > > > > > +static const struct of_device_id lgm_nand_match[] = {
> > > > > > > > + { .compatible = "intel,lgm-nand", },
> > > > > > > > + {}
> > > > > > > > +};
> > > > > > > > +MODULE_DEVICE_TABLE(of, lgm_nand_match);  
> > > > > > >
> > > > > > > You probably have a missing "depends on OF" in your Kconfig.  
> > > > > >
> > > > > > Since it's using device property API, dependency is not needed.
> > > > > >  
> > > > >
> > > > > There's no compile-time dependency, but this driver will be pretty
> > > > > useless if all its users have the NAND controller node defined in their
> > > > > DT and CONFIG_OF is not enabled.  
> > > >
> > > > No, it's not.
> > > > See [1] for the details how ACPI may utilize this table.
> > > >
> > > > [1]: https://www.kernel.org/doc/html/latest/firmware-guide/acpi/enumeration.html#device-tree-namespace-link-device-id  
> > >
> > > Except the NAND framework does use the OF lib when parsing common DT
> > > properties (like nand-ecc-mode, etc), so it does depend on OF if you
> > > want those props to be parsed, which, according to the DT binding patch,
> > > is the case.  
> > 
> > I see, so, NAND framework can be transformed at some point. In any
> > case, from driver perspective it's OF independent.
> > 
> 
> Well, it uses it only if the driver passes an OF node which this driver
> does (see the nand_set_flash_node() call), so no, it's really a driver
> dependency.

Look like still it's framework dependency which driver has to rely on.
Means more work would be needed in case NAND to convert to fwnode API.

-- 
With Best Regards,
Andy Shevchenko


