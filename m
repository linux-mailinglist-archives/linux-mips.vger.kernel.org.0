Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25538A5C29
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2019 20:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbfIBSRj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Sep 2019 14:17:39 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:32938 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbfIBSRi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Sep 2019 14:17:38 -0400
Received: by mail-wr1-f66.google.com with SMTP id u16so14898708wrr.0;
        Mon, 02 Sep 2019 11:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jBcP8+814FXVBIRmjcz1VaPKi5ctF20nPKwL6I2CNCQ=;
        b=faS7HABw9gu83gEWeJ9t0e3z7PXG4M/CTkKuWq9ZyzIl2d/x/mrg8a4P2YSBHuKkSK
         j2Jg0qR3ZMKYg3+W7fvfsjaTQsvaBLPDjNaHD1ciIoo++3q8Gq3ayEnY4ZosSMskNtna
         jtIMiT5+IthZl4oiuye8lom+YlFCguCKVcGl1nUVQkkkmDfAOOc02yjm+c6tbI9xlQfY
         V3XPL6hwvqyqMTLCqyt+cBvG4fk84XYerqrjv+EcSshJoTCU0YcNIwr45nwLa1lBsKFx
         dmtdHjnxenFTjUHrkvu+KQsqikg2CyST7bDw43rc0pKScjGwdWOORIp8CLdPsVl/BcLF
         fnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=jBcP8+814FXVBIRmjcz1VaPKi5ctF20nPKwL6I2CNCQ=;
        b=C/cIQA62E3VpmjqHtTFBCxLZzTQpWCQVvBIri7QM4JUb9Qa0DM1fdWJcpV/oQ2n3lv
         2P7vofyy5QFHLQk0kbCpa/XrDQdkhFCvV1Im5wNNU7SCCNkoS6LTtFqidegy1Et6OheY
         skfNwSTiZrbnWho1v+EhaPvbM5mMjiLoTGQJTpuBiB4am1t8sW95m6wFi1HAtkncE98Z
         T2ev6FrhBbEQDgj0zUJOnpa6b4ApgSRMMoqX9ySTwqQPK0CLF9wOLq0Jzn5zRiWfKWOY
         89U8r1zlXtpGiHr9ukUXE8SmrPNtaKpUUFPU52nI9uSlEy10MngCi+N+UAaQFlLyVYtS
         2t7A==
X-Gm-Message-State: APjAAAXWgF/dDf0oKyMldB0VUkOaSmXh4cCUnaZtiBnppnveB0LasbSP
        L+swX+gRx3dOI3QpIlSiY1/ww48C
X-Google-Smtp-Source: APXvYqwUXJn4is9dMaEXtNMq6w3Zcbe080FjEkYCKmNqosg3UzNOs5c67Kaj0+u++ZycwRSpujDPDQ==
X-Received: by 2002:adf:dd4d:: with SMTP id u13mr28979309wrm.112.1567448255456;
        Mon, 02 Sep 2019 11:17:35 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
        by smtp.gmail.com with ESMTPSA id y186sm27829061wmd.26.2019.09.02.11.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 11:17:34 -0700 (PDT)
Date:   Mon, 2 Sep 2019 20:17:31 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Yunsheng Lin <linyunsheng@huawei.com>, dalias@libc.org,
        linux-sh@vger.kernel.org, catalin.marinas@arm.com,
        dave.hansen@linux.intel.com, heiko.carstens@de.ibm.com,
        linuxarm@huawei.com, jiaxun.yang@flygoat.com,
        linux-mips@vger.kernel.org, mwb@linux.vnet.ibm.com,
        paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org,
        chenhc@lemote.com, will@kernel.org, cai@lca.pw,
        linux-s390@vger.kernel.org, ysato@users.sourceforge.jp,
        mpe@ellerman.id.au, x86@kernel.org, rppt@linux.ibm.com,
        borntraeger@de.ibm.com, dledford@redhat.com, mingo@redhat.com,
        jeffrey.t.kirsher@intel.com, benh@kernel.crashing.org,
        jhogan@kernel.org, nfont@linux.vnet.ibm.com, mattst88@gmail.com,
        len.brown@intel.com, gor@linux.ibm.com, anshuman.khandual@arm.com,
        bp@alien8.de, luto@kernel.org, tglx@linutronix.de,
        naveen.n.rao@linux.vnet.ibm.com,
        linux-arm-kernel@lists.infradead.org, rth@twiddle.net,
        axboe@kernel.dk, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, ralf@linux-mips.org,
        tbogendoerfer@suse.de, paul.burton@mips.com,
        linux-alpha@vger.kernel.org, ink@jurassic.park.msu.ru,
        akpm@linux-foundation.org, robin.murphy@arm.com,
        davem@davemloft.net
Subject: Re: [PATCH v2 2/9] x86: numa: check the node id consistently for x86
Message-ID: <20190902181731.GB35858@gmail.com>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
 <1567231103-13237-3-git-send-email-linyunsheng@huawei.com>
 <20190831085539.GG2369@hirez.programming.kicks-ass.net>
 <4d89c688-49e4-a2aa-32ee-65e36edcd913@huawei.com>
 <20190831161247.GM2369@hirez.programming.kicks-ass.net>
 <ae64285f-5134-4147-7b02-34bb5d519e8c@huawei.com>
 <20190902072542.GN2369@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190902072542.GN2369@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


* Peter Zijlstra <peterz@infradead.org> wrote:

> Also note that the CONFIG_DEBUG_PER_CPU_MAPS version of
> cpumask_of_node() already does this (although it wants the below fix).
> 
> ---
> diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> index e6dad600614c..5f49c10201c7 100644
> --- a/arch/x86/mm/numa.c
> +++ b/arch/x86/mm/numa.c
> @@ -861,7 +861,7 @@ void numa_remove_cpu(int cpu)
>   */
>  const struct cpumask *cpumask_of_node(int node)
>  {
> -	if (node >= nr_node_ids) {
> +	if ((unsigned)node >= nr_node_ids) {
>  		printk(KERN_WARNING
>  			"cpumask_of_node(%d): node > nr_node_ids(%u)\n",
>  			node, nr_node_ids);

Nitpicking: please also fix the kernel message to say ">=".

With that:

Acked-by: Ingo Molnar <mingo@kernel.org>

Note that:

- arch/arm64/mm/numa.c copied the same sign bug (or unrobustness if we 
  don't want to call it a bug).

- Kudos to the mm/memcontrol.c and kernel/bpf/syscall.c teams for not 
  copying that bug. Booo for none of them fixing the buggy pattern 
  elsewhere in the kernel ;-)

Thanks,

	Ingo
