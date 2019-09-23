Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63FEEBADC6
	for <lists+linux-mips@lfdr.de>; Mon, 23 Sep 2019 08:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393087AbfIWG1Y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Sep 2019 02:27:24 -0400
Received: from foss.arm.com ([217.140.110.172]:37482 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387519AbfIWG1X (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Sep 2019 02:27:23 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86A51337;
        Sun, 22 Sep 2019 23:27:22 -0700 (PDT)
Received: from [10.162.40.137] (p8cg001049571a15.blr.arm.com [10.162.40.137])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7248C3F59C;
        Sun, 22 Sep 2019 23:29:45 -0700 (PDT)
Subject: Re: [PATCH V3 2/2] mm/pgtable/debug: Add test validating architecture
 page table helpers
To:     kbuild test robot <lkp@intel.com>
Cc:     Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        James Hogan <jhogan@kernel.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
        Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-s390@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
        x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        Steven Price <Steven.Price@arm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Mark Brown <broonie@kernel.org>,
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Dan Williams <dan.j.williams@intel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Sri Krishna chowdary <schowdary@nvidia.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Hansen <dave.hansen@intel.com>,
        linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
        linux-kernel@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Paul Burton <paul.burton@mips.com>, kbuild-all@01.org,
        Vineet Gupta <vgupta@synopsys.com>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linuxppc-dev@lists.ozlabs.org,
        "David S. Miller" <davem@davemloft.net>
References: <20190921160049.GB13569@xsang-OptiPlex-9020>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <ab7c36ae-0942-d2e3-2a46-924c13a3d999@arm.com>
Date:   Mon, 23 Sep 2019 11:57:29 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190921160049.GB13569@xsang-OptiPlex-9020>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 09/21/2019 09:30 PM, kbuild test robot wrote:
> Hi Anshuman,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]
> [cannot apply to v5.3 next-20190919]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> 
> url:    https://github.com/0day-ci/linux/commits/Anshuman-Khandual/mm-debug-Add-tests-for-architecture-exported-page-table-helpers/20190920-143746
> config: ia64-allmodconfig (attached as .config)
> compiler: ia64-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=ia64 
> :::::: branch date: 3 hours ago
> :::::: commit date: 3 hours ago
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All error/warnings (new ones prefixed by >>):
> 
>    In file included from include/asm-generic/pgtable-nopud.h:8:0,
>                     from arch/ia64/include/asm/pgtable.h:591,
>                     from include/linux/mm.h:99,
>                     from include/linux/highmem.h:8,
>                     from mm/arch_pgtable_test.c:14:
>    mm/arch_pgtable_test.c: In function 'pud_clear_tests':
>>> include/asm-generic/pgtable-nop4d-hack.h:47:32: error: implicit declaration of function '__pgd'; did you mean '__p4d'? [-Werror=implicit-function-declaration]
>     #define __pud(x)    ((pud_t) { __pgd(x) })
>                                    ^
>>> mm/arch_pgtable_test.c:162:8: note: in expansion of macro '__pud'
>      pud = __pud(pud_val(pud) | RANDOM_ORVALUE);
>            ^~~~~
>>> include/asm-generic/pgtable-nop4d-hack.h:47:22: warning: missing braces around initializer [-Wmissing-braces]
>     #define __pud(x)    ((pud_t) { __pgd(x) })
>                          ^
>>> mm/arch_pgtable_test.c:162:8: note: in expansion of macro '__pud'
>      pud = __pud(pud_val(pud) | RANDOM_ORVALUE);
>            ^~~~~
>    cc1: some warnings being treated as errors
> 
> # https://github.com/0day-ci/linux/commit/49047f93b076974eefa5b019311bd3b734d61f8c
> git remote add linux-review https://github.com/0day-ci/linux
> git remote update linux-review
> git checkout 49047f93b076974eefa5b019311bd3b734d61f8c
> vim +47 include/asm-generic/pgtable-nop4d-hack.h
> 
> 30ec842660bd0d Kirill A. Shutemov 2017-03-09  45  
> 30ec842660bd0d Kirill A. Shutemov 2017-03-09  46  #define pud_val(x)				(pgd_val((x).pgd))
> 30ec842660bd0d Kirill A. Shutemov 2017-03-09 @47  #define __pud(x)				((pud_t) { __pgd(x) })

I had mentioned about this build failure in the cover letter. The same
problem also exists on arm32 platform.

- Anshuman
