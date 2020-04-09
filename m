Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8381D1A31B2
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2020 11:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbgDIJTl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Apr 2020 05:19:41 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53486 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726582AbgDIJTk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Apr 2020 05:19:40 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 03993Kop054620
        for <linux-mips@vger.kernel.org>; Thu, 9 Apr 2020 05:19:40 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3091ymg200-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-mips@vger.kernel.org>; Thu, 09 Apr 2020 05:19:40 -0400
Received: from localhost
        by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-mips@vger.kernel.org> from <rppt@linux.ibm.com>;
        Thu, 9 Apr 2020 10:19:10 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 9 Apr 2020 10:19:01 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 0399JRTc48169080
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 9 Apr 2020 09:19:27 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 24E3CA405D;
        Thu,  9 Apr 2020 09:19:27 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 757FDA404D;
        Thu,  9 Apr 2020 09:19:24 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.207.228])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Thu,  9 Apr 2020 09:19:24 +0000 (GMT)
Date:   Thu, 9 Apr 2020 12:19:22 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Robert Richter <rric@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vladimir Kondratiev <vladimir.kondratiev@intel.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Matt Redfearn <matt.redfearn@mips.com>,
        Steve Winslow <swinslow@gmail.com>,
        Richard Fontana <rfontana@redhat.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, oprofile-list@lists.sf.net
Subject: Re: [PATCH 12/12] MIPS: ip27: Fix includes
References: <20200408113505.2528103-1-jiaxun.yang@flygoat.com>
 <20200408130024.2529220-7-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408130024.2529220-7-jiaxun.yang@flygoat.com>
X-TM-AS-GCONF: 00
x-cbid: 20040909-0016-0000-0000-000003014CE8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040909-0017-0000-0000-000033653176
Message-Id: <20200409091922.GA17293@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-09_03:2020-04-07,2020-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 clxscore=1015 mlxscore=0 suspectscore=1 bulkscore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=398
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004090070
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 08, 2020 at 08:59:54PM +0800, Jiaxun Yang wrote:
> Somehow changes in topology messed up headers.
> So just add necessary headers to make it compile again.

Please avoid aftermath build fixes because it breaks bisection.
Each commit should be buildable, so this changes should go into the patches
that actually require them.
 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/include/asm/mach-ip27/mmzone.h   | 2 ++
>  arch/mips/include/asm/mach-ip27/topology.h | 2 ++
>  arch/mips/include/asm/sn/addrs.h           | 1 +
>  3 files changed, 5 insertions(+)
> 
> diff --git a/arch/mips/include/asm/mach-ip27/mmzone.h b/arch/mips/include/asm/mach-ip27/mmzone.h
> index 08c36e50a860..e0a53b97b4a8 100644
> --- a/arch/mips/include/asm/mach-ip27/mmzone.h
> +++ b/arch/mips/include/asm/mach-ip27/mmzone.h
> @@ -2,6 +2,8 @@
>  #ifndef _ASM_MACH_MMZONE_H
>  #define _ASM_MACH_MMZONE_H
>  
> +#include <linux/mmzone.h>
> +
>  #include <asm/sn/addrs.h>
>  #include <asm/sn/arch.h>
>  #include <asm/sn/agent.h>
> diff --git a/arch/mips/include/asm/mach-ip27/topology.h b/arch/mips/include/asm/mach-ip27/topology.h
> index d66cc53feab8..601e350908f7 100644
> --- a/arch/mips/include/asm/mach-ip27/topology.h
> +++ b/arch/mips/include/asm/mach-ip27/topology.h
> @@ -2,6 +2,8 @@
>  #ifndef _ASM_MACH_TOPOLOGY_H
>  #define _ASM_MACH_TOPOLOGY_H	1
>  
> +#include <linux/numa.h>
> +
>  #include <asm/sn/types.h>
>  #include <asm/mmzone.h>
>  
> diff --git a/arch/mips/include/asm/sn/addrs.h b/arch/mips/include/asm/sn/addrs.h
> index 837d23e24976..1d3945ef2ca4 100644
> --- a/arch/mips/include/asm/sn/addrs.h
> +++ b/arch/mips/include/asm/sn/addrs.h
> @@ -13,6 +13,7 @@
>  #ifndef __ASSEMBLY__
>  #include <linux/smp.h>
>  #include <linux/types.h>
> +#include <asm/io.h>
>  #endif /* !__ASSEMBLY__ */
>  
>  #include <asm/addrspace.h>
> -- 
> 2.26.0.rc2
> 
> 

-- 
Sincerely yours,
Mike.

