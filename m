Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19CCF20A34A
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2020 18:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390785AbgFYQqe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Jun 2020 12:46:34 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:49502 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390396AbgFYQqe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 Jun 2020 12:46:34 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05PGfvZx169156;
        Thu, 25 Jun 2020 16:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=UEPtC+P7KIzY6w6/Ov/JEOtd2nMhGKGYQuzAtbcQOsw=;
 b=gB6CIWx2h6622MTQgbZSZ+oBWezbrX1y8ddqt+bWtjk+pikrfz189Vv/IPEDjIImvgPq
 Mwgbt5zMSxahSpqvU4Q0SiPmYl2WQzlVW1juXmu7esfbZ1MaDR3HSPjVsqOBGKkMooUg
 aUPCWDjvPDmvIhbwOMfgZaKcb8aTQyRcuQejd1oSL+wu0Z3MOn+QsmT5yw1uiQfXV4i5
 4gTUSLA9fxaH5FPNd+mK91P3G2iBDk1lQ+/NJhXl/h2gZT0MwHTcQ9dkocFysuNYkBV5
 cDX4l3gNydhWutT5s1bwng88tGryqrk04NpBxNrxpBc4/U2nFyJ90KPdZf7HBIBE38aV yQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 31uusu1ms3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 25 Jun 2020 16:46:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05PGcGPW056764;
        Thu, 25 Jun 2020 16:46:15 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 31uur9sres-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 25 Jun 2020 16:46:14 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05PGk7fA012777;
        Thu, 25 Jun 2020 16:46:08 GMT
Received: from [192.168.2.112] (/50.38.35.18)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 25 Jun 2020 16:46:07 +0000
Subject: Re: [PATCH 2/3] mm/huge_memory.c: update tlb entry if pmd is changed
To:     "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
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
From:   Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <6071df89-1438-1a25-136d-228b8863364e@oracle.com>
Date:   Thu, 25 Jun 2020 09:46:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <87lfkbl5gz.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9663 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=18 spamscore=0
 adultscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006250104
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9663 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=18 bulkscore=0
 cotscore=-2147483648 malwarescore=0 mlxscore=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006250104
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 6/25/20 5:01 AM, Aneesh Kumar K.V wrote:
> Mike Kravetz <mike.kravetz@oracle.com> writes:
> 
>> On 6/24/20 2:26 AM, Bibo Mao wrote:
>>> When set_pmd_at is called in function do_huge_pmd_anonymous_page,
>>> new tlb entry can be added by software on MIPS platform.
>>>
>>> Here add update_mmu_cache_pmd when pmd entry is set, and
>>> update_mmu_cache_pmd is defined as empty excepts arc/mips platform.
>>> This patch has no negative effect on other platforms except arc/mips
>>> system.
>>
>> I am confused by this comment.  It appears that update_mmu_cache_pmd
>> is defined as non-empty on arc, mips, powerpc and sparc architectures.
>> Am I missing something?
>>
>> If those architectures do provide update_mmu_cache_pmd, then the previous
>> patch and this one now call update_mmu_cache_pmd with the actual faulting
>> address instead of the huge page aligned address.  This was intentional
>> for mips.  However, are there any potential issues on the other architectures?
>> I am no expert in any of those architectures.  arc looks like it could be
>> problematic as update_mmu_cache_pmd calls update_mmu_cache and then
>> operates on (address & PAGE_MASK).  That could now be different.
>>
> 
> Also we added update_mmu_cache_pmd to update a THP entry. That could be
> different from a hugetlb entry on some architectures. If we need to do
> hugetlb equivalent for update_mmu_cache, we should add a different
> function.

I do not know the mips architecture well enough or if the motivation for
this patch was based on THP or hugetlb pages.  However, it will change
the address passed to update_mmu_cache_pmd from huge page aligned to the
actual faulting address.  Will such a change in the passed address impact
the powerpc update_mmu_cache_pmd routine?

-- 
Mike Kravetz
