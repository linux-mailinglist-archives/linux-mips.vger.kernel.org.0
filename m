Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5812AB2E7E
	for <lists+linux-mips@lfdr.de>; Sun, 15 Sep 2019 07:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbfIOFt0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 15 Sep 2019 01:49:26 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:10878 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726268AbfIOFtX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 15 Sep 2019 01:49:23 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x8F5lLfJ054840
        for <linux-mips@vger.kernel.org>; Sun, 15 Sep 2019 01:49:22 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2v1d9rtgte-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-mips@vger.kernel.org>; Sun, 15 Sep 2019 01:49:21 -0400
Received: from localhost
        by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-mips@vger.kernel.org> from <rppt@linux.ibm.com>;
        Sun, 15 Sep 2019 06:49:19 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
        by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Sun, 15 Sep 2019 06:49:09 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x8F5n7JN51511398
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sun, 15 Sep 2019 05:49:07 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0B14452051;
        Sun, 15 Sep 2019 05:49:07 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.8.160])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id BB4A55204F;
        Sun, 15 Sep 2019 05:49:03 +0000 (GMT)
Date:   Sun, 15 Sep 2019 08:49:02 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Yunsheng Lin <linyunsheng@huawei.com>
Cc:     catalin.marinas@arm.com, will@kernel.org, mingo@redhat.com,
        bp@alien8.de, rth@twiddle.net, ink@jurassic.park.msu.ru,
        mattst88@gmail.com, benh@kernel.crashing.org, paulus@samba.org,
        mpe@ellerman.id.au, heiko.carstens@de.ibm.com, gor@linux.ibm.com,
        borntraeger@de.ibm.com, ysato@users.sourceforge.jp,
        dalias@libc.org, davem@davemloft.net, ralf@linux-mips.org,
        paul.burton@mips.com, jhogan@kernel.org, jiaxun.yang@flygoat.com,
        chenhc@lemote.com, akpm@linux-foundation.org,
        anshuman.khandual@arm.com, tglx@linutronix.de, cai@lca.pw,
        robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, hpa@zytor.com, x86@kernel.org,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        len.brown@intel.com, axboe@kernel.dk, dledford@redhat.com,
        jeffrey.t.kirsher@intel.com, linux-alpha@vger.kernel.org,
        naveen.n.rao@linux.vnet.ibm.com, mwb@linux.vnet.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        tbogendoerfer@suse.de, linux-mips@vger.kernel.org,
        rafael@kernel.org, mhocko@kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v3 7/8] mips: numa: make node_to_cpumask_map()
 NUMA_NO_NODE aware for mips
References: <1568283334-178380-1-git-send-email-linyunsheng@huawei.com>
 <1568283334-178380-8-git-send-email-linyunsheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568283334-178380-8-git-send-email-linyunsheng@huawei.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19091505-0012-0000-0000-0000034BBE09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091505-0013-0000-0000-0000218630DE
Message-Id: <20190915054901.GC11429@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-09-15_03:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909150063
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Thu, Sep 12, 2019 at 06:15:33PM +0800, Yunsheng Lin wrote:
> When passing the return value of dev_to_node() to cpumask_of_node()
> without checking the node id if the node id is NUMA_NO_NODE, there is
> global-out-of-bounds detected by KASAN.
> 
> From the discussion [1], NUMA_NO_NODE really means no node affinity,
> which also means all cpus should be usable. So the cpumask_of_node()
> should always return all cpus online when user passes the node id
> as NUMA_NO_NODE, just like similar semantic that page allocator handles
> NUMA_NO_NODE.
> 
> But we cannot really copy the page allocator logic. Simply because the
> page allocator doesn't enforce the near node affinity. It just picks it
> up as a preferred node but then it is free to fallback to any other numa
> node. This is not the case here and node_to_cpumask_map will only restrict
> to the particular node's cpus which would have really non deterministic
> behavior depending on where the code is executed. So in fact we really
> want to return cpu_online_mask for NUMA_NO_NODE.
> 
> Since this arch was already NUMA_NO_NODE aware, this patch only changes
> it to return cpu_online_mask and use NUMA_NO_NODE instead of "-1".
> 
> [1] https://lore.kernel.org/patchwork/patch/1125789/
> Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
> Suggested-by: Michal Hocko <mhocko@kernel.org>
> ---
> V3: Change to only handle NUMA_NO_NODE, and return cpu_online_mask
>     for NUMA_NO_NODE case, and change the commit log to better justify
>     the change.
> ---
>  arch/mips/include/asm/mach-ip27/topology.h | 4 ++--

Nit: the subject says "mips:", but this patch only touches sgi-ip27 and
loongson is updated as a separate patch. I don't see why both patches
cannot be merged. Moreover, the whole set can be made as a single patch,
IMHO.

>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/include/asm/mach-ip27/topology.h b/arch/mips/include/asm/mach-ip27/topology.h
> index 965f079..04505e6 100644
> --- a/arch/mips/include/asm/mach-ip27/topology.h
> +++ b/arch/mips/include/asm/mach-ip27/topology.h
> @@ -15,8 +15,8 @@ struct cpuinfo_ip27 {
>  extern struct cpuinfo_ip27 sn_cpu_info[NR_CPUS];
>  
>  #define cpu_to_node(cpu)	(sn_cpu_info[(cpu)].p_nodeid)
> -#define cpumask_of_node(node)	((node) == -1 ?				\
> -				 cpu_all_mask :				\
> +#define cpumask_of_node(node)	((node) == NUMA_NO_NODE ?		\
> +				 cpu_online_mask :			\
>  				 &hub_data(node)->h_cpus)
>  struct pci_bus;
>  extern int pcibus_to_node(struct pci_bus *);
> -- 
> 2.8.1
> 

-- 
Sincerely yours,
Mike.

