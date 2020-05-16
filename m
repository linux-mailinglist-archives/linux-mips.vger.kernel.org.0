Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D08781D5EFF
	for <lists+linux-mips@lfdr.de>; Sat, 16 May 2020 08:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725803AbgEPGQ6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 16 May 2020 02:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725275AbgEPGQ5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sat, 16 May 2020 02:16:57 -0400
Received: from smtp.gentoo.org (smtp.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2A2EC061A0C
        for <linux-mips@vger.kernel.org>; Fri, 15 May 2020 23:16:57 -0700 (PDT)
From:   Joshua Kinard <kumba@gentoo.org>
Subject: Re: [PATCH v2] MIPS: Split R10000 to allow for R12K+ optimizations
To:     "Maciej W. Rozycki" <macro@wdc.com>
Cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
References: <19dc5a54-4f53-5f69-5ade-4c354f63a356@gentoo.org>
 <alpine.LFD.2.21.2005140251480.6492@redsun52.ssa.fujisawa.hgst.com>
 <78b68917-ec7e-7434-2a80-5fabbd5247a8@gentoo.org>
 <alpine.LFD.2.21.2005142233430.6492@redsun52.ssa.fujisawa.hgst.com>
 <18995238-ed16-411c-79ef-071897ee8a1b@gentoo.org>
 <alpine.LFD.2.21.2005151216570.6492@redsun52.ssa.fujisawa.hgst.com>
Message-ID: <6db89a43-372b-ed92-af5d-9a95543554c2@gentoo.org>
Date:   Sat, 16 May 2020 02:16:52 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2005151216570.6492@redsun52.ssa.fujisawa.hgst.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/15/2020 07:20, Maciej W. Rozycki wrote:
> On Thu, 14 May 2020, Joshua Kinard wrote:
> 
>>>  I suppose they have just come up in the order they were added.  Whatever 
>>> the order is however as long as it is consistent you can `diff' a pair of 
>>> files against each other to spot differences easily without the need to 
>>> rely on your perceptiveness.  And <asm/mach-sibyte/war.h> already has 
>>> conditionals in the middle.
>>
>> I think then putting the conditional block below the section of fixed
>> defines achieves that, then.  diff's (and git diff's) algorithm will show
>> that as a clean addition and not require a lot of surrounding context lines.
>>  It'll also avoid the need to submit a separate patch to fix IP30's "war.h".
>>
>> I took a look at asm/mach-sibyte/war.h, but it looks kind of....messy?  None
>> of the other "war.h" files use conditionals outside of IP27's, IP30's, and
>> SiByte's, so there's not a whole lot of precedent to base off of.
> 
>  Well, there's <asm/mach-rc32434/war.h> too, to be exact.
> 
>  I have no further arguments nor other input, so I'll be leaving it for 
> Thomas to decide.
> 
>   Maciej

Focusing on just one hunk for asm/mach-ip27/war.h, how does this look if I
keep the conditional inside the block?

diff --git a/arch/mips/include/asm/mach-ip27/war.h b/arch/mips/include/asm/mach-ip27/war.h
index ef3efce0094a..f041e7357620 100644
--- a/arch/mips/include/asm/mach-ip27/war.h
+++ b/arch/mips/include/asm/mach-ip27/war.h
@@ -17,7 +17,11 @@
 #define MIPS_CACHE_SYNC_WAR		0
 #define TX49XX_ICACHE_INDEX_INV_WAR	0
 #define ICACHE_REFILLS_WORKAROUND_WAR	0
+#ifdef CONFIG_CPU_R10000
 #define R10000_LLSC_WAR			1
+#else
+#define R10000_LLSC_WAR			0
+#endif
 #define MIPS34K_MISSED_ITLB_WAR		0
 
 #endif /* __ASM_MIPS_MACH_IP27_WAR_H */

If this works for you, I'll spin a v3 later and also send along a
separate patch to fix the IP30 case in war.h.

-- 
Joshua Kinard
Gentoo/MIPS
kumba@gentoo.org
rsa6144/5C63F4E3F5C6C943 2015-04-27
177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943

"The past tempts us, the present confuses us, the future frightens us.  And
our lives slip away, moment by moment, lost in that vast, terrible in-between."

--Emperor Turhan, Centauri Republic
