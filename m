Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 024BF3FFBE1
	for <lists+linux-mips@lfdr.de>; Fri,  3 Sep 2021 10:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234838AbhICIYq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 Sep 2021 04:24:46 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:2482 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348295AbhICIYq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 3 Sep 2021 04:24:46 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 18384kVk094606;
        Fri, 3 Sep 2021 04:22:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=yvn3uRltpD6qua2hyp0D2c7Lx/IW7lVKvIh+1+hY8jc=;
 b=sxqFHGBuVldPs6+5K/rqtVS9JHaQU11EacvwcMXWaBbncc1l8OOnAuO55qpy/Yz7lvG8
 fHBGcdKnfMjUhSSKgEXpC9tfhTNXhCD4RL1rLoTx+ouZqYUheCwxI6sQQRKrEw+MIkfP
 NvtrSkjS+pOzrkJLiM4WrfcV3fsDP5VKqrtC2E9soOQhjwnWHr03qec/WayDpr2td3x+
 3dJLfkNMsgjwswwo311zitvpYu/rAJHq1kjaBUQjEZ5HM8L/YTyT0zKUTr/71/uf3dON
 n8LL5RnLa43g60fHv/kVumN2Z4k8oa5+mK/9XJPoCXZpMKfS4mcMm6AYJ7LnhFAdfrNc 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3auftc8fse-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 03 Sep 2021 04:22:03 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18384pMm095198;
        Fri, 3 Sep 2021 04:22:02 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3auftc8frg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 03 Sep 2021 04:22:02 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
        by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18388C9c028085;
        Fri, 3 Sep 2021 08:21:59 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma04fra.de.ibm.com with ESMTP id 3au6q74x6c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 03 Sep 2021 08:21:59 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 1838LtB930671224
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 3 Sep 2021 08:21:55 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 50DCEA4054;
        Fri,  3 Sep 2021 08:21:55 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D5A24A405B;
        Fri,  3 Sep 2021 08:21:53 +0000 (GMT)
Received: from osiris (unknown [9.145.159.114])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Fri,  3 Sep 2021 08:21:53 +0000 (GMT)
Date:   Fri, 3 Sep 2021 10:21:52 +0200
From:   Heiko Carstens <hca@linux.ibm.com>
To:     Weizhao Ouyang <o451686892@gmail.com>
Cc:     rostedt@goodmis.org, mingo@redhat.com, linux@armlinux.org.uk,
        catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org,
        monstr@monstr.eu, tsbogend@alpha.franken.de, nickhu@andestech.com,
        green.hu@gmail.com, deanbo422@gmail.com,
        James.Bottomley@hansenpartnership.com, deller@gmx.de,
        mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
        paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, gor@linux.ibm.com, borntraeger@de.ibm.com,
        ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net,
        tglx@linutronix.de, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org
Subject: Re: [PATCH] ftrace: Cleanup ftrace_dyn_arch_init()
Message-ID: <YTHbIMVw2EhNpDwO@osiris>
References: <20210903071817.1162938-1-o451686892@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903071817.1162938-1-o451686892@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: v7gSly151gMH4jiswwJLQJyae83ofpqz
X-Proofpoint-ORIG-GUID: 5AAR1uAs7Bex_EJmpFQlQUops1ZiOFiF
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-09-03_02:2021-09-03,2021-09-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=634 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109030048
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Sep 03, 2021 at 03:18:17PM +0800, Weizhao Ouyang wrote:
> Most ARCHs use empty ftrace_dyn_arch_init(), introduce a weak common
> ftrace_dyn_arch_init() to cleanup them.
> 
> Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
> ---
>  arch/arm/kernel/ftrace.c          | 5 -----
>  arch/arm64/kernel/ftrace.c        | 5 -----
>  arch/csky/kernel/ftrace.c         | 5 -----
>  arch/ia64/kernel/ftrace.c         | 6 ------
>  arch/microblaze/kernel/ftrace.c   | 5 -----
>  arch/mips/include/asm/ftrace.h    | 2 ++
>  arch/nds32/kernel/ftrace.c        | 5 -----
>  arch/parisc/kernel/ftrace.c       | 5 -----
>  arch/powerpc/include/asm/ftrace.h | 4 ++++
>  arch/riscv/kernel/ftrace.c        | 5 -----
>  arch/s390/kernel/ftrace.c         | 5 -----
>  arch/sh/kernel/ftrace.c           | 5 -----
>  arch/sparc/kernel/ftrace.c        | 5 -----
>  arch/x86/kernel/ftrace.c          | 5 -----
>  include/linux/ftrace.h            | 1 -
>  kernel/trace/ftrace.c             | 5 +++++
>  16 files changed, 11 insertions(+), 62 deletions(-)

For s390:
Acked-by: Heiko Carstens <hca@linux.ibm.com>
