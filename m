Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25356F0CF1
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2019 04:22:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731087AbfKFDWT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Nov 2019 22:22:19 -0500
Received: from foss.arm.com ([217.140.110.172]:33116 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730839AbfKFDWT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 5 Nov 2019 22:22:19 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D732A30E;
        Tue,  5 Nov 2019 19:22:18 -0800 (PST)
Received: from [192.168.225.149] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A8D63F719;
        Tue,  5 Nov 2019 19:21:57 -0800 (PST)
Subject: Re: [PATCH V8] mm/debug: Add tests validating architecture page table
 helpers
To:     linux-mm@kvack.org
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
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
References: <1572240562-23630-1-git-send-email-anshuman.khandual@arm.com>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <3229d68d-0b9d-0719-3370-c6e1df0ea032@arm.com>
Date:   Wed, 6 Nov 2019 08:52:30 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1572240562-23630-1-git-send-email-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 10/28/2019 10:59 AM, Anshuman Khandual wrote:
> +    -----------------------
> +    |         arch |status|
> +    -----------------------
> +    |       alpha: | TODO |
> +    |         arc: | TODO |
> +    |         arm: | TODO |
> +    |       arm64: |  ok  |
> +    |         c6x: | TODO |
> +    |        csky: | TODO |
> +    |       h8300: | TODO |
> +    |     hexagon: | TODO |
> +    |        ia64: | TODO |
> +    |        m68k: | TODO |
> +    |  microblaze: | TODO |
> +    |        mips: | TODO |
> +    |       nds32: | TODO |
> +    |       nios2: | TODO |
> +    |    openrisc: | TODO |
> +    |      parisc: | TODO |
> +    |     powerpc: | TODO |
> +    |       ppc32: |  ok  |
> +    |       riscv: | TODO |
> +    |        s390: | TODO |
> +    |          sh: | TODO |
> +    |       sparc: | TODO |
> +    |          um: | TODO |
> +    |   unicore32: | TODO |
> +    |         x86: |  ok  |
> +    |      xtensa: | TODO |
> +    -----------------------

While here, are there some volunteers to test this on any of the
'yet to be tested and supported' platforms ?

- Anshuman
