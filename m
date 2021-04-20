Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E72093654A8
	for <lists+linux-mips@lfdr.de>; Tue, 20 Apr 2021 10:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbhDTI6o (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Apr 2021 04:58:44 -0400
Received: from elvis.franken.de ([193.175.24.41]:32856 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229749AbhDTI6m (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 20 Apr 2021 04:58:42 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lYmCu-0000OR-00; Tue, 20 Apr 2021 10:58:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E113DC0652; Tue, 20 Apr 2021 10:34:03 +0200 (CEST)
Date:   Tue, 20 Apr 2021 10:34:03 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc:     YunQiang Su <wzssyqa@gmail.com>,
        linux-mips <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: build failure of malta_qemu_32r6_defconfig
Message-ID: <20210420083403.GA6557@alpha.franken.de>
References: <YG35ULOblq/gUZmh@debian>
 <CAKcpw6VrbA2+mq42=0FjE7Y9e6OM-Q9WxvYPWtAF4t0hRWKB1A@mail.gmail.com>
 <20210409121637.GA13010@alpha.franken.de>
 <CADVatmPcL0YF0h6cnUbyo-4xp1re1DTARGKpq9_DYp+hTsueVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADVatmPcL0YF0h6cnUbyo-4xp1re1DTARGKpq9_DYp+hTsueVw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Apr 18, 2021 at 12:01:36AM +0100, Sudip Mukherjee wrote:
> Hi Thomas,
> 
> On Fri, Apr 9, 2021 at 1:17 PM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > On Thu, Apr 08, 2021 at 09:42:11AM +0800, YunQiang Su wrote:
> > > Sudip Mukherjee <sudipm.mukherjee@gmail.com> 于2021年4月8日周四 上午2:26写道：
> > > >
> > > > Hi Thomas,
> > > >
> > > > I was building v5.10.28 with malta_qemu_32r6_defconfig and noticed that
> > > > it fails to build, so tried next-20210407 to see if it has been fixed.
> > > > But linux-next also has the issue with gcc-10.
> > > >
> > > > The error is:
> > > >
> > > > ./arch/mips/include/asm/vdso/gettimeofday.h: In function '__vdso_clock_gettime':
> > > > ./arch/mips/include/asm/vdso/gettimeofday.h:103:2: error: the register 'lo' cannot be clobbered in 'asm' for the current target
> > > >   103 |  asm volatile(
> > > >       |  ^~~
> > >
> > > this operation try to save lo and hi register, while they are not
> > > exisiting on r6.
> > > We are working on figure out a patch for it.
> >
> > looks like there is already a patch in patchwork, which just needs
> > a workup:
> >
> > https://patchwork.kernel.org/project/linux-mips/patch/20200801154401.4177009-1-romain.naour@gmail.com/
> 
> Looks like there has been no response to it since last 8 months. Do
> you want me to respin it and send a proper patch?

that would me fantastic and much appreciated :-)

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
