Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D64E1B1EB0
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2020 08:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbgDUGN3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Apr 2020 02:13:29 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:34156 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725902AbgDUGN3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 21 Apr 2020 02:13:29 -0400
Subject: Re: [PATCH] Add missing ifdefs to SGI Platform files for IP22, IP32
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org
References: <87be6e36-04de-684b-0361-91de9ce2c731@gentoo.org>
 <20200416163051.GA24457@alpha.franken.de>
 <f4c06481-7fa3-d84c-5aa9-f991daef058c@gentoo.org>
 <20200420072257.GE4627@alpha.franken.de>
From:   Joshua Kinard <kumba@gentoo.org>
Openpgp: preference=signencrypt
Message-ID: <69f0ba65-161c-744a-42c0-c8bb435cce3c@gentoo.org>
Date:   Tue, 21 Apr 2020 02:13:23 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200420072257.GE4627@alpha.franken.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 4/20/2020 03:22, Thomas Bogendoerfer wrote:
> On Thu, Apr 16, 2020 at 07:18:35PM -0400, Joshua Kinard wrote:
>> On 4/16/2020 12:30, Thomas Bogendoerfer wrote:
>>> On Mon, Mar 30, 2020 at 11:25:52PM -0400, Joshua Kinard wrote:
>>>> The attached patch fixes the SGI-specific Platform files to only be
>>>> included when their specific platform is actually built.  Both the
>>>> IP27 and IP30 Platform files already have such ifdefs in place.  This
>>>> patch adds the same to the IP22 and IP32 Platform files.
>>>
>>> looking at all other Platform files, I fail to see why this is needed.
>>> It looks like removing the ifdefs from IP27 and IP30 is the way to
>>> go. What do I miss here ?
>>>
>>> Thomas.
>>
>> I ran into an issue long ago where an IP32 kernel tried dragging in some of
>> the directives in IP30 because of the missing ifdef checks, thus causing the
>> build to fail.
> 
> do you still see this problem ? If yes, I'd like to understand why first.
> If no, what about dropping this patch ?
> 
> Thomas.

Okay, I think I may have found an explanation.  Short bit is yes, IP30's
build is pulling in the cflags-* defines in IP32's Platform file.  In the
vanilla tree, this causes no problems because the CONFIG_SGI_IP32 is not
set, causing those directives to get dropped out.

For my Octane, I am still running a 5.0.21 kernel as it's been building
Gentoo stages for the last two-plus months, so I haven't tried a newer
kernel on it yet.  Nonetheless, I reversed the ifdef patch from the same
kernel tree I've built working kernels out of the last few weeks.  And that
led to tripping up a known GCC PR, 88879, wherein the compiler ICEs when
compiling the kernel's Zstd module in.  This was fixed by gcc upstream in
9.3.0.  So it shouldn't happen.  Yet I am compiling //with// gcc-9.3.0 and I
am triggering the same ICE.

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=88879

Adding the ifdef patch back in fixes things and the IP30 kernel compiles
fine w/ Zstd support.  The reason for this is because in my other patch that
I sent in (R10000 split patch), I added a new CONFIG directive for
R12K/R14K/R16K CPUs where I can pass -mno-fix-r10000.  Crucially, on IP32, I
also pass -mr10k-cache-barrier=load-store for both R10K cases, because long
ago, I anticipated maybe one day getting R10k support working on IP32, and I
knew it was going to need the cache barrier GCC switch, similar to IP28.

That switch is set with this:
cflags-$(CONFIG_CPU_R12K_R14K_R16K)     += -mno-fix-r10000
-mr10k-cache-barrier=load-store

Without the ifdefs in place, that directive WILL get included in IP30,
because it's got the same directive in IP30's Platform file and it
effectively adds the cache-barrier switch to the gcc command line, which
just so happens to trigger the ICE on the Zstd code during Octane's kernel
build.

So I think the ifdefs are needed.  They don't really hurt anything, and they
follow similar logic as one finds in header files that encapsulate code
inside of a "guard" #ifdef.

That, or someone needs to take a look at MIPS' Platform-file parsing logic
and make it more robust.  It looks like arch/mips/Kbuild.platforms is the
key here:

# include the platform specific files
include $(patsubst %, $(srctree)/arch/mips/%/Platform, $(platforms))

That line seems to be the culprit.  I think w/ the Platform files sorted by
alphabet in the $(platforms) variable, 'sgi-ip30' comes before 'sgi-ip32',
so that allows IP32's directives to override IP30's.  If we assume Ralf ran
into a similar issue eons ago, then it would follow that maybe 'sgi-ip22'
got clobbered by something in either 'sgi-ip27' or 'sgi-ip32' as well?
Maybe just IP27, which is why IP27's Platform file got the ifdefs?

It also means I basically found another ICE in gcc, completely by accident.
 I wouldn't be surprised if no one has looked at the -mr10k-cache-barrier
code paths in gcc since the code was added years ago.  Not sure how I am
going to report that one to gcc upstream...

-- 
Joshua Kinard
Gentoo/MIPS
kumba@gentoo.org
rsa6144/5C63F4E3F5C6C943 2015-04-27
177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943

"The past tempts us, the present confuses us, the future frightens us.  And
our lives slip away, moment by moment, lost in that vast, terrible in-between."

--Emperor Turhan, Centauri Republic
