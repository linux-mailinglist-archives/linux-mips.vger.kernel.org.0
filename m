Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8191EAFF2
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2020 22:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgFAUG1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Jun 2020 16:06:27 -0400
Received: from mail6.webfaction.com ([31.170.123.134]:54210 "EHLO
        smtp.webfaction.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbgFAUG0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Jun 2020 16:06:26 -0400
Received: from jeremy.localnet (host-37-191-188-128.lynet.no [37.191.188.128])
        by smtp.webfaction.com (Postfix) with ESMTPSA id C9DF960045481;
        Mon,  1 Jun 2020 20:06:28 +0000 (UTC)
From:   Paul Boddie <paul@boddie.org.uk>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     "H . Nikolaus Schaller" <hns@goldelico.com>,
        =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-mips <linux-mips@vger.kernel.org>
Subject: Re: JZ4780 LCD controller initialisation (was Re: [PATCH] clocksource: Ingenic: Add high resolution timer support for SMP.)
Date:   Mon, 01 Jun 2020 22:06:07 +0200
Message-ID: <8743693.hF1s80oglt@jeremy>
User-Agent: KMail/4.14.1 (Linux/3.16.0-10-586; KDE/4.14.2; i686; ; )
In-Reply-To: <T8OYAQ.3TE69K2DB79Z2@crapouillou.net>
References: <1589898923-60048-5-git-send-email-zhouyanjie@wanyeetech.com> <6095840.Tg7rQzGjE8@jeremy> <T8OYAQ.3TE69K2DB79Z2@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wednesday 27. May 2020 01.07.41 Paul Cercueil wrote:
> 
> Don't focus too much on interrupts right now. You don't get interrupts
> because the data is not flowing. Which in turns is caused either by the
> LCDC not being correctly configured, or the HDMI not sending
> hsync/vsync signals.
> 
> For now, what seems to be the problem is that the DMA descriptors
> aren't loaded properly. Whatever I do, the debug registers
> (LCDSAx/LCDIDx/etc) are still zero here.

I checked the LCDSA0 (source address) and LCDFID0 (frame identifier) 
registers, and they get populated with what I put in the descriptor, so I am 
inclined to think that some kind of initialisation does happen. However, as 
previously noted, the LCDIID (interrupt identifier) remains zero.

What I have subsequently done is to introduce the HDMI driver functionality 
from Linux into my test environment (L4Re) to investigate the configuration 
process. Eventually, I managed to get the HDMI signal enabled, meaning that I 
can switch my monitor to the DVI input and be told what kind of picture it 
thinks it is getting (1280x1024 @ 62Hz, and although I asked for 60Hz, the 
111MHz pixel clock will probably generate something closer to 62Hz).

Where this gets interesting/infuriating is that the signal persists but there 
is no actual picture (just a black screen, but illuminated), but accompanying 
this is a "FIFO 0 under run" condition (IFU0 in LCDSTATE). Looking at the 
manual, there is no other mention of this "FIFO 0", but I did wonder whether 
it had anything to do with the OSD functionality because it seems to be the 
case that the OSD is always enabled (OSDEN is set in LCDOSDC) and cannot be 
unset just by clearing the OSDEN bit.

I thought that the "new" 8-word descriptor arrangement might be important in 
this regard. Although the manual doesn't make this explicit, it seems to be 
the case that the extra 4 words are configuring the OSD foreground planes. So, 
I enabled the populated extra words in a similar way to what the 3.18 driver 
does. But even with various other JZ4780-specific registers set up (RGB 
control, priority threshold), what actually happens is that the monitor fails 
to acknowledge a signal and switches back to its default VGA input.

I have tried a few things, such as enabling the IPU clock in the CPM unit 
(which is probably unnecessary since it is enabled by default) and enabling 
the IPU clock in the LCD controller (IPU_CLKEN in LCDOSDCTRL), but neither 
changes the situation.

I also noted a recent patch on the dri-devel list adding OSD support...

"[PATCH 09/12] gpu/drm: Ingenic: Add support for OSD mode"

What is interesting about that patch is that it attempts to enable the OSD 
foreground planes by setting F0EN and F1EN on LCDOSDC. However, these are 
marked as read-only in the JZ4780 and cannot actually be set.

So, I am currently looking for some more ideas about how to get this working. 
It is entirely possible that I have taken one too many shortcuts with the HDMI 
initialisation: I have only implemented "DVI mode" and have sought only to 
implement what is necessary for that and for RGB data. It is also likely that 
I have missed something from the LCD initialisation, but whatever it is 
escapes me at present.

Any suggestions would be appreciated at this point!

Thanks in advance,

Paul

P.S. I can easily imagine that the obstacle to getting things working in a 
modern Linux kernel is just the data format/encoding. The 3.18 driver supports 
only RGB data, which is presumably converted by the HDMI peripheral to 
whatever the preferred output actually is.
