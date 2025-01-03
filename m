Return-Path: <linux-mips+bounces-7230-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E230A00356
	for <lists+linux-mips@lfdr.de>; Fri,  3 Jan 2025 04:56:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1523F1629EF
	for <lists+linux-mips@lfdr.de>; Fri,  3 Jan 2025 03:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461181A38E3;
	Fri,  3 Jan 2025 03:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="K26r34FV"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5417E1514E4
	for <linux-mips@vger.kernel.org>; Fri,  3 Jan 2025 03:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735876609; cv=none; b=qUVaOFecdn2hQJwFWxOu2bygjH6pA+orpk54+ODMuPjpcfwzjT/5wUJqG7bSSWRZ4CBmuQBqPfZNtJRelMJyHJTLTZvZi/gp67Gnw9XSLO4tS8o8t30rPL6nnOQ2Powzh+uYZxtvSEnwKNuarJDjNIKkyRTEpBq1d9O7RRbNcA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735876609; c=relaxed/simple;
	bh=1jkG8vOEuzvlWn7ntVxS/sK5whSZ5XgibAKAEgNYiaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gPfuCcvdcZ4S2Div7otLhhBklKRSPCR4sHgOfcKCtC/cJuT5PeWFvZk/cYEl8VvGgFBZKxLInGO8CzNIk7d2OLYZPhBsACYR+eQo4hDfNOSz7CSiA70xgt3POJ0uIfq7PEAHjjgQfJcFgKH8GnH7cIdLa8YLl8QRBR1TMqgxsgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=K26r34FV; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2161eb95317so168525915ad.1
        for <linux-mips@vger.kernel.org>; Thu, 02 Jan 2025 19:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735876607; x=1736481407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZAFSLXktiWezwRLeMqNHQIZ8a5HqagkfYDHtpNVk3Hg=;
        b=K26r34FVNTcZwPLj6f4ymNKka4VUcf//GDw1A2+SRAXLmH79YjVz5gnL3hdKoBv6Q8
         d2LDSBnBWpcTeZKujlqZzaWcjPk1CvU6Qh+BT6PDL/7g7DGNRV45hNfVTP4JaJ5tjP7p
         KX1G2SLI+NWh7+IcSIWJyskJXQdMiRveP9cId8eM8ihs87TozkikaX1PEMoylMqfDicK
         gTYUyPGwlXGsug+rZTCC7jB0fgBwqaAmbu/4kFkUPhvoSzduW4gZa9V6WMgu9Ru3sie6
         bnNEJMnJYfA9pO/3U56/e1WDKOrQp+Ix3SpVgasoq15vFqlvTNpbwViVfr85ArS/2V/M
         q7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735876607; x=1736481407;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZAFSLXktiWezwRLeMqNHQIZ8a5HqagkfYDHtpNVk3Hg=;
        b=Ts5v5aymmfJJpiAZR1ZjX257y6XPBh3XE8ywCb4jmeVreuySdVM3bzZwaBJ2SBxA5m
         qmjCd/3BGgbAnhYHGqlafkSgxilzvg+l12SmbBIp5Jyh6kDWh4ql4CGzAjcA5TWzC6SJ
         9Dhp8JDYlPKV8pGNRjbIYsZ/9jMY0xU2ajiQWu8/FfI2br1CXZcqr39wdt39fguAiEV7
         UwVesiStkwPz+AWhAC0jAwKZm+T44dopUgK4S6JJiyf4cvPCBhXjR/Xooh7TNDu7X1h/
         jiA9SiiKEH4Pt41JUm0bqSwk/XKUxq5I13tI8pT8Bf5xQNgtcQKOjS1/Ux3TK6bww0mq
         93Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWBDbkhYc1I/qjSzflQrHAS6bC8N/Ig5nNmq5gRH7eOOajECBgurzKNmGewEHYMJ21RgS+ifXJ1tdoJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ0LraWe4wsXmqAI0yOGqHVfMp1Vx4RUIGKAnDwOmxZmdevsKq
	I0u94qM8y9YfH5BpudVGMjlKDj/XifbLmAqRdL2ilxBf4t48j4rXlWjzdeMiV4s=
X-Gm-Gg: ASbGncv1oCkqaBoiTev3n4AxBstMwkho4z0pDURbih4s+noMBQg/8cWctpU5dS5XdqE
	Jm1EcDYPHjXRZLCKdxotRWLvv/dZVDKADmvWuG86P6ETeaM9c9HQrPCyYhBuTNAqIWUbmo3SsYp
	IMOetUd0t9Tp90uQGho2i52C1yGLdZV+hTu+D9IZjE3etkc8Nz1tlpl2PnEY22paINd4zCLUUsE
	SmJZCixn7poc4sbH8aV6nddnv0YzRUhQY2pjYsRser/NK7bhr9tORMt6emHSmUEzzJ/c0gkodCx
	R76jAw==
X-Google-Smtp-Source: AGHT+IEc/ggyHLTYoMeUluV4bigOVwXpofNkIsaBMCcId3pHP1FalWdw/+NGvDWYCJeax838Cotn8g==
X-Received: by 2002:a05:6a21:158d:b0:1e1:ca91:b0e3 with SMTP id adf61e73a8af0-1e5e0800420mr68823527637.36.1735876606776;
        Thu, 02 Jan 2025 19:56:46 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbafesm25847661b3a.128.2025.01.02.19.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 19:56:46 -0800 (PST)
Message-ID: <1cea8c66-626e-434f-aafd-9d44d37f5cc4@bytedance.com>
Date: Fri, 3 Jan 2025 11:56:32 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/15] move pagetable_*_dtor() to __tlb_remove_table()
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: peterz@infradead.org, agordeev@linux.ibm.com, palmer@dabbelt.com,
 tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com,
 yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <04b0a778-7a6b-4df3-b40e-ca76adddb243@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <04b0a778-7a6b-4df3-b40e-ca76adddb243@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/1/3 01:00, Kevin Brodsky wrote:
> On 30/12/2024 10:07, Qi Zheng wrote:
>> Qi Zheng (13):
>>    Revert "mm: pgtable: make ptlock be freed by RCU"
>>    mm: pgtable: add statistics for P4D level page table
>>    arm64: pgtable: use mmu gather to free p4d level page table
>>    s390: pgtable: add statistics for PUD and P4D level page table
>>    mm: pgtable: introduce pagetable_dtor()
>>    arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
>>    arm64: pgtable: move pagetable_dtor() to __tlb_remove_table()
>>    riscv: pgtable: move pagetable_dtor() to __tlb_remove_table()
>>    x86: pgtable: move pagetable_dtor() to __tlb_remove_table()
>>    s390: pgtable: also move pagetable_dtor() of PxD to
>>      __tlb_remove_table()
>>    mm: pgtable: introduce generic __tlb_remove_table()
>>    mm: pgtable: move __tlb_remove_table_one() in x86 to generic file
>>    mm: pgtable: introduce generic pagetable_dtor_free()
> 
> Aside from the nit on patch 4 and the request for clarification on patch
> 10, this is looking good to me, so for the whole series (aside from my
> own patches of course):
> 
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

Thanks for your review!

> 
> And happy new year!

Happy New Year!! :)

> 
> Cheers,
> - Kevin

