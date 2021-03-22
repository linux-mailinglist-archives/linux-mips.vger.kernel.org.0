Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A742344903
	for <lists+linux-mips@lfdr.de>; Mon, 22 Mar 2021 16:16:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231656AbhCVPPz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Mar 2021 11:15:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbhCVPPg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Mar 2021 11:15:36 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A3D0C061574;
        Mon, 22 Mar 2021 08:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=7sVj0zne5uraXbQ//kjYO0Rg5Vmtx7bRBUHhpcOjtWQ=; b=19LPYNE1An4Vq30ymjKPv1ir4
        1N4WZ2NotgqYRXFLxWXnEwIwOV0dUrwCADfnIpw65dBPGGRlqgtjlmDZdpZomzdLoTuQSl1zDGFz2
        MQoxJBg0Tjirj7DxXvGfAOsY45sTY60WYtj/ecWab2d57FCLJMv9NjFZCP7xSvzUijmP/FKbBRfBF
        9frim2m7D7TXIeBRPC8bWx0zyxVBpOhiLY8IQtB/VG8Cs+13h5Nv+kRwQVEGCx3dN0i5MwO5C3Kbt
        gNbXO/w+hnl+ZIPO3hxWwCgR4bNb8EaXvi4pXvLw5+FMwe3PVnYHuypHBWrF6eQ9PT3wPT/4kHFZ2
        jycH0GUEg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51586)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1lOMGp-0006aZ-E5; Mon, 22 Mar 2021 15:15:07 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1lOMGl-0003Ku-Ll; Mon, 22 Mar 2021 15:15:03 +0000
Date:   Mon, 22 Mar 2021 15:15:03 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Christoph Hellwig <hch@lst.de>
Cc:     "David S. Miller" <davem@davemloft.net>,
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
Message-ID: <20210322151503.GX1463@shell.armlinux.org.uk>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-3-hch@lst.de>
 <20210319170753.GV1463@shell.armlinux.org.uk>
 <20210319175311.GW1463@shell.armlinux.org.uk>
 <20210322145403.GA30942@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322145403.GA30942@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 22, 2021 at 03:54:03PM +0100, Christoph Hellwig wrote:
> On Fri, Mar 19, 2021 at 05:53:12PM +0000, Russell King - ARM Linux admin wrote:
> > If I extend the arch/arm/kernel/bios32.c code to kill BARs 2/3 (which
> > actually are not present on the CY82C693) then the IDE driver works
> > for me, but the PATA driver does not:
> > 
> > cy82c693 0000:00:06.1: IDE controller (0x1080:0xc693 rev 0x00)
> > cy82c693 0000:00:06.1: not 100% native mode: will probe irqs later
> > legacy IDE will be removed in 2021, please switch to libata
> > Report any missing HW support to linux-ide@vger.kernel.org
> >     ide0: BM-DMA at 0x1080-0x1087
> >     ide1: BM-DMA at 0x1088-0x108f
> > Probing IDE interface ide0...
> > hda: PIONEER DVD-RW DVR-105, ATAPI CD/DVD-ROM drive
> > hda: host max PIO4 wanted PIO255(auto-tune) selected PIO4
> > ...
> > 
> > (unbind Cypress_IDE and try binding pata_cypress)
> > 
> > pata_cypress 0000:00:06.1: no available native port
> 
> This comes from ata_pci_sff_init_host when it tails to initialize
> a port.  There are three cases why it can't initialize the port:
> 
>  1) because it is marked as dummy, which is the case for the second
>     port of the cypress controller, but you're not using that even
>     with the old ide driver, and we'd still not get that message just
>     because of that second port.
>  2) when ata_resources_present returns false because the BAR has
>     a zero start or length
>  3) because pcim_iomap_regions() fails.  This prints a warning to the
>     log ("failed to request/iomap BARs for port %d (errno=%d)") that you
>     should have seen
> 
> So the problem here has to be number two.  The legacy ide driver OTOH
> seems to lack a lot of these checks, although I'm not sure how it
> manages to actually work without those.
> 
> Can you show how the BAR assignment for the device looks using lscpi
> or a tool of your choice?

There's a big problem here. I have to explicitly zero the resources
(getting rid of the legacy ones assigned by the PCI probe code)
because they are in fact _wrong_ for the CY82C693. The PCI code
assumes that PCI function 1 (primary port) and PCI function 2
(secondary port) are two independent dual-channel IDE ports, and
as the PROG-IF of the class code indicates that all ports are in
legacy mode, the PCI code assigns the legacy ioport resources to
_both_ PCI functions. Essentially, the CY82C693 is a bit of an odd-ball
because it splits the two IDE ports across two functions rather than a
single function.

It gets worse than that though - due to a change to remove
pcibios_min_io from the generic code, moving it into the ARM
architecture code, this has caused a regression that prevents the
legacy resources being registered against the bus resource. So even
if they are there, they cause probe failures. I haven't found a
reasonable way to solve this yet, but until there is, there is no
way that the PATA driver can be used as the "legacy mode" support
is effectively done via the PCI code assigning virtual IO port
resources.

I'm quite surprised that the CY82C693 even works on Alpha - I've
asked for a lspci for that last week but nothing has yet been
forthcoming from whoever responded to your patch for Alpha - so I
can't compare what I'm seeing with what's happening with Alpha.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
