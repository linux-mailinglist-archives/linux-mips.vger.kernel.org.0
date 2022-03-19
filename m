Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED65A4DE6E5
	for <lists+linux-mips@lfdr.de>; Sat, 19 Mar 2022 09:03:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242437AbiCSIFC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 19 Mar 2022 04:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236778AbiCSIFB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 19 Mar 2022 04:05:01 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DA0D9A76C3
        for <linux-mips@vger.kernel.org>; Sat, 19 Mar 2022 01:03:39 -0700 (PDT)
Received: from [10.130.0.136] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxHxNSjjVi3w4MAA--.10389S3;
        Sat, 19 Mar 2022 16:03:31 +0800 (CST)
Subject: Re: [PATCH 1/2] MIPS: loongson64: Fix build error when CONFIG_NUMA is
 set
To:     Feiyang Chen <chris.chenfeiyang@gmail.com>,
        tsbogend@alpha.franken.de
Cc:     Feiyang Chen <chenfeiyang@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org
References: <cover.1647671808.git.chenfeiyang@loongson.cn>
 <91781d982e1b89ab4fc7f1f378433eaa0e44b15a.1647671808.git.chenfeiyang@loongson.cn>
From:   Youling Tang <tangyouling@loongson.cn>
Message-ID: <08a8983a-d6bd-a8d6-7996-59e1aa4c6590@loongson.cn>
Date:   Sat, 19 Mar 2022 16:03:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <91781d982e1b89ab4fc7f1f378433eaa0e44b15a.1647671808.git.chenfeiyang@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxHxNSjjVi3w4MAA--.10389S3
X-Coremail-Antispam: 1UD129KBjvJXoWxtw1UGw18CFyUCF45Xw43KFg_yoW7CF45pF
        W7CrWrKw4UJry8K3yFqFWxZr1vvwn7JFs7tayjgFW3ZFyqg34vqr1jqr13Kw1rKrWkXF18
        JrZ8Xr4agFs7JrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUv2b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCY
        02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
        Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r12
        6r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
        kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE
        14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa
        7IU5yyI5UUUUU==
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Feiyang
On 2022/3/19 下午3:11, Feiyang Chen wrote:
> Modify __node_data to node_data to fix the build error when CONFIG_NUMA=y:
>
> mips64el-unknown-linux-gnu-ld: mm/page_alloc.o: in function `free_area_init':
> (.init.text+0x1714): undefined reference to `node_data'
> mips64el-unknown-linux-gnu-ld: (.init.text+0x1730): undefined reference to `node_data'
1. This issue was introduced by the patch "mm, memory_hotplug: make
arch_alloc_nodedata independent on CONFIG_MEMORY_HOTPLUG". The patch
has not yet been synced to the mips-next branch.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=9039a226f22047ba6b066128318d5be8ef794273

2. The build error should not modify mips but should modifythe
include/linux/memory_hotplug.h file, which will use "NODE_DATA"
instead of "node_data".

3. If "__node_data" is changed to "node_data" in mips, it will cause
problems with the crash tool.

Thanks,
Youling.
>
> BTW, modify __node_distances and __node_cpumask to follow the same style.
>
> Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
> ---
>   .../mips/include/asm/mach-loongson64/mmzone.h |  4 ++--
>   .../include/asm/mach-loongson64/topology.h    |  8 +++----
>   arch/mips/loongson64/numa.c                   | 22 +++++++++----------
>   3 files changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/arch/mips/include/asm/mach-loongson64/mmzone.h b/arch/mips/include/asm/mach-loongson64/mmzone.h
> index ebb1deaa77b9..14e2b860ad65 100644
> --- a/arch/mips/include/asm/mach-loongson64/mmzone.h
> +++ b/arch/mips/include/asm/mach-loongson64/mmzone.h
> @@ -14,9 +14,9 @@
>   #define pa_to_nid(addr)  (((addr) & 0xf00000000000) >> NODE_ADDRSPACE_SHIFT)
>   #define nid_to_addrbase(nid) ((unsigned long)(nid) << NODE_ADDRSPACE_SHIFT)
>   
> -extern struct pglist_data *__node_data[];
> +extern struct pglist_data *node_data[];
>   
> -#define NODE_DATA(n)		(__node_data[n])
> +#define NODE_DATA(n)		(node_data[n])
>   
>   extern void setup_zero_pages(void);
>   extern void __init prom_init_numa_memory(void);
> diff --git a/arch/mips/include/asm/mach-loongson64/topology.h b/arch/mips/include/asm/mach-loongson64/topology.h
> index 3414a1fd1783..dc71eaf9c819 100644
> --- a/arch/mips/include/asm/mach-loongson64/topology.h
> +++ b/arch/mips/include/asm/mach-loongson64/topology.h
> @@ -6,17 +6,17 @@
>   
>   #define cpu_to_node(cpu)	(cpu_logical_map(cpu) >> 2)
>   
> -extern cpumask_t __node_cpumask[];
> -#define cpumask_of_node(node)	(&__node_cpumask[node])
> +extern cpumask_t node_cpumask[];
> +#define cpumask_of_node(node)	(&node_cpumask[node])
>   
>   struct pci_bus;
>   extern int pcibus_to_node(struct pci_bus *);
>   
>   #define cpumask_of_pcibus(bus)	(cpu_online_mask)
>   
> -extern unsigned char __node_distances[MAX_NUMNODES][MAX_NUMNODES];
> +extern unsigned char node_distances[MAX_NUMNODES][MAX_NUMNODES];
>   
> -#define node_distance(from, to)	(__node_distances[(from)][(to)])
> +#define node_distance(from, to)	(node_distances[(from)][(to)])
>   
>   #endif
>   
> diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
> index e8e3e48c5333..9c1bf29c1aae 100644
> --- a/arch/mips/loongson64/numa.c
> +++ b/arch/mips/loongson64/numa.c
> @@ -27,13 +27,13 @@
>   #include <boot_param.h>
>   #include <loongson.h>
>   
> -unsigned char __node_distances[MAX_NUMNODES][MAX_NUMNODES];
> -EXPORT_SYMBOL(__node_distances);
> -struct pglist_data *__node_data[MAX_NUMNODES];
> -EXPORT_SYMBOL(__node_data);
> +unsigned char node_distances[MAX_NUMNODES][MAX_NUMNODES];
> +EXPORT_SYMBOL(node_distances);
> +struct pglist_data *node_data[MAX_NUMNODES];
> +EXPORT_SYMBOL(node_data);
>   
> -cpumask_t __node_cpumask[MAX_NUMNODES];
> -EXPORT_SYMBOL(__node_cpumask);
> +cpumask_t node_cpumask[MAX_NUMNODES];
> +EXPORT_SYMBOL(node_cpumask);
>   
>   static void cpu_node_probe(void)
>   {
> @@ -71,11 +71,11 @@ static void __init init_topology_matrix(void)
>   
>   	for (row = 0; row < MAX_NUMNODES; row++)
>   		for (col = 0; col < MAX_NUMNODES; col++)
> -			__node_distances[row][col] = -1;
> +			node_distances[row][col] = -1;
>   
>   	for_each_online_node(row) {
>   		for_each_online_node(col) {
> -			__node_distances[row][col] =
> +			node_distances[row][col] =
>   				compute_node_distance(row, col);
>   		}
>   	}
> @@ -107,7 +107,7 @@ static void __init node_mem_init(unsigned int node)
>   	tnid = early_pfn_to_nid(nd_pa >> PAGE_SHIFT);
>   	if (tnid != node)
>   		pr_info("NODE_DATA(%d) on node %d\n", node, tnid);
> -	__node_data[node] = nd;
> +	node_data[node] = nd;
>   	NODE_DATA(node)->node_start_pfn = start_pfn;
>   	NODE_DATA(node)->node_spanned_pages = end_pfn - start_pfn;
>   
> @@ -146,7 +146,7 @@ static __init void prom_meminit(void)
>   		if (node_online(node)) {
>   			szmem(node);
>   			node_mem_init(node);
> -			cpumask_clear(&__node_cpumask[node]);
> +			cpumask_clear(&node_cpumask[node]);
>   		}
>   	}
>   	max_low_pfn = PHYS_PFN(memblock_end_of_DRAM());
> @@ -159,7 +159,7 @@ static __init void prom_meminit(void)
>   		if (loongson_sysconf.reserved_cpus_mask & (1<<cpu))
>   			continue;
>   
> -		cpumask_set_cpu(active_cpu, &__node_cpumask[node]);
> +		cpumask_set_cpu(active_cpu, &node_cpumask[node]);
>   		pr_info("NUMA: set cpumask cpu %d on node %d\n", active_cpu, node);
>   
>   		active_cpu++;

