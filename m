Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B506D2097A7
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2020 02:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388467AbgFYAbF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 20:31:05 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:59172 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388380AbgFYAbF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Jun 2020 20:31:05 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05P0IZZe035797;
        Thu, 25 Jun 2020 00:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=v5UZ8E2BaaKVJw0SUqbMQAWJdec91gruES39hMbMVCU=;
 b=vyfAIpZqjw9o9dcPYLfc/MxH6nNL6/pCrCoztRMLPfSXuDFzTHOuSmmA5I8H9t/FhDcU
 +Wrd4UmERiu5/cSb7AMvfn0HRzTuqKq+w8G0BGVQTDDwgf8vt0x3e0W8enbkQvbgkyrS
 LZQ/Ub9qxCo1gM5TDuisOXJiPMIkkrEn6fnAPC+okiY+mPMtCSp9vTr+llb5nHlsTQ1/
 R2rYhSPN/eJOJHOoFxs1T3O/2Jqak/dNcRnxP6Cubh480t/O/vMtFiAzmKlTSoZmMDZx
 /iHF9SivYpppHceukNi7vDUoo3K9AQf2jwoB2wnQBHlWSv8oHOzRfs3yK6DGRBHAgb6v mQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 31uustwsbc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 25 Jun 2020 00:30:47 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05P0IDQv195085;
        Thu, 25 Jun 2020 00:30:46 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 31uur83whu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 25 Jun 2020 00:30:46 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05P0UdVM024958;
        Thu, 25 Jun 2020 00:30:39 GMT
Received: from [192.168.2.112] (/50.38.35.18)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 25 Jun 2020 00:30:39 +0000
Subject: Re: [PATCH 2/3] mm/huge_memory.c: update tlb entry if pmd is changed
To:     Bibo Mao <maobibo@loongson.cn>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Daniel Silsby <dansilsby@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
References: <1592990792-1923-1-git-send-email-maobibo@loongson.cn>
 <1592990792-1923-2-git-send-email-maobibo@loongson.cn>
From:   Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <07f78e99-6e59-0bce-8ac0-50d7c7600461@oracle.com>
Date:   Wed, 24 Jun 2020 17:30:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1592990792-1923-2-git-send-email-maobibo@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9662 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=18 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006250000
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9662 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=18 bulkscore=0
 cotscore=-2147483648 malwarescore=0 mlxscore=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006250000
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 6/24/20 2:26 AM, Bibo Mao wrote:
> When set_pmd_at is called in function do_huge_pmd_anonymous_page,
> new tlb entry can be added by software on MIPS platform.
> 
> Here add update_mmu_cache_pmd when pmd entry is set, and
> update_mmu_cache_pmd is defined as empty excepts arc/mips platform.
> This patch has no negative effect on other platforms except arc/mips
> system.

I am confused by this comment.  It appears that update_mmu_cache_pmd
is defined as non-empty on arc, mips, powerpc and sparc architectures.
Am I missing something?

If those architectures do provide update_mmu_cache_pmd, then the previous
patch and this one now call update_mmu_cache_pmd with the actual faulting
address instead of the huge page aligned address.  This was intentional
for mips.  However, are there any potential issues on the other architectures?
I am no expert in any of those architectures.  arc looks like it could be
problematic as update_mmu_cache_pmd calls update_mmu_cache and then
operates on (address & PAGE_MASK).  That could now be different.

-- 
Mike Kravetz

> 
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  mm/huge_memory.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 0f9187b..8b4ccf7 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -643,6 +643,7 @@ static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf,
>  		lru_cache_add_active_or_unevictable(page, vma);
>  		pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, pgtable);
>  		set_pmd_at(vma->vm_mm, haddr, vmf->pmd, entry);
> +		update_mmu_cache_pmd(vma, vmf->address, vmf->pmd);
>  		add_mm_counter(vma->vm_mm, MM_ANONPAGES, HPAGE_PMD_NR);
>  		mm_inc_nr_ptes(vma->vm_mm);
>  		spin_unlock(vmf->ptl);
> @@ -756,6 +757,7 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf)
>  			} else {
>  				set_huge_zero_page(pgtable, vma->vm_mm, vma,
>  						   haddr, vmf->pmd, zero_page);
> +				update_mmu_cache_pmd(vma, vmf->address, vmf->pmd);
>  				spin_unlock(vmf->ptl);
>  				set = true;
>  			}
> 
