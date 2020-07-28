Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 714922307F1
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jul 2020 12:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728588AbgG1Koq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jul 2020 06:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728566AbgG1Koq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Jul 2020 06:44:46 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B836FC061794;
        Tue, 28 Jul 2020 03:44:45 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id c2so8588299edx.8;
        Tue, 28 Jul 2020 03:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3Jtd/NLDfEi5mS55S0K4WbnSIzqpGJbZScZKeEtsXAQ=;
        b=rFUcMCUj2AwdC69csGGjJVjr3K/8WS4HC4QuFwZtg451Qj4L37BpO16QBPnCSOnEqP
         0XLFh6CAcMNi+86g1xCyy/bqdVTYRHcM+S9kEIZb7EWJKKOmGB7fGMyBy9goHLKaJvij
         l3J//FegCgxfC20hSO+SeOOi0ojcNdANd874jllkW9bgWXdBSGjDZ+KKsJ5ItnWu5ElM
         TutsV7Y/UWKyR2rEXX1BEUlxaWMHKF0PMaSsOZWNK/0D0ZH9xxW9nIbDP8AygACtKk6q
         SuVbplxJKZehbky/ztC2U7bihOneNjqjj52Fn1yyk39lDMDQeAEZqoI3viUUxFXSv5vl
         9XJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=3Jtd/NLDfEi5mS55S0K4WbnSIzqpGJbZScZKeEtsXAQ=;
        b=ZSQUTmefeWtLK+CEQ054R8zMjwmMr1kQGHV//SrV/Y7NrFrRJ4LYlseGfoN/hq3CMG
         I8GvY7tiADo4UFH7Is3XoHqXnHo/DvY1E4xdG8kI5X92lzDEg624ps0HiRRY6FjAQdo1
         IdZjS0135VXkU7hpgT8x2Q1QSC3ceQkZ6/8g+BJezbXSo+KU/3BhgJirmIqHSHwaIheD
         9hUvgz+0qewAIgFn0bZBTtEMyBT5kyOJnGsyAQZgYlhE8h2YDAKRsYfjuMdhTDmSPpy3
         TJTUWePl+6L4iEHGGhEU9iwwQmNHPKbuxNGnpykm8Nu27GRT4TsyvefzlxZ+sgA5r5F6
         K1DA==
X-Gm-Message-State: AOAM5320ckPRT4QDJ4QrsdqQf3JNcI55zxYPlDM3R9GhQb13GjHrfS/b
        BBdHsWr5QRCXwQoFBbH/UIg=
X-Google-Smtp-Source: ABdhPJztizS2/FT37W5GVOnd6egL7RbIXP7ubjCB3LMqpraJ3F9fNNOV7TQhtwANWplTQvf13TbOQg==
X-Received: by 2002:aa7:dd15:: with SMTP id i21mr12013673edv.153.1595933084517;
        Tue, 28 Jul 2020 03:44:44 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id cf10sm460841ejb.4.2020.07.28.03.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 03:44:43 -0700 (PDT)
Date:   Tue, 28 Jul 2020 12:44:40 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Andy Lutomirski <luto@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Ingo Molnar <mingo@redhat.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Simek <monstr@monstr.eu>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Stafford Horne <shorne@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        clang-built-linux@googlegroups.com,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org,
        openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
        uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org
Subject: Re: [PATCH 14/15] x86/numa: remove redundant iteration over
 memblock.reserved
Message-ID: <20200728104440.GA222284@gmail.com>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-15-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728051153.1590-15-rppt@kernel.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


* Mike Rapoport <rppt@kernel.org> wrote:

> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> numa_clear_kernel_node_hotplug() function first traverses numa_meminfo
> regions to set node ID in memblock.reserved and than traverses
> memblock.reserved to update reserved_nodemask to include node IDs that were
> set in the first loop.
> 
> Remove redundant traversal over memblock.reserved and update
> reserved_nodemask while iterating over numa_meminfo.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/x86/mm/numa.c | 26 ++++++++++----------------
>  1 file changed, 10 insertions(+), 16 deletions(-)

I suspect you'd like to carry this in the -mm tree?

Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
