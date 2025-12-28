Return-Path: <linux-mips+bounces-12635-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 793E7CE508B
	for <lists+linux-mips@lfdr.de>; Sun, 28 Dec 2025 14:30:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E230A3007235
	for <lists+linux-mips@lfdr.de>; Sun, 28 Dec 2025 13:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F363296BCC;
	Sun, 28 Dec 2025 13:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBbJP4Wd"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB73F215075
	for <linux-mips@vger.kernel.org>; Sun, 28 Dec 2025 13:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766928601; cv=none; b=YBg4tjrW1qvlMzefMqImWW8Ht4AFBDk3emwuJyUAeohZdXBu4yNbw6Dv/1WrwoKb0K7V28baDfhsgeMpStJnfHHZ6PftCfWu2soT6DcUUv6M9sSVpoEqd05gYAFnRKMcDJV7hVKYrzCZq6sgGMaXAxgh2srSb1IJmCtl1rum86Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766928601; c=relaxed/simple;
	bh=wzDS29pPv16SN5nJL5o+rnuk9lYuas+/v91h2NRmxn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P1FHYojJj8rkpg4txLQ8Xk/d/6AY11n4NQ3d7EmzScsZjGBHU6QksOGF/HUgTXSXY1eXWVJdyjG4xDpQNsDlge5zmoDo0CVBzsqV1ICJFXekZ8sscr+YtKoLIJbADQp46g9pqvTe8L/MggtW0eHXRnKbHJOPy4UMhH6PwojWBEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBbJP4Wd; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-598f8136a24so9403974e87.3
        for <linux-mips@vger.kernel.org>; Sun, 28 Dec 2025 05:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766928597; x=1767533397; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7lWyQqsYJqWc7lm9cTjRQLwXSVE/IuAz3ei2okz3340=;
        b=CBbJP4Wdvc5B3CtNBGl5G6PisnIwIVLPNh8y4Kkq93W609O9ot7XWQibM0OLU65I/J
         fZSkQapbMmJM9qylzG59pNAQQCoFbf7eLiNYx/sdrlqO75lpbsXWsTL8/8GFqamEzxFY
         WA8ACeyUJYEi9eeF+y7nq3g+RuqCjgjKrJwuxJWVEXUajudGQCXirn0V8LI53fholcUn
         f97854AWZmSeBdJGIM5wG+a+i2oIfMXPbNrMsFtJ8pvQFKK2eeahgADjCIlZM73yW9Bg
         j4Mn2JayNUGtPg8x6F5e6VX+R08Q7VldGFH44K83MM0RuS7lm/zMLjNaijINZR5KbalO
         uEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766928597; x=1767533397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7lWyQqsYJqWc7lm9cTjRQLwXSVE/IuAz3ei2okz3340=;
        b=GVqM8e43sB25ffLe4C8Pe/cZDgVgkQSKOea8mybIOuvy7lLFVMO+BdLX8hvG5hSUVq
         Al82XXNgRyhdGWCww7VzXc0/YpO+BOAehgHwpHmkbkHazxP4AlTs43EZa7wsi5ODMj5N
         BJGQ5Z3MhBtBOrVZjnoDQufpKo3qIq4cejoReJpXTCOV7c0eAms7icTekB8Fx4Tatsq9
         jNLshzzjAlRyXnjaa6FqYY8s1PWK6YSITVDl459cs1SywA+Apq2jwFZE4s2ioF1SFXLW
         bwbNRMLdoxcEluy7mq4JGSN2MLAxq5F0G8YRGnP2goDtWXj91gmBR++q/zr9l/yqgub6
         qY4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCmz+bOmoBq6NKv/MA8eOKN+irW1xS/NtEZOoFtGovOl/AesryeqpHc/gX2hHBXFtNWy6rNqNoP256@vger.kernel.org
X-Gm-Message-State: AOJu0YwRK8tsgjQxU85fmCF+VZlhfOWf4cTMP91cx63wK4K0apK/UI5X
	CdQ757SFR/O2rlzuDA3JuHOKc1xGovv1gYgRC8rdgypQ5q6yXgKVNUib
X-Gm-Gg: AY/fxX64HLugzUsx2RDW3hqQmSOrCxkTF1IyEMhGiDR2iGyp07pnKjg86AGnRQgdPXr
	cNtQCA12zvktpoIiOEjn3J8axOVhn2plfhdQJMWKtjtwJqRT+vs5iDpelXNpijHlP7zwBskVnhj
	XC4D074I3/Uo9rfXbh80jKWXJ+Dc94djH38UQhL/dPpWT399FV12UTq1mtso/38z/AA8ppyuDRp
	gEd2+ouWwsPd8icTb5rQSoEsSlepl6XuIGXcjGry9RodNJ4D6ZornALIrBUoXZ62mekjvvGmPEm
	sZuTniUi9T/ntZVYrTern+CH9Ns+E/hZl3o+Do2RvO2aQ6JqWN7tgrhfTh78Y9e9wJ9sY3kAtSV
	6VZq3HZqzJVquDpgoOR9rYG0hMz8xg6HzghRwbsuBwNxHYxO7hgNiaQZ022Gb+LV5r+Yncf2ISz
	SeimkBBvngYEZI/KZEUt0qx+Ckg8Y3ySe/vMIQwK4Z1MQcJOPTJs41s2RdeEboTaSTJxSJxUTQK
	CwJSCpG
X-Google-Smtp-Source: AGHT+IGo/pr+AQ2VNaaG2TyhewLh2BG0nsRAoXdF/d33J1EZZvYOr8FxE2Re2WZCgj4kGCoIAYrr8g==
X-Received: by 2002:a05:6512:3b0c:b0:59a:11b2:2c08 with SMTP id 2adb3069b0e04-59a17dd5fb7mr9312428e87.43.1766928596662;
        Sun, 28 Dec 2025 05:29:56 -0800 (PST)
Received: from ?IPV6:2a00:1fa0:425c:b771:d34f:d055:3147:bcd9? ([2a00:1fa0:425c:b771:d34f:d055:3147:bcd9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d602fsm8238417e87.11.2025.12.28.05.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 05:29:55 -0800 (PST)
Message-ID: <d58d6cfa-d9d1-47fd-91e4-533756f3b3bd@gmail.com>
Date: Sun, 28 Dec 2025 16:29:49 +0300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/28] x86: don't reserve hugetlb memory in setup_arch()
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
 Brian Cain <bcain@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Stafford Horne <shorne@gmail.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org
References: <20251228124001.3624742-1-rppt@kernel.org>
 <20251228124001.3624742-26-rppt@kernel.org>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20251228124001.3624742-26-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/28/25 3:39 PM, Mike Rapoport wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Commit 665eaf313314 ("x86/setup: call hugetlb_bootmem_alloc early")
> added an early call to hugetlb_bootmem_alloc() to setup_arch() to allow
> HVO style pre-initialization of vmemmap on x86.
> 
> With the ordering of hugetlb reservation vs memory map initiaization
> sorted out in core MM this no longer needs to be an architecture specific
> quirk.
> 
> Drop the call to hugetlb_bootmem_alloc() from x86::setup_arch().
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/x86/kernel/setup.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 1b2edd07a3e1..e2318fa9b1bb 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -1191,7 +1191,6 @@ void __init setup_arch(char **cmdline_p)
>  
>  	if (boot_cpu_has(X86_FEATURE_GBPAGES)) {
>  		hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
> -		hugetlb_bootmem_alloc();
>  	}

   You need to drop {} now, no? But seeing that this *if* gets dropped
altogether in the next patch, you may as well ignore me... :-)

[...]

MBR, Sergey


