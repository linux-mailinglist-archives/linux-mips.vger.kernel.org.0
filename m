Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E44014B005
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2020 08:04:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbgA1HEA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jan 2020 02:04:00 -0500
Received: from foss.arm.com ([217.140.110.172]:52830 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725797AbgA1HD7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Jan 2020 02:03:59 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2F6331B;
        Mon, 27 Jan 2020 23:03:58 -0800 (PST)
Received: from [10.163.1.151] (unknown [10.163.1.151])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A5A43F67D;
        Mon, 27 Jan 2020 23:07:21 -0800 (PST)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
To:     Qian Cai <cai@lca.pw>, Christophe Leroy <christophe.leroy@c-s.fr>
Cc:     Linux-MM <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Michal Hocko <mhocko@kernel.org>,
        Mark Rutland <Mark.Rutland@arm.com>,
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
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
References: <115c187b-73ce-30b2-0694-999db1f2183b@c-s.fr>
 <F90DA0AA-4D27-4346-8D8D-D9A7871E2C07@lca.pw>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <ba5a836a-b594-f846-1734-71dcd5d089e6@arm.com>
Date:   Tue, 28 Jan 2020 12:33:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <F90DA0AA-4D27-4346-8D8D-D9A7871E2C07@lca.pw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 01/28/2020 12:06 PM, Qian Cai wrote:
> 
> 
>> On Jan 28, 2020, at 1:17 AM, Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>>
>> It is 'default y' so there is no much risk that it is forgotten, at least all test suites run with 'allyes_defconfig' will trigger the test, so I think it is really a good feature.
> 
> This thing depends on DEBUG_VM which I don’t see it is selected by any defconfig. Am I missing anything?
> 

'allyesconfig' makes 'DEBUG_VM = y' which in turn will enable 'DEBUG_VM_PGTABLE = y'
on platforms that subscribe ARCH_HAS_DEBUG_VM_PGTABLE.
