Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9902B32082D
	for <lists+linux-mips@lfdr.de>; Sun, 21 Feb 2021 04:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232901AbhBUDdc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 20 Feb 2021 22:33:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232904AbhBUDdT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 20 Feb 2021 22:33:19 -0500
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 88299C061574;
        Sat, 20 Feb 2021 19:32:39 -0800 (PST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 87AEC92009C; Sun, 21 Feb 2021 04:32:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 7D0A092009B;
        Sun, 21 Feb 2021 04:32:38 +0100 (CET)
Date:   Sun, 21 Feb 2021 04:32:38 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Christoph Hellwig <hch@lst.de>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH 5/6] driver core: lift dma_default_coherent into common
 code
In-Reply-To: <alpine.DEB.2.21.2102151342050.1521@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2102210407090.2021@angie.orcam.me.uk>
References: <20210208145024.3320420-1-hch@lst.de> <20210208145024.3320420-6-hch@lst.de> <alpine.DEB.2.21.2102081654060.35623@angie.orcam.me.uk> <20210208161043.GA14083@lst.de> <alpine.DEB.2.21.2102091213070.35623@angie.orcam.me.uk>
 <alpine.DEB.2.21.2102151342050.1521@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 15 Feb 2021, Maciej W. Rozycki wrote:

>  I hope to have the adapter properly fixed soon and I'll look at the Malta 
> side now, possibly using the old server whose DEFPA has worked flawlessly 
> for some 20 years now.  I have planned to use the interface to supply NFS 
> root, which I think should be enough of a stress test.

 Card reworked now and network wired, so using the new server actually.  
I haven't booted Linux on my Malta for a while now, but it turns out to 
work just fine, and your patch set does not regress it booting multi-user 
NFS-rooted over FDDI.

 I note however that the system does not reboot properly:

sd 0:0:0:0: [sda] Synchronizing SCSI cache
reboot: Restarting system
Reboot failed -- System halted

which is a regression, and also the MMIO-mapped discrete CBUS UART (ttyS2) 
does not sign in anymore either:

Serial: 8250/16550 driver, 5 ports, IRQ sharing enabled
printk: console [ttyS0] disabled
serial8250.0: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
printk: console [ttyS0] enabled
printk: console [ttyS0] enabled
printk: bootconsole [uart8250] disabled
printk: bootconsole [uart8250] disabled
serial8250.0: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16550A

while long ago:

Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
ttyS28 at 0x03f8 (irq = 4) is a 16550A
ttyS29 at 0x02f8 (irq = 3) is a 16550A
ttyS30 at 0x0000 (irq = 20) is a 16550

(I don't know why the line numbers reported were so odd back then, but the 
standard character device major:minor numbers for ttyS0-2 just worked), so 
there's probably something wrong with platform device registration.  ISTR 
using the CBUS UART as a console device at one point too.

  Maciej
