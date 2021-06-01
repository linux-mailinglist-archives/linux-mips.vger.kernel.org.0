Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68A373973FC
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jun 2021 15:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233657AbhFANVK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Jun 2021 09:21:10 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:1864 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233064AbhFANVJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Jun 2021 09:21:09 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 151D7E92145199;
        Tue, 1 Jun 2021 09:18:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=nujpD2uRJJJK6SGWNkvfjHopcPKh4UOdpV9UeDwm950=;
 b=lu9zdtiAOggn0BEn0PWSqNkynDl14bx+UcEni8ELAqwUzdVV8LvK96tznyKVGyxUEYFN
 DV+Wu9jrPl4LeJ9kgdSAql7rCf+g7k2HiwCwoHN3cYpI6swQbEwbon/K3tVtu/5RRzOU
 LMVfdHSFy66oBmZaktBpyatrVm1X9xeGc1O13brQFmcom5elIMusETlBRTU8AHTZBQik
 IYexEy3ZPWwGw3zI2pbG6mnmU7D1skagjSG2WYFNB25QXjzNXgKGrLccuGte3r+KrelC
 8EZZe5+Aoh354IjNcA/aAc2atFwoF63+oZwQXEfboAjxoOWnTvOAnYrbQ4yxbvTXdRDD KA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 38wma4jq5t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 01 Jun 2021 09:18:45 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 151D7UWu146948;
        Tue, 1 Jun 2021 09:18:45 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 38wma4jq53-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 01 Jun 2021 09:18:44 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 151DEBq2004348;
        Tue, 1 Jun 2021 13:18:42 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
        by ppma03ams.nl.ibm.com with ESMTP id 38ud889qy6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 01 Jun 2021 13:18:42 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 151DIdi518284996
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 1 Jun 2021 13:18:39 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EDD24A4059;
        Tue,  1 Jun 2021 13:18:38 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3027BA4040;
        Tue,  1 Jun 2021 13:18:38 +0000 (GMT)
Received: from thinkpad (unknown [9.171.61.122])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
        Tue,  1 Jun 2021 13:18:38 +0000 (GMT)
Date:   Tue, 1 Jun 2021 15:18:36 +0200
From:   Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-s390@vger.kernel.org
Subject: Re: [RFC/RFT PATCH 1/5] s390: make crashk_res resource a child of
 "System RAM"
Message-ID: <20210601151836.1f3a90e0@thinkpad>
In-Reply-To: <20210531122959.23499-2-rppt@kernel.org>
References: <20210531122959.23499-1-rppt@kernel.org>
        <20210531122959.23499-2-rppt@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zfZM6brFCcTyehtRJvYgRd1OdKDzk76Y
X-Proofpoint-GUID: 4M8jGD7jEmJYuCMaDnew6ToMDp5DgKp1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-01_06:2021-05-31,2021-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106010089
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 31 May 2021 15:29:55 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Commit 4e042af463f8 ("s390/kexec: fix crash on resize of reserved memory")
> added a comment that says "crash kernel resource should not be part of the
> System RAM resource" but never explained why. As it looks from the code in
> the kernel and in kexec there is no actual reason for that.

Still testing, but so far everything works fine.

> 
> Keeping crashk_res inline with other resources makes code simpler and
> cleaner, and allows future consolidation of the resources setup across
> several architectures.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/s390/kernel/setup.c | 21 +++++----------------
>  1 file changed, 5 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/s390/kernel/setup.c b/arch/s390/kernel/setup.c
> index 5aab59ad5688..30430e7c1b03 100644
> --- a/arch/s390/kernel/setup.c
> +++ b/arch/s390/kernel/setup.c
> @@ -500,6 +500,9 @@ static struct resource __initdata *standard_resources[] = {
>  	&code_resource,
>  	&data_resource,
>  	&bss_resource,
> +#ifdef CONFIG_CRASH_DUMP
> +	&crashk_res,
> +#endif
>  };
>  
>  static void __init setup_resources(void)
> @@ -535,7 +538,7 @@ static void __init setup_resources(void)
>  
>  		for (j = 0; j < ARRAY_SIZE(standard_resources); j++) {
>  			std_res = standard_resources[j];
> -			if (std_res->start < res->start ||
> +			if (!std_res->end || std_res->start < res->start ||
>  			    std_res->start > res->end)
>  				continue;
>  			if (std_res->end > res->end) {

Why is this extra check for !std_res->end added here? I assume it
might be needed later, after you moved this to common code, but I
cannot see how any of the other patches in this series would require
that.

> @@ -552,20 +555,6 @@ static void __init setup_resources(void)
>  			}
>  		}
>  	}
> -#ifdef CONFIG_CRASH_DUMP
> -	/*
> -	 * Re-add removed crash kernel memory as reserved memory. This makes
> -	 * sure it will be mapped with the identity mapping and struct pages
> -	 * will be created, so it can be resized later on.
> -	 * However add it later since the crash kernel resource should not be
> -	 * part of the System RAM resource.
> -	 */
> -	if (crashk_res.end) {
> -		memblock_add_node(crashk_res.start, resource_size(&crashk_res), 0);
> -		memblock_reserve(crashk_res.start, resource_size(&crashk_res));
> -		insert_resource(&iomem_resource, &crashk_res);
> -	}
> -#endif
>  }
>  
>  static void __init setup_ident_map_size(void)
> @@ -733,7 +722,7 @@ static void __init reserve_crashkernel(void)
>  		diag10_range(PFN_DOWN(crash_base), PFN_DOWN(crash_size));
>  	crashk_res.start = crash_base;
>  	crashk_res.end = crash_base + crash_size - 1;
> -	memblock_remove(crash_base, crash_size);
> +	memblock_reserve(crash_base, crash_size);
>  	pr_info("Reserving %lluMB of memory at %lluMB "
>  		"for crashkernel (System RAM: %luMB)\n",
>  		crash_size >> 20, crash_base >> 20,

Other architectures check the return value of memblock_reserve() at
this point, and exit crashkernel reservation if it fails. IIUC, the
only reason why memblock_reserve() could fail would be the same reason
why also memblock_remove() could fail, i.e. that memblock_double_array()
would fail. And since we also do not check that at the moment, your
patch would probably not (additionally) break anything.

Still, this might be something for an add-on patch (for us). Do you
happen to know how likely it would be that memblock_remove/reserve()
could fail at this point?
