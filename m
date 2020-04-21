Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1351B24B4
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2020 13:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbgDULNd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Apr 2020 07:13:33 -0400
Received: from mail.loongson.cn ([114.242.206.163]:55664 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726018AbgDULNd (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 21 Apr 2020 07:13:33 -0400
Received: from [10.130.0.79] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT2lO1Z5erYUqAA--.59S3;
        Tue, 21 Apr 2020 19:13:20 +0800 (CST)
Subject: Re: [PATCH 3/3] MIPS: Reduce possibility of kernel panic under
 CONFIG_SWIOTLB
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <1587459869-12183-1-git-send-email-yangtiezhu@loongson.cn>
 <1587459869-12183-4-git-send-email-yangtiezhu@loongson.cn>
 <20200421173525.460949b0@flygoat-x1e>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <cde19f52-1c13-63f6-8a92-26011d70069c@loongson.cn>
Date:   Tue, 21 Apr 2020 19:13:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200421173525.460949b0@flygoat-x1e>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxT2lO1Z5erYUqAA--.59S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCF1rGFWxuFyxZw4rZFWxCrg_yoWrJw4fpr
        yUAa13KF4vqr97A3yxCwn5uFyak3s5Cry7G3ySvr45u3sxuwnxAF1vgr43urWxZr48Xa1I
        va40vr1q9F43AaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
        IcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
        v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
        c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
        0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Gr0_
        Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb0D73
        UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 04/21/2020 05:35 PM, Jiaxun Yang wrote:
> On Tue, 21 Apr 2020 17:04:29 +0800
> Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
>> In the current code, if CONFIG_SWIOTLB is set, when failed to get IO
>> TLB memory from the low pages by plat_swiotlb_setup(), it may lead to
>> the boot process failed with kernel panic.
> Hi Tiezhu,
>
> Thanks for you patch.
>
> Firstly, your commit message should be more straight forward. Please
> describe what you have changed (e.g. MIPS: Set memblock bottom up)
> instead of what you solved.

HI Jiaxun,

Thanks for your suggestion.

I will send a v2 patch used with the following subject:
"MIPS: Make sparse_init() using top-down allocation"

>
>> (1) On the Loongson and SiByte platform
>> arch/mips/loongson64/dma.c
>> arch/mips/sibyte/common/dma.c
>> void __init plat_swiotlb_setup(void)
>> {
>> 	swiotlb_init(1);
>> }
>>
>> kernel/dma/swiotlb.c
>> void  __init
>> swiotlb_init(int verbose)
>> {
>> ...
>> 	vstart = memblock_alloc_low(PAGE_ALIGN(bytes), PAGE_SIZE);
>> 	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs,
>> verbose)) return;
>> ...
>> 	pr_warn("Cannot allocate buffer");
>> 	no_iotlb_memory = true;
>> }
>>
>> phys_addr_t swiotlb_tbl_map_single()
>> {
>> ...
>> 	if (no_iotlb_memory)
>> 		panic("Can not allocate SWIOTLB buffer earlier ...");
>> ...
>> }
>>
>> (2) On the Cavium OCTEON platform
>> arch/mips/cavium-octeon/dma-octeon.c
>> void __init plat_swiotlb_setup(void)
>> {
>> ...
>> 	octeon_swiotlb = memblock_alloc_low(swiotlbsize, PAGE_SIZE);
>> 	if (!octeon_swiotlb)
>> 		panic("%s: Failed to allocate %zu bytes align=%lx\n",
>> 		      __func__, swiotlbsize, PAGE_SIZE);
>> ...
>> }
>>
>> Because IO_TLB_DEFAULT_SIZE is 64M, if the rest size of low memory is
>> less than 64M when call plat_swiotlb_setup(), we can easily reproduce
>> the panic case.
>>
>> In order to reduce the possibility of kernel panic when failed to get
>> IO TLB memory under CONFIG_SWIOTLB, it is better to allocate low
>> memory as small as possible before plat_swiotlb_setup(), so make
>> sparse_init() using top-down allocation.
> AFAIK there are some reasons that we set it to bottom_up.
> On some platforms, bootloader won't place cmdline & devicetree into
> reserved memory but place them just after kernel in memory. That means
> if you set it as bottom up, then early allocate memory might collide
> with these boot arguments.
>
> I'm not even sure if it works fine on Loongson with early PMON.
>
> I had met that issue before, the solution for me is to reduce SWIOTLB
> size.
>
>> Reported-by: Juxin Gao <gaojuxin@loongson.cn>
>> Co-developed-by: Juxin Gao <gaojuxin@loongson.cn>
>> Signed-off-by: Juxin Gao <gaojuxin@loongson.cn>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>   arch/mips/kernel/setup.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
>> index 5481a0c..8db533c 100644
>> --- a/arch/mips/kernel/setup.c
>> +++ b/arch/mips/kernel/setup.c
>> @@ -700,7 +700,17 @@ static void __init arch_mem_init(char
>> **cmdline_p) memblock_reserve(crashk_res.start,
>> resource_size(&crashk_res)); #endif
>>   	device_tree_init();
>> +
>> +	/*
>> +	 * In order to reduce the possibility of kernel panic when
>> failed to
>> +	 * get IO TLB memory under CONFIG_SWIOTLB, it is better to
>> allocate
>> +	 * low memory as small as possible before
>> plat_swiotlb_setup(), so
>> +	 * make sparse_init() using top-down allocation.
>> +	 */
>> +	memblock_set_bottom_up(false);
>>   	sparse_init();
>> +	memblock_set_bottom_up(true);
>> +
>>   	plat_swiotlb_setup();
>>   
>>   	dma_contiguous_reserve(PFN_PHYS(max_low_pfn));
> --
> Jiaxun Yang

