Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6673B23B99E
	for <lists+linux-mips@lfdr.de>; Tue,  4 Aug 2020 13:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729705AbgHDLf3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Aug 2020 07:35:29 -0400
Received: from relay5.mymailcheap.com ([159.100.248.207]:47538 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729698AbgHDLf2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Aug 2020 07:35:28 -0400
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [151.80.165.199])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 87F4D2634E;
        Tue,  4 Aug 2020 11:35:24 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay2.mymailcheap.com (Postfix) with ESMTPS id B31A23ECDA;
        Tue,  4 Aug 2020 13:35:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id DA5642A3BC;
        Tue,  4 Aug 2020 07:35:12 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1596540912;
        bh=aMNJO8csnRKym/zFcvt10glg7WM2vRL4J01oZH4rl4M=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=EE6rduLtlLVgLx5k8JMeZtr+Rtd3wnYwbG9zx4d9WEnZvU338QGGcbZFG0ylLTp1/
         Qb6QNVTbpy7voPJJKV0Rn6MYve9KZuT6mNpyZ3Fe0iBEMjvqQkinsFok+j2qz+cDRC
         iJ6YjX7KnVmMUbVXtbcGwLUJ5Ui2LBcIlbS/8SwI=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id gDeBmdtqP4sK; Tue,  4 Aug 2020 07:35:11 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Tue,  4 Aug 2020 07:35:10 -0400 (EDT)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 4477040E55;
        Tue,  4 Aug 2020 11:35:09 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="C8M5fmkG";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li1197-90.members.linode.com [45.79.98.90])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 91E5440E55;
        Tue,  4 Aug 2020 11:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1596540891;
        bh=aMNJO8csnRKym/zFcvt10glg7WM2vRL4J01oZH4rl4M=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=C8M5fmkGm3r/JaTnbZwA8T+zbKZ7CoJMf60+5ec6qcsFsF2bO+wsyIySMYH9T6pn0
         /bA+7vGjFsgHhsSDWpi3cyxYyetIXktPaZ8n2FcKrjXDV+ggr/F7ZqzPP/K2+JdS5Y
         hXeky0JZMo3f2EPQpWzb4ubVhXu+Muaxzu+2XfAE=
Subject: Re: arch/mips/include/asm/mach-ip27/topology.h:19:7: error: implicit
 declaration of function 'hub_data'
To:     Joshua Kinard <kumba@gentoo.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        kernel test robot <lkp@intel.com>
Cc:     linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        linux-mips@vger.kernel.org
References: <202008040108.xTarUIe8%lkp@intel.com>
 <20200803194910.GC72435@linux.ibm.com>
 <6a37284b-cbdb-36c8-b258-1a47e6c029ef@gentoo.org>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <d3d246c4-e1dd-5d8d-a8c0-23f9cfe878fd@flygoat.com>
Date:   Tue, 4 Aug 2020 19:34:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <6a37284b-cbdb-36c8-b258-1a47e6c029ef@gentoo.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Queue-Id: 4477040E55
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_SEVEN(0.00)[7];
         RCVD_IN_DNSWL_NONE(0.00)[213.133.102.83:from];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Server: mail20.mymailcheap.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/8/4 上午7:58, Joshua Kinard 写道:
> On 8/3/2020 15:49, Mike Rapoport wrote:
>> Hi,
>>
>> On Tue, Aug 04, 2020 at 01:39:14AM +0800, kernel test robot wrote:
>>> Hi Mike,
>>>
>>> FYI, the error/warning still remains.
>>>
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>> head:   bcf876870b95592b52519ed4aafcf9d95999bc9c
>>> commit: 397dc00e249ec64e106374565575dd0eb7e25998 mips: sgi-ip27: switch from DISCONTIGMEM to SPARSEMEM
>>> date:   10 months ago
>>> config: mips-randconfig-r032-20200803 (attached as .config)
>>> compiler: mips64-linux-gcc (GCC) 9.3.0
>>> reproduce (this is a W=1 build):
>>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>          chmod +x ~/bin/make.cross
>>>          git checkout 397dc00e249ec64e106374565575dd0eb7e25998
>>>          # save the attached .config to linux build tree
>>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=mips
>>>
>>> If you fix the issue, kindly add following tag as appropriate
>>> Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>     In file included from arch/mips/include/asm/topology.h:11,
>>>                      from include/linux/topology.h:36,
>>>                      from include/linux/gfp.h:9,
>>>                      from include/linux/slab.h:15,
>>>                      from include/linux/crypto.h:19,
>>>                      from include/crypto/hash.h:11,
>>>                      from include/linux/uio.h:10,
>>>                      from include/linux/socket.h:8,
>>>                      from include/linux/compat.h:15,
>>>                      from arch/mips/kernel/asm-offsets.c:12:
>>>     arch/mips/include/asm/mach-ip27/topology.h:25:39: error: 'MAX_COMPACT_NODES' undeclared here (not in a function)
>>>        25 | extern unsigned char __node_distances[MAX_COMPACT_NODES][MAX_COMPACT_NODES];
>>>           |                                       ^~~~~~~~~~~~~~~~~
>>>     include/linux/topology.h: In function 'numa_node_id':
>>>>> arch/mips/include/asm/mach-ip27/topology.h:16:27: error: implicit declaration of function 'cputonasid' [-Werror=implicit-function-declaration]
>>>        16 | #define cpu_to_node(cpu) (cputonasid(cpu))
>>>           |                           ^~~~~~~~~~
>> This happens when randconfig disables NUMA and has SGI_IP27 enabled.
>> Before switch from discontigmem to sparsemem, there always was
>> CONFIG_NEED_MULTIPLE_NODES=y because it was selected by DISCONTIGMEM.
>> Without DISCONTIGMEM it is possible to have SPARSEMEM without NUMA for
>> SGI_IP27 and as many things there rely on custom node definition, the
>> build breaks.
>>
>> I don't remember small Origin or Onyx systems so I think it would be
>> reasonable to make SGI_IP27 to select NUMA. If the below patch makes
>> sense I'll resend it formally.
>>
>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>> index 6fee1a133e9d..a7e40bb1e5bc 100644
>> --- a/arch/mips/Kconfig
>> +++ b/arch/mips/Kconfig
>> @@ -678,6 +678,7 @@ config SGI_IP27
>>   	select SYS_SUPPORTS_NUMA
>>   	select SYS_SUPPORTS_SMP
>>   	select MIPS_L1_CACHE_SHIFT_7
>> +	select NUMA
>>   	help
>>   	  This are the SGI Origin 200, Origin 2000 and Onyx 2 Graphics
>>   	  workstations.  To compile a Linux kernel that runs on these, say Y
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
Then something like this would be more reasonable:

diff --git a/arch/mips/include/asm/mach-ip27/topology.h 
b/arch/mips/include/asm/mach-ip27/topology.h
index d66cc53feab8..8976b9a20bdc 100644
--- a/arch/mips/include/asm/mach-ip27/topology.h
+++ b/arch/mips/include/asm/mach-ip27/topology.h
@@ -13,6 +13,7 @@ struct cpuinfo_ip27 {

  extern struct cpuinfo_ip27 sn_cpu_info[NR_CPUS];

+#ifdef CONFIG_NUMA
  #define cpu_to_node(cpu)       (cputonasid(cpu))
  #define cpumask_of_node(node)  ((node) == -1 ?                         \
                                  cpu_all_mask :                         \
@@ -25,6 +26,10 @@ extern int pcibus_to_node(struct pci_bus *);
  extern unsigned char __node_distances[MAX_NUMNODES][MAX_NUMNODES];

  #define node_distance(from, to) (__node_distances[(from)][(to)])
+#else
+#define cpu_to_node(cpu)       0
+#define cpumask_of_node(node)  cpu_present_mask
+#endif

  #include <asm-generic/topology.h>

- Jiaxun
>
