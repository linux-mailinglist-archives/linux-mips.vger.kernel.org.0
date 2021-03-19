Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49F2A3414FB
	for <lists+linux-mips@lfdr.de>; Fri, 19 Mar 2021 06:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233894AbhCSFna (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Mar 2021 01:43:30 -0400
Received: from verein.lst.de ([213.95.11.211]:44427 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233870AbhCSFnY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 19 Mar 2021 01:43:24 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id EFE6A68BEB; Fri, 19 Mar 2021 06:43:19 +0100 (CET)
Date:   Fri, 19 Mar 2021 06:43:19 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Christoph Hellwig <hch@lst.de>,
        "David S. Miller" <davem@davemloft.net>,
        Jens Axboe <axboe@kernel.dk>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-ide@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: remove the legacy ide driver
Message-ID: <20210319054319.GA9880@lst.de>
References: <20210318045706.200458-1-hch@lst.de> <c1fa8e6-a05d-9ea1-f47e-9e85ea6ea65e@telegraphics.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1fa8e6-a05d-9ea1-f47e-9e85ea6ea65e@telegraphics.com.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 19, 2021 at 12:43:48PM +1100, Finn Thain wrote:
> A few months ago I wrote another patch to move some more platforms away 
> from macide but it has not been tested yet. That is not to say you should 
> wait. However, my patch does have some changes that are missing from your 
> patch series, relating to ide platform devices in arch/m68k/mac/config.c. 
> I hope to be able to test this patch before the 5.13 merge window closes.

Normally we do not remove drivers for hardware that is still used.  So
at leat for macide my plan was not to take it away unless the users 
are sufficiently happy.  Or in other words:  I think waiting it the
right choice, but hopefully we can make that wait as short as possible.
