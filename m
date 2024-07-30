Return-Path: <linux-mips+bounces-4594-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE8594112F
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jul 2024 13:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2273A284E2A
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jul 2024 11:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2049919B5AC;
	Tue, 30 Jul 2024 11:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hf5X5npP"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A8B197549
	for <linux-mips@vger.kernel.org>; Tue, 30 Jul 2024 11:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722340344; cv=none; b=bxI8r1Vbtva9pb+IFJ0Zyp4kEUTnYsP+ALW4oIU7SnT82kFkywJ6B2YYfUfTL6x42HnSjPQQWHnLA8eaWe8+ZpYAUai7je1GxyoP7BSVTzgxRia4SLYsZ28lXll4jKPE452uD6BUkXVIpRTcxLWel1mExqKQZ//yIgRt4ziwjQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722340344; c=relaxed/simple;
	bh=i5pqEBAzsxZVYdIgCz2pQRWHOKq/9I2sY7ExiVSJ1S0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dx8/O9hY3MYpYB1KILFDQ0Uf308jaI09f7xUg0KwPJikC1xOWau/ydAll41EP3/7nWBcMpVxg18yI3Ixv/LA4f0fTSwXwqvsdD0hGSvaB3ksoiH+c+8LWQDDmPNdfgHI8gmRs/lQgNJYJziy90rqLNB9c8M8y39g4AugE4rJDCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hf5X5npP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722340341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kBFBIKd1rJgOI9YcivSLfU1/eAHX+x0Dw4M+NCBYe5U=;
	b=Hf5X5npPCSB3TJunaCO7/yEglHaWSbpLOg7or/hkRqXSVOyYZtkyK6hgC1QIR1Kbxl8Vqh
	TAmCGanWbuTWf/HB4k3YG4ySXy0RM62Cu7nTnqsSuEzg/YyaEz/ndYnKnuOsKhnvfwY/CH
	HR23bPkVSPAn+IKNNdhRtEu0J5XT5X0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-SHq1_BYLPgep9lXsEnRvnA-1; Tue, 30 Jul 2024 07:52:19 -0400
X-MC-Unique: SHq1_BYLPgep9lXsEnRvnA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-57c93227bbeso4392013a12.3
        for <linux-mips@vger.kernel.org>; Tue, 30 Jul 2024 04:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722340338; x=1722945138;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBFBIKd1rJgOI9YcivSLfU1/eAHX+x0Dw4M+NCBYe5U=;
        b=YJIUWDU0y1adfy/fdexPTA8diiME0JvX9eWrYEj+43b2P2EOY/DuwmjajF4PApznM+
         vdNaYUo0DV/4SJeXxQrQed+S2924Rg1PiqQNCeGY5MfA9Y4M4OXnohYVG1kfHpFvwjn+
         IdQmg5f3Oiz1sAmIVLRGrDJEIYkaC1Fn2Hst7tspPDfFbcYiEXkbgF60eczyElD4ydYl
         012VfeZp8R3L2lgX7yXtQA1DM62rSrLA0umcvHmPsBMG61H/ODa86B+nxtrcZxamk7RN
         E2t9ZDtYsNsQrmXTsYNfQXCPq16ddAz3gEJmQjT4Yp+lZfwG5sEwuQqer0bFcIcxUZd1
         PdWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfmnM0scFmZbDDGvvy/abzm7Nb04l8cfu2e23fkb2IAPg43oEuPpGQ9L8U7fzYe3iT9kJmX4AJzUrE7v58y7paMoPsjMc62oGGRg==
X-Gm-Message-State: AOJu0YyxeUq1h6AGa02eFwaYD0sHyOoVz9xVGfUAVk/DMe0uyO2b4qhU
	k8/yEPuBzIJYzEsizCehuRp7f7ht4Q95jojDYmWeddjfoLav7kjT91vna+MlGPfzi4GehIMDDGH
	zMBdmNGfjY1vU25NfN5WahsGgcPI34pqeOMJPvqFjRLNntOHj6hKr8cQRlgA=
X-Received: by 2002:a50:d742:0:b0:5a1:6c50:a35 with SMTP id 4fb4d7f45d1cf-5b022b8cd30mr5926684a12.37.1722340338220;
        Tue, 30 Jul 2024 04:52:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBJKwuTl3GcCc5YuDbeqMD1zDkMcs4VmkJUQMAj6w6PoPQ2QTlBUJ4IvJ66qrB4FTpUDSGzA==
X-Received: by 2002:a50:d742:0:b0:5a1:6c50:a35 with SMTP id 4fb4d7f45d1cf-5b022b8cd30mr5926669a12.37.1722340337692;
        Tue, 30 Jul 2024 04:52:17 -0700 (PDT)
Received: from [192.168.10.47] ([151.95.101.29])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5b0044c72d4sm5211327a12.70.2024.07.30.04.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 04:52:17 -0700 (PDT)
Message-ID: <419ea6ce-83ca-413e-936c-1935e2c51497@redhat.com>
Date: Tue, 30 Jul 2024 13:52:15 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 00/84] KVM: Stop grabbing references to PFNMAP'd pages
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>,
 David Stevens <stevensd@chromium.org>
References: <20240726235234.228822-1-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Content-Language: en-US
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/27/24 01:51, Sean Christopherson wrote:
> arm64 folks, the first two patches are bug fixes, but I have very low
> confidence that they are correct and/or desirable.  If they are more or
> less correct, I can post them separately if that'd make life easier.  I
> included them here to avoid conflicts, and because I'm pretty sure how
> KVM deals with MTE tags vs. dirty logging will impact what APIs KVM needs
> to provide to arch code.
> 
> On to the series...  The TL;DR is that I would like to get input on two
> things:
> 
>   1. Marking folios dirty/accessed only on the intial stage-2 page fault
>   2. The new APIs for faulting, prefetching, and doing "lookups" on pfns

Wow!

Splitting out prefetching makes a lot of sense, as it's the only one 
with npages > 1 and it doesn't need all the complexity of hva_to_pfn().

I've left a comment on the lookup API, which is probably the only one 
that can be simplified further.

The faulting API looks good as a first iteration.  Code-wise, 
kvm_resolve_pfn() is probably unnecessary at the end of the series but I 
can see why you had to restrain yourself and declare it done. :)

An interesting evolution of the API could be to pass a struct 
kvm_follow_pfn pointer to {,__}kvm_faultin_pfn() and __gfn_to_page() 
(the "constructors"); and on the other side to 
kvm_release_faultin_page() and kvm_release_page_*().  The struct 
kvm_follow_pfn could be embedded in the (x86) kvm_page_fault and 
(generic) kvm_host_map structs.  But certainly not as part of this 
already huge work.

Paolo


