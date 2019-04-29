Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDAD9E6B7
	for <lists+linux-mips@lfdr.de>; Mon, 29 Apr 2019 17:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728572AbfD2Pj6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Apr 2019 11:39:58 -0400
Received: from mga01.intel.com ([192.55.52.88]:3329 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728436AbfD2Pj6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Apr 2019 11:39:58 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Apr 2019 08:39:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,410,1549958400"; 
   d="scan'208";a="295503882"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
  by orsmga004.jf.intel.com with ESMTP; 29 Apr 2019 08:39:51 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hL8Nh-0001DD-6k; Mon, 29 Apr 2019 18:39:49 +0300
Date:   Mon, 29 Apr 2019 18:39:49 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        andrew@aj.id.au, macro@linux-mips.org, vz@mleia.com,
        slemieux.tyco@gmail.com, khilman@baylibre.com, liviu.dudau@arm.com,
        sudeep.holla@arm.com, lorenzo.pieralisi@arm.com,
        davem@davemloft.net, jacmet@sunsite.dk, linux@prisktech.co.nz,
        matthias.bgg@gmail.com, linux-mips@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org
Subject: Re: [PATCH 36/41] drivers: tty: serial: 8250: store mmio resource
 size in port struct
Message-ID: <20190429153949.GV9224@smile.fi.intel.com>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-37-git-send-email-info@metux.net>
 <20190428151848.GO9224@smile.fi.intel.com>
 <4bab941a-c2f2-7f1c-9bc2-86c63f171c25@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bab941a-c2f2-7f1c-9bc2-86c63f171c25@metux.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 29, 2019 at 04:55:05PM +0200, Enrico Weigelt, metux IT consult wrote:
> On 28.04.19 17:18, Andy Shevchenko wrote:
> > On Sat, Apr 27, 2019 at 02:52:17PM +0200, Enrico Weigelt, metux IT consult wrote:

> >> -	int ret = 0;
> > 
> > This and Co is a separate change that can be done in its own patch.
> 
> I don't really understand :(
> Do you mean the splitting off the retval part from the rest ?

You do two things here: one of them is removing ret and other relative changes.
This should be split to a separate patch.

> > You may increase readability by introducing temporary variables
> > 
> > 	... mapbase = port->mapbase;
> > 	... mapsize = port->mapsize;
> > 	...
> > 	port->membase = ioremap_nocache(mapbase, mapsize);
> > 	...
> 
> Is that really necessary ? Maybe it's just my personal taste, but I
> don't feel the more more verbose one is really easier to read.

Up to Greg. For me it's harder to read all those port-> in several parameters.


-- 
With Best Regards,
Andy Shevchenko


