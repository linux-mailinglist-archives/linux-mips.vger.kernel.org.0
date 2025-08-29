Return-Path: <linux-mips+bounces-10844-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73007B3BE34
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 16:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98CB81C2742C
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 14:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04A432A3F5;
	Fri, 29 Aug 2025 14:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aCuWJHmP"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9A131814F
	for <linux-mips@vger.kernel.org>; Fri, 29 Aug 2025 14:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478480; cv=none; b=kbD9bppSklVGPu9HGRSoqfmr8Dx22QCTs9CeHtb+Ch6ZG493BlLf2lX0I+Hc+QJn2JxOqwtT4ei6BwBW3UyPuU6lPZvHAeb76ZaGCCOqiQEynvyYWU7oHgO6Wshpq9Fh3/Fy73q+p+Yy9kkbwWxxXkAqs3y2lExWQfcRuopr0b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478480; c=relaxed/simple;
	bh=CSCcVpPj4C/hs50Ns7qlV+dnR+g1QDFkIRsUlEtqIlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qywlsVVYyr6rtolWnW3VjtKOG4VMVZB8W2ZkCl8UPBVKHY9EZ4Aml3mhLmjS20C13eG7IgMHVyqB9krG9+pUPH9RTp0waT9KQvLohe87FYZScKWm+wEzjcKrFTimRveZ2G430/vwKQWXwmLQZ71/h9YnBOrilQr9yRGs1ex2J1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aCuWJHmP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756478476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IaQHZcwb14XTWilYbwjP6AKy4Qvx/cjgmhYjWqgMQRs=;
	b=aCuWJHmPAx/QbU2S3sz8Qe0Z2XpClY6nIWAixiCjKJ2Q+KYm822awM/TMjapfwh1OUmBne
	uQdSHT44hzJRBkfzIZqpc9WskoWlGQ06rl+N0IxXXb4hgnuWyMOuCfasmmOehlDd2LI2ti
	RHKaF3ITL/6yGRJPuheWM3keJIXI91Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-mIV8Msb7P0W5EC8KbUVleQ-1; Fri, 29 Aug 2025 10:41:14 -0400
X-MC-Unique: mIV8Msb7P0W5EC8KbUVleQ-1
X-Mimecast-MFC-AGG-ID: mIV8Msb7P0W5EC8KbUVleQ_1756478473
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45b467f5173so17487755e9.3
        for <linux-mips@vger.kernel.org>; Fri, 29 Aug 2025 07:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478473; x=1757083273;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IaQHZcwb14XTWilYbwjP6AKy4Qvx/cjgmhYjWqgMQRs=;
        b=XPTJT6EXA75DkCZHsU2iIiQvAIejwLcwRoyc68TvJ2UDtj2Y1oSCRr4ey8ycT8m9Eh
         CODSX7MyINXm1J3Rkl9HhEtoyjyp4DGhOSvqF4I+2q7q3y8TxFBvHjeRv6Tg15gV4KtH
         tmODQjU7vzmo8fHZ8Ho8BNMrGZOOtab9X7B3sQTpmt9dmHSlsWlwJ5LIlFh8gE6apOhj
         hDFVFmZa5drHhHFPKIwS9iaOM/3D307CkJlAKxnkvdIsjEC32kVR13RAmCzHvSbUfVHO
         ESfdxJEjFuJU3SA31Lh3WlU4sf5ZXQ6jsZwe7XAW/nR1jBQbu7rH8ZyCzaQ51iBf7KL4
         ZrBA==
X-Forwarded-Encrypted: i=1; AJvYcCW8gWpW4tb1wRx4t87uU3HtuD6CKgFpMqOOaerP94evlQValJj2fxhdHhwX+3MqLFtr0Qikna0gFvi6@vger.kernel.org
X-Gm-Message-State: AOJu0YyzXEtUWeYgC/3r9UHi0ohDLDAm7iL78nw9R7xaXGoYECMppfdx
	TjGiFstY/qYyb5M9xhDaFi6+MV35Hha4RLSXOwyyrZxpLVu+eGrO/t41KibJO5duuumco6Sfsm4
	0nZubT2xdA3eOg0ULvwB9WBZksh7C9Sj0e2k97HOWHUfHti30ikNnFfoj3v6slE8=
X-Gm-Gg: ASbGnctB0OmS0Ux0p2Jow9pURtixWoJuBzSWvb3AWE28wlwmE1Q9WDY2RryZgHoYxHx
	56Q4r4GHxOWHlZvEmVlD9lY1skmkWTkMMk8CuVPOEQlW6jty0fqWEVkc46EPlBakx2PYAKRkulW
	d6euUca7hr7pCW8aR2qOCEFsiAkz7iP0aGWZ0XqLFLRkn/2Cfp7VlGUwR86WBM8bHLv2OnE+vpa
	p+u0NEpC7GpPeOHernzyYaae5WJ/KxLDeK2A4uewUMEzNzSjsJBjoz+hz+kg3LBTzzumQyxz7iy
	Ggt/ZUq2jguWyrKkBCBtSLMfwSYQ2gl5WHN04xxnPgUX+X+YaaTmPTaduhenlVBIliD9Kiimuf/
	RC6FQgTfl13yp/lBFAGAJz0p/c8TFqtfCBcXCuWHVawY3r1e2x2GP/IKq1gelKYQD
X-Received: by 2002:a05:600c:3b1d:b0:45b:80ff:58f7 with SMTP id 5b1f17b1804b1-45b80ff5a3emr17032585e9.36.1756478472603;
        Fri, 29 Aug 2025 07:41:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxRGXosrm3vEArUqUEmQe7+Z1YlIMaqjbXRbohfYu21MGvBWlOrWQFqI2M9QmqW3L3NnKwrg==
X-Received: by 2002:a05:600c:3b1d:b0:45b:80ff:58f7 with SMTP id 5b1f17b1804b1-45b80ff5a3emr17032245e9.36.1756478471858;
        Fri, 29 Aug 2025 07:41:11 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1d:100:4f8e:bb13:c3c7:f854? (p200300d82f1d01004f8ebb13c3c7f854.dip0.t-ipconnect.de. [2003:d8:2f1d:100:4f8e:bb13:c3c7:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b74950639sm95314275e9.17.2025.08.29.07.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 07:41:11 -0700 (PDT)
Message-ID: <4b053602-7c80-4ea4-8617-0f5e526c02f6@redhat.com>
Date: Fri, 29 Aug 2025 16:41:08 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 33/36] mm/gup: drop nth_page() usage in
 unpin_user_page_range_dirty_lock()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-34-david@redhat.com>
 <c9527014-9a29-48f4-8ca9-a6226f962c00@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <c9527014-9a29-48f4-8ca9-a6226f962c00@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28.08.25 20:09, Lorenzo Stoakes wrote:
> On Thu, Aug 28, 2025 at 12:01:37AM +0200, David Hildenbrand wrote:
>> There is the concern that unpin_user_page_range_dirty_lock() might do
>> some weird merging of PFN ranges -- either now or in the future -- such
>> that PFN range is contiguous but the page range might not be.
>>
>> Let's sanity-check for that and drop the nth_page() usage.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Seems one user uses SG and the other is IOMMU and in each instance you'd
> expect physical contiguity (maybe Jason G. or somebody else more familiar
> with these uses can also chime in).

Right, and I added the sanity-check so we can identify and fix any such 
wrong merging of ranges.

Thanks!

-- 
Cheers

David / dhildenb


