Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 596081D6BC9
	for <lists+linux-mips@lfdr.de>; Sun, 17 May 2020 20:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbgEQSmo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 17 May 2020 14:42:44 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:53476 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726269AbgEQSml (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 17 May 2020 14:42:41 -0400
Subject: Re: [PATCH v2] MIPS: Split R10000 to allow for R12K+ optimizations
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org
References: <19dc5a54-4f53-5f69-5ade-4c354f63a356@gentoo.org>
 <20200517105955.GB5508@alpha.franken.de>
From:   Joshua Kinard <kumba@gentoo.org>
Openpgp: preference=signencrypt
Message-ID: <866edd5a-dfb2-8a90-06ef-831bd7efc255@gentoo.org>
Date:   Sun, 17 May 2020 14:42:35 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200517105955.GB5508@alpha.franken.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/17/2020 06:59, Thomas Bogendoerfer wrote:
> On Wed, May 13, 2020 at 08:55:27PM -0400, Joshua Kinard wrote:
>> From: Joshua Kinard <kumba@gentoo.org>
>>
>> The attached patch adds more-specific support for R12000 and higher
>> CPUs by splitting the R10000 logic at several places.  This avoids
>> the workarounds enabled by R10000_LLSC_WAR and passes -mno-fix-r10000
>> to gcc during the kernel compile.
> 
> I've seen this patch multiple times already and I always think there
> is something wrong with it. So we want to allow a way to disable
> bug workarounds for old R10k (rev < 3.0), why not call it that way ?
> Something like CONFIG_R10000_WORKAROUNDS, which defaults to y.
> The only thing we would be missing is the -march=r12000 not sure,
> if this makes much difference. Do I miss something else ?

I've submitted it a few times before, but I think most of the times, it
simply got missed due to Ralf just being busy.  The one time he did look at
it, I don't think he saw too much of a benefit as the only SGI system that
could run R12K+ at the time was IP27, which had its own issues.  I figured
I'd give it another go-around now that IP30 is mainlined, as R12K is more
common on that platform.  Adding framework to further optimize based on CPU
type seems like a good thing, even if those aren't used yet?

Internally to gcc, there is no functional difference, yet, between 'r10000'
and 'r12000' or later.  I *think* on -march=r12000, -mno-fix-r10000 might be
implied, but I would have to go look at gcc's source again.  Specific to the
R12000, there is a bit in the CONFIG register (I think) called Delay
Speculative Dirty (DSD) that can be used on the IP32 to mitigate the
speculative execution issues on that platform, just no one's coded for it yet.

My hope was also that at some point, documentation for the R14000 and R16000
might find its way to the internet and maybe there were additional
optimizations that could be added to gcc for those, to make -march=r14000 or
-march=r16000 viable.  Thus far, that hasn't happened.  Both of those CPUs
really seem to just be clock speed increases and die shrinkages.

Though I do know that the R14000 uses DDR for the L2 cache, but I don't
think that is something that can be taken advantage of by the compiler or
kernel in terms of instruction scheduling.  R16000 also seems to have an
additional undocumented bit in the STATUS register, based on IRIX headers,
but no other documentation exists on that.  Really, as far as R14000/R16000
go, they're black boxes, as neither SGI, HP, nor NEC has ever released
documentation or errata for those two CPUs.

-- 
Joshua Kinard
Gentoo/MIPS
kumba@gentoo.org
rsa6144/5C63F4E3F5C6C943 2015-04-27
177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943

"The past tempts us, the present confuses us, the future frightens us.  And
our lives slip away, moment by moment, lost in that vast, terrible in-between."

--Emperor Turhan, Centauri Republic
