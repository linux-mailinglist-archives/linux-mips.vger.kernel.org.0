Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B93F11D43E2
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 05:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727982AbgEODKj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 23:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726192AbgEODKi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 May 2020 23:10:38 -0400
X-Greylist: delayed 84969 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 14 May 2020 20:10:38 PDT
Received: from smtp.gentoo.org (smtp.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCDEDC061A0C
        for <linux-mips@vger.kernel.org>; Thu, 14 May 2020 20:10:38 -0700 (PDT)
Subject: Re: [PATCH v2] MIPS: Split R10000 to allow for R12K+ optimizations
To:     "Maciej W. Rozycki" <macro@wdc.com>
Cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
References: <19dc5a54-4f53-5f69-5ade-4c354f63a356@gentoo.org>
 <alpine.LFD.2.21.2005140251480.6492@redsun52.ssa.fujisawa.hgst.com>
 <78b68917-ec7e-7434-2a80-5fabbd5247a8@gentoo.org>
 <alpine.LFD.2.21.2005142233430.6492@redsun52.ssa.fujisawa.hgst.com>
From:   Joshua Kinard <kumba@gentoo.org>
Openpgp: preference=signencrypt
Message-ID: <18995238-ed16-411c-79ef-071897ee8a1b@gentoo.org>
Date:   Thu, 14 May 2020 23:10:20 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2005142233430.6492@redsun52.ssa.fujisawa.hgst.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/14/2020 17:42, Maciej W. Rozycki wrote:
> On Wed, 13 May 2020, Joshua Kinard wrote:
> 
>>>  I think it would be good not to reorder the macros (even though there's
>>> preexisting breakage in <asm/mach-ip30/war.h>) so that all the files have
>>> them in the same order.
>>
>> They don't appear to be in any logical order to begin with.  That, and I
>> wanted to keep conditional defines separate from the fixed defines, hence
>> moving the first in those files down to its own block.
> 
>  I suppose they have just come up in the order they were added.  Whatever 
> the order is however as long as it is consistent you can `diff' a pair of 
> files against each other to spot differences easily without the need to 
> rely on your perceptiveness.  And <asm/mach-sibyte/war.h> already has 
> conditionals in the middle.

I think then putting the conditional block below the section of fixed
defines achieves that, then.  diff's (and git diff's) algorithm will show
that as a clean addition and not require a lot of surrounding context lines.
 It'll also avoid the need to submit a separate patch to fix IP30's "war.h".

I took a look at asm/mach-sibyte/war.h, but it looks kind of....messy?  None
of the other "war.h" files use conditionals outside of IP27's, IP30's, and
SiByte's, so there's not a whole lot of precedent to base off of.


>> Is there some subtlety w/r to the existing ordering that I don't know about,
>> or would it make sense to have two patches, one which reorders the defines
>> to be alphabetical, then the second being the R10K split patch?
> 
>  I wouldn't strongly mind reordering alphabetically, but it would disturb 
> `git blame' and would add little value I'm afraid.  I'm fine if new ones 
> keep being added at the end, though OTOH it's not the best way to avoid 
> conflicts.

Agreed on not re-sorting.  Adding comments to delineate might help, but then
all of the war.h files would need to be touched, and I want to limit my
edits strictly to the platforms I have knowledge of and can actually test
on.  Nobody, including myself, noticed the bit in IP30's war.h getting
mainlined, so I don't think a lot of harm would be done by doing the same to
IP27.h.

-- 
Joshua Kinard
Gentoo/MIPS
kumba@gentoo.org
rsa6144/5C63F4E3F5C6C943 2015-04-27
177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943

"The past tempts us, the present confuses us, the future frightens us.  And
our lives slip away, moment by moment, lost in that vast, terrible in-between."

--Emperor Turhan, Centauri Republic
