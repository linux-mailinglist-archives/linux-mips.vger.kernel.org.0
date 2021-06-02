Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C04FD39820A
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jun 2021 08:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhFBG5b (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Jun 2021 02:57:31 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32930 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231171AbhFBG5V (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Jun 2021 02:57:21 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1526YJpc108772;
        Wed, 2 Jun 2021 02:55:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=AggN6kILmAq6M552UF66y/v2nWUUZffhUg8jiO0qhW4=;
 b=PpT/tyMiRPDUsoxCXMtbgnwbwYGzLCDkbLB9UKylypA4FOYWI/bFDWEY7CfCEdgn2NNS
 JkmyJLEK022XM5wWoCeR3YnJp1DKeRdnmsX98neyDOt+MhWqgQfhp3egcvr/yLO/edmI
 E0maKeFZ8iM0HorQeJGEj06hc8nSJ0psCjTksjr+GB6pewUE+ZK2lMLFZQ3rCxHPXs0e
 iyiNi+npciK8+LvtEORfNFNLo+uHp8GJc9xqC46SC5jmcqEIh3SF+lQbGSqPrMVqyET5
 uZVAJsROa9SV9LoBiY6QAdCM6CV4D54kku7R4EpNqeaC90Luo5gdnQpLXhOXTcXPhJjY Og== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 38x4qd0nb5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Jun 2021 02:55:02 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1526a1Kp118406;
        Wed, 2 Jun 2021 02:55:02 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
        by mx0a-001b2d01.pphosted.com with ESMTP id 38x4qd0n9v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Jun 2021 02:55:02 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
        by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1526qSCJ008200;
        Wed, 2 Jun 2021 06:54:59 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
        by ppma05fra.de.ibm.com with ESMTP id 38ud87s65k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Jun 2021 06:54:59 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 1526sMEt22479250
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 2 Jun 2021 06:54:22 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5B35D4C040;
        Wed,  2 Jun 2021 06:54:56 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id F02FA4C046;
        Wed,  2 Jun 2021 06:54:52 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.77.40])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed,  2 Jun 2021 06:54:52 +0000 (GMT)
Date:   Wed, 2 Jun 2021 09:54:50 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc:     Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-s390@vger.kernel.org
Subject: Re: [RFC/RFT PATCH 1/5] s390: make crashk_res resource a child of
 "System RAM"
Message-ID: <YLcrOtfuhCw9e63w@linux.ibm.com>
References: <20210531122959.23499-1-rppt@kernel.org>
 <20210531122959.23499-2-rppt@kernel.org>
 <20210601151836.1f3a90e0@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601151836.1f3a90e0@thinkpad>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: x1gpB5QYTm7sXsXiPqw0ZFNHlr3tRL4e
X-Proofpoint-ORIG-GUID: vZcsgnNHdeQa4JksiepwCR0xd-j5brVe
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-02_02:2021-06-01,2021-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106020041
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 01, 2021 at 03:18:36PM +0200, Gerald Schaefer wrote:
> On Mon, 31 May 2021 15:29:55 +0300
> Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > Commit 4e042af463f8 ("s390/kexec: fix crash on resize of reserved memory")
> > added a comment that says "crash kernel resource should not be part of the
> > System RAM resource" but never explained why. As it looks from the code in
> > the kernel and in kexec there is no actual reason for that.
> 
> Still testing, but so far everything works fine.
> 
> > 
> > Keeping crashk_res inline with other resources makes code simpler and
> > cleaner, and allows future consolidation of the resources setup across
> > several architectures.
> > 
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > ---
> >  arch/s390/kernel/setup.c | 21 +++++----------------
> >  1 file changed, 5 insertions(+), 16 deletions(-)
> > 
> > diff --git a/arch/s390/kernel/setup.c b/arch/s390/kernel/setup.c
> > index 5aab59ad5688..30430e7c1b03 100644
> > --- a/arch/s390/kernel/setup.c
> > +++ b/arch/s390/kernel/setup.c
> > @@ -500,6 +500,9 @@ static struct resource __initdata *standard_resources[] = {
> >  	&code_resource,
> >  	&data_resource,
> >  	&bss_resource,
> > +#ifdef CONFIG_CRASH_DUMP
> > +	&crashk_res,
> > +#endif
> >  };
> >  
> >  static void __init setup_resources(void)
> > @@ -535,7 +538,7 @@ static void __init setup_resources(void)
> >  
> >  		for (j = 0; j < ARRAY_SIZE(standard_resources); j++) {
> >  			std_res = standard_resources[j];
> > -			if (std_res->start < res->start ||
> > +			if (!std_res->end || std_res->start < res->start ||
> >  			    std_res->start > res->end)
> >  				continue;
> >  			if (std_res->end > res->end) {
> 
> Why is this extra check for !std_res->end added here? I assume it
> might be needed later, after you moved this to common code, but I
> cannot see how any of the other patches in this series would require
> that.

This is needed to avoid requesting empty crash_res.
 
> > @@ -552,20 +555,6 @@ static void __init setup_resources(void)
> >  			}
> >  		}
> >  	}
> > -#ifdef CONFIG_CRASH_DUMP
> > -	/*
> > -	 * Re-add removed crash kernel memory as reserved memory. This makes
> > -	 * sure it will be mapped with the identity mapping and struct pages
> > -	 * will be created, so it can be resized later on.
> > -	 * However add it later since the crash kernel resource should not be
> > -	 * part of the System RAM resource.
> > -	 */
> > -	if (crashk_res.end) {
> > -		memblock_add_node(crashk_res.start, resource_size(&crashk_res), 0);
> > -		memblock_reserve(crashk_res.start, resource_size(&crashk_res));
> > -		insert_resource(&iomem_resource, &crashk_res);
> > -	}
> > -#endif
> >  }
> >  
> >  static void __init setup_ident_map_size(void)
> > @@ -733,7 +722,7 @@ static void __init reserve_crashkernel(void)
> >  		diag10_range(PFN_DOWN(crash_base), PFN_DOWN(crash_size));
> >  	crashk_res.start = crash_base;
> >  	crashk_res.end = crash_base + crash_size - 1;
> > -	memblock_remove(crash_base, crash_size);
> > +	memblock_reserve(crash_base, crash_size);
> >  	pr_info("Reserving %lluMB of memory at %lluMB "
> >  		"for crashkernel (System RAM: %luMB)\n",
> >  		crash_size >> 20, crash_base >> 20,
> 
> Other architectures check the return value of memblock_reserve() at
> this point, and exit crashkernel reservation if it fails. IIUC, the
> only reason why memblock_reserve() could fail would be the same reason
> why also memblock_remove() could fail, i.e. that memblock_double_array()
> would fail. And since we also do not check that at the moment, your
> patch would probably not (additionally) break anything.

We don't check the return value of memblock_reserve() (or memblock_remove()
for that matter) in vast majority of cases all over the place, but it is
very much unlikely it will fail because there is not enough memory.
 
> Still, this might be something for an add-on patch (for us). Do you
> happen to know how likely it would be that memblock_remove/reserve()
> could fail at this point?

Generally, the worst case scenario is that memblock_remove/reserve() will
need to double one of the memblock arrays. This will require to allocate
several kilobytes of memory, but since the memory this early is mostly free
it should not be a problem.

Looking particularly at s390 case, there are handful of reservations before
setup_resouces(), so we can accommodate more than 100 calls to
memblock_reserve() before we'll need to increase memblock.reserved array.

-- 
Sincerely yours,
Mike.
