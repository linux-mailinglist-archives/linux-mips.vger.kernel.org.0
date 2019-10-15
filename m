Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 875ACD7999
	for <lists+linux-mips@lfdr.de>; Tue, 15 Oct 2019 17:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732815AbfJOPU4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Oct 2019 11:20:56 -0400
Received: from foss.arm.com ([217.140.110.172]:40796 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726523AbfJOPU4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 15 Oct 2019 11:20:56 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68FF928;
        Tue, 15 Oct 2019 08:20:55 -0700 (PDT)
Received: from [10.162.42.142] (p8cg001049571a15.blr.arm.com [10.162.42.142])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 754823F718;
        Tue, 15 Oct 2019 08:20:44 -0700 (PDT)
Subject: Re: [PATCH V6 0/2] mm/debug: Add tests validating architecture page
 table helpers
To:     Qian Cai <cai@lca.pw>, linux-mm@kvack.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Michal Hocko <mhocko@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Steven Price <Steven.Price@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Kees Cook <keescook@chromium.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Matthew Wilcox <willy@infradead.org>,
        Sri Krishna chowdary <schowdary@nvidia.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Vineet Gupta <vgupta@synopsys.com>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
References: <1571131302-32290-1-git-send-email-anshuman.khandual@arm.com>
 <1571150502.5937.39.camel@lca.pw>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <c052784a-a5d7-878e-cd97-01daa90c0ed8@arm.com>
Date:   Tue, 15 Oct 2019 20:51:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1571150502.5937.39.camel@lca.pw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 10/15/2019 08:11 PM, Qian Cai wrote:
> The x86 will crash with linux-next during boot due to this series (v5) with the
> config below plus CONFIG_DEBUG_VM_PGTABLE=y. I am not sure if v6 would address
> it.
> 
> https://raw.githubusercontent.com/cailca/linux-mm/master/x86.config
> 
> [   33.862600][    T1] page:ffffea0009000000 is uninitialized and poisoned
> [   33.862608][    T1] raw: ffffffffffffffff ffffffffffffffff ffffffffffffffff
> ffffff871140][    T1]  ? _raw_spin_unlock_irq+0x27/0x40
> [   33.871140][    T1]  ? rest_init+0x307/0x307
> [   33.871140][    T1]  kernel_init+0x11/0x139
> [   33.871140][    T1]  ? rest_init+0x307/0x307
> [   33.871140][    T1]  ret_from_fork+0x27/0x50
> [   33.871140][    T1] Modules linked in:
> [   33.871140][    T1] ---[ end trace e99d392b0f7befbd ]---
> [   33.871140][    T1] RIP: 0010:alloc_gigantic_page_order+0x3fe/0x490

Hmm, with defconfig (DEBUG_VM=y and DEBUG_VM_PGTABLE=y) it does not crash but
with the config above, it does. Just wondering if it is possible that these
pages might not been initialized yet because DEFERRED_STRUCT_PAGE_INIT=y ?

[   13.898549][    T1] page:ffffea0005000000 is uninitialized and poisoned
[   13.898549][    T1] raw: ffffffffffffffff ffffffffffffffff ffffffffffffffff ffffffffffffffff
[   13.898549][    T1] raw: ffffffffffffffff ffffffffffffffff ffffffffffffffff ffffffffffffffff
[   13.898549][    T1] page dumped because: VM_BUG_ON_PAGE(PagePoisoned(p))
[   13.898549][    T1] ------------[ cut here ]------------
[   13.898549][    T1] kernel BUG at ./include/linux/mm.h:1107!
[   13.898549][    T1] invalid opcode: 0000 [#1] SMP DEBUG_PAGEALLOC KASAN PTI
[   13.898549][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.4.0-rc3-next-20191015+ #
