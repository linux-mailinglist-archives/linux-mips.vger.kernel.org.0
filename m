Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB2134483D
	for <lists+linux-mips@lfdr.de>; Mon, 22 Mar 2021 15:55:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbhCVOyi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Mar 2021 10:54:38 -0400
Received: from verein.lst.de ([213.95.11.211]:56129 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231366AbhCVOyI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Mar 2021 10:54:08 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id A32F268BEB; Mon, 22 Mar 2021 15:54:03 +0100 (CET)
Date:   Mon, 22 Mar 2021 15:54:03 +0100
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
Message-ID: <20210322145403.GA30942@lst.de>
References: <20210318045706.200458-1-hch@lst.de> <20210318045706.200458-3-hch@lst.de> <20210319170753.GV1463@shell.armlinux.org.uk> <20210319175311.GW1463@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319175311.GW1463@shell.armlinux.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 19, 2021 at 05:53:12PM +0000, Russell King - ARM Linux admin wrote:
> If I extend the arch/arm/kernel/bios32.c code to kill BARs 2/3 (which
> actually are not present on the CY82C693) then the IDE driver works
> for me, but the PATA driver does not:
> 
> cy82c693 0000:00:06.1: IDE controller (0x1080:0xc693 rev 0x00)
> cy82c693 0000:00:06.1: not 100% native mode: will probe irqs later
> legacy IDE will be removed in 2021, please switch to libata
> Report any missing HW support to linux-ide@vger.kernel.org
>     ide0: BM-DMA at 0x1080-0x1087
>     ide1: BM-DMA at 0x1088-0x108f
> Probing IDE interface ide0...
> hda: PIONEER DVD-RW DVR-105, ATAPI CD/DVD-ROM drive
> hda: host max PIO4 wanted PIO255(auto-tune) selected PIO4
> ...
> 
> (unbind Cypress_IDE and try binding pata_cypress)
> 
> pata_cypress 0000:00:06.1: no available native port

This comes from ata_pci_sff_init_host when it tails to initialize
a port.  There are three cases why it can't initialize the port:

 1) because it is marked as dummy, which is the case for the second
    port of the cypress controller, but you're not using that even
    with the old ide driver, and we'd still not get that message just
    because of that second port.
 2) when ata_resources_present returns false because the BAR has
    a zero start or length
 3) because pcim_iomap_regions() fails.  This prints a warning to the
    log ("failed to request/iomap BARs for port %d (errno=%d)") that you
    should have seen

So the problem here has to be number two.  The legacy ide driver OTOH
seems to lack a lot of these checks, although I'm not sure how it
manages to actually work without those.

Can you show how the BAR assignment for the device looks using lscpi
or a tool of your choice?
