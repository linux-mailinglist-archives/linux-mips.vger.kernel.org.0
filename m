Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 502D923ADC1
	for <lists+linux-mips@lfdr.de>; Mon,  3 Aug 2020 21:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728525AbgHCTtZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Aug 2020 15:49:25 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45640 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728275AbgHCTtZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 3 Aug 2020 15:49:25 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 073JY5j9156473;
        Mon, 3 Aug 2020 15:49:18 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
        by mx0b-001b2d01.pphosted.com with ESMTP id 32pmmeyu2a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 03 Aug 2020 15:49:18 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
        by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 073Jjcx2027671;
        Mon, 3 Aug 2020 19:49:16 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
        by ppma05fra.de.ibm.com with ESMTP id 32n017sgwn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 03 Aug 2020 19:49:16 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 073Jll9K63504762
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 3 Aug 2020 19:47:47 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id F2E6BA405F;
        Mon,  3 Aug 2020 19:49:13 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E8038A4054;
        Mon,  3 Aug 2020 19:49:12 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.18.98])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Mon,  3 Aug 2020 19:49:12 +0000 (GMT)
Date:   Mon, 3 Aug 2020 22:49:10 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     kernel test robot <lkp@intel.com>
Cc:     linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        linux-mips@vger.kernel.org
Subject: Re: arch/mips/include/asm/mach-ip27/topology.h:19:7: error: implicit
 declaration of function 'hub_data'
Message-ID: <20200803194910.GC72435@linux.ibm.com>
References: <202008040108.xTarUIe8%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202008040108.xTarUIe8%lkp@intel.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-03_15:2020-08-03,2020-08-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 mlxscore=0 adultscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008030133
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Tue, Aug 04, 2020 at 01:39:14AM +0800, kernel test robot wrote:
> Hi Mike,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   bcf876870b95592b52519ed4aafcf9d95999bc9c
> commit: 397dc00e249ec64e106374565575dd0eb7e25998 mips: sgi-ip27: switch from DISCONTIGMEM to SPARSEMEM
> date:   10 months ago
> config: mips-randconfig-r032-20200803 (attached as .config)
> compiler: mips64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 397dc00e249ec64e106374565575dd0eb7e25998
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=mips 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/mips/include/asm/topology.h:11,
>                     from include/linux/topology.h:36,
>                     from include/linux/gfp.h:9,
>                     from include/linux/slab.h:15,
>                     from include/linux/crypto.h:19,
>                     from include/crypto/hash.h:11,
>                     from include/linux/uio.h:10,
>                     from include/linux/socket.h:8,
>                     from include/linux/compat.h:15,
>                     from arch/mips/kernel/asm-offsets.c:12:
>    arch/mips/include/asm/mach-ip27/topology.h:25:39: error: 'MAX_COMPACT_NODES' undeclared here (not in a function)
>       25 | extern unsigned char __node_distances[MAX_COMPACT_NODES][MAX_COMPACT_NODES];
>          |                                       ^~~~~~~~~~~~~~~~~
>    include/linux/topology.h: In function 'numa_node_id':
> >> arch/mips/include/asm/mach-ip27/topology.h:16:27: error: implicit declaration of function 'cputonasid' [-Werror=implicit-function-declaration]
>       16 | #define cpu_to_node(cpu) (cputonasid(cpu))
>          |                           ^~~~~~~~~~

This happens when randconfig disables NUMA and has SGI_IP27 enabled.
Before switch from discontigmem to sparsemem, there always was
CONFIG_NEED_MULTIPLE_NODES=y because it was selected by DISCONTIGMEM.
Without DISCONTIGMEM it is possible to have SPARSEMEM without NUMA for
SGI_IP27 and as many things there rely on custom node definition, the
build breaks.

I don't remember small Origin or Onyx systems so I think it would be
reasonable to make SGI_IP27 to select NUMA. If the below patch makes
sense I'll resend it formally.

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 6fee1a133e9d..a7e40bb1e5bc 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -678,6 +678,7 @@ config SGI_IP27
 	select SYS_SUPPORTS_NUMA
 	select SYS_SUPPORTS_SMP
 	select MIPS_L1_CACHE_SHIFT_7
+	select NUMA
 	help
 	  This are the SGI Origin 200, Origin 2000 and Onyx 2 Graphics
 	  workstations.  To compile a Linux kernel that runs on these, say Y


-- 
Sincerely yours,
Mike.
