Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E56EAA9AF
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 19:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731772AbfIERGr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Sep 2019 13:06:47 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:15242 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730485AbfIERGq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Sep 2019 13:06:46 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x85H6hdD062812
        for <linux-mips@vger.kernel.org>; Thu, 5 Sep 2019 13:06:45 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2uu4wa44xk-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-mips@vger.kernel.org>; Thu, 05 Sep 2019 13:06:44 -0400
Received: from localhost
        by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-mips@vger.kernel.org> from <gerald.schaefer@de.ibm.com>;
        Thu, 5 Sep 2019 18:06:42 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
        by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 5 Sep 2019 18:06:33 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x85H68Tu33030630
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 5 Sep 2019 17:06:08 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 104054C050;
        Thu,  5 Sep 2019 17:06:32 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0017A4C044;
        Thu,  5 Sep 2019 17:06:30 +0000 (GMT)
Received: from thinkpad (unknown [9.152.96.45])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Thu,  5 Sep 2019 17:06:30 +0000 (GMT)
Date:   Thu, 5 Sep 2019 19:06:29 +0200
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
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] mm/pgtable/debug: Add test validating architecture
 page table helpers
In-Reply-To: <20e3044d-2af5-b27b-7653-cec53bdec941@arm.com>
References: <1567497706-8649-1-git-send-email-anshuman.khandual@arm.com>
        <1567497706-8649-2-git-send-email-anshuman.khandual@arm.com>
        <20190904221618.1b624a98@thinkpad>
        <20e3044d-2af5-b27b-7653-cec53bdec941@arm.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19090517-0012-0000-0000-000003471F7D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090517-0013-0000-0000-000021817691
Message-Id: <20190905190629.523bdb87@thinkpad>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-09-05_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909050164
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 5 Sep 2019 14:48:14 +0530
Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> > [...]  
> >> +
> >> +#if !defined(__PAGETABLE_PMD_FOLDED) && !defined(__ARCH_HAS_4LEVEL_HACK)
> >> +static void pud_clear_tests(pud_t *pudp)
> >> +{
> >> +	memset(pudp, RANDOM_NZVALUE, sizeof(pud_t));
> >> +	pud_clear(pudp);
> >> +	WARN_ON(!pud_none(READ_ONCE(*pudp)));
> >> +}  
> > 
> > For pgd/p4d/pud_clear(), we only clear if the page table level is present
> > and not folded. The memset() here overwrites the table type bits, so
> > pud_clear() will not clear anything on s390 and the pud_none() check will
> > fail.
> > Would it be possible to OR a (larger) random value into the table, so that
> > the lower 12 bits would be preserved?  
> 
> So the suggestion is instead of doing memset() on entry with RANDOM_NZVALUE,
> it should OR a large random value preserving lower 12 bits. Hmm, this should
> still do the trick for other platforms, they just need non zero value. So on
> s390, the lower 12 bits on the page table entry already has valid value while
> entering this function which would make sure that pud_clear() really does
> clear the entry ?

Yes, in theory the table entry on s390 would have the type set in the last
4 bits, so preserving those would be enough. If it does not conflict with
others, I would still suggest preserving all 12 bits since those would contain
arch-specific flags in general, just to be sure. For s390, the pte/pmd tests
would also work with the memset, but for consistency I think the same logic
should be used in all pxd_clear_tests.

However, there is another issue on s390 which will make this only work
for pud_clear_tests(), and not for the p4d/pgd_tests. The problem is that
mm_alloc() will only give you a 3-level page table initially on s390.
This means that pudp == p4dp == pgdp, and so the p4d/pgd_tests will
both see the pud level (of course this also affects other tests).

Not sure yet how to fix this, i.e. how to initialize/update the page table
to 5 levels. We can handle 5 level page tables, and it would be good if
all levels could be tested, but using mm_alloc() to establish the page
tables might not work on s390. One option could be to provide an arch-hook
or weak function to allocate/initialize the mm.

IIUC, the (dummy) mm is really only needed to provide an mm->pgd as starting
point, right?

Regards,
Gerald

