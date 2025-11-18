Return-Path: <linux-mips+bounces-12269-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0C5C6936E
	for <lists+linux-mips@lfdr.de>; Tue, 18 Nov 2025 12:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 18BD42AA1E
	for <lists+linux-mips@lfdr.de>; Tue, 18 Nov 2025 11:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C6A34FF66;
	Tue, 18 Nov 2025 11:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6KXI7E3"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA7134F46C
	for <linux-mips@vger.kernel.org>; Tue, 18 Nov 2025 11:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763466919; cv=none; b=VV4109ggjaGgEPTQhOa/RUpSGBDVU/Y/Sd/duTPp+j96bE9YYLgb409WdNws+O9VenZSH11NEeaoh0+KMah2giNl5qB/0mFZmCvlxBGzDwf2SRS+nClMijmFUCxJlUjHvSl6bmULMScTDD9/huzwvM5i7/4jB5clGWHlEDYgCqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763466919; c=relaxed/simple;
	bh=jneRGbDx8iaCsHjcSO3LMYs6xm0P9/PiTsbxJnh68lY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DvR5wvbfSezxRTgTVZbTVox/IECP9xRWvNgjvOKCSdY4EiZheMw3n2qPsJ28FLAW1fwBt81rwQsVaOebli6fJwCwn2lM6FrWq8BZOTwuf4CHYj115S0y2BAETiHgNc1aPSuXHe3BkkRnxX7BN217VCxVeyYbncFt/OBHTq6EFok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6KXI7E3; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-29568d93e87so48598985ad.2
        for <linux-mips@vger.kernel.org>; Tue, 18 Nov 2025 03:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763466917; x=1764071717; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9v8UiKRyyvD16t4ENb8APUiQmIzVsGi/FebBj0lOkJ4=;
        b=I6KXI7E3s+zxub0ZQ8DsKJnuOVjMhxwRG1aNuLxcBoUfiTvnon5mLGucGki0piBkZy
         4x6EIJhKAVqNx5p0F3BA+RKBVamh+XetjdT128/kPHI5nxiC8p3Yb8kbniJnbmPlSL0n
         Yr5Tr/JcYUk/X1P5cL8hI8MEx761x9YPnBURS3SllkAFBC2RA6ughuNysbBCCnT94HNX
         UfGJ7XUBidSBM+rr6WFaK2omGalqaHA6VQFPSVWBwL0dLrMMdE00U0Y2IWb9CxBSw0lK
         nQYpXqKaeNJEOHMRtPwfUq23h9h3alGc3Vn/nADz5k7Fw4erwAEuKls0Cfq8UO0Du/BD
         TMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763466917; x=1764071717;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9v8UiKRyyvD16t4ENb8APUiQmIzVsGi/FebBj0lOkJ4=;
        b=D5TRU043RRwTeLNMA9lY+gJaO5SI13GHOXOZ3HBdEsSeqBNIc2iH7GBi1gQpPYLzy8
         8obIjUqBk14+n3CviDR3DOrq8KxtM95zxRZlRdIWxi9Q44O+5yhDk+ZUsHN7xUnuk98i
         tQiEcET1L8T/9dvqSspGRD2VfhDkr/EkgWyqs4wEQOBVW1VHW9Xbwb21DOPVmgFpqsma
         amtPubrncaVIYsCz+c+aGys+1LGfrR0H5aLnQj9fL+O2DI9CQWqMzev83BuG+9diQg0d
         GW3bqzkfeTu5QT0pXlbjRHxTyORCouyAcNLloUWFofjW1s7XztgyhReD+Go/uf4WkaUz
         aT8A==
X-Forwarded-Encrypted: i=1; AJvYcCWaJSvUax9aaKJGNJrtETQXz0/7RsNIh9NWtcm/mKGXcBz0lat1KRlM9ZM0NjuSxzbeX7lI0VRn5Y68@vger.kernel.org
X-Gm-Message-State: AOJu0YwCVQoe5IzI4WmPjkzF9uet8X5djLEtqC/c9DJpDtXrUQbG3wOp
	var0dIKOBGwrHAJsHWtUsegR0esdpjykHzVOOqzq+LokzpSaj0KSmr00
X-Gm-Gg: ASbGnctlpRI8AE2hJVJo8xeVbXtPOJd/Kr7JoRnxUoC/PWXpaKf0ILE1VyKUhzfJiCr
	LGQR86OUC8GdaTYgQjtUBJIdBuUWuMjotL/Bic93o+KN8nLnh8szbqGmhWUjKqRUn1acMFYMsc6
	cNCR3ZeKbaRRRb+lJqvJQdX0z1oD1Ixn2CkrfV0jf3PgUAvK3Z99QtYguW7Kf3Wvi7UyxWX0Ksv
	y5JS3CsHmdHkyPf3z05pQMvu/9Z71UXwSm1kRhYbge0AoQggDxpUroleS9zb8MLw8KkfxZtuNXy
	niq/2kCCW9Quok9Zxs3zGqAbNQIAhyyqHTq3Nvs9NVs8dpYbbnE82AaDBXdEsx/Hes1Mp7ptty/
	ImPu0XsGz+VG5t+MbrE99F+WZFZbAXN2mF9vuiSWU5HP1tWNpUeeOiAMZOoLpT3Gl5XL399CReT
	Ofdn55vboMZKmbuFN22CCK8dy4rjZqUlxGD38P6X1WZf1xvw==
X-Google-Smtp-Source: AGHT+IGaNSdLxRla9oY02zDdWZQ+dAcjdxohCbg81uqIYBMI/Z6QJtGDDVm6vwOhGnWyaCl6P1ztwQ==
X-Received: by 2002:a17:903:1b2f:b0:295:3f35:a312 with SMTP id d9443c01a7336-2986a6cfeefmr183341175ad.20.1763466916628;
        Tue, 18 Nov 2025 03:55:16 -0800 (PST)
Received: from [10.255.206.79] ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0d17sm172235585ad.72.2025.11.18.03.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 03:55:16 -0800 (PST)
Message-ID: <f7f0ca8d-bca2-4a3e-8c45-85cba1b0ff18@gmail.com>
Date: Tue, 18 Nov 2025 19:53:50 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] enable PT_RECLAIM on all 64-bit architectures
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Qi Zheng <qi.zheng@linux.dev>, will@kernel.org, aneesh.kumar@kernel.org,
 npiggin@gmail.com, peterz@infradead.org, dev.jain@arm.com,
 akpm@linux-foundation.org, ioworker0@gmail.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-um@lists.infradead.org, Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1763117269.git.zhengqi.arch@bytedance.com>
 <83e88171-54cb-4112-a344-f6a7d7f13784@kernel.org>
From: Qi Zheng <arch0.zheng@gmail.com>
In-Reply-To: <83e88171-54cb-4112-a344-f6a7d7f13784@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/18/25 12:53 AM, David Hildenbrand (Red Hat) wrote:
> On 14.11.25 12:11, Qi Zheng wrote:
>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>
>> Hi all,
>>
>> This series aims to enable PT_RECLAIM on all 64-bit architectures.
>>
>> On a 64-bit system, madvise(MADV_DONTNEED) may cause a large number of 
>> empty PTE
>> page table pages (such as 100GB+). To resolve this problem, we need to 
>> enable
>> PT_RECLAIM, which depends on MMU_GATHER_RCU_TABLE_FREE.
>>
> 
> Makes sense!
> 
>> Therefore, this series first enables MMU_GATHER_RCU_TABLE_FREE on all 
>> 64-bit
>> architectures, and finally makes PT_RECLAIM depend on 
>> MMU_GATHER_RCU_TABLE_FREE
>> && 64BIT. This way, PT_RECLAIM can be enabled by default on all 64-bit
>> architectures.
> 
> Could we then even go ahead and stop making PT_RECLAIM user-selectable?

OK, will change to:

config PT_RECLAIM
	def_bool y
	depends on MMU_GATHER_RCU_TABLE_FREE && MMU && SMP && 64BIT

> 


