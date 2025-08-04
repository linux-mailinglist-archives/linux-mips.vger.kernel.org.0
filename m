Return-Path: <linux-mips+bounces-9989-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E55EB19B6A
	for <lists+linux-mips@lfdr.de>; Mon,  4 Aug 2025 08:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33FCC3A5D4B
	for <lists+linux-mips@lfdr.de>; Mon,  4 Aug 2025 06:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CEA717A2EC;
	Mon,  4 Aug 2025 06:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A1vAic0k"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ABE2BAF9
	for <linux-mips@vger.kernel.org>; Mon,  4 Aug 2025 06:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754288183; cv=none; b=Z02ns+YcxHIBl4FdjLA3ylN8/sHmeyRpc0fumMYgEX3nHlbrxAS+B/8HVYGqD8kw5rzlPIWRzBKW2qWT3hX4hGXoyaVERJFlqOmevNnyWsV2orYSeVYyePhy35wpV6UonBJepWLELonhjvBw3ub+kaPdaRbr0wPlqLtGzyEKNpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754288183; c=relaxed/simple;
	bh=ezKvKM7bBqicRK9JFtR6S1LoIy5flHDIJKBYk76Z7OQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BEf4CehtMQ1YwYxrRRJjbODJUVz5tcvxNK+4VQC0NNyeSCPdBMu+Ipv2UCoFdclG6qAMzM2Vv40irTs+Ulv8y+ikR4fpX9B74HTgG38Ii7xew3VX7DT6BnX5hXkma4oo/CWoNWHPuTKK8lB3UMJQyQXUglw4Mnak+Fwt9oBkv+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A1vAic0k; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754288180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=paU7Fs80gihpxT7AApQ9dKihwE6g0iNhWCyVWUX+mqw=;
	b=A1vAic0kzF2ZQcWuGd0Q/Px87LWmWh4RVQU0Fzi5L4+JPi+xmJTne8DzEM3LN27vRzh3NE
	n6lWRLoTMJU0vZ+Wx/2c4BXybDU795CehzgrHC7FrMjRUqbE9VGGrxp3Dbye1fN1+oyjP8
	BlXzs/Xsej9GWtQMxhdeWpjZfq3Ukbc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-mFFnnLAlO66mlNqPlfDSLA-1; Mon, 04 Aug 2025 02:16:18 -0400
X-MC-Unique: mFFnnLAlO66mlNqPlfDSLA-1
X-Mimecast-MFC-AGG-ID: mFFnnLAlO66mlNqPlfDSLA_1754288178
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4af0100c03fso71444881cf.2
        for <linux-mips@vger.kernel.org>; Sun, 03 Aug 2025 23:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754288178; x=1754892978;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=paU7Fs80gihpxT7AApQ9dKihwE6g0iNhWCyVWUX+mqw=;
        b=cO8mH0EcyCu1kS0nenYUfGVDUXDeOSsexMxiNIapUqfr8MIvRAtgHPEDKzTiJ3CPOl
         a0o/z2zEjHRoLNu4cubhzLKVWZdbUfRjfsiAXhXV79oB/vBULczDaf3t2iOYNQwe2sdq
         7P5XDT5I99shlHPfPXR6maDsIq4D8vBbTk3KV1T5Q0cLDCFI2mDkjFdU/ng09kGN2JQN
         fL9zfxCeZk+hQQeC4ATlvTNe+Fl0a4bW0SKQailn6bP2AOYMm2yIYeZFho4Uweoj6x72
         ubALdCmgFKh5Zo5U80ulpipYE2vOwoILpvdVmS6jmENsahJlgJOqXl5pffvEHGimu4yn
         cMVA==
X-Gm-Message-State: AOJu0YwJ9QYd8N/nzQqh+8YNeeLHKrTZvUDr/KXVu/z5rtC4bYyxpw29
	qpVxllYqUiNSUWLw1EO2PxaSBhvkJRKkH+pSvn9yriiWDXquBWStCPFSJF5zFwlbcb01yaWoQic
	rdbvyyAd6mZTdOhebOiLK/ayBAOGOfYx+6MuYZnb9vZ8GQbXXcVzi8M1EA/e2rcO4lJ/Azb0=
X-Gm-Gg: ASbGncvA8E5YgBy2wb384zYcwKxWPnM9YVi+AFcHe2LQkm1C/inF+ivqvDj8+ks7xmU
	7gAfVE7yW738SnAJ11gmZUMAnZjRt+VhdewkAZXG/9juqA2iux1BdGkUqlSsO04W8G84XHYHrWU
	NHtMZs5G1dt6sHucKEO+k+7KCTyiYziFqtke/mZVY/+zlUPNBDGFYb6XDS5P0xtl5aIq1KzV4in
	hmHuuMhJ/C41I8IK+mJZD08jkJmJlQ+e+SH3Flc2lA9d8qIj6g0z2cHjJ/2/xF+XlC6bKvuXnyg
	hxDEP76ZcNwYrNfnxyalCev+1fmYu6fiDZ5rJ1fLKRqr9Ol2mp4UVQ8SFhgoOAh/OK9Ic2FDrZ5
	kv80=
X-Received: by 2002:a05:622a:1790:b0:4ab:9335:7af4 with SMTP id d75a77b69052e-4af6904caa4mr54537771cf.2.1754288178267;
        Sun, 03 Aug 2025 23:16:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxo8AiPNibwEEafqqqVB8V4gGY1UTek/mVygmGMl6RjlNJFRhX9IFJZBBZI0wQ6yfZepKO7g==
X-Received: by 2002:a05:622a:1790:b0:4ab:9335:7af4 with SMTP id d75a77b69052e-4af6904caa4mr54537551cf.2.1754288177730;
        Sun, 03 Aug 2025 23:16:17 -0700 (PDT)
Received: from [192.168.0.6] (ltea-047-064-114-086.pools.arcor-ip.net. [47.64.114.86])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b06da4c7c7sm7906611cf.62.2025.08.03.23.16.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Aug 2025 23:16:17 -0700 (PDT)
Message-ID: <054000c4-f63b-4965-93ea-0c51f226a0fb@redhat.com>
Date: Mon, 4 Aug 2025 08:16:14 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mips: Replace __ASSEMBLY__ with __ASSEMBLER__ in the
 mips headers
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <20250611090544.90032-1-thuth@redhat.com>
 <alpine.DEB.2.21.2508040010580.5060@angie.orcam.me.uk>
From: Thomas Huth <thuth@redhat.com>
Content-Language: en-US
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <alpine.DEB.2.21.2508040010580.5060@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/08/2025 01.59, Maciej W. Rozycki wrote:
> On Wed, 11 Jun 2025, Thomas Huth wrote:
> 
>> While the GCC and Clang compilers already define __ASSEMBLER__
>> automatically when compiling assembler code, __ASSEMBLY__ is a
>> macro that only gets defined by the Makefiles in the kernel.
> 
>   It could be worth noting that our arrangement for the __ASSEMBLY__ macro
> obviously predates GCC's predefinition (which was only added back in 2000
> with GCC commit f8f769ea4e69, 9 years into the existence of Linux, which
> ultimately landed as GCC 3.0 release) and the whole existence of Clang.
> So the choice was perfectly fine back when it was originally made.

That's valuable information, thanks for looking that up!

>> This is bad since macros starting with two underscores are names
>> that are reserved by the C language.
> 
>   I think it's correct usage given that we're the C language environment
> here, just as any C library is.  Such names are not to be used by user
> programs and we're not one.

I just added that sentence after I've recently been told that it's rather 
the other way round:

  https://lore.kernel.org/linuxppc-dev/20250610200028.GE30295@gate.crashing.org/

I guess it's mainly a matter of opinion how to classify the kernel here?
Anyway, I can simply drop that sentence again from the description, that's 
fine for me.

>> It can also be very confusing
>> for the developers when switching between userspace and kernelspace
>> coding, or when dealing with uapi headers that rather should use
>> __ASSEMBLER__  instead. So let's now standardize on the __ASSEMBLER__
>> macro that is provided by the compilers.
> 
>   I think it's the right choice in 2025 (and would have been a few years
> earlier, for a liberal definition of "few", when we switched away from
> supporting GCC 2.95.x), so:
> 
> Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk>
> 
> for the code updates, but I think the description could have been more
> focused on how the old choice has become no longer the best one as the
> compiler evolved.
> 
>   Would you mind factoring in the observations made here?

Thanks for your review! I'll respin a v3 with an updated description.

  Thomas


