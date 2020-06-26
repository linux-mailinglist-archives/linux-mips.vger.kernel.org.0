Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95D2D20AE41
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2020 10:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728988AbgFZINf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 26 Jun 2020 04:13:35 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54748 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728817AbgFZINe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 26 Jun 2020 04:13:34 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05Q89UrY054383;
        Fri, 26 Jun 2020 04:13:16 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31vxqkyb28-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 Jun 2020 04:13:15 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05Q89XJu054597;
        Fri, 26 Jun 2020 04:13:15 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31vxqkyb1c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 Jun 2020 04:13:15 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
        by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05Q8Bmio024767;
        Fri, 26 Jun 2020 08:13:13 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
        by ppma06ams.nl.ibm.com with ESMTP id 31uusjjp7s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 Jun 2020 08:13:12 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 05Q8DAGX34537708
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Jun 2020 08:13:10 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id CCD9D42042;
        Fri, 26 Jun 2020 08:13:10 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EB02742049;
        Fri, 26 Jun 2020 08:13:07 +0000 (GMT)
Received: from [9.199.51.116] (unknown [9.199.51.116])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Fri, 26 Jun 2020 08:13:07 +0000 (GMT)
Subject: Re: [PATCH 2/3] mm/huge_memory.c: update tlb entry if pmd is changed
To:     Mike Kravetz <mike.kravetz@oracle.com>,
        Bibo Mao <maobibo@loongson.cn>,
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
 <07f78e99-6e59-0bce-8ac0-50d7c7600461@oracle.com>
 <87lfkbl5gz.fsf@linux.ibm.com>
 <6071df89-1438-1a25-136d-228b8863364e@oracle.com>
From:   "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <ad67e08e-9da8-6123-2c14-c197d22ee27a@linux.ibm.com>
Date:   Fri, 26 Jun 2020 13:43:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <6071df89-1438-1a25-136d-228b8863364e@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-26_04:2020-06-26,2020-06-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 priorityscore=1501 cotscore=-2147483648
 spamscore=0 suspectscore=8 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006260058
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 6/25/20 10:16 PM, Mike Kravetz wrote:
> On 6/25/20 5:01 AM, Aneesh Kumar K.V wrote:
>> Mike Kravetz <mike.kravetz@oracle.com> writes:
>>
>>> On 6/24/20 2:26 AM, Bibo Mao wrote:
>>>> When set_pmd_at is called in function do_huge_pmd_anonymous_page,
>>>> new tlb entry can be added by software on MIPS platform.
>>>>
>>>> Here add update_mmu_cache_pmd when pmd entry is set, and
>>>> update_mmu_cache_pmd is defined as empty excepts arc/mips platform.
>>>> This patch has no negative effect on other platforms except arc/mips
>>>> system.
>>>
>>> I am confused by this comment.  It appears that update_mmu_cache_pmd
>>> is defined as non-empty on arc, mips, powerpc and sparc architectures.
>>> Am I missing something?
>>>
>>> If those architectures do provide update_mmu_cache_pmd, then the previous
>>> patch and this one now call update_mmu_cache_pmd with the actual faulting
>>> address instead of the huge page aligned address.  This was intentional
>>> for mips.  However, are there any potential issues on the other architectures?
>>> I am no expert in any of those architectures.  arc looks like it could be
>>> problematic as update_mmu_cache_pmd calls update_mmu_cache and then
>>> operates on (address & PAGE_MASK).  That could now be different.
>>>
>>
>> Also we added update_mmu_cache_pmd to update a THP entry. That could be
>> different from a hugetlb entry on some architectures. If we need to do
>> hugetlb equivalent for update_mmu_cache, we should add a different
>> function.
> 
> I do not know the mips architecture well enough or if the motivation for
> this patch was based on THP or hugetlb pages.  However, it will change
> the address passed to update_mmu_cache_pmd from huge page aligned to the
> actual faulting address.  Will such a change in the passed address impact
> the powerpc update_mmu_cache_pmd routine?
> 

Right now powerpc update_mmu_cache_pmd() is a dummy function. But I 
agree we should audit arch to make sure such a change can work with 
architectures. My comment was related to the fact that mmu cache update 
w.r.t THP and hugetlb can be different on some platforms. So we may
want to avoid using the same function for both.

-aneesh
