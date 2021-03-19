Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5585A3423BB
	for <lists+linux-mips@lfdr.de>; Fri, 19 Mar 2021 18:54:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbhCSRxv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Mar 2021 13:53:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbhCSRxT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 19 Mar 2021 13:53:19 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D59C06174A;
        Fri, 19 Mar 2021 10:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=5b5bolNJYoHvpbguUfHCrjOiVB1eiZ/SyLUPdIsBqrE=; b=fapckYyyVxKxd05dheNDlrTlv
        uFcmGtMwFwzwBPEbnfZHhBlGlW9zqTLadk1HYzxRYAwklFLtV9Ox76oL3XfZFqn6UE1mg/IROkVj3
        79f+WCg+fD7E2jnn1NqHDS3WGxIyuIatzqJmPNCsZxFSkCBNJu9EFI0JI2gN0m43clGoTG/R0W/fh
        oEixbjDCYeE7nceZZwUWWrI/Ve1MweoQ8ZXHSGEwt/4o53r61OjolSZJcVNk3E10ogAN9vvDsQqgy
        MhUzclWSUDU/yZFF8vu1i02HG9tGrP42frcpWnKzo5X6m8xslMqMzvtfBYxMIR2nmTOd6rlatvgWI
        vvWNoMRwA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51488)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1lNJJA-0004hZ-VN; Fri, 19 Mar 2021 17:53:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1lNJJA-0000jP-3r; Fri, 19 Mar 2021 17:53:12 +0000
Date:   Fri, 19 Mar 2021 17:53:12 +0000
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
Message-ID: <20210319175311.GW1463@shell.armlinux.org.uk>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-3-hch@lst.de>
 <20210319170753.GV1463@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319170753.GV1463@shell.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 19, 2021 at 05:07:53PM +0000, Russell King - ARM Linux admin wrote:
> On Thu, Mar 18, 2021 at 05:56:58AM +0100, Christoph Hellwig wrote:
> > footbridge_defconfig enables CONFIG_IDE but no actual host controller
> > driver, so just drop it.
> 
> I have been using the Cypress 82C693 IDE driver on Footbridge for a
> CD ROM drive, and I know it doesn't work with the PATA driver - as
> I need to disable BM DMA, otherwise the 82C693/DC21285 combination
> deadlocks the PCI bus. The PATA driver doesn't support disabling
> BM DMA without disabling it for all PATA ports, which is really
> annoying for my IT821x card in the same machine.
> 
> So, I'm rather stuck using the PATA driver for the HDDs and the
> IDE driver for the CD ROM.
> 
> That said, a commit a while back "cleaning up" the PCI layer appears
> to have totally shafted the 82C693, as the kernel tries to request
> IO resources at the legacy IDE addresses against the PCI bus resource
> which only covers 0x1000-0xffff. Hence, the 82C693 IDE ports are non-
> functional at the moment.
> 
> I'm debating about trying to find a fix to the PCI breakage that was
> introduced by "ARM: move PCI i/o resource setup into common code".
> 
> I hadn't noticed it because I don't use the CD ROM drive very often,
> and I don't upgrade the kernel that often either on the machine -
> but it has been running 24x7 for almost two decades.

Okay, a bit more on this...

If I extend the arch/arm/kernel/bios32.c code to kill BARs 2/3 (which
actually are not present on the CY82C693) then the IDE driver works
for me, but the PATA driver does not:

cy82c693 0000:00:06.1: IDE controller (0x1080:0xc693 rev 0x00)
cy82c693 0000:00:06.1: not 100% native mode: will probe irqs later
legacy IDE will be removed in 2021, please switch to libata
Report any missing HW support to linux-ide@vger.kernel.org
    ide0: BM-DMA at 0x1080-0x1087
    ide1: BM-DMA at 0x1088-0x108f
Probing IDE interface ide0...
hda: PIONEER DVD-RW DVR-105, ATAPI CD/DVD-ROM drive
hda: host max PIO4 wanted PIO255(auto-tune) selected PIO4
...

(unbind Cypress_IDE and try binding pata_cypress)

pata_cypress 0000:00:06.1: no available native port


-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
