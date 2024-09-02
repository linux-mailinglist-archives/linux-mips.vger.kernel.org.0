Return-Path: <linux-mips+bounces-5286-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E02CE968C4A
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2024 18:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5540CB215BD
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2024 16:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97DB01A264E;
	Mon,  2 Sep 2024 16:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AOvDZojF"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B876D1A262F
	for <linux-mips@vger.kernel.org>; Mon,  2 Sep 2024 16:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725295201; cv=none; b=cC8O3ip4H8UPBqCiigB/X3aif6L4HVsU9N42OHC4zjE8oZVrtnxgLXkv26o2m/hgUzu8pLH3Ur72arte7gs3Ok0093WLFLsTUcnYfo1bVQDwulL1QyVSZSUCQl4tygpIX9vUWR7UT067HgYfETB5MC94+n/CvbHIIUqLvN9WK9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725295201; c=relaxed/simple;
	bh=TWQWTjb2bHDNoyq7Qb4nnNTNgORAKZgIpkkOeqVlH6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pi6vvsWmucsG8OBtlNF8FCeXidixA5WUx2OyzunTRml+8ET1aglQa3jVGEgiDJpn/wlgpwZgbE9TlX/Bmi3wgmcjqXRHXagExl/WBnvTL1P3BOkw8xGhBPL+1yydwzFB86QrTLEv7zsILCWpJA8uDNvqn+wiGT8Ixwn73/q4HZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AOvDZojF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725295198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sN52cpHdRrdru0pCcK4JXKDfBVCF3QpRMNtiOqVdu9M=;
	b=AOvDZojF1lV35ty0godFZjm5Vr9I648EELf1cigniiF06tnIsOykn1FqDHCva8gx8KBt/p
	xTkfXH6Y3DVlFema+quYwg8cRrm2QbbMh4BCeoPp7bDbAf7Af3kg87XpE5MbS5Tx36uYT/
	bKE5cXTfgM4en+x6tf74y5ra7+mIHN4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-4bkijzL8PQGO42tqBWEm8Q-1; Mon, 02 Sep 2024 12:39:56 -0400
X-MC-Unique: 4bkijzL8PQGO42tqBWEm8Q-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42c7dd5d7faso7434085e9.1
        for <linux-mips@vger.kernel.org>; Mon, 02 Sep 2024 09:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725295195; x=1725899995;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sN52cpHdRrdru0pCcK4JXKDfBVCF3QpRMNtiOqVdu9M=;
        b=wzbU1jcpLJNxE9as3uuITw4VFhBj6FPhHPS9b51q9zauxBvkl7ZujsLnytbMikJSuC
         N5aU1UGsyluKauOAMXIWsGvSyjXA7lFwbmPixzli4FXG8NkUjOEee7RN339K7Eyi8Gi2
         UM4UOGvZWqRZ2OdLENdfjciY/NyD/lbk+vYzcq8Jhc8ctbhK43RG5WU2aC1UqIdIRBjM
         saS/0pN2WFaR6BzN3G9N4p12P8n+FdMdyof8ZrcP+DYlk8YKrkon7tPlDf3CK+e38bTq
         M97lzwHFPkJj9EGT376noC6wCIdUhG4zwF+eptXLfZcKZKAgODGBixbet+4mb67po9R0
         a13w==
X-Forwarded-Encrypted: i=1; AJvYcCX5M0ieGXMq6fGIpnsQ+EqOL0GOUL82oVSXEHYXeSj6rTMBk86Z7UAWPqVHdOC7GPTn+QwaqDGlpMAL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+nxglFPqP23tLuVlxe78GtK8Ezb9dYWtdCPdwEHVuD0tIzErt
	AbANbsHFQkMq93rXjmERQdvlJP1TYxSKh3AfVoaE3/E5TEsSlPyiZ+pME2ZCUKT26IRsWRFwKEm
	fkFrDIQ4FD2LHtM0a22EsxlyoR0FHKGadPTh1U82SOgg3CvPYFSuQwsshEmE=
X-Received: by 2002:a05:600c:3ba3:b0:42a:a92b:8e06 with SMTP id 5b1f17b1804b1-42bb4c3e51bmr97930575e9.4.1725295194794;
        Mon, 02 Sep 2024 09:39:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9phZGFO80qt7wZJU2JQ9lMT8p4KQA1ByjuceIs5a81ZoCFG/S1B+NhesIR8p82ymaNDcdGw==
X-Received: by 2002:a05:600c:3ba3:b0:42a:a92b:8e06 with SMTP id 5b1f17b1804b1-42bb4c3e51bmr97930195e9.4.1725295193873;
        Mon, 02 Sep 2024 09:39:53 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72d:6500:849a:c1af:a5bb:ba9d? (p200300cbc72d6500849ac1afa5bbba9d.dip0.t-ipconnect.de. [2003:cb:c72d:6500:849a:c1af:a5bb:ba9d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba63abea3sm180516415e9.28.2024.09.02.09.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 09:39:53 -0700 (PDT)
Message-ID: <995d18bb-16f1-4843-92bc-6c4a386a811d@redhat.com>
Date: Mon, 2 Sep 2024 18:39:52 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mm: make copy_to_kernel_nofault() not fault on user
 addresses
To: Omar Sandoval <osandov@osandov.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-um@lists.infradead.org,
 kernel-team@fb.com
References: <cover.1725223574.git.osandov@fb.com>
 <5fa50d78-6764-4f99-87b3-7bd7edbeea5a@csgroup.eu>
 <ZtVbrM4rQsGFJo_t@telecaster>
 <861d448c-ce1d-4b74-87eb-9b211dfebbb1@redhat.com>
 <ZtXZFc9kZAUMD4e0@telecaster>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ZtXZFc9kZAUMD4e0@telecaster>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02.09.24 17:26, Omar Sandoval wrote:
> On Mon, Sep 02, 2024 at 10:56:27AM +0200, David Hildenbrand wrote:
>> On 02.09.24 08:31, Omar Sandoval wrote:
>>> On Mon, Sep 02, 2024 at 08:19:33AM +0200, Christophe Leroy wrote:
>>>>
>>>>
>>>> Le 02/09/2024 à 07:31, Omar Sandoval a écrit :
>>>>> [Vous ne recevez pas souvent de courriers de osandov@osandov.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>>>>>
>>>>> From: Omar Sandoval <osandov@fb.com>
>>>>>
>>>>> Hi,
>>>>>
>>>>> I hit a case where copy_to_kernel_nofault() will fault (lol): if the
>>>>> destination address is in userspace and x86 Supervisor Mode Access
>>>>> Prevention is enabled. Patch 2 has the details and the fix. Patch 1
>>>>> renames a helper function so that its use in patch 2 makes more sense.
>>>>> If the rename is too intrusive, I can drop it.
>>>>
>>>> The name of the function is "copy_to_kernel". If the destination is a user
>>>> address, it is not a copy to kernel but a copy to user and you already have
>>>> the function copy_to_user() for that. copy_to_user() properly handles SMAP.
>>>
>>> I'm not trying to copy to user. I am (well, KDB is) trying to copy to an
>>> arbitrary address, and I want it to return an error instead of crashing
>>> if the address is not a valid kernel address. As far as I can tell, that
>>> is the whole point of copy_to_kernel_nofault().
>>
>> The thing is that you (well, KDB) triggers something that would be
>> considered a real BUG when triggered from "ordinary" (non-debugging) code.
> 
> If that's the case, then it's a really weird inconsistency that it's OK
> to call copy_from_kernel_nofault() with an invalid address but a bug to
> call copy_to_kernel_nofault() on the same address. Again, isn't the
> whole point of these functions to fail gracefully instead of crashing on
> invalid addresses? (Modulo the offline and hwpoison cases you mention
> for /proc/kcore.)

I assume the difference is mostly historically, because usually, when 
modifying something (ftrace, live patch, kdb) you better know what you 
want to modify actually exist and can be modified. IOW, you usually 
read-before-weite.

In contrast, things like /proc/kcore, (I think) while limiting it to 
sane addresses, might still read from areas where we remove entries from 
the directmap (e.g., secretmem), I think.

Like, in a compiler, modifying a variable you didn't read before is 
rather rare as well. If you would have tried to read it, the 
copy_from_kernel_nofault() would have failed.

I agree that the difference is weird, and likely really "nobody ran into 
this before in sane use cases".

> 
>> But now I am confused: "if the destination address is in userspace" does not
>> really make sense in the context of KDB, no?
>>
>>    [15]kdb> mm 0 1234
>>    [   94.652476] BUG: kernel NULL pointer dereference, address:
>> 0000000000000000
>>
>> Why is address 0 in "user space"? "Which" user space?
> 
> Sure, it's not really user space, but it's below TASK_SIZE_MAX, so
> things like handle_page_fault() and fault_in_kernel_space() treat it as
> if it were a user address. I could
> s/userspace address/address that is less than TASK_SIZE_MAX or is_vsyscall_vaddr(address)/.

Ah, okay, that's x86 specifics detail in 
copy_from_kernel_nofault_allowed(), thanks.

> 
>> Isn't the problem here that KDB lets you blindly write to any non-existing
>> memory address?
>>
>>
>> Likely it should do some proper filtering like we do in fs/proc/kcore.c:
>>
>> Take a look at the KCORE_RAM case where we make sure the page exists, is
>> online and may be accessed. Only then, we trigger a
>> copy_from_kernel_nofault(). Note that the KCORE_USER is a corner case only
>> for some special thingies on x86 (vsyscall), and can be ignored for our case
>> here.
> 
> Sure, it would be better to harden KDB against all of these special
> cases. But you can break things in all sorts of fun ways with a
> debugger, anyways. The point of this patch is that it's nonsense that a
> function named copy_to_kernel_nofault() does indeed fault in a trivial
> case like address < TASK_SIZE_MAX.

Yes, because the write-without-read to kernel memory "you don't know 
even exists" is rather ... weird :)

Anyhow, no strong opinion here. Patches look simple enough.

-- 
Cheers,

David / dhildenb


