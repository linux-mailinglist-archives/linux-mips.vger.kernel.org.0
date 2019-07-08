Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0A6661982
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jul 2019 05:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727592AbfGHDc6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Jul 2019 23:32:58 -0400
Received: from foss.arm.com ([217.140.110.172]:36452 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727451AbfGHDc6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 7 Jul 2019 23:32:58 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B57842B;
        Sun,  7 Jul 2019 20:32:56 -0700 (PDT)
Received: from [10.162.43.130] (p8cg001049571a15.blr.arm.com [10.162.43.130])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A45B13F738;
        Sun,  7 Jul 2019 20:32:43 -0700 (PDT)
Subject: Re: [PATCH] mm/kprobes: Add generic kprobe_fault_handler() fallback
 definition
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
        Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Enrico Weigelt <info@metux.net>,
        Richard Fontana <rfontana@redhat.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>, x86@kernel.org,
        linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org
References: <1562304629-29376-1-git-send-email-anshuman.khandual@arm.com>
 <20190705193028.f9e08fe9cf1ee86bc5c0bb82@kernel.org>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <3aee1f30-241c-d1c2-2ff5-ff521db47755@arm.com>
Date:   Mon, 8 Jul 2019 09:03:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190705193028.f9e08fe9cf1ee86bc5c0bb82@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 07/05/2019 04:00 PM, Masami Hiramatsu wrote:
> Hi Anshuman,


Hello Masami,

> 
> On Fri,  5 Jul 2019 11:00:29 +0530
> Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> 
>> Architectures like parisc enable CONFIG_KROBES without having a definition
>> for kprobe_fault_handler() which results in a build failure.
> 
> Hmm, as far as I can see, kprobe_fault_handler() is closed inside each arch
> specific code. The reason why include/linux/kprobes.h defines
> dummy inline function is only for !CONFIG_KPROBES case.

IIRC Andrew mentioned [1] that we should remove this stub from the generic kprobes
header because this is very much architecture specific. As we see in this proposed
patch, except x86 there is no other current user which actually calls this from
some where when CONFIG_KPROBES is not enabled.

[1] https://www.spinics.net/lists/linux-mm/msg182649.html
> 
>> Arch needs to
>> provide kprobe_fault_handler() as it is platform specific and cannot have
>> a generic working alternative. But in the event when platform lacks such a
>> definition there needs to be a fallback.
> 
> Wait, indeed that each arch need to implement it, but that is for calling
> kprobe->fault_handler() as user expected.
> Hmm, why not fixing those architecture implementations?

After the recent change which introduced a generic kprobe_page_fault() every
architecture enabling CONFIG_KPROBES must have a kprobe_fault_handler() which
was not the case earlier. Architectures like parisc which does enable KPROBES but
never used (kprobe_page_fault or kprobe->fault_handler) kprobe_fault_handler() now
needs one as well. I am not sure and will probably require inputs from arch parsic
folks whether it at all needs one. We dont have a stub or fallback definition for
kprobe_fault_handler() when CONFIG_KPROBES is enabled just to prevent a build
failure in such cases.

In such a situation it might be better defining a stub symbol fallback than to try
to implement one definition which the architecture previously never needed or used.
AFAICS there is no generic MM callers for kprobe_fault_handler() as well which would
have made it mandatory for parisc to define a real one.

> 
>> This adds a stub kprobe_fault_handler() definition which not only prevents
>> a build failure but also makes sure that kprobe_page_fault() if called will
>> always return negative in absence of a sane platform specific alternative.
> 
> I don't like introducing this complicated macro only for avoiding (not fixing)
> build error. To fix that, kprobes on parisc should implement kprobe_fault_handler
> correctly (and call kprobe->fault_handler).

As I mentioned before parsic might not need a real one. But you are right this
complicated (if perceived as such) change can be just avoided at least for the
build failure problem by just defining a stub definition kprobe_fault_handler()
for arch parsic when CONFIG_KPROBES is enabled. But this patch does some more
and solves the kprobe_fault_handler() symbol dependency in a more generic way and
forces kprobe_page_fault() to fail in absence a real arch kprobe_fault_handler().
Is not it worth solving in this way ?

> 
> BTW, even if you need such generic stub, please use a weak function instead
> of macros for every arch headers.

There is a bit problem with that. The existing definitions are with different
signatures and an weak function will need them to be exact same for override
requiring more code changes. Hence choose to go with a macro in each header.

arch/arc/include/asm/kprobes.h:int kprobe_fault_handler(struct pt_regs *regs, unsigned long cause);
arch/arm/include/asm/kprobes.h:int kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr);
arch/arm64/include/asm/kprobes.h:int kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr);
arch/ia64/include/asm/kprobes.h:extern int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
arch/powerpc/include/asm/kprobes.h:extern int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
arch/s390/include/asm/kprobes.h:int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
arch/sh/include/asm/kprobes.h:extern int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
arch/sparc/include/asm/kprobes.h:int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
arch/x86/include/asm/kprobes.h:extern int kprobe_fault_handler(struct pt_regs *regs, int trapnr);

> 
>> While here wrap kprobe_page_fault() in CONFIG_KPROBES. This enables stud
>> definitions for generic kporbe_fault_handler() and kprobes_built_in() can
>> just be dropped. Only on x86 it needs to be added back locally as it gets
>> used in a !CONFIG_KPROBES function do_general_protection().
> 
> If you want to remove kprobes_built_in(), you should replace it with
> IS_ENABLED(CONFIG_KPROBES), instead of this...

Apart from kprobes_built_in() the intent was to remove !CONFIG_KPROBES
stub for kprobe_fault_handler() as well which required making generic
kprobe_page_fault() to be empty in such case.
