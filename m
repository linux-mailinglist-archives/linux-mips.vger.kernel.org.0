Return-Path: <linux-mips+bounces-11089-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E38C6B492FF
	for <lists+linux-mips@lfdr.de>; Mon,  8 Sep 2025 17:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D25451B21544
	for <lists+linux-mips@lfdr.de>; Mon,  8 Sep 2025 15:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD73830E0D1;
	Mon,  8 Sep 2025 15:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q1gHV7iQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306BE30CDA1
	for <linux-mips@vger.kernel.org>; Mon,  8 Sep 2025 15:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757344953; cv=none; b=CobG9IGnFTyukPVS83BfJkZCwK20YSH2FGlAJT+c1SsIP6bK+qAqJQB8GfgPX5Dn2Z0Hos1uwrRw6iC3oyJAVDO9NkCOz9UmmJLo3wW7TTEsNLcU4jpxCbPu6IUDzkD7qEw5fGeqwdQRnmmy2EKbX5q+NS4Lnkmm6GosMvvacuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757344953; c=relaxed/simple;
	bh=F32FXDZGXwaYxsj8gbSU0nKzm4ocUmQnsK9BI1F5gkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D1oMcTmreuoy2lOUc5ixYYTUTBNi9X8LU8+fwyI2O8PI2J5igM7jQhbUC3Rg7LdBtWgPqfFqxRhvrLQJvY0lqDjB3/QREYSkl5lC8VrXHaF7PSakkPoaDc6l7BILrVYcilFZrv6RrUD/YyPOifn+f0autUyuFaaT3KYHoVlysmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q1gHV7iQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757344951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=w4KMjz9pZf6Gn5SDTmwCP/agoyxxfuBiYUtMKRyfuzo=;
	b=Q1gHV7iQQzLoc2JypY3ed8RF2ersFi4XoZdJAN9UkZwZeStmVXy5BNPS6K/vhi390pyPYn
	bv6CI7RSOZRZKvbBBZafSFQ0ivJ3HMpGeIdWqghxnDZMIjuRP63DGI0h0onid3Adr6yQj2
	tXlsgsRIaKMqm6nXKPus0Q2CknWxVUI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-qIWG2zu9M5GtpnImziNr2A-1; Mon, 08 Sep 2025 11:22:30 -0400
X-MC-Unique: qIWG2zu9M5GtpnImziNr2A-1
X-Mimecast-MFC-AGG-ID: qIWG2zu9M5GtpnImziNr2A_1757344948
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45cb5dbda9cso28429235e9.2
        for <linux-mips@vger.kernel.org>; Mon, 08 Sep 2025 08:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757344948; x=1757949748;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w4KMjz9pZf6Gn5SDTmwCP/agoyxxfuBiYUtMKRyfuzo=;
        b=rfT2VfzRMK+MgbqXK5fq+/ABDIlzOvkcJ3TOreYt7bt45D82RxQsbkill4iRot+dew
         Sn3fimmRENnW209StSWKt1wiHJSSYMCdoLj2I3E26myjgRmdBoXNg2tvo+lg/c/Ro8Tf
         bsmDhoHva/nA5yR7rRvHikOSieATtd6sA1zd4eI6fwvlLmPHw6CIWGCm+gZJ7vzVxd3P
         dm82oA7I+XRMt2bqBeSm9ApVXdPV0w/G2PZh4EEIziUJsG7CbNBt6B3XXMj0HtoyP5hw
         9HH7Ma4hWOAbv1OiM0Ve4XtZhhKagVp4SR7OIuY/NJtxT4vGP7XT4Fr4vJMRCyDtOR7g
         VTeA==
X-Forwarded-Encrypted: i=1; AJvYcCWBQ6lVKMb/lCqDW7b0CNZw0m729H42AZ3f8Pt1MUB55hxQYe3z6hlQnTXq50/y9C6/MADPjrljNMjz@vger.kernel.org
X-Gm-Message-State: AOJu0YyI1VncVGJtDJzb7D9cGqGXKxR4FrDbmr9KMr6CsFBoNjnSlC4A
	g4gY/ZFIBwI7nvnKotzKGLAt+P7tbt1uAYXQCBmlWTiGHs7IsRGvjUE3wPQmEclhlyJjOenGmHS
	9ml0gOQsxCrPmmo92zyi/E8Tqk3J0fIOFqwr+D2k1pKDC9lAZlFw28IfpxLYOqcY=
X-Gm-Gg: ASbGncsPFFgoCoFQrR+WipIf8YBU8Z7ZVRZr3uI1/C4BTxAIJGaqge38zHskEP07Tzo
	7l7h+VQX5vTSZDyId6xb7vYoeYnTsXFZ8UwK22430StXPfIZOSe7AUPQRHKriJVP1siFf6TWOM4
	LFuQeslpK1q6IDXcEwsdADCLPR/1ZyHKVFie/k2o8ta63J8sqnCrC5n5Z55gTHPrGAQ7okXMbLx
	opoow2xMiC7N8CweMuoN0g53YGYXDxByMlXuMl24aJLdENQUz19axOF344wVDOLtUBmzwhcJwbF
	XzGFPfFP0fSvIms7O/ueRutwYyc7+ZtnXNoz9C/4kfbKaLzhjAT9c3v/Sl1nG5rytZPVup8Fk95
	WX618aKsHfVKsbaWWtTKAA1mpv7hSe7TL/QeYPJ99d3LooPn/RBKjwRDjfvor8v1Y
X-Received: by 2002:a05:600c:34cb:b0:45d:e0cf:41c9 with SMTP id 5b1f17b1804b1-45de0cf447fmr65101195e9.22.1757344947804;
        Mon, 08 Sep 2025 08:22:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHYVI7uetiSbrjm9XefV08PSiCwYstCNobj3gljiWL9Oji0Bqd7BtZyoiA+b/dW0fMqgLp+w==
X-Received: by 2002:a05:600c:34cb:b0:45d:e0cf:41c9 with SMTP id 5b1f17b1804b1-45de0cf447fmr65100515e9.22.1757344947304;
        Mon, 08 Sep 2025 08:22:27 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:700:d846:15f3:6ca0:8029? (p200300d82f250700d84615f36ca08029.dip0.t-ipconnect.de. [2003:d8:2f25:700:d846:15f3:6ca0:8029])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf276d5e5fsm42252142f8f.27.2025.09.08.08.22.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 08:22:26 -0700 (PDT)
Message-ID: <83d3ef61-abc7-458d-b6ea-20094eeff6cd@redhat.com>
Date: Mon, 8 Sep 2025 17:22:24 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/37] mm/gup: remove record_subpages()
To: Mark Brown <broonie@kernel.org>
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
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, virtualization@lists.linux.dev,
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org,
 Zi Yan <ziy@nvidia.com>
References: <20250901150359.867252-1-david@redhat.com>
 <20250901150359.867252-20-david@redhat.com>
 <f5032553-9ec0-494c-8689-0e3a6a73853c@sirena.org.uk>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <f5032553-9ec0-494c-8689-0e3a6a73853c@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.09.25 17:16, Mark Brown wrote:
> On Mon, Sep 01, 2025 at 05:03:40PM +0200, David Hildenbrand wrote:
>> We can just cleanup the code by calculating the #refs earlier,
>> so we can just inline what remains of record_subpages().
>>
>> Calculate the number of references/pages ahead of times, and record them
>> only once all our tests passed.
> 
> I'm seeing failures in kselftest-mm in -next on at least Raspberry Pi 4
> and Orion O6 which bisect to this patch.  I'm seeing a NULL pointer
> dereference during the GUP test (which isn't actually doing anything as
> I'm just using a standard defconfig rather than one with the mm
> fragment):

On which -next label are you on? next-20250908 should no longer have 
that commit.

-- 
Cheers

David / dhildenb


