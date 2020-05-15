Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AEDD1D5316
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 17:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbgEOPFq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 May 2020 11:05:46 -0400
Received: from mga05.intel.com ([192.55.52.43]:28339 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726140AbgEOPFq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 May 2020 11:05:46 -0400
IronPort-SDR: MHM+E/F2RjRegcbJ5yG++1J3qOtHcitfn+3Cs17Ip0MdAmtUHM2T4JlsXFXVbLI3+ZgxpZ3Qvx
 X0fKuLp8sU/w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2020 08:05:45 -0700
IronPort-SDR: EX+/kA0HXNH84sqyToqDVeH2rEi9LIuOqiQ6K0oN24pfAe2f1Rat9eUkw4gWcL3iD9ayQ886Np
 VcYqaY6I9WsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,395,1583222400"; 
   d="scan'208";a="252057189"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 15 May 2020 08:05:40 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jZbuA-006tTf-Vz; Fri, 15 May 2020 18:05:42 +0300
Date:   Fri, 15 May 2020 18:05:42 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
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
Message-ID: <20200515150542.GN1634618@smile.fi.intel.com>
References: <20200323024611.16039-1-Sergey.Semin@baikalelectronics.ru>
 <20200506233136.11842-1-Sergey.Semin@baikalelectronics.ru>
 <20200506233136.11842-4-Sergey.Semin@baikalelectronics.ru>
 <20200515140547.GE1634618@smile.fi.intel.com>
 <20200515145007.xjrx5mminxrh374d@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200515145007.xjrx5mminxrh374d@mobilestation>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 15, 2020 at 05:50:07PM +0300, Serge Semin wrote:
> On Fri, May 15, 2020 at 05:05:47PM +0300, Andy Shevchenko wrote:
> > On Thu, May 07, 2020 at 02:31:34AM +0300, Serge Semin wrote:
> > > Really instead of twice checking the clk_round_rate() return value
> > > we could do it once, and if it isn't error the clock rate can be changed.
> > > By doing so we decrease a number of ret-value tests and remove a weird
> > > goto-based construction implemented in the dw8250_set_termios() method.
> > 
> > >  	rate = clk_round_rate(d->clk, baud * 16);
> > > -	if (rate < 0)
> > > -		ret = rate;
> > 
> > > -	else if (rate == 0)
> > > -		ret = -ENOENT;
> > 
> > This case now handled differently.
> > I don't think it's good idea to change semantics.
> > 
> > So, I don't see how this, after leaving the rate==0 case, would be better than
> > original one.
> 
> Semantic doesn't change. The code does exactly the same as before. If it didn't
> I either would have provided a comment about this or just didn't introduce the
> change in the first place. I guess you just don't see the whole picture of the
> method. Take a look in the code. The ret variable's been used to skip the
> "p->uartclk = rate" assignment. That's it. So the (rate == 0) will still be
> considered as error condition, which causes the clock rate left unchanged.
> Here is the code diff so you wouldn't need to dive deep into the driver
> sources:
> 
> <	clk_disable_unprepare(d->clk);
> <	rate = clk_round_rate(d->clk, baud * 16);
> <	if (rate < 0)
> <		ret = rate;
> <	else if (rate == 0)
> <		ret = -ENOENT;
> <	else
> <		ret = clk_set_rate(d->clk, rate);
> <	clk_prepare_enable(d->clk);
> <
> <	if (ret)
> <		goto out;
> <
> <	p->uartclk = rate;
> <
> <out:
> ---
> >       clk_disable_unprepare(d->clk);
> >       rate = clk_round_rate(d->clk, baud * 16);
> >       if (rate > 0) {
> >              ret = clk_set_rate(d->clk, rate);
> >              if (!ret)
> >                      p->uartclk = rate;
> >       }
> >       clk_prepare_enable(d->clk);

Thanks.
Indeed, in the above it looks clear.



-- 
With Best Regards,
Andy Shevchenko


