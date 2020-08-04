Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 696A723BAD3
	for <lists+linux-mips@lfdr.de>; Tue,  4 Aug 2020 15:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726580AbgHDNAL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Aug 2020 09:00:11 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60766 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726210AbgHDNAK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Aug 2020 09:00:10 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 074CWcut082089;
        Tue, 4 Aug 2020 08:59:55 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
        by mx0a-001b2d01.pphosted.com with ESMTP id 32q6aqkdp0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 04 Aug 2020 08:59:55 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
        by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 074Cp4YE000836;
        Tue, 4 Aug 2020 12:59:53 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
        by ppma02fra.de.ibm.com with ESMTP id 32n018a1a8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 04 Aug 2020 12:59:53 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 074CxpCj25952672
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 4 Aug 2020 12:59:51 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E220611C050;
        Tue,  4 Aug 2020 12:59:50 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2486411C04A;
        Tue,  4 Aug 2020 12:59:50 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.77.62])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue,  4 Aug 2020 12:59:50 +0000 (GMT)
Date:   Tue, 4 Aug 2020 15:59:48 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Joshua Kinard <kumba@gentoo.org>
Cc:     kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
        Paul Burton <paul.burton@mips.com>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        linux-mips@vger.kernel.org
Subject: Re: arch/mips/include/asm/mach-ip27/topology.h:19:7: error: implicit
 declaration of function 'hub_data'
Message-ID: <20200804125948.GH72435@linux.ibm.com>
References: <202008040108.xTarUIe8%lkp@intel.com>
 <20200803194910.GC72435@linux.ibm.com>
 <6a37284b-cbdb-36c8-b258-1a47e6c029ef@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a37284b-cbdb-36c8-b258-1a47e6c029ef@gentoo.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-04_04:2020-08-03,2020-08-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 mlxscore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008040090
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Aug 03, 2020 at 07:58:54PM -0400, Joshua Kinard wrote:
> On 8/3/2020 15:49, Mike Rapoport wrote:
> > Hi,
> > 
> > On Tue, Aug 04, 2020 at 01:39:14AM +0800, kernel test robot wrote:
> >> Hi Mike,
> >>
> >> FYI, the error/warning still remains.
> >>
> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> >> head:   bcf876870b95592b52519ed4aafcf9d95999bc9c
> >> commit: 397dc00e249ec64e106374565575dd0eb7e25998 mips: sgi-ip27: switch from DISCONTIGMEM to SPARSEMEM
> >> date:   10 months ago
> >> config: mips-randconfig-r032-20200803 (attached as .config)
> >> compiler: mips64-linux-gcc (GCC) 9.3.0
> >> reproduce (this is a W=1 build):
> >>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >>         chmod +x ~/bin/make.cross
> >>         git checkout 397dc00e249ec64e106374565575dd0eb7e25998
> >>         # save the attached .config to linux build tree
> >>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=mips 
> >>
> >> If you fix the issue, kindly add following tag as appropriate
> >> Reported-by: kernel test robot <lkp@intel.com>
> >>
> >> All errors (new ones prefixed by >>):
> >>
> >>    In file included from arch/mips/include/asm/topology.h:11,
> >>                     from include/linux/topology.h:36,
> >>                     from include/linux/gfp.h:9,
> >>                     from include/linux/slab.h:15,
> >>                     from include/linux/crypto.h:19,
> >>                     from include/crypto/hash.h:11,
> >>                     from include/linux/uio.h:10,
> >>                     from include/linux/socket.h:8,
> >>                     from include/linux/compat.h:15,
> >>                     from arch/mips/kernel/asm-offsets.c:12:
> >>    arch/mips/include/asm/mach-ip27/topology.h:25:39: error: 'MAX_COMPACT_NODES' undeclared here (not in a function)
> >>       25 | extern unsigned char __node_distances[MAX_COMPACT_NODES][MAX_COMPACT_NODES];
> >>          |                                       ^~~~~~~~~~~~~~~~~
> >>    include/linux/topology.h: In function 'numa_node_id':
> >>>> arch/mips/include/asm/mach-ip27/topology.h:16:27: error: implicit declaration of function 'cputonasid' [-Werror=implicit-function-declaration]
> >>       16 | #define cpu_to_node(cpu) (cputonasid(cpu))
> >>          |                           ^~~~~~~~~~
> > 
> > This happens when randconfig disables NUMA and has SGI_IP27 enabled.
> > Before switch from discontigmem to sparsemem, there always was
> > CONFIG_NEED_MULTIPLE_NODES=y because it was selected by DISCONTIGMEM.
> > Without DISCONTIGMEM it is possible to have SPARSEMEM without NUMA for
> > SGI_IP27 and as many things there rely on custom node definition, the
> > build breaks.
> > 
> > I don't remember small Origin or Onyx systems so I think it would be
> > reasonable to make SGI_IP27 to select NUMA. If the below patch makes
> > sense I'll resend it formally.
> > 
> > diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> > index 6fee1a133e9d..a7e40bb1e5bc 100644
> > --- a/arch/mips/Kconfig
> > +++ b/arch/mips/Kconfig
> > @@ -678,6 +678,7 @@ config SGI_IP27
> >  	select SYS_SUPPORTS_NUMA
> >  	select SYS_SUPPORTS_SMP
> >  	select MIPS_L1_CACHE_SHIFT_7
> > +	select NUMA
> >  	help
> >  	  This are the SGI Origin 200, Origin 2000 and Onyx 2 Graphics
> >  	  workstations.  To compile a Linux kernel that runs on these, say Y
> 
> NUMA is really only needed if you have more than one nodeboard for the Onyx2
> or Origin2000 systems.  If you just have a single Origin 200 system, you
> want to turn NUMA off.  I happen to have both a single Origin 200 system and
> an Onyx2 w/ two nodeboards.  Haven't fired them up recently on modern
> kernels, though.
> 
> I can't think of a good workaround off the top of my head for this case.
> NUMA shouldn't hurt an Origin 200, but I recall Ralf once telling me it does
> introduce slowdown at some points due to checks for other nodes being done
> when we know there can't physically be any more (exception: dual Origin
> 200's hooked together via CrossTown cables).
 
Before the removal of DISCONTIGMEM, Origin 200 would still have multiple
nodes and AFAIU it was not configurable, so I'm not sure there would be
a measurable difference between DISCONTIGMEM + !NUMA vs SPARSEMEM + NUMA 

> -- 
> Joshua Kinard
> Gentoo/MIPS
> kumba@gentoo.org
> rsa6144/5C63F4E3F5C6C943 2015-04-27
> 177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943
> 
> "The past tempts us, the present confuses us, the future frightens us.  And
> our lives slip away, moment by moment, lost in that vast, terrible in-between."
> 
> --Emperor Turhan, Centauri Republic

-- 
Sincerely yours,
Mike.
