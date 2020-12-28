Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43D092E361A
	for <lists+linux-mips@lfdr.de>; Mon, 28 Dec 2020 11:53:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbgL1Kwy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Dec 2020 05:52:54 -0500
Received: from elvis.franken.de ([193.175.24.41]:43075 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727019AbgL1Kwy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 28 Dec 2020 05:52:54 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1ktq8K-00054l-00; Mon, 28 Dec 2020 11:52:12 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C06D5C0524; Mon, 28 Dec 2020 11:47:45 +0100 (CET)
Date:   Mon, 28 Dec 2020 11:47:45 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: CPUs with EVA support
Message-ID: <20201228104745.GA3606@alpha.franken.de>
References: <20201220193201.GA3184@alpha.franken.de>
 <d45cb374-f3dc-8c26-6b0f-27bec45854a9@flygoat.com>
 <20201227222643.GA5249@alpha.franken.de>
 <0c24ee90-1872-492d-9bfe-4744aaa87615@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c24ee90-1872-492d-9bfe-4744aaa87615@www.fastmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Dec 28, 2020 at 09:28:53AM +0800, Jiaxun Yang wrote:
> 
> 
> On Mon, Dec 28, 2020, at 6:26 AM, Thomas Bogendoerfer wrote:
> > On Mon, Dec 21, 2020 at 08:38:00AM +0800, Jiaxun Yang wrote:
> > > > How good is EVA support in qemu ?
> > > 
> > > EVA is functional in QEMU.
> > > I had tested it with P5600 malta system.
> > 
> > and it's working for you ? I've setup a qemu malta system running
> > debian buster. It boots fine when CPU is != P5600, but as soon as
> > I enable -cpu P5600 it stops booting:
> > 
> > Run /bin/bash as init process
> > request_module: kmod_concurrent_max (0) close to 0 (max_modprobes: 50), 
> > for module binfmt-464c, throttling...
> > request_module: modprobe binfmt-464c cannot be processed, kmod busy 
> > with 50 threads for more than 5 seconds now
> > Kernel panic - not syncing: Requested init /bin/bash failed (error -8).
> 
> Well you need add "ieee754=relaxed" to cmdline
> to workaround this.
> 
> It's due to NAN2008 mismatch.

excellent, now it boots. I had to specify "coherentio" as kernel parameter
to avoid a pcnet32 driver crash the kernel. Looks like creating uncached
pointers is borken in EVA kernels, is this a known issue ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
