Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55675145FCF
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2020 01:20:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbgAWAUi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jan 2020 19:20:38 -0500
Received: from mail-io1-f53.google.com ([209.85.166.53]:34615 "EHLO
        mail-io1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgAWAUi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Jan 2020 19:20:38 -0500
Received: by mail-io1-f53.google.com with SMTP id z193so1236288iof.1;
        Wed, 22 Jan 2020 16:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q9OnONyP09Moztbo+Zld7RNuaGBt8c5OJNarX5zYoeg=;
        b=ebiH8eRbwZ28AjEsFCJJHr853iDHjGjVrGPQyBE+C4kSWhZrMTY5qTGrRqyzRfItMx
         WPUv6BCv8YQlYO8fI6mtFTrKMkHm5dH8tmhsaLJn2Dsfgdn9VdpHw3WqJB5x2uLI1Ow/
         4JvQRh8i5kL1AGZsWgYRWDPnQKGrIYrIedltSH9sdxsd1H94yiHG3B19WpRJsWq3R/tv
         vMlJR719RY9L0utBNAET+N7qQ0LZW6waGyWuwlRVcd2ydvM9EejpcfYZP3I7sEAX0ev8
         KqI3xXugFinIHlHp1IYH26IwUsnDjKSrgwPCktCIy0jWP5Z8sbNqAXpDySh8586rWEMe
         rvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q9OnONyP09Moztbo+Zld7RNuaGBt8c5OJNarX5zYoeg=;
        b=sabfhGZ/qqUBndHAw4uC3/XfE9RdNkClC63TNgkpqwWqnqQqjKpqjej/d2hkf6h9Jh
         raVoMMAzssXjd8+ItwtIKW51iBaCNIntBvltTmAi3krCiGEWPRmvMHbee6vNyWGs32Df
         tAEXJhml0y2paoYErlcfA2aMmaTS8A8Bnkkti797AUILKxZ9i046OEXOEzvvenURG/OA
         cf9Az5XPSbZ27fHM+5ZaJtAG7Ekl+BKhlIcsDvG4vcJ2tH2a15p6fKObTF1qBMeFq9Gu
         YY+OGEU4io5G1qJyIWJh82jLzuBtsRa6ax19ppK48NnrL7w9L2SumM+dwp18MqSoDefD
         WEOg==
X-Gm-Message-State: APjAAAU70U7qjEMlvD9I2oULd/shef87O0g7wJQzPZRZe1/oith67OY0
        wTwOsewifEyj0njoMLyq6eC1t8Fy2RrjfyfZSSY=
X-Google-Smtp-Source: APXvYqynSFq+/hmW/yTpgk43hU/Ydwm6maWK274YlWABDs1iN5tMK4oeZExEFYIXJtVONfNIp6dUTYx+YnluZQxC4D4=
X-Received: by 2002:a5e:d515:: with SMTP id e21mr4706750iom.100.1579738837257;
 Wed, 22 Jan 2020 16:20:37 -0800 (PST)
MIME-Version: 1.0
References: <20190217235951.GA20700@darkstar.musicnaut.iki.fi>
 <orpnrpj2rk.fsf@lxoliva.fsfla.org> <alpine.LFD.2.21.1902180227090.15915@eddie.linux-mips.org>
 <orlg1ryyo2.fsf@lxoliva.fsfla.org> <alpine.LFD.2.21.1903071744560.7728@eddie.linux-mips.org>
 <orwolaw5u1.fsf@lxoliva.fsfla.org> <alpine.LFD.2.21.1903082347330.31648@eddie.linux-mips.org>
 <or7ead4lq3.fsf@lxoliva.fsfla.org> <20190610214938.GB7147@darkstar.musicnaut.iki.fi>
 <alpine.LFD.2.21.1906102253080.19418@eddie.linux-mips.org> <20190612192412.GF26504@darkstar.musicnaut.iki.fi>
In-Reply-To: <20190612192412.GF26504@darkstar.musicnaut.iki.fi>
From:   Matt Turner <mattst88@gmail.com>
Date:   Wed, 22 Jan 2020 16:20:26 -0800
Message-ID: <CAEdQ38E4_eSm9VnHHJuV=qvQVWrGNOMvn0s8KEKaJT65vO77pQ@mail.gmail.com>
Subject: Re: [RFC] On the Current Troubles of Mainlining Loongson Platform Drivers
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        Alexandre Oliva <lxoliva@fsfla.org>, Tom Li <tomli@tomli.me>,
        James Hogan <jhogan@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jun 12, 2019 at 12:25 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
>
> Hi,
>
> On Wed, Jun 12, 2019 at 06:55:28AM +0100, Maciej W. Rozycki wrote:
> > On Tue, 11 Jun 2019, Aaro Koskinen wrote:
> >
> > > However, with your patch the "nobody cared" is never reached so all is
> > > good. I tried 10 boots with the patch and all were successful. Without
> > > the patch 8 out of 10 failed with the "nobody cared" warning.
> >
> >  I wouldn't call it "good", just less obvious or painful.  This is still
> > causing wasted CPU cycles that are used for taking the phantom interrupts.
> >
> >  There is clearly a completion barrier missing somewhere that causes the
> > interrupt request to linger beyond the point interrupts are reenabled at
> > the CPU.
> >
> >  One way to attempt to narrow it down might be taking a backtrace from
> > where IRQ 14 is found to be spurious.  This would indicate the offending
> > interrupt unmask action.  E.g. I see no explicit completion barrier
>
> The first spurious IRQ is right after the driver registers:
>
> [    4.732000] [<ffffffff8020efac>] show_stack+0x90/0x140
> [    4.732000] [<ffffffff8052850c>] ata_bmdma_interrupt+0x2b4/0x39c
> [    4.732000] [<ffffffff80260368>] __handle_irq_event_percpu+0xb0/0x178
> [    4.732000] [<ffffffff80260464>] handle_irq_event_percpu+0x34/0x9c
> [    4.732000] [<ffffffff80260508>] handle_irq_event+0x3c/0x74
> [    4.732000] [<ffffffff80264d28>] handle_level_irq+0x118/0x154
> [    4.732000] [<ffffffff8025f978>] generic_handle_irq+0x34/0x50
> [    4.732000] [<ffffffff806b9600>] do_IRQ+0x18/0x24
> [    4.732000] [<ffffffff80208ce4>] handle_int+0x17c/0x188
> [    4.732000] [<ffffffff806b30c8>] arch_local_irq_restore+0x18/0x30
> [    4.732000] [<ffffffff802621f0>] __setup_irq+0x660/0x7a0
> [    4.732000] [<ffffffff80262798>] request_threaded_irq+0x114/0x19c
> [    4.732000] [<ffffffff80265d7c>] devm_request_threaded_irq+0xa0/0x10c
> [    4.732000] [<ffffffff80527f00>] ata_pci_sff_activate_host+0x1c0/0x274
> [    4.732000] [<ffffffff80528a30>] ata_pci_init_one+0x170/0x1c4
> [    4.732000] [<ffffffff8052a288>] cs5536_init_one+0x94/0xb8
>
> and the following ones do not seem to provide much info as I can only
> see the IRQ stack:
>
> [    4.736000] [<ffffffff8020efac>] show_stack+0x90/0x140
> [    4.736000] [<ffffffff8052850c>] ata_bmdma_interrupt+0x2b4/0x39c
> [    4.736000] [<ffffffff80260368>] __handle_irq_event_percpu+0xb0/0x178
> [    4.736000] [<ffffffff80260464>] handle_irq_event_percpu+0x34/0x9c
> [    4.736000] [<ffffffff80260508>] handle_irq_event+0x3c/0x74
> [    4.736000] [<ffffffff80264d28>] handle_level_irq+0x118/0x154
> [    4.736000] [<ffffffff8025f978>] generic_handle_irq+0x34/0x50
> [    4.736000] [<ffffffff806b9600>] do_IRQ+0x18/0x24
> [    4.736000] [<ffffffff80208ce4>] handle_int+0x17c/0x188
> [    4.736000] [<ffffffff8022f330>] irq_exit+0x68/0xcc
>
> > between the final `outb' in `mask_and_ack_8259A' and the following call to
> > `raw_spin_unlock_irqrestore', which are obviously otherwise unordered WRT
> > each other (because `outb' is I/O or MMIO and `raw_spin_unlock_irqrestore'
> > is contained within the CPU on UP).  I can see provisions however for
> > issuing an architecture-specific barrier in `do_raw_spin_unlock', which is
> > the workhorse for `raw_spin_unlock_irqrestore', so maybe this is the place
> > to look into?
> >
> >  Also how's IRQ 14 registered as indicated by /proc/interrupts?
>
> Not sure what you mean but here's the output:
>
> $ cat /proc/interrupts
>            CPU0
>   2:          0    XT-PIC   2  cascade
>   3:         20    XT-PIC   3  ttyS0
>   5:     543358    XT-PIC   5  timer
>  11:          0    XT-PIC  11  ehci_hcd:usb1, ohci_hcd:usb2
>  14:     100000    XT-PIC  14  pata_cs5536
>  18:          0      MIPS   2  cascade
>  22:          0      MIPS   6  cascade
>  36:       3052  bonito_irq      eth0
> ERR:          0
>
> A.

Has any more progress been made?

Thanks,
Matt
