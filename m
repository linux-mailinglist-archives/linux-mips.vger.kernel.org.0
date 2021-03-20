Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22429342A3F
	for <lists+linux-mips@lfdr.de>; Sat, 20 Mar 2021 04:45:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbhCTDox (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Mar 2021 23:44:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbhCTDou (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 19 Mar 2021 23:44:50 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 694FCC061761;
        Fri, 19 Mar 2021 20:44:50 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 26B2092009C; Sat, 20 Mar 2021 04:44:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 1F63392009B;
        Sat, 20 Mar 2021 04:44:46 +0100 (CET)
Date:   Sat, 20 Mar 2021 04:44:46 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Christoph Hellwig <hch@lst.de>
cc:     "David S. Miller" <davem@davemloft.net>,
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
Subject: Re: [PATCH 10/10] ide: remove the legacy ide driver
In-Reply-To: <20210318045706.200458-11-hch@lst.de>
Message-ID: <alpine.DEB.2.21.2103200425360.21463@angie.orcam.me.uk>
References: <20210318045706.200458-1-hch@lst.de> <20210318045706.200458-11-hch@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 18 Mar 2021, Christoph Hellwig wrote:

> The legay ide driver has been replace with libata startin in 2003 and has

 s/legay/legacy/;s/replace/replaced/;s/startin/startin/ (though I'd say 
"back in" instead in the latter case).

> been scheduled for removal for a while.  Finally kill it off so that we
> can start cleaning up various bits of cruft it forced on the block layer.

 You need to adjust Documentation/admin-guide/kernel-parameters.txt too, 
i.e. remove all the `ide*' options, possibly more (I haven't checked in 
detail).

  Maciej
