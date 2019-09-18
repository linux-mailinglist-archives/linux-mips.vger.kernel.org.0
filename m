Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BBD4B6A71
	for <lists+linux-mips@lfdr.de>; Wed, 18 Sep 2019 20:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388046AbfIRSXB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 18 Sep 2019 14:23:01 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:11376 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388507AbfIRSXA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 18 Sep 2019 14:23:00 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x8IIMNWd136613
        for <linux-mips@vger.kernel.org>; Wed, 18 Sep 2019 14:23:00 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2v3r2e3f52-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-mips@vger.kernel.org>; Wed, 18 Sep 2019 14:22:59 -0400
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-mips@vger.kernel.org> from <gerald.schaefer@de.ibm.com>;
        Wed, 18 Sep 2019 19:22:57 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
        by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 18 Sep 2019 19:22:47 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x8IIMkOY40436054
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 18 Sep 2019 18:22:46 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4D57D11C058;
        Wed, 18 Sep 2019 18:22:46 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 02F0511C04A;
        Wed, 18 Sep 2019 18:22:45 +0000 (GMT)
Received: from thinkpad (unknown [9.152.212.222])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed, 18 Sep 2019 18:22:44 +0000 (GMT)
Date:   Wed, 18 Sep 2019 20:22:43 +0200
From:   Gerald Schaefer <gerald.schaefer@de.ibm.com>
To:     Christophe Leroy <christophe.leroy@c-s.fr>
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
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
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/2] mm/pgtable/debug: Add test validating
 architecture page table helpers
In-Reply-To: <64504101-d9dd-f273-02f9-e9a8b178eecc@c-s.fr>
References: <1568268173-31302-1-git-send-email-anshuman.khandual@arm.com>
        <1568268173-31302-3-git-send-email-anshuman.khandual@arm.com>
        <ab0ca38b-1e4f-b636-f8b4-007a15903984@c-s.fr>
        <502c497a-9bf1-7d2e-95f2-cfebcd9cf1d9@arm.com>
        <95ed9d92-dd43-4c45-2e52-738aed7f2fb5@c-s.fr>
        <f872e6f4-a5cb-069d-2034-78961930cb9f@arm.com>
        <64504101-d9dd-f273-02f9-e9a8b178eecc@c-s.fr>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091818-0008-0000-0000-000003180C76
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091818-0009-0000-0000-00004A368EF9
Message-Id: <20190918202243.37e709df@thinkpad>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-09-18_09:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909180162
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 18 Sep 2019 18:26:03 +0200
Christophe Leroy <christophe.leroy@c-s.fr> wrote:

[..] 
> My suggestion was not to completely drop the #ifdef but to do like you 
> did in pgd_clear_tests() for instance, ie to add the following test on 
> top of the function:
> 
> 	if (mm_pud_folded(mm) || is_defined(__ARCH_HAS_5LEVEL_HACK))
> 		return;
> 

Ah, very nice, this would also fix the remaining issues for s390. Since
we have dynamic page table folding, neither __PAGETABLE_PXX_FOLDED nor
__ARCH_HAS_XLEVEL_HACK is defined, but mm_pxx_folded() will work.

mm_alloc() returns with a 3-level page table by default on s390, so we
will run into issues in p4d_clear/populate_tests(), and also at the end
with p4d/pud_free() (double free).

So, adding the mm_pud_folded() check to p4d_clear/populate_tests(),
and also adding mm_p4d/pud_folded() checks at the end before calling
p4d/pud_free(), would make it all work on s390.

BTW, regarding p4d/pud_free(), I'm not sure if we should rather check
the folding inside our s390 functions, similar to how we do it for
p4d/pud_free_tlb(), instead of relying on not being called for folded
p4d/pud. So far, I see no problem with this behavior, all callers of
p4d/pud_free() should be fine because of our folding check within
p4d/pud_present/none(). But that doesn't mean that it is correct not
to check for the folding inside p4d/pud_free(). At least, with this
test module we do now have a caller of p4d/pud_free() on potentially
folded entries, so instead of adding pxx_folded() checks to this
test module, we could add them to our p4d/pud_free() functions.
Any thoughts on this?

Regards,
Gerald

