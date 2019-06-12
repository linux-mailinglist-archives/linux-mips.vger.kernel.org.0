Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C773842FDD
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2019 21:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727584AbfFLTYQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Jun 2019 15:24:16 -0400
Received: from emh07.mail.saunalahti.fi ([62.142.5.117]:44270 "EHLO
        emh07.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727443AbfFLTYQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Jun 2019 15:24:16 -0400
Received: from darkstar.musicnaut.iki.fi (85-76-70-161-nat.elisa-mobile.fi [85.76.70.161])
        by emh07.mail.saunalahti.fi (Postfix) with ESMTP id B32D2B0069;
        Wed, 12 Jun 2019 22:24:12 +0300 (EEST)
Date:   Wed, 12 Jun 2019 22:24:12 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Alexandre Oliva <lxoliva@fsfla.org>, Tom Li <tomli@tomli.me>,
        James Hogan <jhogan@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC] On the Current Troubles of Mainlining Loongson Platform
 Drivers
Message-ID: <20190612192412.GF26504@darkstar.musicnaut.iki.fi>
References: <20190217235951.GA20700@darkstar.musicnaut.iki.fi>
 <orpnrpj2rk.fsf@lxoliva.fsfla.org>
 <alpine.LFD.2.21.1902180227090.15915@eddie.linux-mips.org>
 <orlg1ryyo2.fsf@lxoliva.fsfla.org>
 <alpine.LFD.2.21.1903071744560.7728@eddie.linux-mips.org>
 <orwolaw5u1.fsf@lxoliva.fsfla.org>
 <alpine.LFD.2.21.1903082347330.31648@eddie.linux-mips.org>
 <or7ead4lq3.fsf@lxoliva.fsfla.org>
 <20190610214938.GB7147@darkstar.musicnaut.iki.fi>
 <alpine.LFD.2.21.1906102253080.19418@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.1906102253080.19418@eddie.linux-mips.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Wed, Jun 12, 2019 at 06:55:28AM +0100, Maciej W. Rozycki wrote:
> On Tue, 11 Jun 2019, Aaro Koskinen wrote:
> 
> > However, with your patch the "nobody cared" is never reached so all is
> > good. I tried 10 boots with the patch and all were successful. Without
> > the patch 8 out of 10 failed with the "nobody cared" warning.
> 
>  I wouldn't call it "good", just less obvious or painful.  This is still 
> causing wasted CPU cycles that are used for taking the phantom interrupts.
>
>  There is clearly a completion barrier missing somewhere that causes the 
> interrupt request to linger beyond the point interrupts are reenabled at 
> the CPU.
> 
>  One way to attempt to narrow it down might be taking a backtrace from 
> where IRQ 14 is found to be spurious.  This would indicate the offending 
> interrupt unmask action.  E.g. I see no explicit completion barrier 

The first spurious IRQ is right after the driver registers:

[    4.732000] [<ffffffff8020efac>] show_stack+0x90/0x140
[    4.732000] [<ffffffff8052850c>] ata_bmdma_interrupt+0x2b4/0x39c
[    4.732000] [<ffffffff80260368>] __handle_irq_event_percpu+0xb0/0x178
[    4.732000] [<ffffffff80260464>] handle_irq_event_percpu+0x34/0x9c
[    4.732000] [<ffffffff80260508>] handle_irq_event+0x3c/0x74
[    4.732000] [<ffffffff80264d28>] handle_level_irq+0x118/0x154
[    4.732000] [<ffffffff8025f978>] generic_handle_irq+0x34/0x50
[    4.732000] [<ffffffff806b9600>] do_IRQ+0x18/0x24
[    4.732000] [<ffffffff80208ce4>] handle_int+0x17c/0x188
[    4.732000] [<ffffffff806b30c8>] arch_local_irq_restore+0x18/0x30
[    4.732000] [<ffffffff802621f0>] __setup_irq+0x660/0x7a0
[    4.732000] [<ffffffff80262798>] request_threaded_irq+0x114/0x19c
[    4.732000] [<ffffffff80265d7c>] devm_request_threaded_irq+0xa0/0x10c
[    4.732000] [<ffffffff80527f00>] ata_pci_sff_activate_host+0x1c0/0x274
[    4.732000] [<ffffffff80528a30>] ata_pci_init_one+0x170/0x1c4
[    4.732000] [<ffffffff8052a288>] cs5536_init_one+0x94/0xb8

and the following ones do not seem to provide much info as I can only
see the IRQ stack:

[    4.736000] [<ffffffff8020efac>] show_stack+0x90/0x140
[    4.736000] [<ffffffff8052850c>] ata_bmdma_interrupt+0x2b4/0x39c
[    4.736000] [<ffffffff80260368>] __handle_irq_event_percpu+0xb0/0x178
[    4.736000] [<ffffffff80260464>] handle_irq_event_percpu+0x34/0x9c
[    4.736000] [<ffffffff80260508>] handle_irq_event+0x3c/0x74
[    4.736000] [<ffffffff80264d28>] handle_level_irq+0x118/0x154
[    4.736000] [<ffffffff8025f978>] generic_handle_irq+0x34/0x50
[    4.736000] [<ffffffff806b9600>] do_IRQ+0x18/0x24
[    4.736000] [<ffffffff80208ce4>] handle_int+0x17c/0x188
[    4.736000] [<ffffffff8022f330>] irq_exit+0x68/0xcc

> between the final `outb' in `mask_and_ack_8259A' and the following call to 
> `raw_spin_unlock_irqrestore', which are obviously otherwise unordered WRT 
> each other (because `outb' is I/O or MMIO and `raw_spin_unlock_irqrestore' 
> is contained within the CPU on UP).  I can see provisions however for 
> issuing an architecture-specific barrier in `do_raw_spin_unlock', which is 
> the workhorse for `raw_spin_unlock_irqrestore', so maybe this is the place 
> to look into?
> 
>  Also how's IRQ 14 registered as indicated by /proc/interrupts?

Not sure what you mean but here's the output:

$ cat /proc/interrupts 
           CPU0       
  2:          0    XT-PIC   2  cascade
  3:         20    XT-PIC   3  ttyS0
  5:     543358    XT-PIC   5  timer
 11:          0    XT-PIC  11  ehci_hcd:usb1, ohci_hcd:usb2
 14:     100000    XT-PIC  14  pata_cs5536
 18:          0      MIPS   2  cascade
 22:          0      MIPS   6  cascade
 36:       3052  bonito_irq      eth0
ERR:          0

A.
