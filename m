Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3D5A34226B
	for <lists+linux-mips@lfdr.de>; Fri, 19 Mar 2021 17:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbhCSQsm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Mar 2021 12:48:42 -0400
Received: from angie.orcam.me.uk ([157.25.102.26]:37910 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbhCSQsf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 19 Mar 2021 12:48:35 -0400
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 112A792009C; Fri, 19 Mar 2021 17:48:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 0ABFF92009B;
        Fri, 19 Mar 2021 17:48:33 +0100 (CET)
Date:   Fri, 19 Mar 2021 17:48:32 +0100 (CET)
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
Subject: Re: remove the legacy ide driver
In-Reply-To: <20210318045706.200458-1-hch@lst.de>
Message-ID: <alpine.DEB.2.21.2103191712550.21463@angie.orcam.me.uk>
References: <20210318045706.200458-1-hch@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 18 Mar 2021, Christoph Hellwig wrote:

> we've been trying to get rid of the legacy ide driver for a while now,
> and finally scheduled a removal for 2021, which is three month old now.

 Hmm, there's still a regression in that pata_legacy unconditionally pokes 
at random I/O port locations corresponding to all the known possible ATA 
interface mappings with ISA option cards:

scsi host0: pata_legacy
ata1: PATA max PIO4 cmd 0x1f0 ctl 0x3f6 irq 14
ata1.00: ATA-4: ST310211A, 3.54, max UDMA/100
ata1.00: 19541088 sectors, multi 16: LBA
ata1.00: configured for PIO
scsi 0:0:0:0: Direct-Access     ATA      ST310211A        3.54 PQ: 0 ANSI: 5
scsi 0:0:0:0: Attached scsi generic sg0 type 0
sd 0:0:0:0: [sda] 19541088 512-byte logical blocks: (10.0 GB/9.32 GiB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't 
support DPO or FUA
 sda: sda1 sda2 sda3
sd 0:0:0:0: [sda] Attached SCSI disk
scsi host1: pata_legacy
ata2: PATA max PIO4 cmd 0x170 ctl 0x376 irq 15
scsi host1: pata_legacy
ata3: PATA max PIO4 cmd 0x1e8 ctl 0x3ee irq 11
scsi host1: pata_legacy
ata4: PATA max PIO4 cmd 0x168 ctl 0x36e irq 10
scsi host1: pata_legacy
ata5: PATA max PIO4 cmd 0x1e0 ctl 0x3e6 irq 8
scsi host1: pata_legacy
ata6: PATA max PIO4 cmd 0x160 ctl 0x366 irq 12

This seems needlessly dangerous to me.  With the old IDE driver I could 
(and did) specify "ide_generic.probe_mask=1" to avoid this clutter (the 
ISA card used with this system has a single ATA port only).

 I guess it's easy to fix by carrying the `probe_mask' parameter over and 
I think we'd rather wait with the removal of the IDE subsystem until we 
have a release with this option supported.  I may look into it unless 
someone beats me to it.

 Overall I find it rather disturbing that nobody has noticed this issue 
over all these years.

 NB it is only earlier this year that I recovered this system from a PSU 
failure several years ago, which took the disk the system previously had 
with it, so myself I had no chance to get at it any earlier, though I did 
mean to have a look as soon as I saw the notice about the scheduled IDE 
removal.

  Maciej
