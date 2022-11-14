Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD7662823C
	for <lists+linux-mips@lfdr.de>; Mon, 14 Nov 2022 15:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236738AbiKNOTm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Nov 2022 09:19:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237020AbiKNOTd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Nov 2022 09:19:33 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8BBA72656C;
        Mon, 14 Nov 2022 06:19:31 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71CAB23A;
        Mon, 14 Nov 2022 06:19:37 -0800 (PST)
Received: from [192.168.0.110] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61C753F73D;
        Mon, 14 Nov 2022 06:19:21 -0800 (PST)
Message-ID: <40f1b5ad-2165-bb81-1ff5-89786373fa14@arm.com>
Date:   Mon, 14 Nov 2022 19:49:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v5 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
Content-Language: en-US
To:     Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        x86@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        linux-doc@vger.kernel.org
Cc:     yangyicong@hisilicon.com, corbet@lwn.net, peterz@infradead.org,
        arnd@arndb.de, punit.agrawal@bytedance.com,
        linux-kernel@vger.kernel.org, darren@os.amperecomputing.com,
        huzhanyuan@oppo.com, lipeifeng@oppo.com, zhangshiming@oppo.com,
        guojian@oppo.com, realmz6@gmail.com, linux-mips@vger.kernel.org,
        openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        Barry Song <21cnbao@gmail.com>, wangkefeng.wang@huawei.com,
        xhao@linux.alibaba.com, prime.zeng@hisilicon.com,
        Barry Song <v-songbaohua@oppo.com>,
        Nadav Amit <namit@vmware.com>, Mel Gorman <mgorman@suse.de>
References: <20221028081255.19157-1-yangyicong@huawei.com>
 <20221028081255.19157-3-yangyicong@huawei.com>
 <86fbdc8c-0dcb-9b8f-d843-63460d8b1d6a@arm.com>
 <9982dac0-9f2e-112a-d440-467c8e8f8aa4@huawei.com>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <9982dac0-9f2e-112a-d440-467c8e8f8aa4@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 11/14/22 14:16, Yicong Yang wrote:
> On 2022/11/14 11:29, Anshuman Khandual wrote:
>>
>> On 10/28/22 13:42, Yicong Yang wrote:
>>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>>> +{
>>> +	/*
>>> +	 * TLB batched flush is proved to be beneficial for systems with large
>>> +	 * number of CPUs, especially system with more than 8 CPUs. TLB shutdown
>>> +	 * is cheap on small systems which may not need this feature. So use
>>> +	 * a threshold for enabling this to avoid potential side effects on
>>> +	 * these platforms.
>>> +	 */
>>> +	if (num_online_cpus() <= CONFIG_ARM64_NR_CPUS_FOR_BATCHED_TLB)
>>> +		return false;
>>> +
>>> +#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
>>> +	if (unlikely(this_cpu_has_cap(ARM64_WORKAROUND_REPEAT_TLBI)))
>>> +		return false;
>>> +#endif
>> should_defer_flush() is immediately followed by set_tlb_ubc_flush_pending() which calls
>> arch_tlbbatch_add_mm(), triggering the actual TLBI flush via __flush_tlb_page_nosync().
>> It should be okay to check capability with this_cpu_has_cap() as the entire call chain
>> here is executed on the same cpu. But just wondering if cpus_have_const_cap() would be
>> simpler, consistent, and also cost effective ?
>>
> ok. Checked cpus_have_const_cap() I think it matches your words.
> 
>> Regardless, a comment is needed before the #ifdef block explaining why it does not make
>> sense to defer/batch when __tlbi()/__tlbi_user() implementation will execute 'dsb(ish)'
>> between two TLBI instructions to workaround the errata.
>>
> The workaround for the errata mentioned the affected platforms need the tlbi+dsb to be done
> twice, so I'm not sure if we defer the final dsb will cause any problem so I think the judgement
> here is used for safety. I have no such platform to test if it's ok to defer the last dsb.

We should not defer TLB flush on such systems, as ensured by the above test and 'false'
return afterwards. The only question is whether this decision should be taken at a CPU
level (which is affected by the errata) or the whole system level.

What is required now

- Replace this_cpu_has_cap() with cpus_have_const_cap ?
- Add the following comment before the #ifdef check

/*
 * TLB flush deferral is not required on systems, which are affected with
 * ARM64_WORKAROUND_REPEAT_TLBI, as __tlbi()/__tlbi_user() implementation
 * will have two consecutive TLBI instructions with a dsb(ish) in between
 * defeating the purpose (i.e save overall 'dsb ish' cost).
 */
