Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE2346D3F9
	for <lists+linux-mips@lfdr.de>; Wed,  8 Dec 2021 14:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233997AbhLHNIz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Dec 2021 08:08:55 -0500
Received: from elvis.franken.de ([193.175.24.41]:36512 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229636AbhLHNIz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 8 Dec 2021 08:08:55 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1muwdN-0002vv-00; Wed, 08 Dec 2021 14:05:21 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 78AACC4E02; Wed,  8 Dec 2021 12:50:30 +0100 (CET)
Date:   Wed, 8 Dec 2021 12:50:30 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhuacai@kernel.org>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>
Subject: Re: Loongson64 and huge pages
Message-ID: <20211208115030.GA9868@alpha.franken.de>
References: <20211207162618.GA19327@alpha.franken.de>
 <CAAhV-H6tWyiZCtZXf_57-va9J8C+Roy5bgKJVc0=ATRrHV9Mtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H6tWyiZCtZXf_57-va9J8C+Roy5bgKJVc0=ATRrHV9Mtw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Dec 08, 2021 at 09:56:50AM +0800, Huacai Chen wrote:
> Hi, Thomas,
> 
> On Wed, Dec 8, 2021 at 8:59 AM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > Hi,
> >
> > [   11.647401] CPU 3 Unable to handle kernel paging request at virtual address 0000000558005801, epc == ffffffff80232838, ra == ffffffff802327ac
> > [   11.660049] Oops[#1]:
> > [   11.662303] CPU: 3 PID: 348 Comm: libvirtd Not tainted 5.16.0-rc3+ #140
> > [   11.668877] Hardware name: Lemote LEMOTE-LS3A4000-7A1000-1w-V0.1-pc/LEMOTE-LS3A4000-7A1000-1w-V01-pc, BIOS Kunlun-A1901-V4.1.4 04/20/2020
> > [   11.929428] note: libvirtd[348] exited with preempt_count 1
> [..]
> >
> > is this a known issue ? If I disabled TRANSPARENT_HUGE_PAGE system
> > works.
> Have you tried some older kernels, such as 5.10/5.15? I have seen that
> some MM-related patches be merged in MIPS tree in recent releases, and
> maybe this bug is caused by them.

not yet, as it has worked, I'm going to bisect it.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
