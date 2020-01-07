Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 239A6131FEF
	for <lists+linux-mips@lfdr.de>; Tue,  7 Jan 2020 07:45:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727176AbgAGGpE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Jan 2020 01:45:04 -0500
Received: from foss.arm.com ([217.140.110.172]:53050 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725781AbgAGGpE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 7 Jan 2020 01:45:04 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3E7731B;
        Mon,  6 Jan 2020 22:45:02 -0800 (PST)
Received: from [10.162.43.133] (p8cg001049571a15.blr.arm.com [10.162.43.133])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A45EE3F703;
        Mon,  6 Jan 2020 22:48:16 -0800 (PST)
Subject: Re: [mm/debug] 87c4696d57: kernel_BUG_at_include/linux/mm.h
To:     kernel test robot <rong.a.chen@intel.com>
Cc:     linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
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
        x86@kernel.org, linux-kernel@vger.kernel.org, lkp@lists.01.org
References: <20191227142255.GD2760@shao2-debian>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <490e77d6-a3ef-dd70-4c29-b90234f8a13d@arm.com>
Date:   Tue, 7 Jan 2020 12:16:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191227142255.GD2760@shao2-debian>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/27/2019 07:52 PM, kernel test robot wrote:
> [    9.781974] kernel BUG at include/linux/mm.h:592!
> [    9.782810] invalid opcode: 0000 [#1] PTI
> [    9.783443] CPU: 0 PID: 1 Comm: swapper Not tainted 5.5.0-rc3-00001-g87c4696d57b5e #1
> [    9.784528] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.10.2-1 04/01/2014
> [    9.785756] EIP: __free_pages+0x14/0x40
> [    9.786442] Code: 0c 9c 5e fa 89 d8 e8 5b f3 ff ff 56 9d 5b 5e 5d c3 8d 74 26 00 90 8b 48 1c 55 89 e5 85 c9 75 16 ba b4 b6 84 d6 e8 ac 49 fe ff <0f> 0b 8d b4 26 00 00 00 00 8d 76 00 ff 48 1c 75 10 85 d2 75 07 e8
> [    9.789697] EAX: d68761f7 EBX: ea52f000 ECX: ea4f8520 EDX: d684b6b4
> [    9.790850] ESI: 00000000 EDI: ef45e000 EBP: ea501f08 ESP: ea501f08
> [    9.791879] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010286
> [    9.792783] CR0: 80050033 CR2: ffffffff CR3: 16d00000 CR4: 000406b0
> [    9.792783] Call Trace:
> [    9.792783]  free_pages+0x3c/0x50
> [    9.792783]  pgd_free+0x5a/0x170
> [    9.792783]  __mmdrop+0x42/0xe0
> [    9.792783]  debug_vm_pgtable+0x54f/0x567
> [    9.792783]  kernel_init_freeable+0x90/0x1e3
> [    9.792783]  ? rest_init+0xf0/0xf0
> [    9.792783]  kernel_init+0x8/0xf0
> [    9.792783]  ret_from_fork+0x19/0x24
> [    9.792783] Modules linked in:
> [    9.792803] ---[ end trace 91b7335adcf0b656 ]---
> 
> 
> To reproduce:
> 
>         # build kernel
> 	cd linux
> 	cp config-5.5.0-rc3-00001-g87c4696d57b5e .config
> 	make HOSTCC=gcc-7 CC=gcc-7 ARCH=i386 olddefconfig prepare modules_prepare bzImage
> 
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in this email

Hello,

As the failure might be happening during boot when the test executes,
do we really need to run these LKP based QEMU environment in order to
reproduce the problem ? Could not this be recreated on a standalone
system.

- Anshuman
