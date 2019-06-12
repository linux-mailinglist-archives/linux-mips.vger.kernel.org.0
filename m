Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88B7F41BB2
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2019 07:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbfFLFzb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Jun 2019 01:55:31 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:60554 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbfFLFzb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Jun 2019 01:55:31 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23990398AbfFLFz2EBmjF (ORCPT
        <rfc822;linux-kernel@vger.kernel.org> + 1 other);
        Wed, 12 Jun 2019 07:55:28 +0200
Date:   Wed, 12 Jun 2019 06:55:28 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
cc:     Alexandre Oliva <lxoliva@fsfla.org>, Tom Li <tomli@tomli.me>,
        James Hogan <jhogan@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC] On the Current Troubles of Mainlining Loongson Platform
 Drivers
In-Reply-To: <20190610214938.GB7147@darkstar.musicnaut.iki.fi>
Message-ID: <alpine.LFD.2.21.1906102253080.19418@eddie.linux-mips.org>
References: <20190211230614.GB22242@darkstar.musicnaut.iki.fi> <orva1jj9ht.fsf@lxoliva.fsfla.org> <20190217235951.GA20700@darkstar.musicnaut.iki.fi> <orpnrpj2rk.fsf@lxoliva.fsfla.org> <alpine.LFD.2.21.1902180227090.15915@eddie.linux-mips.org>
 <orlg1ryyo2.fsf@lxoliva.fsfla.org> <alpine.LFD.2.21.1903071744560.7728@eddie.linux-mips.org> <orwolaw5u1.fsf@lxoliva.fsfla.org> <alpine.LFD.2.21.1903082347330.31648@eddie.linux-mips.org> <or7ead4lq3.fsf@lxoliva.fsfla.org>
 <20190610214938.GB7147@darkstar.musicnaut.iki.fi>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 11 Jun 2019, Aaro Koskinen wrote:

> However, with your patch the "nobody cared" is never reached so all is
> good. I tried 10 boots with the patch and all were successful. Without
> the patch 8 out of 10 failed with the "nobody cared" warning.

 I wouldn't call it "good", just less obvious or painful.  This is still 
causing wasted CPU cycles that are used for taking the phantom interrupts.

 There is clearly a completion barrier missing somewhere that causes the 
interrupt request to linger beyond the point interrupts are reenabled at 
the CPU.

 One way to attempt to narrow it down might be taking a backtrace from 
where IRQ 14 is found to be spurious.  This would indicate the offending 
interrupt unmask action.  E.g. I see no explicit completion barrier 
between the final `outb' in `mask_and_ack_8259A' and the following call to 
`raw_spin_unlock_irqrestore', which are obviously otherwise unordered WRT 
each other (because `outb' is I/O or MMIO and `raw_spin_unlock_irqrestore' 
is contained within the CPU on UP).  I can see provisions however for 
issuing an architecture-specific barrier in `do_raw_spin_unlock', which is 
the workhorse for `raw_spin_unlock_irqrestore', so maybe this is the place 
to look into?

 Also how's IRQ 14 registered as indicated by /proc/interrupts?

  Maciej
