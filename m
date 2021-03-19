Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77065341DA7
	for <lists+linux-mips@lfdr.de>; Fri, 19 Mar 2021 14:04:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbhCSNEX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Mar 2021 09:04:23 -0400
Received: from verein.lst.de ([213.95.11.211]:46083 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229941AbhCSNEC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 19 Mar 2021 09:04:02 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 6CB8568BFE; Fri, 19 Mar 2021 14:03:57 +0100 (CET)
Date:   Fri, 19 Mar 2021 14:03:57 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Christoph Hellwig <hch@lst.de>,
        "David S. Miller" <davem@davemloft.net>,
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
Subject: Re: [PATCH 08/10] MIPS: disable CONFIG_IDE in malta*_defconfig
Message-ID: <20210319130356.GA2624@lst.de>
References: <20210318045706.200458-1-hch@lst.de> <20210318045706.200458-9-hch@lst.de> <20210318141900.GA10554@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210318141900.GA10554@alpha.franken.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 18, 2021 at 03:19:00PM +0100, Thomas Bogendoerfer wrote:
> On Thu, Mar 18, 2021 at 05:57:04AM +0100, Christoph Hellwig wrote:
> >  arch/mips/configs/malta_kvm_guest_defconfig | 3 ---
> 
> that file is gone in mips-next.
> 
> I could take all MIPS patches into mips-next, if you want...

Fine with me - it shouldn't really matter if the defconfig updates
go in independently.  Do you want a resend with the typos fixed
against mips-next or are you simply going to fix these things up?
