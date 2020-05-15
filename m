Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 445EA1D500C
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 16:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbgEOOKt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 May 2020 10:10:49 -0400
Received: from mga14.intel.com ([192.55.52.115]:23237 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726140AbgEOOKt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 May 2020 10:10:49 -0400
IronPort-SDR: Lvl0LWOKuTBWMprfi1yX22tZOyO0qrSB9ym2Q/OTsbcqKrj8+7rbdUtM9bcsdc0/MFu4U25FFW
 q8HtMsC4DO2w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2020 07:10:49 -0700
IronPort-SDR: 54TbqBR7CXjYDsu+yd9jQlAkaAjG99wMxI2ia8etFYijKsxS7dIc+1yj3hatPR1kLCRXXsU3Hi
 WXtG+gio5/OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,395,1583222400"; 
   d="scan'208";a="372701841"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001.fm.intel.com with ESMTP; 15 May 2020 07:10:44 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jZb30-006sqV-VP; Fri, 15 May 2020 17:10:46 +0300
Date:   Fri, 15 May 2020 17:10:46 +0300
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
Subject: Re: [PATCH v3 4/4] serial: 8250_dw: Fix common clocks usage race
 condition
Message-ID: <20200515141046.GF1634618@smile.fi.intel.com>
References: <20200323024611.16039-1-Sergey.Semin@baikalelectronics.ru>
 <20200506233136.11842-1-Sergey.Semin@baikalelectronics.ru>
 <20200506233136.11842-5-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506233136.11842-5-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 07, 2020 at 02:31:35AM +0300, Serge Semin wrote:
> The race condition may happen if the UART reference clock is shared with
> some other device (on Baikal-T1 SoC it's another DW UART port). In this
> case if that device changes the clock rate while serial console is using
> it the DW 8250 UART port might not only end up with an invalid uartclk
> value saved, but may also experience a distorted output data since
> baud-clock could have been changed. In order to fix this lets at least
> try to adjust the 8250 port setting like UART clock rate in case if the
> reference clock rate change is discovered. The driver will call the new
> method to update 8250 UART port clock rate settings. It's done by means of
> the clock event notifier registered at the port startup and unregistered
> in the shutdown callback method.

I'm wondering if clock framework itself can provide such a notifier?

> Note 1. In order to avoid deadlocks we had to execute the UART port update
> method in a dedicated deferred work. This is due to (in my opinion
> redundant) the clock update implemented in the dw8250_set_termios()
> method.

So, and how you propose to update the clock when ->set_termios() is called?

> Note 2. Before the ref clock is manually changed by the custom
> set_termios() function we swap the port uartclk value with new rate
> adjusted to be suitable for the requested baud. It is necessary in
> order to effectively disable a functionality of the ref clock events
> handler for the current UART port, since uartclk update will be done
> a bit further in the generic serial8250_do_set_termios() function.

...

> +	struct notifier_block	clk_notifier;
> +	struct work_struct	clk_work;

Oh, this seems too much.
Perhaps, the compatible based quirk with your initial approach is much better for time being.

-- 
With Best Regards,
Andy Shevchenko


