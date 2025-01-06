Return-Path: <linux-mips+bounces-7270-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF8EA026BD
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jan 2025 14:38:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87E7F1885C81
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jan 2025 13:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3151DE3C0;
	Mon,  6 Jan 2025 13:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="NuN2UeE1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEF11DE2DE
	for <linux-mips@vger.kernel.org>; Mon,  6 Jan 2025 13:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736170672; cv=none; b=pyhT3SQZpsBK8TTvP9hjTJCtOixRT1DIXudXvfigH2ZnsEVG2EsH+XWbw0flHsMJxXCKga7iPrWEfJq9JRIXGqHOyJvSPNgMu4aZPWTNG8eRw/0VNTp+V0vHfxvIRxBMjwWmaiO8qto4ipKlHfdi6M+CrQq46zn/a/5+JZQdCz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736170672; c=relaxed/simple;
	bh=LrtzBOpc20LA4eXs+7jXvZs6h3AKiR2Si9ZU3N7n2dE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jSDY0Np/sWZ0zYCIwpU/SeVEqeJiFmrnXeVfNeKzSGBTiye5EWgRYUYEvFpZkM2EGT64GVQ1/V1g7VHvFRYZBlVNG47LLaI1wGnpavffyMZyNM1AIQx5FyPQiKICg9I+VuEh3K7hRiMSWlDtIqfbykvyC8js74DlpiS6wYeW5lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=NuN2UeE1; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21644aca3a0so23076125ad.3
        for <linux-mips@vger.kernel.org>; Mon, 06 Jan 2025 05:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736170670; x=1736775470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=45XLTheYrSs123jVGiTYWA09gh8PmFWTSz2LniJsnL8=;
        b=NuN2UeE1GdCda6qrwFsmhiL7uWpUjeNKWHV3aAfKBp8gSVqZZ5qyv+AVLM00GgPdK9
         34ZNTRef6uiMLHGdMy6X3j+8PPHLGyCij8sVkhOVqz1kdh6sju+ib3+UTUp2e1WUATZ/
         LPTcHdj/VdjBjm8Uq6LfMc/qkEEZe9NkloicHQagMxRkH1zm8Gjrzvcz2ouCQMQqcZlK
         NsVYHQkQ/pOjvND16yXWpzsfuJbRraihd1O+SvlBKuUkjnP5NfzTtCpBMbwHjFv1omZ2
         4HxJxAZRyeqClmBYfFHu+xRpc5hTaKkBPcD5nP3/A4CnBkXmLZP29mkiy/4GqvEve0gJ
         gxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170670; x=1736775470;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=45XLTheYrSs123jVGiTYWA09gh8PmFWTSz2LniJsnL8=;
        b=aqckhPAvEUAUqdAbgf68FPjdjReb5FTY7r1xfMxt6EBXhvMYmtQcwDQ8aXNuEFXg3/
         t4ds4n4o0SdesUm8svRNNNMcLwSO141ITqUupesSjQY+47othr+jU6LS3IHNKF2bhEoZ
         udqd6W1GCxf8S6yUT0QNl2RiHzjaCVC4i1u1pcxyD8IYmjrwBX/NIINfxjprgvjXw1T7
         ppxZ+IuIcTPp1oXCdPgl74Lfd1zAgVnfURHskAnJtMsjYXj0tTA17Kc61qKGjwCdFSH1
         cnK/hFSzcY1actVNUQwqQdLgqyOfwZAQMPlfGbFd2OxMvfFy8h2ZrzBS0HZhTt5vhnWo
         iESg==
X-Forwarded-Encrypted: i=1; AJvYcCWe9smUVPyJX178hsf8tH+6C3Ok/Xnx3wa1DR3paNegb3kELE8AJ62CRsGaQW151ZnQjwSvZat7ETfp@vger.kernel.org
X-Gm-Message-State: AOJu0YxIPXVl7cUowpI4opxblslrIR9qXgOsRjtJrLD2qQjCMWjrW52T
	7QUPEZEKjJwqhUqT/bXK6Se+u0fuZiROwH7yJobmdOWp3urc/Rkt/4RIL4pZMUo=
X-Gm-Gg: ASbGnctLLatQ4NRv/BM5Ej0OolYb/J7bk/iHEf6mn4H5tZkKyauOq9ZQp8We2hhHsRy
	xjLaivK2LhmcpovYfLvqrW0jA42QujLLWTfKAY62hEMdu1E3gt8KW44HR0IffxtgCI0aXbWj2JD
	hMHiutpDlfwdHfQROfgt9DUjNNh+IO6sqf3Pfuhqj6U3FsuSSAY4NCcBkG71CV2sS+cdAp6p7xG
	oANeFihyvxvqbijDVEESQvPwInqZGUSc2njCBrTfLqLnnoiezoz8Gnawiqq1h6jJXllfxHIuj71
	o3MJXmDtaVmDB3yYBPohDY3KPovbd/reNu0j07CC8MrURZ2Zcesq
X-Google-Smtp-Source: AGHT+IFnWXSZW4FIIFkfBRxwzvmAw3s/HsdTqMia2pBdvLu70V6jfgNFfu5B3ABCLJ+ulhyhNt7Jxw==
X-Received: by 2002:a17:902:c406:b0:216:2bd7:1c4a with SMTP id d9443c01a7336-219e6ebb716mr865705425ad.26.1736170668665;
        Mon, 06 Jan 2025 05:37:48 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:d64:296c:a8f3:f81e:f88b? ([2409:8a28:f44:d64:296c:a8f3:f81e:f88b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f51a0sm290583325ad.187.2025.01.06.05.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 05:37:48 -0800 (PST)
Message-ID: <760c9610-a11b-4bc2-852e-340adb27f666@bytedance.com>
Date: Mon, 6 Jan 2025 21:37:36 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/15] s390: pgtable: add statistics for PUD and P4D
 level page table
Content-Language: en-US
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, palmer@dabbelt.com,
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
 <35be22a2b1666df729a9fc108c2da5cce266e4be.1735549103.git.zhengqi.arch@bytedance.com>
 <Z3uxVkg3i7zXI92e@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <a3a2bd64-9952-4c66-8626-f2436ce07d1d@bytedance.com>
 <Z3vb+0MktvDNysQD@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z3vb+0MktvDNysQD@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/1/6 21:34, Alexander Gordeev wrote:
> On Mon, Jan 06, 2025 at 07:05:16PM +0800, Qi Zheng wrote:
>>> I understand that you want to sort p.._free_tlb() routines, but please
>>
>> Yes, I thought it was a minor change, so I just did it.
>>
>>> do not move the code around or make a separate follow-up patch.
>>
>> Well, if you have a strong opinion about this, I can send an updated
>> patch.
> 
> If you ever send v5, then please update this patch.

OK, will do.

> 
>> Thanks!
> 
> Thank you!

