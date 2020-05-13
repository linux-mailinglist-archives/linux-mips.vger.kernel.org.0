Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0F681D198A
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2020 17:35:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389273AbgEMPfe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 11:35:34 -0400
Received: from mga06.intel.com ([134.134.136.31]:38891 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389127AbgEMPfe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 May 2020 11:35:34 -0400
IronPort-SDR: AZv9qNu4xcAWDIdIvPnQzYkR7v+/WV5OeTua4KTPg6ukje4VmqJnrHFn6typr/xGa2vkC7J8zY
 RpAOVAFYRmwg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 08:35:34 -0700
IronPort-SDR: pwsSBjsRnOgLG5QqYs80dlDULprquX2PSgKG/EHmKfpyRIohKpac0bIFTaL7UdVNLpYT6sStsn
 HrChOT8l8rvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,388,1583222400"; 
   d="scan'208";a="298401178"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 13 May 2020 08:35:29 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1jYtPw-006Rwo-39; Wed, 13 May 2020 18:35:32 +0300
Date:   Wed, 13 May 2020 18:35:32 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, arnd@arndb.de,
        brendanhiggins@google.com, tglx@linutronix.de,
        boris.brezillon@collabora.com, anders.roxell@linaro.org,
        masonccyang@mxic.com.tw, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, hauke.mehrtens@intel.com,
        qi-ming.wu@intel.com, cheol.yong.kim@intel.com
Subject: Re: [PATCH v6 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200513153532.GT185537@smile.fi.intel.com>
References: <20200513104615.7905-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200513104615.7905-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200513153405.GS185537@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513153405.GS185537@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 13, 2020 at 06:34:05PM +0300, Andy Shevchenko wrote:
> On Wed, May 13, 2020 at 06:46:15PM +0800, Ramuthevar,Vadivel MuruganX wrote:

...

> > +static int ebu_nand_remove(struct platform_device *pdev)
> > +{
> > +	struct ebu_nand_controller *ebu_host = platform_get_drvdata(pdev);
> > +
> 
> > +	if (ebu_host) {
> 
> How it can be NULL here?
> 
> > +		mtd_device_unregister(nand_to_mtd(&ebu_host->chip));
> > +		nand_cleanup(&ebu_host->chip);
> > +		ebu_nand_disable(&ebu_host->chip);
> > +

> > +		if (ebu_host->dma_rx || ebu_host->dma_tx)

This is duplicate and thus redundant.

> > +			ebu_dma_cleanup(ebu_host);
> > +
> > +		clk_disable_unprepare(ebu_host->clk);
> > +	}
> > +
> > +	return 0;
> > +}

-- 
With Best Regards,
Andy Shevchenko


