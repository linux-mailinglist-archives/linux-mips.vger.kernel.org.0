Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE41B2EB5
	for <lists+linux-mips@lfdr.de>; Sun, 15 Sep 2019 08:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbfIOGrR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 15 Sep 2019 02:47:17 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29994 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726476AbfIOGrR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 15 Sep 2019 02:47:17 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x8F6lGGb084640
        for <linux-mips@vger.kernel.org>; Sun, 15 Sep 2019 02:47:16 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2v1dv3avhn-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-mips@vger.kernel.org>; Sun, 15 Sep 2019 02:47:15 -0400
Received: from localhost
        by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-mips@vger.kernel.org> from <rppt@linux.ibm.com>;
        Sun, 15 Sep 2019 07:47:07 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
        by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Sun, 15 Sep 2019 07:46:55 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x8F6krao46858610
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sun, 15 Sep 2019 06:46:54 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D1ADFAE04D;
        Sun, 15 Sep 2019 06:46:53 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 80EE1AE045;
        Sun, 15 Sep 2019 06:46:50 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.8.160])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Sun, 15 Sep 2019 06:46:50 +0000 (GMT)
Date:   Sun, 15 Sep 2019 09:46:48 +0300
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
 <20190915054901.GC11429@linux.ibm.com>
 <938be3af-ece4-7f5f-34d6-f949ee2a3d32@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <938be3af-ece4-7f5f-34d6-f949ee2a3d32@huawei.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19091506-0012-0000-0000-0000034BC3EB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091506-0013-0000-0000-0000218636D0
Message-Id: <20190915064647.GD11429@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-09-15_03:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909150073
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Sep 15, 2019 at 02:13:51PM +0800, Yunsheng Lin wrote:
> On 2019/9/15 13:49, Mike Rapoport wrote:
> > Hi,
> > 
> > On Thu, Sep 12, 2019 at 06:15:33PM +0800, Yunsheng Lin wrote:
> >> When passing the return value of dev_to_node() to cpumask_of_node()
> >> without checking the node id if the node id is NUMA_NO_NODE, there is
> >> global-out-of-bounds detected by KASAN.
> >>
> >> From the discussion [1], NUMA_NO_NODE really means no node affinity,
> >> which also means all cpus should be usable. So the cpumask_of_node()
> >> should always return all cpus online when user passes the node id
> >> as NUMA_NO_NODE, just like similar semantic that page allocator handles
> >> NUMA_NO_NODE.
> >>
> >> But we cannot really copy the page allocator logic. Simply because the
> >> page allocator doesn't enforce the near node affinity. It just picks it
> >> up as a preferred node but then it is free to fallback to any other numa
> >> node. This is not the case here and node_to_cpumask_map will only restrict
> >> to the particular node's cpus which would have really non deterministic
> >> behavior depending on where the code is executed. So in fact we really
> >> want to return cpu_online_mask for NUMA_NO_NODE.
> >>
> >> Since this arch was already NUMA_NO_NODE aware, this patch only changes
> >> it to return cpu_online_mask and use NUMA_NO_NODE instead of "-1".
> >>
> >> [1] https://lore.kernel.org/patchwork/patch/1125789/
> >> Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
> >> Suggested-by: Michal Hocko <mhocko@kernel.org>
> >> ---
> >> V3: Change to only handle NUMA_NO_NODE, and return cpu_online_mask
> >>     for NUMA_NO_NODE case, and change the commit log to better justify
> >>     the change.
> >> ---
> >>  arch/mips/include/asm/mach-ip27/topology.h | 4 ++--
> > 
> > Nit: the subject says "mips:", but this patch only touches sgi-ip27 and
> > loongson is updated as a separate patch. I don't see why both patches
> > cannot be merged. Moreover, the whole set can be made as a single patch,
> > IMHO.
> 
> Thanks for reviewing.
> 
> As this patchset touches a few files, which may has different maintainer.
> I am not sure if a separate patch for different arch will make the merging
> process easy, or a single patch will make the merging process easy?

The set makes the same logical change to several definitions of
cpumask_of_node(). It's appropriate to have all these changes in a single
patch.
 
> It can be made as a single patch if a single patch will make the merging
> process easy.
> 
> > 
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/mips/include/asm/mach-ip27/topology.h b/arch/mips/include/asm/mach-ip27/topology.h
> >> index 965f079..04505e6 100644
> >> --- a/arch/mips/include/asm/mach-ip27/topology.h
> >> +++ b/arch/mips/include/asm/mach-ip27/topology.h
> >> @@ -15,8 +15,8 @@ struct cpuinfo_ip27 {
> >>  extern struct cpuinfo_ip27 sn_cpu_info[NR_CPUS];
> >>  
> >>  #define cpu_to_node(cpu)	(sn_cpu_info[(cpu)].p_nodeid)
> >> -#define cpumask_of_node(node)	((node) == -1 ?				\
> >> -				 cpu_all_mask :				\
> >> +#define cpumask_of_node(node)	((node) == NUMA_NO_NODE ?		\
> >> +				 cpu_online_mask :			\
> >>  				 &hub_data(node)->h_cpus)
> >>  struct pci_bus;
> >>  extern int pcibus_to_node(struct pci_bus *);
> >> -- 
> >> 2.8.1
> >>
> > 
> 

-- 
Sincerely yours,
Mike.

