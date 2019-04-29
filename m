Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC59FE49F
	for <lists+linux-mips@lfdr.de>; Mon, 29 Apr 2019 16:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728280AbfD2OXY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Apr 2019 10:23:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:39712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728260AbfD2OXY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Apr 2019 10:23:24 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 05EF02087B;
        Mon, 29 Apr 2019 14:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556547803;
        bh=CkUjjUJoMHq8rlvMrsqjvKQxwGL4ZgTcgUZqqiiE4wk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DbpGdnjdtpdQJlRzLjdXk/CzMnGnx2UImW/X2Ktk2CSjyqyJm9+xzPJkeajfWT9Qd
         N3PRnB8M7vrDlYE0ETDEyal91HTyIwFfrFHNs92GYThQ8pojlh/IRIH3MXMHNa5heE
         ZNgpK7yyRwLUt1w0xCmLk/cfr533cOSm5sUVT9v0=
Date:   Mon, 29 Apr 2019 16:23:21 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org, andrew@aj.id.au,
        andriy.shevchenko@linux.intel.com, macro@linux-mips.org,
        vz@mleia.com, slemieux.tyco@gmail.com, khilman@baylibre.com,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, davem@davemloft.net, jacmet@sunsite.dk,
        linux@prisktech.co.nz, matthias.bgg@gmail.com,
        linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH 01/41] drivers: tty: serial: dz: use dev_err() instead of
 printk()
Message-ID: <20190429142321.GA29007@kroah.com>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-2-git-send-email-info@metux.net>
 <20190427132959.GA11368@kroah.com>
 <e10175d0-bc3b-a4ab-cb47-0b4761bfb629@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e10175d0-bc3b-a4ab-cb47-0b4761bfb629@metux.net>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 29, 2019 at 04:11:15PM +0200, Enrico Weigelt, metux IT consult wrote:
> On 27.04.19 15:29, Greg KH wrote:
> > On Sat, Apr 27, 2019 at 02:51:42PM +0200, Enrico Weigelt, metux IT consult wrote:
> >> Using dev_err() instead of printk() for more consistent output.
> >> (prints device name, etc).
> >>
> >> Signed-off-by: Enrico Weigelt <info@metux.net>
> > 
> > Your "From:" line does not match the signed-off-by line, so I can't take
> > any of these if I wanted to :(
> 
> Grmpf. I've manually changed it, as you isisted in having my company
> name remove from it ....

Yes, that's fine, but the lines have to match.  See the documentation
for how to have a "From:" in the changelog text to override whatever
your email client happens to pollute the email with :)

thanks,

greg k-h
