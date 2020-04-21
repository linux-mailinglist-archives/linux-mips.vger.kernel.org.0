Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEED61B211C
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2020 10:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728040AbgDUIJi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Apr 2020 04:09:38 -0400
Received: from foss.arm.com ([217.140.110.172]:59616 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726628AbgDUIJi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 21 Apr 2020 04:09:38 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B5261FB;
        Tue, 21 Apr 2020 01:09:37 -0700 (PDT)
Received: from [10.163.1.9] (unknown [10.163.1.9])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03BAA3F6CF;
        Tue, 21 Apr 2020 01:09:29 -0700 (PDT)
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
 <78fee884-78fc-6102-1a37-12106dc21336@arm.com>
 <20200421070703.GC14448@willie-the-truck>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <73e2d20a-4009-c2f3-03b7-fcd29d098491@arm.com>
Date:   Tue, 21 Apr 2020 13:39:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200421070703.GC14448@willie-the-truck>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 04/21/2020 12:37 PM, Will Deacon wrote:
> On Tue, Apr 21, 2020 at 04:57:26AM +0530, Anshuman Khandual wrote:
>>
>>
>> On 04/21/2020 02:33 AM, Will Deacon wrote:
>>> On Fri, Mar 20, 2020 at 10:24:17AM +0530, Anshuman Khandual wrote:
>>>> pmd_present() is expected to test positive after pmdp_mknotpresent() as the
>>>> PMD entry still points to a valid huge page in memory. pmdp_mknotpresent()
>>>> implies that given PMD entry is just invalidated from MMU perspective while
>>>> still holding on to pmd_page() referred valid huge page thus also clearing
>>>> pmd_present() test. This creates the following situation which is counter
>>>> intuitive.
>>>>
>>>> [pmd_present(pmd_mknotpresent(pmd)) = true]
>>>>
>>>> This renames pmd_mknotpresent() as pmd_mknotvalid() reflecting the helper's
>>>> functionality more accurately while changing the above mentioned situation
>>>> as follows. This does not create any functional change.
>>>>
>>>> [pmd_present(pmd_mknotvalid(pmd)) = true]
>>>>
>>>> This is not applicable for platforms that define own pmdp_invalidate() via
>>>> __HAVE_ARCH_PMDP_INVALIDATE. Suggestion for renaming came during a previous
>>>> discussion here.
>>>
>>> Bikeshed alert: maybe pmd_mkinvalid() would be better, given that this is
>>> a one-trick pony for pmdp_invalidate()?
>>
>> I had thought about making it pmd_mkinvalid() earlier. But as we were replacing
>> pmd_mknotpresent(), hence went with similar pattern pmd_mknotvalid() which was
>> originally suggested by Catalin. There is an existing pte_mknotpresent() in arc
>> platform as well. I dont have a very strong opinion either way, will be happy
>> to rename. But then still wondering if we really need to.
> 
> I just think that having pmdp_invalidate() call pmd_mkinvalid() makes a lot
> of sense and, since this is a pure renaming patch, then that's worth taking
> into consideration.

Sure np, will do.

> 
> If you go with pmd_mkinvalid(), then:
> 
> Acked-by: Will Deacon <will@kernel.org>
> 
> Will
> 
