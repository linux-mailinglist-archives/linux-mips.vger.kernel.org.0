Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D587123B16F
	for <lists+linux-mips@lfdr.de>; Tue,  4 Aug 2020 01:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729475AbgHCX67 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Aug 2020 19:58:59 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:36514 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729462AbgHCX67 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 3 Aug 2020 19:58:59 -0400
Subject: Re: arch/mips/include/asm/mach-ip27/topology.h:19:7: error: implicit
 declaration of function 'hub_data'
To:     Mike Rapoport <rppt@linux.ibm.com>,
        kernel test robot <lkp@intel.com>
Cc:     linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        linux-mips@vger.kernel.org
References: <202008040108.xTarUIe8%lkp@intel.com>
 <20200803194910.GC72435@linux.ibm.com>
From:   Joshua Kinard <kumba@gentoo.org>
Openpgp: preference=signencrypt
Message-ID: <6a37284b-cbdb-36c8-b258-1a47e6c029ef@gentoo.org>
Date:   Mon, 3 Aug 2020 19:58:54 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200803194910.GC72435@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 8/3/2020 15:49, Mike Rapoport wrote:
> Hi,
> 
> On Tue, Aug 04, 2020 at 01:39:14AM +0800, kernel test robot wrote:
>> Hi Mike,
>>
>> FYI, the error/warning still remains.
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   bcf876870b95592b52519ed4aafcf9d95999bc9c
>> commit: 397dc00e249ec64e106374565575dd0eb7e25998 mips: sgi-ip27: switch from DISCONTIGMEM to SPARSEMEM
>> date:   10 months ago
>> config: mips-randconfig-r032-20200803 (attached as .config)
>> compiler: mips64-linux-gcc (GCC) 9.3.0
>> reproduce (this is a W=1 build):
>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         git checkout 397dc00e249ec64e106374565575dd0eb7e25998
>>         # save the attached .config to linux build tree
>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=mips 
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>    In file included from arch/mips/include/asm/topology.h:11,
>>                     from include/linux/topology.h:36,
>>                     from include/linux/gfp.h:9,
>>                     from include/linux/slab.h:15,
>>                     from include/linux/crypto.h:19,
>>                     from include/crypto/hash.h:11,
>>                     from include/linux/uio.h:10,
>>                     from include/linux/socket.h:8,
>>                     from include/linux/compat.h:15,
>>                     from arch/mips/kernel/asm-offsets.c:12:
>>    arch/mips/include/asm/mach-ip27/topology.h:25:39: error: 'MAX_COMPACT_NODES' undeclared here (not in a function)
>>       25 | extern unsigned char __node_distances[MAX_COMPACT_NODES][MAX_COMPACT_NODES];
>>          |                                       ^~~~~~~~~~~~~~~~~
>>    include/linux/topology.h: In function 'numa_node_id':
>>>> arch/mips/include/asm/mach-ip27/topology.h:16:27: error: implicit declaration of function 'cputonasid' [-Werror=implicit-function-declaration]
>>       16 | #define cpu_to_node(cpu) (cputonasid(cpu))
>>          |                           ^~~~~~~~~~
> 
> This happens when randconfig disables NUMA and has SGI_IP27 enabled.
> Before switch from discontigmem to sparsemem, there always was
> CONFIG_NEED_MULTIPLE_NODES=y because it was selected by DISCONTIGMEM.
> Without DISCONTIGMEM it is possible to have SPARSEMEM without NUMA for
> SGI_IP27 and as many things there rely on custom node definition, the
> build breaks.
> 
> I don't remember small Origin or Onyx systems so I think it would be
> reasonable to make SGI_IP27 to select NUMA. If the below patch makes
> sense I'll resend it formally.
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 6fee1a133e9d..a7e40bb1e5bc 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -678,6 +678,7 @@ config SGI_IP27
>  	select SYS_SUPPORTS_NUMA
>  	select SYS_SUPPORTS_SMP
>  	select MIPS_L1_CACHE_SHIFT_7
> +	select NUMA
>  	help
>  	  This are the SGI Origin 200, Origin 2000 and Onyx 2 Graphics
>  	  workstations.  To compile a Linux kernel that runs on these, say Y

NUMA is really only needed if you have more than one nodeboard for the Onyx2
or Origin2000 systems.  If you just have a single Origin 200 system, you
want to turn NUMA off.  I happen to have both a single Origin 200 system and
an Onyx2 w/ two nodeboards.  Haven't fired them up recently on modern
kernels, though.

I can't think of a good workaround off the top of my head for this case.
NUMA shouldn't hurt an Origin 200, but I recall Ralf once telling me it does
introduce slowdown at some points due to checks for other nodes being done
when we know there can't physically be any more (exception: dual Origin
200's hooked together via CrossTown cables).

-- 
Joshua Kinard
Gentoo/MIPS
kumba@gentoo.org
rsa6144/5C63F4E3F5C6C943 2015-04-27
177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943

"The past tempts us, the present confuses us, the future frightens us.  And
our lives slip away, moment by moment, lost in that vast, terrible in-between."

--Emperor Turhan, Centauri Republic
