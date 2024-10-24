Return-Path: <linux-mips+bounces-6339-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE68E9ADE17
	for <lists+linux-mips@lfdr.de>; Thu, 24 Oct 2024 09:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFA7E1C25CD4
	for <lists+linux-mips@lfdr.de>; Thu, 24 Oct 2024 07:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA5D1AC458;
	Thu, 24 Oct 2024 07:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ip2UTJvw"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6895B1AA7B6
	for <linux-mips@vger.kernel.org>; Thu, 24 Oct 2024 07:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729755945; cv=none; b=ejA+07bZurSeCHLlJblEWl8ERFMJXhHVSZXjyegu7TXZajo3CZmvTgF6U4BYsn+zlI+eOlBTiYoSzpq4GlJD2GOVba8kfU88Szxai0z2xihTUjASllVWtusYJY0HUN9YTet7TxkVoBugsNz5JkGtWgI5O1UrY17IP/W+SPHlnw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729755945; c=relaxed/simple;
	bh=75GuJM3z3gUbgm6OR9oVr6rTeKxgv65kR3/ItrpYIO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bnfj37+CLmSTWNAn0YogqSHDpr4WL3X8v+z/vqc1ViCZ0XRlJamWgSY+BwlIzV6J52cfM8WBsdKK1+EiRf6CEF1MF7eZpZ3wK6v80rbrJb/mTzoKK2jrS9v5/aQRhSZ1nwYzE5kReDvqpw5s5NKK51ujCB3qour/pcY0sfnY2iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ip2UTJvw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729755942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hPYuDToRpBPGSedDH6WO/E6lGGRZMoEslalgqhpMqfY=;
	b=Ip2UTJvw6q/D7Y+hapNLCXjF3biTcQjJwu0wZN8HPcjyiVx1l5n+MTXD83b1jOmO/8iF9r
	T1IIM1pE2kn8snQz2EwRD9BbQz7DuzXWFY8Ig81bd688lQXothXVWtztxvLKp5LDuhEwhm
	7jrYU7ezvYYNKL3sgolrwljN/2/fWK4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-KFgzhtCVNCyZhc8awBThew-1; Thu, 24 Oct 2024 03:45:41 -0400
X-MC-Unique: KFgzhtCVNCyZhc8awBThew-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-37d5ca192b8so304770f8f.1
        for <linux-mips@vger.kernel.org>; Thu, 24 Oct 2024 00:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729755940; x=1730360740;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hPYuDToRpBPGSedDH6WO/E6lGGRZMoEslalgqhpMqfY=;
        b=Et+WhG/9z3+U2/FY50NCYqwAXhJq98oxKtvQyZpv7Vd8LWHsRtf3RF2LXdNF07ZpBw
         an6/ibPsZsoF5w4RiOtYAOXgA3/ExjgFY2PoBOILFUmoYea4Tqx4bDYTIVdhBtYj+kUb
         7Udn3rOol7dTE28S/n0+7SIZrGNgs4FmC8auB9Buh0ygeZdGvxKev7RJljOeBGLxwsF1
         JYkzlAjMGXSXea85OxdmbAgNDSIdmZbIYEgF71d/DGoF5CmHmsERUQRY/WcGDxnm7ZUe
         RXu4E4yyYh3cz/2LxyKrTnSPw4w1hDfDrlESqDToffJX1DP6oPqvTLFjAFi9SJv+AGmy
         ew4w==
X-Forwarded-Encrypted: i=1; AJvYcCW5oag1mXgpO3WfSkca0BGjN3wyKgTZQqk2vMFtSaZl+fN4mezP+KQ25mFLiz2Q9uiw5QCby6Bt9NBM@vger.kernel.org
X-Gm-Message-State: AOJu0YxpzfQnQccXk7zfn9ydrrulzcD1uzbUv6QPZHA4hHfd8LsbZcCT
	6RKhXwGhKMaO8wTorXQgcDKGonMtIpdwYrKpAmtnG2jHUQZZKfPUUfu4d4fXdGBb1b9xo2M7ky/
	HM0SCVO2SRdkSYReyNLYsRUBB7c3PAz8IfWidD8BXXSiLpt6tVaZkC12EytE=
X-Received: by 2002:a05:6000:c6:b0:37d:3f81:153f with SMTP id ffacd0b85a97d-3803ac0670fmr638392f8f.17.1729755939793;
        Thu, 24 Oct 2024 00:45:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELvXhEEh4kEkFbK5TioBTnFzdEpPS7Pp3lgM2sA9dD3bmQAPUom4l+fRdVw7hX/9kDiQSn1w==
X-Received: by 2002:a05:6000:c6:b0:37d:3f81:153f with SMTP id ffacd0b85a97d-3803ac0670fmr638363f8f.17.1729755939386;
        Thu, 24 Oct 2024 00:45:39 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:4f00:9949:9757:8f9a:e10? (p200300cbc7044f00994997578f9a0e10.dip0.t-ipconnect.de. [2003:cb:c704:4f00:9949:9757:8f9a:e10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9442bsm10632960f8f.78.2024.10.24.00.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 00:45:39 -0700 (PDT)
Message-ID: <a089ff3b-119e-44a0-a780-3abca01886f7@redhat.com>
Date: Thu, 24 Oct 2024 09:45:37 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] mm: pagewalk: add the ability to install PTEs
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 "Paul E . McKenney" <paulmck@kernel.org>, Jann Horn <jannh@google.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Muchun Song <muchun.song@linux.dev>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@kernel.org>,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-arch@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>,
 linux-kselftest@vger.kernel.org, Sidhartha Kumar
 <sidhartha.kumar@oracle.com>, Jeff Xu <jeffxu@chromium.org>,
 Christoph Hellwig <hch@infradead.org>, linux-api@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>
References: <cover.1729699916.git.lorenzo.stoakes@oracle.com>
 <9be732fd0e897453116b433fe2f468ef7795602e.1729699916.git.lorenzo.stoakes@oracle.com>
 <20241023160405.33995c68f20c141325a8fadb@linux-foundation.org>
 <635de052-35a6-40e0-82ea-4349f3aecc06@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <635de052-35a6-40e0-82ea-4349f3aecc06@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.10.24 09:34, Lorenzo Stoakes wrote:
> On Wed, Oct 23, 2024 at 04:04:05PM -0700, Andrew Morton wrote:
>> On Wed, 23 Oct 2024 17:24:38 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
>>
>>>
>>> ...
>>>
>>> Existing mechanism for performing a walk which also installs page table
>>> entries if necessary are heavily duplicated throughout the kernel,
>>
>> How complicated is it to migrate those to use this?
> 
> I would say probably somewhat difficult as very often people are doing quite
> custom things, but I will take a look at seeing if we can't make things a little
> more generic.
> 
> I am also mildly motivated to look at trying to find a generic way to do
> replaces...
> 
> Both on the TODO!

I'm not super happy about extending the rusty old pagewalk API, because 
it's inefficient (indirect calls) and not future proof (batching, large 
folios).

But I see how we ended up with this patch, and it will be easy to 
convert to something better once we have it.

We already discussed in the past that we need a better and more 
efficient way to walk page tables. I have part of that on my TODO list, 
but I'm getting distracted.

*Inserting* (not walking/modifying existing things as most users to) as 
done in this patch is slightly different though, likely "on thing that 
fits all" will not apply to all page table walker user cases.

-- 
Cheers,

David / dhildenb


