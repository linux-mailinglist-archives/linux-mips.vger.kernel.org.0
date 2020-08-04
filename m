Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B65F23BA7A
	for <lists+linux-mips@lfdr.de>; Tue,  4 Aug 2020 14:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgHDMhz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Aug 2020 08:37:55 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:18034 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725932AbgHDMhz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Aug 2020 08:37:55 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 074CV6NV163021;
        Tue, 4 Aug 2020 08:37:40 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0b-001b2d01.pphosted.com with ESMTP id 32q6t3swdx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 04 Aug 2020 08:37:39 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 074CaPUk005237;
        Tue, 4 Aug 2020 12:37:37 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
        by ppma03ams.nl.ibm.com with ESMTP id 32n0183a64-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 04 Aug 2020 12:37:37 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 074CbY7526607968
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 4 Aug 2020 12:37:35 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DAE56AE04D;
        Tue,  4 Aug 2020 12:37:34 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 07C5FAE051;
        Tue,  4 Aug 2020 12:37:34 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.77.62])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue,  4 Aug 2020 12:37:33 +0000 (GMT)
Date:   Tue, 4 Aug 2020 15:37:32 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Joshua Kinard <kumba@gentoo.org>,
        kernel test robot <lkp@intel.com>,
        linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        linux-mips@vger.kernel.org
Subject: Re: arch/mips/include/asm/mach-ip27/topology.h:19:7: error: implicit
 declaration of function 'hub_data'
Message-ID: <20200804123732.GG72435@linux.ibm.com>
References: <202008040108.xTarUIe8%lkp@intel.com>
 <20200803194910.GC72435@linux.ibm.com>
 <6a37284b-cbdb-36c8-b258-1a47e6c029ef@gentoo.org>
 <d3d246c4-e1dd-5d8d-a8c0-23f9cfe878fd@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3d246c4-e1dd-5d8d-a8c0-23f9cfe878fd@flygoat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-04_04:2020-08-03,2020-08-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1011
 priorityscore=1501 impostorscore=0 mlxscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008040090
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Aug 04, 2020 at 07:34:39PM +0800, Jiaxun Yang wrote:
> 
> 在 2020/8/4 上午7:58, Joshua Kinard 写道:
> > On 8/3/2020 15:49, Mike Rapoport wrote:
> > > Hi,
> > > 
> > > On Tue, Aug 04, 2020 at 01:39:14AM +0800, kernel test robot wrote:
> > > > Hi Mike,
> > > > 
> > > > FYI, the error/warning still remains.
> > > > 
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > > head:   bcf876870b95592b52519ed4aafcf9d95999bc9c
> > > > commit: 397dc00e249ec64e106374565575dd0eb7e25998 mips: sgi-ip27: switch from DISCONTIGMEM to SPARSEMEM
> > > > date:   10 months ago
> > > > config: mips-randconfig-r032-20200803 (attached as .config)
> > > > compiler: mips64-linux-gcc (GCC) 9.3.0
> > > > reproduce (this is a W=1 build):
> > > >          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > > >          chmod +x ~/bin/make.cross
> > > >          git checkout 397dc00e249ec64e106374565575dd0eb7e25998
> > > >          # save the attached .config to linux build tree
> > > >          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=mips
> > > > 
> > > > If you fix the issue, kindly add following tag as appropriate
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > 
> > > > All errors (new ones prefixed by >>):
> > > > 
> > > >     In file included from arch/mips/include/asm/topology.h:11,
> > > >                      from include/linux/topology.h:36,
> > > >                      from include/linux/gfp.h:9,
> > > >                      from include/linux/slab.h:15,
> > > >                      from include/linux/crypto.h:19,
> > > >                      from include/crypto/hash.h:11,
> > > >                      from include/linux/uio.h:10,
> > > >                      from include/linux/socket.h:8,
> > > >                      from include/linux/compat.h:15,
> > > >                      from arch/mips/kernel/asm-offsets.c:12:
> > > >     arch/mips/include/asm/mach-ip27/topology.h:25:39: error: 'MAX_COMPACT_NODES' undeclared here (not in a function)
> > > >        25 | extern unsigned char __node_distances[MAX_COMPACT_NODES][MAX_COMPACT_NODES];
> > > >           |                                       ^~~~~~~~~~~~~~~~~
> > > >     include/linux/topology.h: In function 'numa_node_id':
> > > > > > arch/mips/include/asm/mach-ip27/topology.h:16:27: error: implicit declaration of function 'cputonasid' [-Werror=implicit-function-declaration]
> > > >        16 | #define cpu_to_node(cpu) (cputonasid(cpu))
> > > >           |                           ^~~~~~~~~~
> > > This happens when randconfig disables NUMA and has SGI_IP27 enabled.
> > > Before switch from discontigmem to sparsemem, there always was
> > > CONFIG_NEED_MULTIPLE_NODES=y because it was selected by DISCONTIGMEM.
> > > Without DISCONTIGMEM it is possible to have SPARSEMEM without NUMA for
> > > SGI_IP27 and as many things there rely on custom node definition, the
> > > build breaks.
> > > 
> > > I don't remember small Origin or Onyx systems so I think it would be
> > > reasonable to make SGI_IP27 to select NUMA. If the below patch makes
> > > sense I'll resend it formally.
> > > 
> > > diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> > > index 6fee1a133e9d..a7e40bb1e5bc 100644
> > > --- a/arch/mips/Kconfig
> > > +++ b/arch/mips/Kconfig
> > > @@ -678,6 +678,7 @@ config SGI_IP27
> > >   	select SYS_SUPPORTS_NUMA
> > >   	select SYS_SUPPORTS_SMP
> > >   	select MIPS_L1_CACHE_SHIFT_7
> > > +	select NUMA
> > >   	help
> > >   	  This are the SGI Origin 200, Origin 2000 and Onyx 2 Graphics
> > >   	  workstations.  To compile a Linux kernel that runs on these, say Y
> > NUMA is really only needed if you have more than one nodeboard for the Onyx2
> > or Origin2000 systems.  If you just have a single Origin 200 system, you
> > want to turn NUMA off.  I happen to have both a single Origin 200 system and
> > an Onyx2 w/ two nodeboards.  Haven't fired them up recently on modern
> > kernels, though.
> > 
> > I can't think of a good workaround off the top of my head for this case.
> > NUMA shouldn't hurt an Origin 200, but I recall Ralf once telling me it does
> > introduce slowdown at some points due to checks for other nodes being done
> > when we know there can't physically be any more (exception: dual Origin
> > 200's hooked together via CrossTown cables).
>
> Then something like this would be more reasonable:
> 
> diff --git a/arch/mips/include/asm/mach-ip27/topology.h
> b/arch/mips/include/asm/mach-ip27/topology.h
> index d66cc53feab8..8976b9a20bdc 100644
> --- a/arch/mips/include/asm/mach-ip27/topology.h
> +++ b/arch/mips/include/asm/mach-ip27/topology.h
> @@ -13,6 +13,7 @@ struct cpuinfo_ip27 {
> 
>  extern struct cpuinfo_ip27 sn_cpu_info[NR_CPUS];
> 
> +#ifdef CONFIG_NUMA
>  #define cpu_to_node(cpu)       (cputonasid(cpu))
>  #define cpumask_of_node(node)  ((node) == -1 ?                         \
>                                  cpu_all_mask :                         \
> @@ -25,6 +26,10 @@ extern int pcibus_to_node(struct pci_bus *);
>  extern unsigned char __node_distances[MAX_NUMNODES][MAX_NUMNODES];
> 
>  #define node_distance(from, to) (__node_distances[(from)][(to)])
> +#else
> +#define cpu_to_node(cpu)       0
> +#define cpumask_of_node(node)  cpu_present_mask
> +#endif

Unfortunately this won't be enough. sgi-ip27 presumes custom node
structures available even if CONFIG_NUMA is disabled.
 
>  #include <asm-generic/topology.h>
> 
> - Jiaxun
> > 

-- 
Sincerely yours,
Mike.
