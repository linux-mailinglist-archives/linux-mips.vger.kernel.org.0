Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E12A318D319
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2020 16:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727530AbgCTPj2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 20 Mar 2020 11:39:28 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:39712 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727060AbgCTPj2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 20 Mar 2020 11:39:28 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23992475AbgCTPjZQAhSh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 20 Mar 2020 16:39:25 +0100
Date:   Fri, 20 Mar 2020 15:39:25 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Patrick Doyle <wpdster@gmail.com>
cc:     post@pfrst.de, linux-mips@vger.kernel.org
Subject: Re: Address space in MIPS Linux kernel
In-Reply-To: <CAF_dkJDm=Kk6n-KqFZjabQ8GUY-axrhN4W2CBNmkzy++jBk2=A@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.2003201517230.2689954@eddie.linux-mips.org>
References: <CAF_dkJCQuF0MaYddfqVRJ-8tNPWVkR8Q0ZYz22DUi9moAWsxeQ@mail.gmail.com> <Pine.LNX.4.64.2003061230320.1467@Mobile0.Peter> <CAF_dkJDm=Kk6n-KqFZjabQ8GUY-axrhN4W2CBNmkzy++jBk2=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 6 Mar 2020, Patrick Doyle wrote:

> Thank you for your reply.  I managed to find my MIPS book finally, and read:
> 
> kuseg: 0x00000000-0x7FFFFFFF - User space mapped addresses
> kseg0: 0x80000000-0x9FFFFFFF - Cached, "untranslated" address
> kseg1: 0xA0000000-0xBFFFFFFF - Uncached, "untranslated" address
> kseg2: 0xC0000000-0xFFFFFFFF - Kernel space mapped addresses (cached?)

 KSEG2 addresses will have the caching attribute set to one requested with 
the allocation that has made them.  At the hardware level the attribute is 
held in the respective TLB entries.

> So, I guess I'm wondering how the kernel ends up with some addresses
> in kseg0 and some in kseg2.  Is there any significance to the fact
> that one address is in kseg2 while the other is in kseg0.  I may be
> chasing down a rabbit hole here, but, at this point, I don't know
> what's causing my kernel panic, and I noticed something I didn't
> understand (kseg2 vs kseg0), so I figured I would ask folks on this
> list and learn something.  Maybe this will ultimately point me to the
> source of my problem.  Maybe I will just learn something new.  Either
> way, I win.

 KSEG2 addresses are handed out with virtual allocations, typically 
`vmalloc' and friends (also used for mapping kernel modules), but also 
`ioremap' and friends if hardware constraints mandate it.  KSEG0 addresses 
are handed out with regular allocations made with `kmalloc' and friends, 
and also `ioremap' and friends where feasible.  Also addresses coming from 
the kernel executable and the stack will be in KSEG0.

 This is for 32-bit MIPS/Linux configurations; 64-bit ones have additional 
segments, which will be used accordingly.

 HTH,

  Maciej
