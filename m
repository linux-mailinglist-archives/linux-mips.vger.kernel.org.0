Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27F7A347561
	for <lists+linux-mips@lfdr.de>; Wed, 24 Mar 2021 11:09:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233249AbhCXKIy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Mar 2021 06:08:54 -0400
Received: from elvis.franken.de ([193.175.24.41]:55103 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235378AbhCXKIo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Mar 2021 06:08:44 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lP0RM-0008Sw-03; Wed, 24 Mar 2021 11:08:40 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A0842C1C69; Wed, 24 Mar 2021 11:00:03 +0100 (CET)
Date:   Wed, 24 Mar 2021 11:00:03 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Christoph Hellwig <hch@lst.de>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jens Axboe <axboe@kernel.dk>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-ide@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 05/10] MIPS: switch workpad_defconfig from legacy IDE to
 libata
Message-ID: <20210324100003.GD2378@alpha.franken.de>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-6-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210318045706.200458-6-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 18, 2021 at 05:57:01AM +0100, Christoph Hellwig wrote:
> Use libata instead of the deprecated legacy ide driver in
> workpad_defconfig.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/mips/configs/workpad_defconfig | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
