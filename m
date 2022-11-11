Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15B87625801
	for <lists+linux-mips@lfdr.de>; Fri, 11 Nov 2022 11:18:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233468AbiKKKSI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Nov 2022 05:18:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233469AbiKKKRO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 11 Nov 2022 05:17:14 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F4BC42F4B
        for <linux-mips@vger.kernel.org>; Fri, 11 Nov 2022 02:17:12 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id l14so5867431wrw.2
        for <linux-mips@vger.kernel.org>; Fri, 11 Nov 2022 02:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BH/APi1a0PoKAJZknP8AkAonpu9TnXBBnNUq+HUkcwM=;
        b=4oOscMH7jU6ury8coe6FqLy7zK1XZNinWBvFR7izLUhT8UO+Uf7A34vnnALOX+0uZw
         6u0BzpFG7Xf65rlpJuAvjMgTNhVx/gSKcxgRlSDN2zH7W+6LI6BnNcuT8FnlleBan74e
         U+nnWKJgynFDrs5h1v4LHjxM1v+N8pvPWTcuhFJiAYBmZcFqEaaRiyqBxAjt+VLKVj27
         ymKqo1xHrZ7qEJ3SsTyk8ixNapD9K4j74hbbeGy2nwxMGfxLNJInz1YB3DFYiKEqav4a
         oeGBzhxJPbF4jd3XpyzDJKvMeI1dC4S63nsd7WzmmwS7/SrtVuS1+i59tvEjxRd8GW0+
         CSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BH/APi1a0PoKAJZknP8AkAonpu9TnXBBnNUq+HUkcwM=;
        b=YOHNHsPLVkOJV42/Y+Ew4VAZy7866NU1CWpwNKgxTxCHflUSB8rlMrisPy7c2EiaOT
         XYNhwf62nIkzNf7VGRAuD+Ycu+zfe8rrkt8+NMIzS7utTLLLpzDzFMN3q73QvVlbyY8A
         YWyoJzt+ZF6f84r7y/w+m56ahkIjzZzYxRbSMNWVBe1I0h6PObhK9jgmV5iqKkzlRKWv
         RIvh9oFP+pjIgXG447MEQ7hBKYwtgtOiBRe8JC+gFdXklTLYeE8u+qKR6aSMUD3OtO2+
         idQIIWNUgzwunRQ1YwzTdavbGGcp5/K7sOySLWOuq/E5ws3gGI6yXQNv457UUlKhKSdS
         OL6A==
X-Gm-Message-State: ANoB5plJPV3FCSi3AWe9UvO6XpNvqTH1oB7MjPHa1A5clk3Vp2Lp8+tw
        IGeK9Wl0d8BEPe6aZQHvYBETkw==
X-Google-Smtp-Source: AA0mqf4pSdxpuNsvbAiQ/VPT4Uicb2yIOEyOj0DptBJEnqY46AvxjvE1jv4RoOcak7HL0HGEg3fM1Q==
X-Received: by 2002:a05:6000:18cc:b0:236:6d79:b312 with SMTP id w12-20020a05600018cc00b002366d79b312mr805921wrq.699.1668161831083;
        Fri, 11 Nov 2022 02:17:11 -0800 (PST)
Received: from localhost ([95.148.15.66])
        by smtp.gmail.com with ESMTPSA id h8-20020a05600c2ca800b003b4a699ce8esm8500043wmc.6.2022.11.11.02.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 02:17:10 -0800 (PST)
From:   Punit Agrawal <punit.agrawal@bytedance.com>
To:     Yicong Yang <yangyicong@huawei.com>
Cc:     <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
        <linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <anshuman.khandual@arm.com>, <linux-doc@vger.kernel.org>,
        <corbet@lwn.net>, <peterz@infradead.org>, <arnd@arndb.de>,
        <punit.agrawal@bytedance.com>, <linux-kernel@vger.kernel.org>,
        <darren@os.amperecomputing.com>, <yangyicong@hisilicon.com>,
        <huzhanyuan@oppo.com>, <lipeifeng@oppo.com>,
        <zhangshiming@oppo.com>, <guojian@oppo.com>, <realmz6@gmail.com>,
        <linux-mips@vger.kernel.org>, <openrisc@lists.librecores.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
        <linux-s390@vger.kernel.org>, Barry Song <21cnbao@gmail.com>,
        <wangkefeng.wang@huawei.com>, <xhao@linux.alibaba.com>,
        <prime.zeng@hisilicon.com>
Subject: Re: [External] [PATCH v5 0/2] arm64: support batched/deferred tlb
 shootdown during page reclamation
References: <20221028081255.19157-1-yangyicong@huawei.com>
Date:   Fri, 11 Nov 2022 10:17:09 +0000
In-Reply-To: <20221028081255.19157-1-yangyicong@huawei.com> (Yicong Yang's
        message of "Fri, 28 Oct 2022 16:12:53 +0800")
Message-ID: <87pmdtztga.fsf@stealth>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Yicong Yang <yangyicong@huawei.com> writes:

> From: Yicong Yang <yangyicong@hisilicon.com>
>
> Though ARM64 has the hardware to do tlb shootdown, the hardware
> broadcasting is not free.
> A simplest micro benchmark shows even on snapdragon 888 with only
> 8 cores, the overhead for ptep_clear_flush is huge even for paging
> out one page mapped by only one process:
> 5.36%  a.out    [kernel.kallsyms]  [k] ptep_clear_flush
>
> While pages are mapped by multiple processes or HW has more CPUs,
> the cost should become even higher due to the bad scalability of
> tlb shootdown.
>
> The same benchmark can result in 16.99% CPU consumption on ARM64
> server with around 100 cores according to Yicong's test on patch
> 4/4.
>
> This patchset leverages the existing BATCHED_UNMAP_TLB_FLUSH by
> 1. only send tlbi instructions in the first stage -
> 	arch_tlbbatch_add_mm()
> 2. wait for the completion of tlbi by dsb while doing tlbbatch
> 	sync in arch_tlbbatch_flush()
> Testing on snapdragon shows the overhead of ptep_clear_flush
> is removed by the patchset. The micro benchmark becomes 5% faster
> even for one page mapped by single process on snapdragon 888.
>
> With this support we're possible to do more optimization for memory
> reclamation and migration[*].

I applied the patches on v6.1-rc4 and was able to see the drop in
ptep_clear_flush() in the perf report when running the test program from
Patch 2. The tests were done on a rk3399 based system with benefits
visible when running the tests on either of the clusters. 

So, for the series,

Tested-by: Punit Agrawal <punit.agrawal@bytedance.com>

Thanks,
Punit

[...]

