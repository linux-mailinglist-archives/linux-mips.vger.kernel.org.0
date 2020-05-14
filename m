Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E92A71D256F
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 05:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgENDea (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 23:34:30 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:36238 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725925AbgENDe3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 May 2020 23:34:29 -0400
Subject: Re: [PATCH v2] MIPS: Split R10000 to allow for R12K+ optimizations
To:     "Maciej W. Rozycki" <macro@wdc.com>
Cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
References: <19dc5a54-4f53-5f69-5ade-4c354f63a356@gentoo.org>
 <alpine.LFD.2.21.2005140251480.6492@redsun52.ssa.fujisawa.hgst.com>
From:   Joshua Kinard <kumba@gentoo.org>
Openpgp: preference=signencrypt
Message-ID: <78b68917-ec7e-7434-2a80-5fabbd5247a8@gentoo.org>
Date:   Wed, 13 May 2020 23:34:24 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2005140251480.6492@redsun52.ssa.fujisawa.hgst.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/13/2020 21:52, Maciej W. Rozycki wrote:
> On Wed, 13 May 2020, Joshua Kinard wrote:
> 
>> diff --git a/arch/mips/include/asm/mach-ip27/war.h b/arch/mips/include/asm/mach-ip27/war.h
>> index ef3efce0094a..845b8951d74f 100644
>> --- a/arch/mips/include/asm/mach-ip27/war.h
>> +++ b/arch/mips/include/asm/mach-ip27/war.h
>> @@ -17,7 +17,12 @@
>>  #define MIPS_CACHE_SYNC_WAR		0
>>  #define TX49XX_ICACHE_INDEX_INV_WAR	0
>>  #define ICACHE_REFILLS_WORKAROUND_WAR	0
>> -#define R10000_LLSC_WAR			1
>>  #define MIPS34K_MISSED_ITLB_WAR		0
>>  
>> +#ifdef CONFIG_CPU_R10000
>> +#define R10000_LLSC_WAR			1
>> +#else
>> +#define R10000_LLSC_WAR			0
>> +#endif
>> +
> 
>  I think it would be good not to reorder the macros (even though there's
> preexisting breakage in <asm/mach-ip30/war.h>) so that all the files have
> them in the same order.

They don't appear to be in any logical order to begin with.  That, and I
wanted to keep conditional defines separate from the fixed defines, hence
moving the first in those files down to its own block.

And the one in IP30's war.h is an artifact of my patchset that Thomas
must've based off of for mainlining IP30 support.  That section actually
should be in this patchset alongside the hunk for IP27's war.h.

Is there some subtlety w/r to the existing ordering that I don't know about,
or would it make sense to have two patches, one which reorders the defines
to be alphabetical, then the second being the R10K split patch?

-- 
Joshua Kinard
Gentoo/MIPS
kumba@gentoo.org
rsa6144/5C63F4E3F5C6C943 2015-04-27
177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943

"The past tempts us, the present confuses us, the future frightens us.  And
our lives slip away, moment by moment, lost in that vast, terrible in-between."

--Emperor Turhan, Centauri Republic
