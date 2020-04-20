Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF9A51B1A24
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2020 01:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727950AbgDTX1q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 19:27:46 -0400
Received: from foss.arm.com ([217.140.110.172]:55870 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726123AbgDTX1p (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 19:27:45 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DF641FB;
        Mon, 20 Apr 2020 16:27:45 -0700 (PDT)
Received: from [192.168.0.129] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6918F3F73D;
        Mon, 20 Apr 2020 16:27:39 -0700 (PDT)
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 2/2] mm/thp: Rename pmd_mknotpresent() as pmd_mknotvalid()
To:     Will Deacon <will@kernel.org>
Cc:     linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        nouveau@lists.freedesktop.org, linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
References: <1584680057-13753-1-git-send-email-anshuman.khandual@arm.com>
 <1584680057-13753-3-git-send-email-anshuman.khandual@arm.com>
 <20200420210354.GD29998@willie-the-truck>
Message-ID: <78fee884-78fc-6102-1a37-12106dc21336@arm.com>
Date:   Tue, 21 Apr 2020 04:57:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200420210354.GD29998@willie-the-truck>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 04/21/2020 02:33 AM, Will Deacon wrote:
> On Fri, Mar 20, 2020 at 10:24:17AM +0530, Anshuman Khandual wrote:
>> pmd_present() is expected to test positive after pmdp_mknotpresent() as the
>> PMD entry still points to a valid huge page in memory. pmdp_mknotpresent()
>> implies that given PMD entry is just invalidated from MMU perspective while
>> still holding on to pmd_page() referred valid huge page thus also clearing
>> pmd_present() test. This creates the following situation which is counter
>> intuitive.
>>
>> [pmd_present(pmd_mknotpresent(pmd)) = true]
>>
>> This renames pmd_mknotpresent() as pmd_mknotvalid() reflecting the helper's
>> functionality more accurately while changing the above mentioned situation
>> as follows. This does not create any functional change.
>>
>> [pmd_present(pmd_mknotvalid(pmd)) = true]
>>
>> This is not applicable for platforms that define own pmdp_invalidate() via
>> __HAVE_ARCH_PMDP_INVALIDATE. Suggestion for renaming came during a previous
>> discussion here.
> 
> Bikeshed alert: maybe pmd_mkinvalid() would be better, given that this is
> a one-trick pony for pmdp_invalidate()?

I had thought about making it pmd_mkinvalid() earlier. But as we were replacing
pmd_mknotpresent(), hence went with similar pattern pmd_mknotvalid() which was
originally suggested by Catalin. There is an existing pte_mknotpresent() in arc
platform as well. I dont have a very strong opinion either way, will be happy
to rename. But then still wondering if we really need to.

> 
> Will
> 
