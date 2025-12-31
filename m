Return-Path: <linux-mips+bounces-12652-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C281CEBB61
	for <lists+linux-mips@lfdr.de>; Wed, 31 Dec 2025 10:43:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF18E30115EB
	for <lists+linux-mips@lfdr.de>; Wed, 31 Dec 2025 09:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9023191D0;
	Wed, 31 Dec 2025 09:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEa2fbsn"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C754630F927
	for <linux-mips@vger.kernel.org>; Wed, 31 Dec 2025 09:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767174167; cv=none; b=dqYvDzzg9Hv4h1KRmbL32RBmR7+yJ/c43hjlRYwERokACXeIxu2FDApJSLKKneCtoVqlPZcYq7TWe0l0nFnukVHLP8BOY7894TG01+UjnmSHMZHEQx8yHnC1zvLnOkciNZ+jlVryoeKCgv/s7t/DuzcSTsK5ykZM4/vU1bMd33U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767174167; c=relaxed/simple;
	bh=6NyyhcRHSRbBjOQ8whZAS+PjNnfwKSUqmF6OUVwGHdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDGNaV6cgKN8o+58HWo6eYfmnC6GsrXfJZuvRbO8L2aq7NDrtexRAQYiLg7YtAwvBjs4Kp3clJ+aBnc9swrQs1xxRidPw4Ps1P+6AFUdOz9GnSmcBMnwOZoClUksamJfQBQ3BExtbDTiNmBWRqubKurYjy8C9G9GBWmL7Z/ISM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEa2fbsn; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64b7318f1b0so12651692a12.2
        for <linux-mips@vger.kernel.org>; Wed, 31 Dec 2025 01:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767174164; x=1767778964; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhQC3hnAx6vo8ybVJwyWTzkkYGMOha8q8BXdXCtNSM8=;
        b=ZEa2fbsnG0HUCPuL/f9TUju7GtGrZ2Gs/x/d+fboujj0Q3gytjtVF8OD0pPeTrweSB
         Yv/Yzo0i84u9+A/o/rQ0rzx/uq35Kpfz5w4saSelrbBCPfHVkqJJIcNbA7NZsazxP7AV
         99MVmTAPMVxpUg9CVQZGbVg0qf4fG3BhNYSNcJlBJFiy5PF9x4dkwExWYpSdqxifvjVo
         CQUom1yIEPXSMt7VXFjo5piI06NIbofnFHIwZk16xDHoo1MikIK3GxF7I1877Ks158fe
         xp0D/ZSi54Bf1BrRzwY1qbh+5m5AHoa5PVaolJUjPRA9n77SFzEMcrApx70HqySAYkbe
         6s4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767174164; x=1767778964;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RhQC3hnAx6vo8ybVJwyWTzkkYGMOha8q8BXdXCtNSM8=;
        b=cyIgi2LBriMgK/Dz0nMFCP4PAh8W1Ip50PftMIqR6PYm50vdFOPd9bXu3HMT9Jb/hL
         ycxKhuMcf01AUr+TTG4/A1OES0U6B12Uf5S7Q6V516x6Y4pfeNmUGahXYcaReSmUREiG
         Oh2SrNGJ7+Une0rdGhOX0A754WUnbqfuXbR3GR1hkNE/nG+6kFKRyc9SZYd41w9WFES9
         /09eHGcu4fwAuo8K7+1RZkbW0tBl/6nQX1tlXWDbVa0oQ1GjhByI/BTVxhFWIGVbzbI5
         0TVtfvtuSfoZqvWnODyh/yS6mzxftcOl1X8fupPC/eqImsYEyg09bU7pgMwWYUECB/D6
         Hxag==
X-Forwarded-Encrypted: i=1; AJvYcCWr407jh5ZGT5OnvBuZrjlGrypCASyRbS8qneajZw3wpJGfA1SAg9O5/xmmK/N8PKi84K63ZZuUf37e@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9jfmTKHkshmOq/JxdLO6tgsavnNPAgxIrXiNK24mQ9WwFc6+7
	y5XYZovSgNh0nWhtYYFL2AgKOeX/D5X0xlcf6cyHZUiKETWHKa2ANrqz
X-Gm-Gg: AY/fxX4R+ck0a7L54MGcPrZv+j27L9UGYSFV+15I0kTG+4mxkaFaQkS4rARtatvEZWn
	furTJJT2IqDE/OxGiYS9xtTdxHO8KL8CmaQVVwdWtA3W/txRukQWSaZVLv3OTDSbL05IJcg/8kP
	kKHOMcuf3a/H26QPO5mCKuFCS9zV0o1JtiKrgaXbuyztJPUL84aMvyt77dUmzhcWXlSTKWqpoD4
	i1ACuUuADJA+c0iDXqFY+ArESrCSxaKJnAkWxg7SEyRxQ23wfc6ncKjd+4kPYKyLcdy7aDifJW+
	dSZ8AkpSnCPj5Ajkstx+uk5GdMg7hGRzk8sP0rJaqbUoweUKg4FyyLBCiwZtvOp0Nyc2Hs1lbpF
	5R3zjBAOdU82GY2lm+Mqmyp7zK0Xa0EF9ftQDhvQJ7/sDtCKPK5ZRDXX/rm0urnpg47uaIRuKWw
	0Eab2l2IgBCQ==
X-Google-Smtp-Source: AGHT+IG6BnZXWofbdukBItAk61uwrC2j9z3+nQpSf68E/xI1yNmjywUHcnARSPenSAEDWkU1hfWn1g==
X-Received: by 2002:a05:6402:2356:b0:64d:4f75:aa28 with SMTP id 4fb4d7f45d1cf-64d4f75adb0mr30963979a12.18.1767174163924;
        Wed, 31 Dec 2025 01:42:43 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105655asm37568985a12.9.2025.12.31.01.42.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Dec 2025 01:42:43 -0800 (PST)
Date: Wed, 31 Dec 2025 09:42:43 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Qi Zheng <qi.zheng@linux.dev>
Cc: will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
	peterz@infradead.org, dev.jain@arm.com, akpm@linux-foundation.org,
	david@kernel.org, ioworker0@gmail.com, linmag7@gmail.com,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-alpha@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v3 7/7] mm: make PT_RECLAIM depends on
 MMU_GATHER_RCU_TABLE_FREE
Message-ID: <20251231094243.zmjs7kgflm7q6k73@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <cover.1765963770.git.zhengqi.arch@bytedance.com>
 <ac2bdb2a66da1edb24f60d1da1099e2a0b734880.1765963770.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac2bdb2a66da1edb24f60d1da1099e2a0b734880.1765963770.git.zhengqi.arch@bytedance.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, Dec 17, 2025 at 05:45:48PM +0800, Qi Zheng wrote:
>From: Qi Zheng <zhengqi.arch@bytedance.com>
>
>The PT_RECLAIM can work on all architectures that support
>MMU_GATHER_RCU_TABLE_FREE, so make PT_RECLAIM depends on
>MMU_GATHER_RCU_TABLE_FREE.
>
>BTW, change PT_RECLAIM to be enabled by default, since nobody should want
>to turn it off.
>
>Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>---
> arch/x86/Kconfig | 1 -
> mm/Kconfig       | 9 ++-------
> 2 files changed, 2 insertions(+), 8 deletions(-)
>
>diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>index 80527299f859a..0d22da56a71b0 100644
>--- a/arch/x86/Kconfig
>+++ b/arch/x86/Kconfig
>@@ -331,7 +331,6 @@ config X86
> 	select FUNCTION_ALIGNMENT_4B
> 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
> 	select HAVE_DYNAMIC_FTRACE_NO_PATCHABLE
>-	select ARCH_SUPPORTS_PT_RECLAIM		if X86_64
> 	select ARCH_SUPPORTS_SCHED_SMT		if SMP
> 	select SCHED_SMT			if SMP
> 	select ARCH_SUPPORTS_SCHED_CLUSTER	if SMP
>diff --git a/mm/Kconfig b/mm/Kconfig
>index bd0ea5454af82..fc00b429b7129 100644
>--- a/mm/Kconfig
>+++ b/mm/Kconfig
>@@ -1447,14 +1447,9 @@ config ARCH_HAS_USER_SHADOW_STACK
> 	  The architecture has hardware support for userspace shadow call
>           stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
> 
>-config ARCH_SUPPORTS_PT_RECLAIM
>-	def_bool n
>-
> config PT_RECLAIM
>-	bool "reclaim empty user page table pages"
>-	default y
>-	depends on ARCH_SUPPORTS_PT_RECLAIM && MMU && SMP
>-	select MMU_GATHER_RCU_TABLE_FREE
>+	def_bool y
>+	depends on MMU_GATHER_RCU_TABLE_FREE
> 	help
> 	  Try to reclaim empty user page table pages in paths other than munmap
> 	  and exit_mmap path.

Hi, Qi

I am new to PT_RECLAIM, when reading related code I got one question.

Before this patch,  we could have this config combination:

    CONFIG_MMU_GATHER_RCU_TABLE_FREE & !CONFIG_PT_RECLAIM

This means tlb_remove_table_free() is rcu version while tlb_remove_table_one()
is semi rcu version.

I am curious could we use rcu version tlb_remove_table_one() for this case?
Use rcu version tlb_remove_table_one() if CONFIG_MMU_GATHER_RCU_TABLE_FREE. Is
there some limitation here?

Thanks in advance for your explanation.


-- 
Wei Yang
Help you, Help me

