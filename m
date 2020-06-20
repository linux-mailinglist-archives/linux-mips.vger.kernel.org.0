Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8883A2022BC
	for <lists+linux-mips@lfdr.de>; Sat, 20 Jun 2020 11:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727808AbgFTJIm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 20 Jun 2020 05:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727771AbgFTJIm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 20 Jun 2020 05:08:42 -0400
X-Greylist: delayed 735 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 20 Jun 2020 02:08:41 PDT
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B697C06174E;
        Sat, 20 Jun 2020 02:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=HkINJawlRBHwc9VNfEcMZvgjcar16lovqjBKst1T/h8=; b=c0RvMXGf8LMYYodMuFBnlGPA5
        h3JK1D0vAcXa0tRBv93Q3jOqdlWFQcW1Y2zFSv9zuMaFffJHzW8y0a04xN1b5rtlaz2oBMbGC4ZIX
        uRoG02au1wR0yha0mGobF+Uhyj4gj/O6v6gihU6qJj9mnC+LDmvkJWZC2U83PkpFYyBRv1PCrTrLf
        SmrIxhXVJNpfqwG6smZdrlXW83kMBWT6Azs8qTaHYQ/BDAVm0tuWINrSRxGwlPdUxkN7Do1/pi0D5
        WYLG50K8mu8WOowJ0Bev9At1TL/gy/77i5bRvhvW7GvcB0hD0aUcPCprpHBkRzK2gup6oC/BrgGYe
        oX9vd11Jg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58864)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jmZII-0007Mf-B7; Sat, 20 Jun 2020 09:56:10 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jmYbZ-0006Th-Ck; Sat, 20 Jun 2020 09:12:01 +0100
Date:   Sat, 20 Jun 2020 09:12:01 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Arnd Bergmann <arnd@arndb.de>,
        Maxime Ripard <mripard@kernel.org>,
        Will Deacon <will@kernel.org>, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/3] serial: 8250_dw: Simplify the ref clock rate
 setting procedure
Message-ID: <20200620081201.GQ1551@shell.armlinux.org.uk>
References: <20200619200251.9066-1-Sergey.Semin@baikalelectronics.ru>
 <20200619200251.9066-3-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200619200251.9066-3-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jun 19, 2020 at 11:02:50PM +0300, Serge Semin wrote:
> Really instead of twice checking the clk_round_rate() return value
> we could do it once, and if it isn't error the clock rate can be changed.
> By doing so we decrease a number of ret-value tests and remove a weird
> goto-based construction implemented in the dw8250_set_termios() method.

This doesn't look right to me - neither the before code nor the after
code.

>  	clk_disable_unprepare(d->clk);
>  	rate = clk_round_rate(d->clk, baud * 16);
> -	if (rate < 0)
> -		ret = rate;
> -	else if (rate == 0)
> -		ret = -ENOENT;
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

	newrate = baud * 16;

	clk_disable_unprepare(d->clk);
	rate = clk_round_rate(newrate);
	ret = clk_set_rate(d->clk, newrate);
	if (!ret)
		p->uartclk = rate;

	ret = elk_prepare_enable(d->clk);
	/* check ret for failure, means the clock is no longer running */

is all that should be necessary: note that clk_round_rate() is required
to return the rate that a successful call to clk_set_rate() would result
in for that clock.  It is equivalent to:

	ret = clk_set_rate(d->clk, newrate);
	if (ret == 0)
		p->uartclk = clk_get_rate(d->clk);

The other commonly misunderstood thing about the clk API is that the
rate you pass in to clk_round_rate() to discover the actual clock rate
and the value passed in to clk_set_rate() _should_ be the same value.
You should _not_ do clk_set_rate(clk, clk_round_rate(clk, newrate));

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
