Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D239F10CB95
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 16:17:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbfK1PRr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Nov 2019 10:17:47 -0500
Received: from elvis.franken.de ([193.175.24.41]:53109 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726726AbfK1PRr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 28 Nov 2019 10:17:47 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1iaLY8-0003pZ-00; Thu, 28 Nov 2019 16:17:44 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id F11D9C0638; Thu, 28 Nov 2019 16:07:21 +0100 (CET)
Date:   Thu, 28 Nov 2019 16:07:21 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Maarten ter Huurne <maarten@treewalker.org>,
        mips-creator-ci20-dev@googlegroups.com,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Subject: Re: MIPS: bug: gettimeofday syscall broken on CI20 board
Message-ID: <20191128150721.GA20142@alpha.franken.de>
References: <18788C50-F29B-4BD7-89F6-B056FF490214@goldelico.com>
 <7b6275c7-ab2b-a647-6bf7-d5e1c4523c98@arm.com>
 <D1CE4D1E-9A42-4FAE-90A9-615C38B979C0@goldelico.com>
 <4807842.gtHLO0kk0V@hyperion>
 <01D75E67-EC2E-4C74-B9BB-752773C481A9@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01D75E67-EC2E-4C74-B9BB-752773C481A9@goldelico.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Nov 28, 2019 at 02:48:46PM +0100, H. Nikolaus Schaller wrote:
> 
> What still does not fit into the picture is the errno = 1 i.e. EPERM.
> Maybe I have to study the libc code that tries to read the ELF symbols
> you have mentioned. It may fail for unknown reasons.

to understand vdso you might look at arch/mips/vdso and lib/vdso
kernel sources.

And if I understand it correctly you neither have a working high resolution
timer usable bei do_hres() in lib/vdso/gettimeofday.c or a working
gettimeofday_fallback(), which is enabled via CONFIG_MIPS_CLOCK_VSYSCALL
and needs either CSRC_R4K or CLKSRC_MIPS_GIC.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
