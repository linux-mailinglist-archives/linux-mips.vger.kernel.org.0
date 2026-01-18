Return-Path: <linux-mips+bounces-12955-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DFED39346
	for <lists+linux-mips@lfdr.de>; Sun, 18 Jan 2026 09:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 706A8300384B
	for <lists+linux-mips@lfdr.de>; Sun, 18 Jan 2026 08:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B5C27E07E;
	Sun, 18 Jan 2026 08:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzQ5aXSe"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB68627CB02
	for <linux-mips@vger.kernel.org>; Sun, 18 Jan 2026 08:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768724055; cv=none; b=n+rLwmewaPpOgNvNV1nseGedGDJYst99IqOxk2LjbFTT1XmLi6/3Sau6EEEb6D072crq3e3i6v4OOPVcPhyP7vRsWjLrJaYvTfR3SUsWRlF8IF9EwitLL0i1FJwuj05ABkIt1r/5bs9NWjeNqNeBHJJm6YTp+PaLaRIs7nzaL8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768724055; c=relaxed/simple;
	bh=QgT2evQuj3cvQqRAA1G9AXLS+KHzWpz3urey0I2MaQM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=eLfanE9x03U3qcUWKGzuFONNUBY2YhxJfoSsoONdruYH4QSRgayqZL5c6qhnpTAGKZYipIQwq38KBCM7mq127/gJKeqrNTbRBXtnOxRG3yZrTQytjPIQnasAXLJSwzN8vuEiQ73ukfjT3xS8lwfcOkP6zBbPBft54WFDczCHmVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YzQ5aXSe; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a2ea96930cso19804845ad.2
        for <linux-mips@vger.kernel.org>; Sun, 18 Jan 2026 00:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768724052; x=1769328852; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X+fhLmMt6EbvGWzllqZJVhmHGvaT37bdUz8irugZaMU=;
        b=YzQ5aXSezflQSS4fyv6YrVmbfYKirEpnZcjFX8vKbHywdSy74iYS6281s9Keui7EAZ
         CQ5KoP6iC97nn7Kv0GsSObUSL2JQywB7nmYE676KDVv4XZKKf3hlx24Q7ny3bd8jpEJl
         gDuJ8d45gtLMWZYw4UJxjV39vcXirmfTu79baWdlAJlll6LfU4Mj9VzAHpfW2p5Bn0mz
         Kw0s7hbWKRT7+vEb79JxIrGc8laHKof/zs22o8Rff0TwpBUlD+Is2rYEPfhRcs+6MwIC
         Yqp50pTXO4z7pH/OINQ0KX7kFvDuxlNiVIV5M8DiZ3pAS6VD591IxrR81OcXia5FHQJW
         x5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768724052; x=1769328852;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X+fhLmMt6EbvGWzllqZJVhmHGvaT37bdUz8irugZaMU=;
        b=F13idEBKEQeiO74HXfcxCY+h/kCNevwF9MEHUzYb1we22GKhh0YSDyPCODkKoWacaX
         GL8Km6bA+RfzUtd8vtTloviuZWwjwMvt9BAvgl6Fxl9UsjRXbCVCMlg75ahKNQx/qZKH
         sOwzggDFI9PcBFKQNfzNZxKH2QJwQdECN4cWAi8c0SSRs+ZpbGMyiNS4/JUysTQBUyvo
         jBDgHcOMfsWs7tX2a5VuXl4HowUPHKlsdVyEHSuBAgZqi3PXdQpjeYisalGlFWun1f6o
         qNAZ2RcLAnss3rvXTh/wEt67LrDj+jCLHL9v8ZburOfezgqGvMSDAGnHJ1szM+YuCsyI
         h/Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWoIGCy0x1SOVZqbIrnrDquQWeu7FoSdu4kPv4R5gNe8ZQhyUwMEM4JBJpMy+dSezxmo/1xN1AXuXME@vger.kernel.org
X-Gm-Message-State: AOJu0YyFQkG66/uEh0y/Ww/+K/+HMjVQIZNBx1jYj+WImDgtfnsJBy9T
	JnKLYYRRsMeAj+QZbXPErq0ynQ6uyn2LDmnfCVaegHYFpcBlTNnjo7l4
X-Gm-Gg: AY/fxX40MUus8nhYkSIQUTotAbuLaQ8XnrrkaVjc5cD6D02DgqQbru1g+y89Wm1lAQR
	c4T8z+mXEJxD6h8ouINWy3Q5qKh1yjWSG4KHa7QjYd+yuDMMaoIlQ8Y7A80+hlZd+m0h8u7ndC6
	DskHB81s7bkTkn2rPEwZ8KrqE3ai7J0BRk9b+ig66ZbDinNGvpegQH9iHkk0nQ+SGhVN9u1ao5f
	LnPyoT0euk0PTqSHKDLG2NVSkhjtc/tYkkvWzo9OycITcwCqkHjS0CtyHWNcDPtyHcZlbeE1Oub
	s21YnjZnNGnX6nRdoz46hqzA0vKzgLc95MuJhNzxmqC0ccKH0Ey8z/2RVeQ7SOO0iKc4B/CNXUq
	zcJW/FwJ82AGiJKjoGeKOPIEXp8J3fZX2zXhAfQsuURig800wDXLunCsOVVRkTTiQIwX0G6pw1c
	6ub+LGxx55
X-Received: by 2002:a17:903:40c5:b0:2a7:3dae:de9b with SMTP id d9443c01a7336-2a73daedf5fmr2287485ad.44.1768724051933;
        Sun, 18 Jan 2026 00:14:11 -0800 (PST)
Received: from [192.168.2.226] ([114.92.45.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190abcf0sm63240195ad.12.2026.01.18.00.13.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 00:14:11 -0800 (PST)
Message-ID: <85a0be43-3598-435d-a50e-9403b7e963f7@gmail.com>
Date: Sun, 18 Jan 2026 16:13:47 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/pgtable: convert pgtable_t to ptdesc pointer
From: Alex Shi <seakeel@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Mike Rapoport <rppt@kernel.org>, alexs@kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>,
 Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
 Brian Cain <bcain@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 "open list:MMU GATHER AND TLB INVALIDATION" <linux-arch@vger.kernel.org>,
 "open list:MMU GATHER AND TLB INVALIDATION" <linux-mm@kvack.org>,
 "open list:C-SKY ARCHITECTURE" <linux-csky@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON ARCHITECTURE" <linux-hexagon@vger.kernel.org>,
 "open list:LOONGARCH" <loongarch@lists.linux.dev>,
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "open list:OPENRISC ARCHITECTURE" <linux-openrisc@vger.kernel.org>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>,
 "open list:USER-MODE LINUX (UML)" <linux-um@lists.infradead.org>
References: <20260107064642.15771-1-alexs@kernel.org>
 <aV4h5vQUNXn5cpMY@kernel.org>
 <080e493a-e4f1-4c97-a3e1-f76f126b5213@gmail.com>
 <aV5yIuGi9Ni5YP5E@casper.infradead.org>
 <1d110134-89ab-474b-bca6-cfbfd4b5057f@gmail.com>
Content-Language: en-US
In-Reply-To: <1d110134-89ab-474b-bca6-cfbfd4b5057f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/1/8 10:23, Alex Shi wrote:
> 
> 
> On 2026/1/7 22:48, Matthew Wilcox wrote:
>> On Wed, Jan 07, 2026 at 05:28:36PM +0800, Alex Shi wrote:
>>> Right, I will fix this. and sent the 2nd version.
>> No, the patch is stupid and wrong.  Don't send a v2.  You seem to have a
>> hairtrigger resend, so I'm trying to prevent a v2 being sent instead of
>> sending a patient reply.
> 
> Hi Matthew,
> 
> I hear you—no v2 will be sent.
> but sorry for a bit confusing, what's your expected fix? is the too 
> quick resenting? or the direction to alignment pgtable_t with ptdesc is 
> wrong?

Hi Willy, Do you mind to share the detailed concern for this patch?

Thanks

> 
> If it's the first. the new change for review address Mike's concern.
> diff --git a/arch/arm/include/asm/pgalloc.h b/arch/arm/include/asm/ 
> pgalloc.h
> index a17f01235c29..a204c3ac800a 100644
> --- a/arch/arm/include/asm/pgalloc.h
> +++ b/arch/arm/include/asm/pgalloc.h
> @@ -94,13 +94,13 @@ pte_alloc_one_kernel(struct mm_struct *mm)
>   static inline pgtable_t
>   pte_alloc_one(struct mm_struct *mm)
>   {
> -       struct page *pte;
> +       struct ptdesc *pte;
> 
>          pte = __pte_alloc_one(mm, GFP_PGTABLE_USER | PGTABLE_HIGHMEM);
>          if (!pte)
>                  return NULL;
> -       if (!PageHighMem(pte))
> -               clean_pte_table(page_address(pte));
> +       if (!PageHighMem(ptdesc_page(pte)))
> +               clean_pte_table(ptdesc_address(pte));
>          return pte;
>   }
> 
> @@ -141,7 +141,7 @@ pmd_populate(struct mm_struct *mm, pmd_t *pmdp, 
> pgtable_t ptep)
>          else
>                  prot = _PAGE_USER_TABLE;
> 
> -       __pmd_populate(pmdp, page_to_phys(ptep), prot);
> +       __pmd_populate(pmdp, page_to_phys(ptdesc_page(ptep)), prot);
>   }
> 
>   #endif /* CONFIG_MMU */


