Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1623E3B9D34
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jul 2021 09:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbhGBIBv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Jul 2021 04:01:51 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50486 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229519AbhGBIBv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 2 Jul 2021 04:01:51 -0400
Received: from ambrosehua-HP-xw6600-Workstation (unknown [182.149.162.13])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Bx8OJGx95gR3kbAA--.17323S2;
        Fri, 02 Jul 2021 15:59:04 +0800 (CST)
Date:   Fri, 2 Jul 2021 15:59:02 +0800
From:   Huang Pei <huangpei@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-mm@kvack.org, yijun@loongson.cn,
        Yang Tiezhu <yangtiezhu@loongson.cn>, lixuefeng@loongson.cn
Subject: [bug report]: high memory and cache alias handing
Message-ID: <20210702075902.7wxuyom6cic4ceaq@ambrosehua-HP-xw6600-Workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID: AQAAf9Bx8OJGx95gR3kbAA--.17323S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXF4DuryfJw4rKFyfXFyUGFg_yoW5uw13pF
        W7Kw18JrWIq3yrKw17trnIkr1rG3sxAayUtanxA3Wj9w13WF1Svry3u3Z5Za15Kr95Xa17
        A3yYk345ur90gaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUka14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4xMxAI
        w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
        4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
        rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
        CI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
        6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUh4SOUUUUU=
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

I found some issue about cache alias when trying to support 4KB page 
on Loongson 3A1000 (VIPT L1D and L1C, both 4-way in total 64KB)

1.  __flush_anon_page 
.......
void __flush_anon_page(struct page *page, unsigned long vmaddr)
{
	//A:if page is in high memory, page_address does not return
	//meaningful addr
	unsigned long addr = (unsigned long) page_address(page);

	if (pages_do_alias(addr, vmaddr)) {
		if (page_mapcount(page) && !Page_dcache_dirty(page)) {
			void *kaddr;

			kaddr = kmap_coherent(page, vmaddr);
			flush_data_cache_page((unsigned long)kaddr);
			kunmap_coherent();
		} else
			//A: so can not use this addr for cache flush

			//for 64bit kernel, although addr returned is OK
			//but the flush_data_cache_page(addr) DOES NOT
			//touch the cache alias
			flush_data_cache_page(addr);
	}
}
........

to fix __flush_anon_page, I has one question

+. Why using kmap_coherent depends on !Page_dcache_dirty(page)?

I think after ce01948eb85d and 0f334a3e8c35, it is safe to
kmap_coherent without checking Page_dcache_dirty(page)

since with preempt disabled in kmap_coherent, and in interrupt use
indepent fixmap index, there is no collision in TLB  

void __flush_anon_page(struct page *page, unsigned long vmaddr)
{
	void *kaddr;
	if (page_mapcount(page)) {

		kaddr = kmap_coherent(page, vmaddr);
		flush_data_cache_page((unsigned long)kaddr);
		kunmap_coherent();
	}
}

2.  __flush_dcache_page 
........
void __flush_dcache_page(struct page *page)
{
	struct address_space *mapping = page_mapping_file(page);
	unsigned long addr;

	if (mapping && !mapping_mapped(mapping)) {
		SetPageDcacheDirty(page);
		return;
	}

	/*
	 * We could delay the flush for the !page_mapping case too.  But that
	 * case is for exec env/arg pages and those are %99 certainly going to
	 * get faulted into the tlb (and thus flushed) anyways.
	 */
	//B: calling __flush_dcache_page is under cpu_has_dc_aliases, so
	//we can not make sure addr returned by kmap_atomic is some
	//color with page's physical color, 
	//how can flush_data_cache_page flush cache line with this page
	if (PageHighMem(page))
		addr = (unsigned long)kmap_atomic(page);
	else
		addr = (unsigned long)page_address(page);

	flush_data_cache_page(addr);

	if (PageHighMem(page))
		kunmap_atomic((void *)addr);
}
........
3.  __update_tlb
.....
void __update_cache(unsigned long address, pte_t pte)
{
	struct page *page;
	unsigned long pfn, addr;
	int exec = !pte_no_exec(pte) && !cpu_has_ic_fills_f_dc;

	pfn = pte_pfn(pte);
	if (unlikely(!pfn_valid(pfn)))
		return;
	page = pfn_to_page(pfn);
	if (Page_dcache_dirty(page)) {
		//C: same as B, can not make sure the addr is in
		//same color with address
		if (PageHighMem(page))
			addr = (unsigned long)kmap_atomic(page);
		else
			addr = (unsigned long)page_address(page);
		//C: if exec is true and addr is NOT in same color with address
		//then flush_data_cache_page CAN NOT hit writeback and
		//invalidate page's cache line

		//C: if exec is false, page_do_alias return true, AKA
		addr is not in same color with address
		//then flush_data_cache_page(addr) 
		if (exec || pages_do_alias(addr, address & PAGE_MASK))
			flush_data_cache_page(addr);

		if (PageHighMem(page))
			kunmap_atomic((void *)addr);

		ClearPageDcacheDirty(page);
	}
}


all 3 issues need page_coherent to work without restriction of
!Page_Dcache_Dirty()

