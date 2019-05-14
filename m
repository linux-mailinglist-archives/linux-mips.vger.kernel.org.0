Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1F91D03F
	for <lists+linux-mips@lfdr.de>; Tue, 14 May 2019 22:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbfENUBz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 May 2019 16:01:55 -0400
Received: from emh01.mail.saunalahti.fi ([62.142.5.107]:38320 "EHLO
        emh01.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbfENUBz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 May 2019 16:01:55 -0400
Received: from darkstar.musicnaut.iki.fi (85-76-80-127-nat.elisa-mobile.fi [85.76.80.127])
        by emh01.mail.saunalahti.fi (Postfix) with ESMTP id A386D20156;
        Tue, 14 May 2019 23:01:51 +0300 (EEST)
Date:   Tue, 14 May 2019 23:01:51 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-mips@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
        linux-ide@vger.kernel.org
Subject: Re: Loongson 2F IDE/ATA broken with lemote2f_defconfig
Message-ID: <20190514200151.GA10985@darkstar.musicnaut.iki.fi>
References: <20190106124607.GK27785@darkstar.musicnaut.iki.fi>
 <CGME20190112152659epcas5p3953165de5118dba017c94b164dd725a2@epcas5p3.samsung.com>
 <20190112152609.GE22416@darkstar.musicnaut.iki.fi>
 <08c48218-2bc5-a100-4b01-edb08b4225c4@samsung.com>
 <20190126184351.GE2792@darkstar.musicnaut.iki.fi>
 <66a23e7c-2ba8-b505-8382-d13c1912ea88@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66a23e7c-2ba8-b505-8382-d13c1912ea88@samsung.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Thu, Feb 07, 2019 at 04:02:11PM +0100, Bartlomiej Zolnierkiewicz wrote:
> On 01/26/2019 07:43 PM, Aaro Koskinen wrote:
> > On Mon, Jan 14, 2019 at 02:16:42PM +0100, Bartlomiej Zolnierkiewicz wrote:
> >> On 01/12/2019 04:26 PM, Aaro Koskinen wrote:
> >>> Hi,
> >>>
> >>> On Sun, Jan 06, 2019 at 02:46:07PM +0200, Aaro Koskinen wrote:
> >>>> Commit 7ff7a5b1bfff ("MIPS: lemote2f_defconfig: Convert to use libata
> >>>> PATA drivers") switched from IDE to libata PATA on Loongson 2F, but
> >>>> neither PATA_AMD or PATA_CS5536 work well on this platform compared
> >>>> to the AMD74XX IDE driver.
> >>
> >> Sorry about that.
> >>
> >>>> During the ATA init/probe there is interrupt storm from irq 14, and
> >>>> majority of system boots end up with "nobody cared... IRQ disabled".
> >>>> So the result is a very slow disk access.
> >>>>
> >>>> It seems that the interrupt gets crazy after the port freeze done early
> >>>> during the init, and for whatever reason it cannot be cleared.
> >>>>
> >>>> With the below workaround I was able to boot the system normally. I
> >>>> guess that rather than going back to old IDE driver, we should just try
> >>>> to make pata_cs5536 work (and forget PATA AMD on this board)...?
> >>>
> >>> Hmm, even with this hack I get ~500 spurious IRQs during the boot.
> >>>
> >>> Also compared to old IDE, there's 33 vs 100 speed difference:
> >>>
> >>> [    3.324000] ata1: PATA max UDMA/100 cmd 0x1f0 ctl 0x3f6 bmdma 0x4ce0 irq 14
> >>> [    3.584000] ata1.00: ATA-8: WDC WD1600BEVS-00VAT0, 11.01A11, max UDMA/133
> >>> [    3.588000] ata1.00: 312581808 sectors, multi 16: LBA48
> >>> [    3.592000] ata1.00: limited to UDMA/33 due to 40-wire cable
> >>>
> >>> [    4.540000] Probing IDE interface ide0...
> >>> [    4.992000] hda: WDC WD1600BEVS-00VAT0, ATA DISK drive
> >>> [    5.716000] hda: host max PIO5 wanted PIO255(auto-tune) selected PIO4
> >>> [    5.716000] hda: UDMA/100 mode selected
> >>
> >> Can you try booting with "libata.force=1:80c" (and if that doesn't work with
> >> "libata.force=1:short40c")
> > 
> > (Sorry for delay, this machine is in use so I couldn't reboot it randomly...)
> > 
> > OK, the speed issue can be fixed with command line. So "libata.force=1:80c"
> > works with cs5536 libata driver.
> > 
> >> and also provide full dmesg-s for working (ide) and not working
> >> (libata) kernels.
> > 
> > Logs are below:
> > 
> > 1) working IDE (no spurious IRQs)
> > 2) working PATA AMD (around ~90k spurious IRQs, so it's just a matter of luck)
> > 3) failing PATA AMD (100k spurious IRQs reached)
> > 4) working PATA CS5536 (same as with PATA AMD)
> > 5) failing PATA CS5536 (same as with PATA AMD)
> 
> Thank you.
> 
> I've looked a bit more into the problem and came with two possible
> approaches to investigate it further:
> 
> * The major difference between IDE and libata during probing is that
>   IDE keeps the port's IRQ (if known) disabled during whole probe time.
> 
>   To replicate this behavior in libata it seems that we would need
>   to cache IRQ number used in ap->irq, then call disable_irq(ap->irq)
>   when ATA_PFLAG_LOADING flag is set and enable_irq(ap->irq) when
>   ATA_PFLAG_LOADING is cleared.

Since IDE driver is now officially deprecated, I got some motivation to
start trying to fix this. I tried the above approach, but it does not work
very well - I still get around 50000 spurious IRQs.

If I move disable_irq() earlier (from __ata_port_probe() into
ata_pci_sff_activate_host()), it works better with only 20 spurious IRQs.

But, keeping the IRQ disabled during probe seems to result in the
following:

[    4.956000] ata1: PATA max UDMA/100 cmd 0x1f0 ctl 0x3f6 bmdma 0x4ce0 irq 14
[    4.960000] ata2: DUMMY
[   10.328000] ata1.00: qc timeout (cmd 0x27)
[   10.332000] ata1.00: failed to read native max address (err_mask=0x4)
[   10.336000] ata1.00: HPA support seems broken, skipping HPA handling

> * The other idea is to try to modify your workaround patch to implement
>   dummy ->sff_set_devctl helper ("empty" one) instead of adding custom
>   version of ->freeze one.

This works, but also still results in around 50000 spurious IRQs... So
the risk is that the 100000 limit is could be reached if the ATA probe
gets delayed by other subsystems.

A.
