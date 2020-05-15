Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA9DD1D4FF5
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 16:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgEOOFw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 May 2020 10:05:52 -0400
Received: from mga05.intel.com ([192.55.52.43]:23421 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726188AbgEOOFw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 May 2020 10:05:52 -0400
IronPort-SDR: 1n8Pzfki/4TgoqjTLfpMyMKiYgMdKVuG5fzt33o588IB3vEsraX/tkJWC0YRQzo+MID7a3glde
 cNU47MfO3C2Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2020 07:05:51 -0700
IronPort-SDR: j1Q0bRRVSaWAmZFGS8vch5frswSS1RBL2pvNRiS+svM1m7u39vjRO0yCTw2lu0wUihPV6RvRj2
 fU0qJiS54CBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,395,1583222400"; 
   d="scan'208";a="341988727"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001.jf.intel.com with ESMTP; 15 May 2020 07:05:45 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jZayB-006soL-RN; Fri, 15 May 2020 17:05:47 +0300
Date:   Fri, 15 May 2020 17:05:47 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Long Cheng <long.cheng@mediatek.com>,
        Maxime Ripard <mripard@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] serial: 8250_dw: Simplify the ref clock rate
 setting procedure
Message-ID: <20200515140547.GE1634618@smile.fi.intel.com>
References: <20200323024611.16039-1-Sergey.Semin@baikalelectronics.ru>
 <20200506233136.11842-1-Sergey.Semin@baikalelectronics.ru>
 <20200506233136.11842-4-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506233136.11842-4-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 07, 2020 at 02:31:34AM +0300, Serge Semin wrote:
> Really instead of twice checking the clk_round_rate() return value
> we could do it once, and if it isn't error the clock rate can be changed.
> By doing so we decrease a number of ret-value tests and remove a weird
> goto-based construction implemented in the dw8250_set_termios() method.

>  	rate = clk_round_rate(d->clk, baud * 16);
> -	if (rate < 0)
> -		ret = rate;

> -	else if (rate == 0)
> -		ret = -ENOENT;

This case now handled differently.
I don't think it's good idea to change semantics.

So, I don't see how this, after leaving the rate==0 case, would be better than
original one.

> -	else
> +	if (rate > 0) {
>  		ret = clk_set_rate(d->clk, rate);
> +		if (!ret)
> +			p->uartclk = rate;
> +	}
>  	clk_prepare_enable(d->clk);
>  
> -	if (ret)
> -		goto out;
> -
> -	p->uartclk = rate;
> -
> -out:
>  	p->status &= ~UPSTAT_AUTOCTS;
>  	if (termios->c_cflag & CRTSCTS)
>  		p->status |= UPSTAT_AUTOCTS;

-- 
With Best Regards,
Andy Shevchenko


