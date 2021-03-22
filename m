Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5024D344910
	for <lists+linux-mips@lfdr.de>; Mon, 22 Mar 2021 16:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbhCVPSe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Mar 2021 11:18:34 -0400
Received: from verein.lst.de ([213.95.11.211]:56255 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231645AbhCVPS2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Mar 2021 11:18:28 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id B542A68BFE; Mon, 22 Mar 2021 16:18:23 +0100 (CET)
Date:   Mon, 22 Mar 2021 16:18:23 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Christoph Hellwig <hch@lst.de>,
        "David S. Miller" <davem@davemloft.net>,
        Jens Axboe <axboe@kernel.dk>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-ide@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 02/10] ARM: disable CONFIG_IDE in footbridge_defconfig
Message-ID: <20210322151823.GA2764@lst.de>
References: <20210318045706.200458-1-hch@lst.de> <20210318045706.200458-3-hch@lst.de> <20210319170753.GV1463@shell.armlinux.org.uk> <20210319175311.GW1463@shell.armlinux.org.uk> <20210322145403.GA30942@lst.de> <20210322151503.GX1463@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322151503.GX1463@shell.armlinux.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 22, 2021 at 03:15:03PM +0000, Russell King - ARM Linux admin wrote:
> It gets worse than that though - due to a change to remove
> pcibios_min_io from the generic code, moving it into the ARM
> architecture code, this has caused a regression that prevents the
> legacy resources being registered against the bus resource. So even
> if they are there, they cause probe failures. I haven't found a
> reasonable way to solve this yet, but until there is, there is no
> way that the PATA driver can be used as the "legacy mode" support
> is effectively done via the PCI code assigning virtual IO port
> resources.
> 
> I'm quite surprised that the CY82C693 even works on Alpha - I've
> asked for a lspci for that last week but nothing has yet been
> forthcoming from whoever responded to your patch for Alpha - so I
> can't compare what I'm seeing with what's happening with Alpha.

That sounds like something we could fix with a quirk for function 2
in the PCI resource assignment code.  Can you show what vendor and
device ID function 2 has so that I could try to come up with one?
