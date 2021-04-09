Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9048359E72
	for <lists+linux-mips@lfdr.de>; Fri,  9 Apr 2021 14:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbhDIMRi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Apr 2021 08:17:38 -0400
Received: from elvis.franken.de ([193.175.24.41]:36495 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229801AbhDIMRi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 9 Apr 2021 08:17:38 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lUq4j-0006Zn-00; Fri, 09 Apr 2021 14:17:25 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 6F1ECC24F9; Fri,  9 Apr 2021 14:16:37 +0200 (CEST)
Date:   Fri, 9 Apr 2021 14:16:37 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     YunQiang Su <wzssyqa@gmail.com>
Cc:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        linux-mips <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: build failure of malta_qemu_32r6_defconfig
Message-ID: <20210409121637.GA13010@alpha.franken.de>
References: <YG35ULOblq/gUZmh@debian>
 <CAKcpw6VrbA2+mq42=0FjE7Y9e6OM-Q9WxvYPWtAF4t0hRWKB1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKcpw6VrbA2+mq42=0FjE7Y9e6OM-Q9WxvYPWtAF4t0hRWKB1A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 08, 2021 at 09:42:11AM +0800, YunQiang Su wrote:
> Sudip Mukherjee <sudipm.mukherjee@gmail.com> 于2021年4月8日周四 上午2:26写道：
> >
> > Hi Thomas,
> >
> > I was building v5.10.28 with malta_qemu_32r6_defconfig and noticed that
> > it fails to build, so tried next-20210407 to see if it has been fixed.
> > But linux-next also has the issue with gcc-10.
> >
> > The error is:
> >
> > ./arch/mips/include/asm/vdso/gettimeofday.h: In function '__vdso_clock_gettime':
> > ./arch/mips/include/asm/vdso/gettimeofday.h:103:2: error: the register 'lo' cannot be clobbered in 'asm' for the current target
> >   103 |  asm volatile(
> >       |  ^~~
> 
> this operation try to save lo and hi register, while they are not
> exisiting on r6.
> We are working on figure out a patch for it.

looks like there is already a patch in patchwork, which just needs
a workup:

https://patchwork.kernel.org/project/linux-mips/patch/20200801154401.4177009-1-romain.naour@gmail.com/

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
