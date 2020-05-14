Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCC0C1D2B82
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 11:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgENJeU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 05:34:20 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:21596 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725878AbgENJeU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 May 2020 05:34:20 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 04E9XYhf095041;
        Thu, 14 May 2020 05:34:08 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31016tccvx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 14 May 2020 05:34:08 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04E9Y7vA097580;
        Thu, 14 May 2020 05:34:07 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31016tccuh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 14 May 2020 05:34:07 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04E9UVQw007020;
        Thu, 14 May 2020 09:34:05 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
        by ppma03ams.nl.ibm.com with ESMTP id 3100ubbbqg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 14 May 2020 09:34:04 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 04E9Y2Fm62652776
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 14 May 2020 09:34:02 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C1FE4A405C;
        Thu, 14 May 2020 09:34:02 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B50F0A4060;
        Thu, 14 May 2020 09:34:01 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.206.128])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Thu, 14 May 2020 09:34:01 +0000 (GMT)
Date:   Thu, 14 May 2020 12:33:59 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Bibo Mao <maobibo@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paul Burton <paulburton@kernel.org>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
        Stafford Horne <shorne@gmail.com>,
        Steven Price <steven.price@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: update tlb even if pte entry has no change
Message-ID: <20200514093359.GB1059226@linux.ibm.com>
References: <1589422677-11455-1-git-send-email-maobibo@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589422677-11455-1-git-send-email-maobibo@loongson.cn>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.676
 definitions=2020-05-14_02:2020-05-13,2020-05-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=895 cotscore=-2147483648 impostorscore=0 phishscore=0
 suspectscore=22 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005140086
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 14, 2020 at 10:17:57AM +0800, Bibo Mao wrote:
> From: bibo mao <maobibo@loongson.cn>
> 
> If there are two threads reading the same memory and tlb miss happens,
> one thread fills pte entry, the other reads new pte value during page fault
> handling. PTE value may be updated before page faul, so the process need
> need update tlb still.
> 
> Also this patch define flush_tlb_fix_spurious_fault as empty, since it not
> necessary to flush the page for all CPUs

I'm not familiar enough with MIPS TLB workings, but it seems that adding
a MIPS version of ptep_set_access_flags() and relaxing
flush_tlb_fix_spurious_fault() are two separate patches.

> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  arch/mips/include/asm/pgtable.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
> index aab0ec1..d0a4940 100644
> --- a/arch/mips/include/asm/pgtable.h
> +++ b/arch/mips/include/asm/pgtable.h
> @@ -635,6 +635,26 @@ static inline pmd_t pmd_mknotpresent(pmd_t pmd)
>  	return pmd;
>  }
>  
> +#define flush_tlb_fix_spurious_fault(vma, address) do { } while (0)
> +
> +#define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
> +int ptep_set_access_flags(struct vm_area_struct *vma,
> +			unsigned long address, pte_t *ptep,
> +			pte_t entry, int dirty)
> +{
> +	int changed = !pte_same(*ptep, entry);
> +
> +	if (changed)
> +		set_pte_at(vma->vm_mm, address, ptep, entry);
> +	else
> +		/* update tlb with latest pte entry still, tlb entry is old
> +		 * since there is page fault
> +		 */
> +		update_mmu_cache(vma, address, ptep);
> +
> +	return changed;
> +}
> +
>  /*
>   * The generic version pmdp_huge_get_and_clear uses a version of pmd_clear() with a
>   * different prototype.
> -- 
> 1.8.3.1
> 

-- 
Sincerely yours,
Mike.
