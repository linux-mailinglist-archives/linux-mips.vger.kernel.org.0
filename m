Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4224614D2F9
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jan 2020 23:20:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbgA2WUs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Jan 2020 17:20:48 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:17070 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726558AbgA2WUr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Jan 2020 17:20:47 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00TMIsaU008178
        for <linux-mips@vger.kernel.org>; Wed, 29 Jan 2020 17:20:47 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2xtpmth4ek-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-mips@vger.kernel.org>; Wed, 29 Jan 2020 17:20:46 -0500
Received: from localhost
        by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-mips@vger.kernel.org> from <gerald.schaefer@de.ibm.com>;
        Wed, 29 Jan 2020 22:20:43 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
        by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 29 Jan 2020 22:20:32 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 00TMKVnc38863252
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 29 Jan 2020 22:20:31 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 43C3111C050;
        Wed, 29 Jan 2020 22:20:31 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 15A9E11C052;
        Wed, 29 Jan 2020 22:20:30 +0000 (GMT)
Received: from thinkpad (unknown [9.152.96.253])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed, 29 Jan 2020 22:20:30 +0000 (GMT)
Date:   Wed, 29 Jan 2020 23:20:28 +0100
From:   Gerald Schaefer <gerald.schaefer@de.ibm.com>
To:     Anshuman Khandual <anshuman.khandual@arm.com>
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
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
In-Reply-To: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
References: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20012922-0020-0000-0000-000003A53066
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012922-0021-0000-0000-000021FCE2F5
Message-Id: <20200129232028.5a27e656@thinkpad>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-29_07:2020-01-28,2020-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 clxscore=1011 priorityscore=1501 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001290171
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 28 Jan 2020 06:57:53 +0530
Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> This adds tests which will validate architecture page table helpers and
> other accessors in their compliance with expected generic MM semantics.
> This will help various architectures in validating changes to existing
> page table helpers or addition of new ones.
> 
> This test covers basic page table entry transformations including but not
> limited to old, young, dirty, clean, write, write protect etc at various
> level along with populating intermediate entries with next page table page
> and validating them.
> 
> Test page table pages are allocated from system memory with required size
> and alignments. The mapped pfns at page table levels are derived from a
> real pfn representing a valid kernel text symbol. This test gets called
> right after page_alloc_init_late().
> 
> This gets build and run when CONFIG_DEBUG_VM_PGTABLE is selected along with
> CONFIG_VM_DEBUG. Architectures willing to subscribe this test also need to
> select CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE which for now is limited to x86 and
> arm64. Going forward, other architectures too can enable this after fixing
> build or runtime problems (if any) with their page table helpers.
> 
> Folks interested in making sure that a given platform's page table helpers
> conform to expected generic MM semantics should enable the above config
> which will just trigger this test during boot. Any non conformity here will
> be reported as an warning which would need to be fixed. This test will help
> catch any changes to the agreed upon semantics expected from generic MM and
> enable platforms to accommodate it thereafter.
> 

[...]

> 
> Tested-by: Christophe Leroy <christophe.leroy@c-s.fr>		#PPC32

Tested-by: Gerald Schaefer <gerald.schaefer@de.ibm.com> # s390

Thanks again for this effort, and for keeping up the spirit against
all odds and even after 12 iterations :-)

> 
> diff --git a/Documentation/features/debug/debug-vm-pgtable/arch-support.txt b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
> new file mode 100644
> index 000000000000..f3f8111edbe3
> --- /dev/null
> +++ b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
> @@ -0,0 +1,35 @@
> +#
> +# Feature name:          debug-vm-pgtable
> +#         Kconfig:       ARCH_HAS_DEBUG_VM_PGTABLE
> +#         description:   arch supports pgtable tests for semantics compliance
> +#
> +    -----------------------
> +    |         arch |status|
> +    -----------------------
> +    |       alpha: | TODO |
> +    |         arc: |  ok  |
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
> +    |  powerpc/32: |  ok  |
> +    |  powerpc/64: | TODO |
> +    |       riscv: | TODO |
> +    |        s390: | TODO |

s390 is ok now, with my patches included in v5.5-rc1. So you can now add

--- a/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
+++ b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
@@ -25,7 +25,7 @@
     |  powerpc/32: |  ok  |
     |  powerpc/64: | TODO |
     |       riscv: | TODO |
-    |        s390: | TODO |
+    |        s390: |  ok  |
     |          sh: | TODO |
     |       sparc: | TODO |
     |          um: | TODO |
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -59,6 +59,7 @@ config KASAN_SHADOW_OFFSET
 config S390
 	def_bool y
 	select ARCH_BINFMT_ELF_STATE
+	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_FORTIFY_SOURCE

