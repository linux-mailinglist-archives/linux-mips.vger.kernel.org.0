Return-Path: <linux-mips+bounces-7229-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3512A0034B
	for <lists+linux-mips@lfdr.de>; Fri,  3 Jan 2025 04:54:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C376B3A32D6
	for <lists+linux-mips@lfdr.de>; Fri,  3 Jan 2025 03:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E97019D8BB;
	Fri,  3 Jan 2025 03:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="AZBWcdEZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A19B186A
	for <linux-mips@vger.kernel.org>; Fri,  3 Jan 2025 03:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735876453; cv=none; b=PFr1EDVdyAQ4nkUjwL+u+nFxOrNRNx5p67Yh+o35nTV6RZMD2cWSq/QSxJ+TZ9NgROPKpuLnGy45M+ur9n0rPDGMPgTsL9qiPFej5BaTqikjVgg2KSn8TwRmthlcHWvwiIraO2SElUUq3Pa7cvn9j1u1QOtyyWTXuBW4Y/3l1lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735876453; c=relaxed/simple;
	bh=FQ5D1Kx+YlPJIwMGyXspAy7bXvtTs/Tb+GWLn9dccaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HT6lh+wPnUxXX8VzLLNBxDmx1osbNZ41Q66yhZPVlcBmQccGltcEXzLiZKsljMtbJmzY0K9PEfsLoloEIgtyYlw3yzM2I2cq8dlEJBKYJoEA08T3u8WYtcAvmZNf2pLeK7AxO2QlmzBlF+sbjZ2OBIwDeD2Lpnginxx0uwplzaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=AZBWcdEZ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2163bd70069so65841405ad.0
        for <linux-mips@vger.kernel.org>; Thu, 02 Jan 2025 19:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735876451; x=1736481251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ExtURrdtg4wvz/5S73kPKLfYL+g+cN7JWlBZcDSiUw0=;
        b=AZBWcdEZaNC+rG26GO/MJaHvesaAdqBYdCjqcv6/fSF/L5W7TfSueFG2l17j+ZqY6/
         NHIOaEeVcHvVNP9c4kPWAIeb1z4JuGhHO/I0Uwt+mS82ciXOzhiV6LnFuVfei2UcAykk
         el+lfLVCXLI1EkRAOSEq+V+3xwqJ516kTNVSDlJYluIP+vRf50A8JnTHwfMX14avKLFt
         mH/9xFwtxGmwdJ7klxqWgT9TeIOA1aPk/jdmVDLeDr0ipsnRwKkefLIlMElWD5MH9jVn
         vhhtfVrY9m7kUStZKCRKilFUc1fj3lIHLVNIs8uEYcSDfwxfeQpVrBAxaP8kwUDxDM7U
         RI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735876451; x=1736481251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ExtURrdtg4wvz/5S73kPKLfYL+g+cN7JWlBZcDSiUw0=;
        b=OUhLXBHeSfxV2E/JeTpNeox3hIzoJze9aofwnlNPnrzd+m1N2xCXK3OdTn0IUNWuFb
         sWZPVMb1XCjHqL0uQYsD6x0a4rFsHE2FSLbgZchiZ4T7a7vuENzfGhgeLxX5f0WLmphk
         XozTI21RVqJfd6A5Isb1qWh64NjG0lWubBeCTSFhoEOfpSWdb3qaLi1rw1hNqPdyctWv
         +TRySFnikqNcUhnXI+C+tHoD1KgXysjYFldwmKNuw4iwK72DALzgiBmy1t3W6voPOop1
         3V+BgCB9U1Qhq/qSvMornJICkceF4znc2q625LqTkstzRRzPp0Qmj+vFS8m0DHQAX1FE
         bM4g==
X-Forwarded-Encrypted: i=1; AJvYcCXben7qiLgvSo19RfYFJ31MiCcS82fsIoh/7TG6liJjN2Uy3omERQToyMLsN7mWkOeFxzFCZlQf4PpK@vger.kernel.org
X-Gm-Message-State: AOJu0YyDNzBoz0pA4DVFpvyajK2Tphswm86ml9rq9bSTDj6S4eSfhYTo
	D/k0dXHWP8Wf6/3Ojz1d4iG74GW7r9iVC8pnCAc3FdUguHiCQQxPYKhQHWymUQc=
X-Gm-Gg: ASbGncv1FY85d93/EepCk0XbPzH8JWEdMK48+43HBDw58lvFhKAjx0Ehu2n3uSftWEC
	aPQg7Xgv06y6WOFCKupNqynkxN5EaVQagYy8L6Zb6VRoPZELw5cWdXVOBpYp/9wT1F9kv4VGjvL
	0NEKRyCAWonvjC9kqY5cCHML70Uw+Q/dHRXQIisyV0O2MVJSKR9wHp3dJHoyS6Ml56s0VGJL9PG
	yNvtJAYxw+PwbChU/rDFIIusAwTxqnBNmKTgY77VZPKfe0EORJiq59HI04yPwrw/WqMic7KH30N
	WcF1Qw==
X-Google-Smtp-Source: AGHT+IGRLBberTsNPcVz5fDDiJ496OTTAGvxwwTdPWwuUiji7gMKzctc+wxIQ/Y0LkCE8MhlfHWUlw==
X-Received: by 2002:a05:6a21:6d86:b0:1e0:ae58:2945 with SMTP id adf61e73a8af0-1e5e081179bmr90059001637.31.1735876450877;
        Thu, 02 Jan 2025 19:54:10 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fba98sm25284573b3a.161.2025.01.02.19.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 19:54:10 -0800 (PST)
Message-ID: <77c202bf-e0a3-45e7-bf8d-eef7903e3c64@bytedance.com>
Date: Fri, 3 Jan 2025 11:53:56 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/15] mm: pgtable: add statistics for P4D level page
 table
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
 <2fa644e37ab917292f5c342e40fa805aa91afbbd.1735549103.git.zhengqi.arch@bytedance.com>
 <237a3bf6-c24f-4feb-8d3d-bb3beb2fd18e@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <237a3bf6-c24f-4feb-8d3d-bb3beb2fd18e@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/1/3 00:53, Kevin Brodsky wrote:
> On 30/12/2024 10:07, Qi Zheng wrote:
>> diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
>> index 551d614d3369c..3466fbe2e508d 100644
>> --- a/arch/riscv/include/asm/pgalloc.h
>> +++ b/arch/riscv/include/asm/pgalloc.h
>> @@ -108,8 +108,12 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
>>   static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
>>   				  unsigned long addr)
>>   {
>> -	if (pgtable_l5_enabled)
>> +	if (pgtable_l5_enabled) {
>> +		struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
>> +
>> +		pagetable_p4d_dtor(ptdesc);
>>   		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
> 
> Nit: could use the new ptdesc variable here instead of calling
> virt_to_ptdesc().

Right, but we will remove pagetable_p4d_dtor() in patch #10, so this
may not matter.

Thanks!

> 
> - Kevin

