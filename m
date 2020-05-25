Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47A641E180B
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 01:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387745AbgEYXD7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 May 2020 19:03:59 -0400
Received: from mail6.webfaction.com ([31.170.123.134]:58884 "EHLO
        smtp.webfaction.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbgEYXD7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 May 2020 19:03:59 -0400
Received: from jeremy.localnet (host-37-191-188-128.lynet.no [37.191.188.128])
        by smtp.webfaction.com (Postfix) with ESMTPSA id 595D46002ABC2;
        Mon, 25 May 2020 23:03:56 +0000 (UTC)
From:   Paul Boddie <paul@boddie.org.uk>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     "H . Nikolaus Schaller" <hns@goldelico.com>,
        =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-mips <linux-mips@vger.kernel.org>
Subject: JZ4780 LCD controller initialisation (was Re: [PATCH] clocksource: Ingenic: Add high resolution timer support for SMP.)
Date:   Tue, 26 May 2020 01:03:43 +0200
Message-ID: <2002785.O4FZc3DvTp@jeremy>
User-Agent: KMail/4.14.1 (Linux/3.16.0-10-586; KDE/4.14.2; i686; ; )
In-Reply-To: <1902082.ZKqtjM8ATQ@jeremy>
References: <1589898923-60048-5-git-send-email-zhouyanjie@wanyeetech.com> <RVFQAQ.7WL51YCH3VE1@crapouillou.net> <1902082.ZKqtjM8ATQ@jeremy>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Friday 22. May 2020 21.16.10 Paul Boddie wrote:
> On Friday 22. May 2020 14.26.15 Paul Cercueil wrote:
> > Hi Paul,
> > 
> > I think the ingenic-drm driver is fine, even though the old 3.8 kernel
> > worked differently, the IP is backwards-compatible so it should work no
> > problem. I think the problem is somewhere in the Synopsis HDMI code or
> > the glue code. Because the LCDC does seem to send data, which is not
> > encoded properly by the HDMI chip.
> 
> There was one interesting insight related to vertical blank interrupts,
> where it would appear that the end-of-frame condition does not occur, with
> this failure then obstructing driver initialisation. I aim to look into
> that further.

Some further experiments indicate that interrupt generation is indeed a 
problem...

[L4Re experimentation]

> So far, I have managed to reproduce EDID retrieval using the HDMI
> peripheral's own I2C support, and I plan to reproduce the HDMI peripheral
> initialisation itself. However, it is perhaps more interesting to get the
> LCD controller working first and potentially delivering end-of-frame
> interrupts: this might help me understand whether this problem is a serious
> obstacle or not.

First of all, I managed to get the HDMI connector hotplug detection working. 
This was a relatively simple matter of setting the appropriate flags, binding 
to an interrupt and then waiting for one to arrive. Consequently, booting 
without the connector inserted means that my program is halted until the 
interrupt arrives upon insertion; then, the EDID is read, which seems to work 
reliably.

However, I then found that the LCD controller could not be activated. The 
solution to this involves the TVE clock on the JZ4780 which appears to be 
necessary in addition to the LCD clock. Ingenic documentation being what it 
is, I suspect that the LCD clock in the block diagram is really the pixel 
clock(s), with the TVE clock not even appearing in the diagram. The 3.18 
kernel's device tree for the JZ4780 plus the CGU code provide the necessary 
hints, without any explanation, of course.

With the LCD controller now willing to retain values stored in its registers, 
I have been attempting to set up descriptors and do the usual general 
configuration exercise that works on the JZ4720 and JZ4730. However, I have 
never enabled interrupts on those devices, so I don't know what I need to do 
other than to set the appropriate control and command (descriptor) flags. 
Doing so doesn't manage to generate any interrupts, though.

The 3.18 kernel driver sets up the "new" 8-word descriptor and other new 
things. Initially, I ignored these things, but then I thought that they might 
actually be mandatory. Still, introducing practically the same details as seen 
in the 3.18 driver seems to have no effect. So, I imagine I am missing 
something pretty obvious: it took me a while to realise that I wasn't even 
enabling the LCD controller, after all.

One thing I would point out is that the operation of the JZ4780 is not exactly 
the same as earlier products. For example, various configuration register bits 
related to pixel depths are now read-only. Presumably, the idea is to set the 
pixel depth in the "new" descriptor fields instead, enabling some kind of 
mixing of different kinds of pixel data. I also wonder how well supported some 
of the older functions are in the newer hardware.

Anyway, I'm rather stuck with this at the moment. I don't know whether I 
should be reproducing the HDMI initialisation in my test environment under the 
assumption that the LCD controller isn't sending data without some kind of 
output path, or whether I should fake up some other output path (maybe a 
serial LCD) by setting GPIO alternate pin functions. But it turns out not to 
be entirely trivial to just have the LCD controller do its own thing and 
generate these interrupts all by itself.

But again, I may well be overlooking an obvious mistake of my own.

Paul
