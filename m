Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8AC05AE52
	for <lists+linux-mips@lfdr.de>; Sun, 30 Jun 2019 06:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725978AbfF3Ekt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 30 Jun 2019 00:40:49 -0400
Received: from foss.arm.com ([217.140.110.172]:44468 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725771AbfF3Eks (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 30 Jun 2019 00:40:48 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A8E728;
        Sat, 29 Jun 2019 21:40:47 -0700 (PDT)
Received: from [192.168.0.129] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5ECD73F706;
        Sat, 29 Jun 2019 21:40:37 -0700 (PDT)
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH] mm: Generalize and rename notify_page_fault() as
 kprobe_page_fault()
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org,
        linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Will Deacon <will.deacon@arm.com>,
        Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-s390@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        James Hogan <jhogan@kernel.org>,
        linux-snps-arc@lists.infradead.org,
        Fenghua Yu <fenghua.yu@intel.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Tony Luck <tony.luck@intel.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linuxppc-dev@lists.ozlabs.org,
        "David S. Miller" <davem@davemloft.net>
References: <1560420444-25737-1-git-send-email-anshuman.khandual@arm.com>
 <20190629145009.GA28613@roeck-us.net>
Message-ID: <78863cd0-8cb5-c4fd-ed06-b1136bdbb6ef@arm.com>
Date:   Sun, 30 Jun 2019 10:11:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190629145009.GA28613@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Guenter,

On 06/29/2019 08:20 PM, Guenter Roeck wrote:
> Hi,
> 
> On Thu, Jun 13, 2019 at 03:37:24PM +0530, Anshuman Khandual wrote:
>> Architectures which support kprobes have very similar boilerplate around
>> calling kprobe_fault_handler(). Use a helper function in kprobes.h to unify
>> them, based on the x86 code.
>>
>> This changes the behaviour for other architectures when preemption is
>> enabled. Previously, they would have disabled preemption while calling the
>> kprobe handler. However, preemption would be disabled if this fault was
>> due to a kprobe, so we know the fault was not due to a kprobe handler and
>> can simply return failure.
>>
>> This behaviour was introduced in the commit a980c0ef9f6d ("x86/kprobes:
>> Refactor kprobes_fault() like kprobe_exceptions_notify()")
>>
> 
> With this patch applied, parisc:allmodconfig images no longer build.
> 
> In file included from arch/parisc/mm/fixmap.c:8:
> include/linux/kprobes.h: In function 'kprobe_page_fault':
> include/linux/kprobes.h:477:9: error:
> 	implicit declaration of function 'kprobe_fault_handler'; did you mean 'kprobe_page_fault'?

Yikes.. Arch parisc does not even define (unlike mips which did but never exported)
now required function kprobe_fault_handler() when CONFIG_KPROBES is enabled.

I believe rather than defining one stub version only for parsic it would be better
to have an weak symbol generic stub definition for kprobe_fault_handler() in file
include/linux/kprobes.h when CONFIG_KPROBES is enabled along side the other stub
definition when !CONFIG_KPROBES. But arch which wants to use kprobe_page_fault()
cannot use stub kprobe_fault_handler() definition and will have to provide one.
I will probably add a comment regarding this.

> 
> Reverting the patch fixes the problem.
> 
> Guenter
> 

Thanks for reporting the problem.
