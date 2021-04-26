Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64A3536B3DD
	for <lists+linux-mips@lfdr.de>; Mon, 26 Apr 2021 15:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233471AbhDZNNC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Apr 2021 09:13:02 -0400
Received: from mail.loongson.cn ([114.242.206.163]:54564 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232575AbhDZNNB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 26 Apr 2021 09:13:01 -0400
Received: from ambrosehua-HP-xw6600-Workstation (unknown [182.149.162.118])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxmckTvIZgWwwOAA--.10892S2;
        Mon, 26 Apr 2021 21:11:49 +0800 (CST)
Date:   Mon, 26 Apr 2021 21:11:47 +0800
From:   Huang Pei <huangpei@loongson.cn>
To:     Zhou Yanjie <zhouyanjie@wanyeetech.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        akpm@linux-foundation.org, paul.burton@mips.com,
        paul@crapouillou.net, siyanteng@loongson.cn, ira.weiny@intel.com,
        yangtiezhu@loongson.cn, jun.jiang@ingenic.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sernia.zhou@foxmail.com,
        sihui.liu@ingenic.com
Subject: Re: [PATCH] Revert "MIPS: make userspace mapping young by default".
Message-ID: <20210426131146.bj2r4ha7yy5norxa@ambrosehua-HP-xw6600-Workstation>
References: <1618562868-91115-1-git-send-email-zhouyanjie@wanyeetech.com>
 <20210416092003.5754967.19768.9603@loongson.cn>
 <ae06522f-eda8-96d1-6f58-072905afa65c@wanyeetech.com>
 <20210419045610.frhzxskec47s5rmq@ambrosehua-HP-xw6600-Workstation>
 <13e37741-c1b4-2aae-471e-0790adc8db59@wanyeetech.com>
 <20210420024818.r6jf243oglb2ywbr@ambrosehua-HP-xw6600-Workstation>
 <fd1e02ff-0165-7e7e-8bc6-55fb278fc50f@wanyeetech.com>
 <20210423145131.GA11112@alpha.franken.de>
 <6d307cf6-0ed5-e9f9-ae1e-8f2e28b23311@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d307cf6-0ed5-e9f9-ae1e-8f2e28b23311@wanyeetech.com>
User-Agent: NeoMutt/20171215
X-CM-TRANSID: AQAAf9CxmckTvIZgWwwOAA--.10892S2
X-Coremail-Antispam: 1UD129KBjvJXoW3tw17Aw4fKF4DuFWDWw1rWFg_yoWDKrWrpF
        93Ga9rWF48Xr4DAr1xG34DWrn8Xa93uay8ArykJF1Fyw1fZryYyrZ5JrW8Ar9xA3ykZws5
        tw4Dt3Wjvan09w7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY
        04v7MxkIecxEwVAFwVW5GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
        C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
        wI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
        v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2
        z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
        UI43ZEXa7VUjHGQDUUUUU==
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Thomas,
On Sat, Apr 24, 2021 at 07:24:21PM +0800, Zhou Yanjie wrote:
> Hi Thomas,
> 
> On 2021/4/23 下午10:51, Thomas Bogendoerfer wrote:
> > On Tue, Apr 20, 2021 at 10:03:01PM +0800, Zhou Yanjie wrote:
> > > Sorry for my carelessness, the log in the previous email was wrong, please
> > > check the log in this email.
> > > 
> > > [   53.684067] --- pte 1 = 07698685
> > any chance to print the virtual address to this pte ?
> > 
> > > [   53.687376] --- pte 3 = 07698685
> > > [   53.737175] --- pte 1 = 07699685
> > > [   53.740412] --- pte 3 = 07699685
> > > [   53.744064] --- pte 1 = 076c3685
> > > [..]
> > could you print PTE, which faults ? And what is mapped there ?
> > 
> > 
> > so far I haven't seen any ill-effects of the (bisected ?) patch.
> > The problem I have with reverting is that IMHO we re-introduce the bug,
> > which this patch fixed.
> 
> 
> Fortunately, Mr. Huang Pei and I are in the same city. We have done off-line
> communication, and he is very generous to help troubleshoot the problem.
> 
> 
> Thanks and best regards!
> 
> 
> > 
> > Thomas.
> > 

I add some debug info based on v5.12, see patch and kernel log below

--------------------
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 808b8b61ded1..86ce01d66b03 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -376,6 +376,7 @@ void show_registers(struct pt_regs *regs)
 		set_fs(KERNEL_DS);
 	show_stacktrace(current, regs, KERN_DEFAULT);
 	show_code((unsigned int __user *) regs->cp0_epc);
+	dump_tlb_all();
 	printk("\n");
 	set_fs(old_fs);
 }
diff --git a/mm/memory.c b/mm/memory.c
index 550405fc3b5e..d8f1c69de242 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2831,7 +2831,7 @@ static inline void wp_page_reuse(struct vm_fault *vmf)
  *   held to the old page, as well as updating the rmap.
  * - In any case, unlock the PTL and drop the reference we took to the old page.
  */
-static vm_fault_t wp_page_copy(struct vm_fault *vmf)
+static vm_fault_t wp_page_copy(struct vm_fault *vmf, int a)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct mm_struct *mm = vma->vm_mm;
@@ -2862,6 +2862,8 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
 			 * the same address and we will handle the fault
 			 * from the second attempt.
 			 */
+			if (a)
+				pr_info("hp:copy ok\n");
 			put_page(new_page);
 			if (old_page)
 				put_page(old_page);
@@ -2894,6 +2896,8 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
 		} else {
 			inc_mm_counter_fast(mm, MM_ANONPAGES);
 		}
+		if (a)
+			pr_info("hp:out %p, %lx, %lx\n", vma, vmf->address, pte_val(vmf->orig_pte));
 		flush_cache_page(vma, vmf->address, pte_pfn(vmf->orig_pte));
 		entry = mk_pte(new_page, vma->vm_page_prot);
 		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
@@ -3087,7 +3091,7 @@ static vm_fault_t wp_page_shared(struct vm_fault *vmf)
  * but allow concurrent faults), with pte both mapped and locked.
  * We return with mmap_lock still held, but pte unmapped and unlocked.
  */
-static vm_fault_t do_wp_page(struct vm_fault *vmf)
+static vm_fault_t do_wp_page(struct vm_fault *vmf, int a)
 	__releases(vmf->ptl)
 {
 	struct vm_area_struct *vma = vmf->vma;
@@ -3119,7 +3123,9 @@ static vm_fault_t do_wp_page(struct vm_fault *vmf)
 			return wp_pfn_shared(vmf);
 
 		pte_unmap_unlock(vmf->pte, vmf->ptl);
-		return wp_page_copy(vmf);
+		if (a)
+			pr_info("hp:in2\n");
+		return wp_page_copy(vmf, a);
 	}
 
 	/*
@@ -3157,7 +3163,9 @@ static vm_fault_t do_wp_page(struct vm_fault *vmf)
 	get_page(vmf->page);
 
 	pte_unmap_unlock(vmf->pte, vmf->ptl);
-	return wp_page_copy(vmf);
+	if (a)
+		pr_info("hp:in3\n");
+	return wp_page_copy(vmf, a);
 }
 
 static void unmap_mapping_range_vma(struct vm_area_struct *vma,
@@ -3433,6 +3441,10 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	}
 	set_pte_at(vma->vm_mm, vmf->address, vmf->pte, pte);
 	arch_do_swap_page(vma->vm_mm, vma, vmf->address, pte, vmf->orig_pte);
+	if (vmf->flags & FAULT_FLAG_WRITE)
+		pr_info("hp: %p, %p, %lx, %lx, %lx\n", vma->vm_mm, vma, vmf->address, pte_val(pte),
+			pte_val(vmf->orig_pte));
+
 	vmf->orig_pte = pte;
 
 	/* ksm created a completely new copy */
@@ -3462,7 +3474,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	}
 
 	if (vmf->flags & FAULT_FLAG_WRITE) {
-		ret |= do_wp_page(vmf);
+		ret |= do_wp_page(vmf, 1);
 		if (ret & VM_FAULT_ERROR)
 			ret &= VM_FAULT_ERROR;
 		goto out;
@@ -4333,7 +4345,7 @@ static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
 	}
 	if (vmf->flags & FAULT_FLAG_WRITE) {
 		if (!pte_write(entry))
-			return do_wp_page(vmf);
+			return do_wp_page(vmf, 0);
 		entry = pte_mkdirty(entry);
 	}
 	entry = pte_mkyoung(entry);
-------------------------------------
[   27.502265] random: 7 urandom warning(s) missed due to ratelimiting
[371/1987]
[   40.775969] hp: 368bbd08, baf3a8c3, 77e23000, 6807685, 2017a000

!!! swap entry is 0x2017a000

[   40.781983] hp:in3
[   40.784005] hp:out baf3a8c3, 77e23000, 6807685

!!! vmf->pte is held with ptl, so and "pte_same return true" imply that
the *vmf->pte is 0x6807685, instead of 0x2017a000, aka. swap entry

[   40.788446] CPU 0 Unable to handle kernel paging request at virtual
address 77e23000, epc == 801174ec, ra == 80117fb0
[   40.799084] Oops[#1]:
[   40.801353] CPU: 0 PID: 1370 Comm: Xsession Not tainted
5.12.0-00060-g8099b2938a9d-dirty #55
[   40.809777] $ 0   : 00000000 00000001 801174e8 77e24000
[   40.815006] $ 4   : 77e23000 83a1f280 80117d7c 83995c30
[   40.820234] $ 8   : ffffffea 83995c44 00000000 0000000a
[   40.825461] $12   : 65373720 806b1270 0000000f 30303332
[   40.830688] $16   : 83a1f280 77e23000 809dcd1c 00000004
[   40.835915] $20   : 00000000 83a1f280 856c76c0 00000000
[   40.841142] $24   : 00000000 8042251c
[   40.846368] $28   : 83994000 83995d60 80860000 80117fb0
[   40.851596] Hi    : 00000000
[   40.854465] Lo    : 0000afa8
[   40.857333] epc   : 801174ec r4k_blast_dcache_page_dc32+0x4/0x9c
[   40.863338] ra    : 80117fb0 local_r4k_flush_cache_page+0x234/0x2b4
[   40.869597] Status: 10001403 KERNEL EXL IE
[   40.873779] Cause : 4080800c (ExcCode 03)
[   40.877775] BadVA : 77e23000
[   40.880645] PrId  : 00d00100 (Ingenic XBurst)
[   40.884989] Modules linked in:
[   40.888034] Process Xsession (pid: 1370, threadinfo=ca5ce8d6,
task=61c8f3ad, tls=77e28690)

!!! This is my first time debug MIPS32 kernel, I think both threadinfo
and task should be at KSEG0, instead of KSEG2 or USEG

[   40.896285] Stack : 83995dcc 00000000 80860000 8093e2f8 809dcd1c
80860000 8093e2f8 809dcd1c
[   40.904649]         856c76c0 80117c1c 00000000 00000cc0 855e7800
80860000 83995dcc 80117d48
[   40.913013]         856c76c0 806536f0 809dcd1c 856c76c0 856c76c0
77e23000 00006807 fa51a59c
[   40.921377]         83995e80 801ca8bc 00000002 856c76c0 77e23000
06807685 00000000 8387b88c
[   40.929739]         80860000 fa51a59c 83995e80 fa51a59c 809dcd1c
83995e80 00000004 856c76c0
[   40.938103]         ...
[   40.940544] Call Trace:
[   40.942979] [<801174ec>] r4k_blast_dcache_page_dc32+0x4/0x9c
[   40.948633] [<80117fb0>] local_r4k_flush_cache_page+0x234/0x2b4
[   40.954546] [<80117c1c>] r4k_on_each_cpu.isra.10+0x24/0x58
[   40.960024] [<80117d48>] r4k_flush_cache_page+0x38/0x5c
[   40.965242] [<801ca8bc>] wp_page_copy+0x1d0/0x5a8
[   40.969943] [<801cd838>] do_swap_page+0x4a0/0x588
[   40.974642] [<801ce3dc>] handle_mm_fault+0x834/0x954
[   40.979601] [<80110054>] do_page_fault+0x294/0x530
[   40.984387] [<80113fa0>] tlb_do_page_fault_1+0x10c/0x11c
[   40.989693]
[   40.991175] Code: 03e00008  00000000  24831000 <bc950000> bc950020
bc950040  bc950060  bc950080  bc9500a0
[   41.000936] Index:  7 pgmask=4kb va=77e20000 asid=5c
[   41.000936]  [pa=2017e000 c=0 d=0 v=0 g=0] [pa=058b5000 c=3 d=1 v=1
g=0]
[   41.012585] Index:  8 pgmask=4kb va=77d44000 asid=5c
[   41.012585]  [pa=013f4000 c=3 d=0 v=1 g=0] [pa=013f5000 c=3 d=0 v=1
g=0]
[   41.024232] Index:  9 pgmask=4kb va=77d40000 asid=5c
[   41.024232]  [pa=013f0000 c=3 d=0 v=1 g=0] [pa=013f1000 c=3 d=0 v=1
g=0]
[   41.035879] Index: 10 pgmask=4kb va=77d42000 asid=5c
[   41.035879]  [pa=013f2000 c=3 d=0 v=1 g=0] [pa=013f3000 c=3 d=0 v=1
g=0]
[   41.047525] Index: 11 pgmask=4kb va=77d46000 asid=5c
[   41.047525]  [pa=013f6000 c=3 d=0 v=1 g=0] [pa=013f7000 c=3 d=0 v=1
g=0]
[   41.059173] Index: 12 pgmask=4kb va=77d48000 asid=5c
[   41.059173]  [pa=013f8000 c=3 d=0 v=1 g=0] [pa=013f9000 c=3 d=0 v=1
g=0]
[   41.070819] Index: 13 pgmask=4kb va=77d4a000 asid=5c
[   41.070819]  [pa=013fa000 c=3 d=0 v=1 g=0] [pa=013fb000 c=3 d=0 v=1
g=0]
[   41.082467] Index: 14 pgmask=4kb va=77d4c000 asid=5c
[   41.082467]  [pa=013fc000 c=3 d=0 v=1 g=0] [pa=013fd000 c=3 d=0 v=1
g=0]
[   41.094113] Index: 15 pgmask=4kb va=77d4e000 asid=5c
[   41.094113]  [pa=013fe000 c=3 d=0 v=1 g=0] [pa=013ff000 c=3 d=0 v=1
g=0]
[   41.105760] Index: 16 pgmask=4kb va=77d02000 asid=5c
[   41.105760]  [pa=01c81000 c=3 d=0 v=1 g=0] [pa=01c82000 c=3 d=0 v=1
g=0]
[   41.117407] Index: 17 pgmask=4kb va=77d00000 asid=5c
[   41.117407]  [pa=01c7f000 c=3 d=0 v=1 g=0] [pa=01c80000 c=3 d=0 v=1
g=0]
[   41.129054] Index: 18 pgmask=4kb va=77d04000 asid=5c
[   41.129054]  [pa=01c83000 c=3 d=0 v=1 g=0] [pa=01c84000 c=3 d=0 v=1
g=0]
[   41.140701] Index: 19 pgmask=4kb va=77d06000 asid=5c
[   41.140701]  [pa=01c85000 c=3 d=0 v=1 g=0] [pa=01c86000 c=3 d=0 v=1
g=0]
[   41.152348] Index: 20 pgmask=4kb va=77d08000 asid=5c
[   41.152348]  [pa=01c87000 c=3 d=0 v=1 g=0] [pa=01c88000 c=3 d=0 v=1
g=0]
[   41.163995] Index: 21 pgmask=4kb va=77d0a000 asid=5c
[   41.163995]  [pa=01c89000 c=3 d=0 v=1 g=0] [pa=01c8a000 c=3 d=0 v=1
g=0]
[   41.175642] Index: 22 pgmask=4kb va=77d0c000 asid=5c
[   41.175642]  [pa=01c8b000 c=3 d=0 v=1 g=0] [pa=01c8c000 c=3 d=0 v=1
g=0]
[   41.187289] Index: 23 pgmask=4kb va=77d0e000 asid=5c
[   41.187289]  [pa=01c8d000 c=3 d=0 v=1 g=0] [pa=01c8e000 c=3 d=0 v=1
g=0]
[   41.198936] Index: 24 pgmask=4kb va=7f8ee000 asid=5c
[   41.198936]  [pa=02efd000 c=3 d=0 v=0 g=0] [pa=01a8e000 c=3 d=0 v=1
g=0]
[   41.210583] Index: 25 pgmask=4kb va=77dda000 asid=5c
[   41.210583]  [pa=022cc000 c=3 d=0 v=1 g=0] [pa=042a6000 c=3 d=0 v=1
g=0]
[   41.222230] Index: 26 pgmask=4kb va=77dd8000 asid=5c
[   41.222230]  [pa=06618000 c=3 d=0 v=0 g=0] [pa=05794000 c=3 d=0 v=1
g=0]
[   41.233877] Index: 27 pgmask=4kb va=77e22000 asid=5c
[   41.233877]  [pa=06a17000 c=3 d=0 v=0 g=0] [pa=2017a000 c=0 d=0 v=0
g=0]

!!! TLB entry is loading a SWAP entry(C=0, pa=swap) at BADV, the pte_buddy point to a valid
PFN(C=3, pa seem ok), but it is impossible, since line 116 must flush the tlb and
replaced swap entry with new page 

Am I missing something?

[   41.245524] Index: 28 pgmask=4kb va=c00a2000 asid=5c
[   41.245524]  [pa=02c3c000 c=3 d=1 v=1 g=1] [pa=02c3d000 c=3 d=1 v=1
g=1]
[   41.257171] Index: 29 pgmask=4kb va=c00aa000 asid=5c
[   41.257171]  [pa=00000000 c=0 d=0 v=0 g=1] [pa=02c45000 c=3 d=1 v=1
g=1]

