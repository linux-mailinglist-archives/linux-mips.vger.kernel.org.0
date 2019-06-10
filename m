Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4A5D3AE66
	for <lists+linux-mips@lfdr.de>; Mon, 10 Jun 2019 07:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387430AbfFJFGZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 10 Jun 2019 01:06:25 -0400
Received: from foss.arm.com ([217.140.110.172]:36280 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387402AbfFJFGY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 10 Jun 2019 01:06:24 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A00A9337;
        Sun,  9 Jun 2019 22:06:23 -0700 (PDT)
Received: from [10.162.42.131] (p8cg001049571a15.blr.arm.com [10.162.42.131])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D10043F557;
        Sun,  9 Jun 2019 22:06:13 -0700 (PDT)
Subject: Re: [RFC V3] mm: Generalize and rename notify_page_fault() as
 kprobe_page_fault()
To:     Dave Hansen <dave.hansen@intel.com>,
        Matthew Wilcox <willy@infradead.org>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrey Konovalov <andreyknvl@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Andy Lutomirski <luto@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        linux-snps-arc@lists.infradead.org,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>
References: <1559903655-5609-1-git-send-email-anshuman.khandual@arm.com>
 <20190607201202.GA32656@bombadil.infradead.org>
 <f1b109a3-ef4c-359c-a124-e219e84a6266@arm.com>
 <33c6a1cd-5c07-e623-28e5-f31f6fe30394@intel.com>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <62aa0369-9542-17bc-034b-8445664c7c10@arm.com>
Date:   Mon, 10 Jun 2019 10:36:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <33c6a1cd-5c07-e623-28e5-f31f6fe30394@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 06/10/2019 10:27 AM, Dave Hansen wrote:
> On 6/9/19 9:34 PM, Anshuman Khandual wrote:
>>> Do you really think this is easier to read?
>>>
>>> Why not just move the x86 version to include/linux/kprobes.h, and replace
>>> the int with bool?
>> Will just return bool directly without an additional variable here as suggested
>> before. But for the conditional statement, I guess the proposed one here is more
>> compact than the x86 one.
> 
> FWIW, I don't think "compact" is generally a good goal for code.  Being
> readable is 100x more important than being compact and being un-compact
> is only a problem when it hurts readability.
> 
> For a function like the one in question, having the individual return
> conditions clearly commented is way more important than saving 10 lines
> of code.

Fair enough. Will keep the existing code flow from x86.
