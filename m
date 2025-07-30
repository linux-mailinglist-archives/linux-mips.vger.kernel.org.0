Return-Path: <linux-mips+bounces-9936-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 356C7B1594B
	for <lists+linux-mips@lfdr.de>; Wed, 30 Jul 2025 09:07:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 687C918A71A6
	for <lists+linux-mips@lfdr.de>; Wed, 30 Jul 2025 07:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414EB34CDD;
	Wed, 30 Jul 2025 07:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FZsGnYwB"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2C9E55B
	for <linux-mips@vger.kernel.org>; Wed, 30 Jul 2025 07:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753859241; cv=none; b=foJ3f8eoRyQcLN0oWNSQrFV06EUEeO5/e0tDGNXb1BS1tfkPupWgIHwCEmBduMqYJYggjh4gNXwYzI8PHIpTMBkeU8amMs806TU+C493lzsFoHJRsINRkCjlmrhttBq1pgZhffhDp1acVIPsjR7nrGVYv2NtOxbTj9m2LZVSjWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753859241; c=relaxed/simple;
	bh=Fqc2azcOj/otAKOYF0MkgwRASfc/AAUw6vumWQDkDL4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=MCzK+pAlvy40ZJd832rfGI2bob+nPk/DFRYsPFuz2jlAN3Xw8GN5VvfDK+mawvBmZre33DVVYuDZuJFl+vQWO/nubXyffvbyVJ3pUs1+fJd16PXIqei+ozyZlGLpFjhh7ZisYKBrHITgE6LKsZWj3RHOfCroWV0XmlLtplh76U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FZsGnYwB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753859238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=k0Jrcb6mPZz8pvIdw3iT7NX4ELsp6zt++tHHYLFqDJ0=;
	b=FZsGnYwBHtBp9rLW8zwshXJ5ni+kgVE+5YQDaMRP2VBnCO43eS1WRtGbF8MmH5QirNIIge
	8+pABemJqg8BY3AtPKpxTZiEp/nG6tJRW3CT2E+YT9sWtBoCCDH6tHbA6dgTy90o/UEAq8
	japTkY1Dyo4RVQr+OMyZgDykWgfTdBA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-VhYYl8MeOhmF0cnFy-7QwA-1; Wed, 30 Jul 2025 03:07:14 -0400
X-MC-Unique: VhYYl8MeOhmF0cnFy-7QwA-1
X-Mimecast-MFC-AGG-ID: VhYYl8MeOhmF0cnFy-7QwA_1753859233
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4561c67daebso2248825e9.1
        for <linux-mips@vger.kernel.org>; Wed, 30 Jul 2025 00:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753859233; x=1754464033;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k0Jrcb6mPZz8pvIdw3iT7NX4ELsp6zt++tHHYLFqDJ0=;
        b=sAXgyMlC0Vlb3v8v56fnFD09pw+aH1FYux8rMnb8HNMjSGSdETCTftPwr1ikHlsRH+
         iEturY3Lly1D0Hi0kSqQzjXrA1+pZhYvbz2p5RYl7SaS8qGfu+kMj3l/2OV6BZv6q9dk
         Ska93g5JNO4AG/NoPRAWQjAKhCo+Ei9KovFuQRaPdVIGqaQ73YyFLb5yhLOFOS2Qa8AT
         KIC5Lh8ruDquBku4n+f6ND47jn+ozmHHndTXvpmV4wKVyW3YZMETrtzpDJCvPiOSr4sZ
         M/YduQwPURNXjhePlaIG6XIgl0CIvvVIorardYPWXnolHDccKKpHOFmwRBDsvJPFkEA1
         L+tw==
X-Gm-Message-State: AOJu0YzfbtnupG5QaMQq6nK6+TsAAiYy+8VJNInpRmDixr3el6dvER9r
	K0GuJhJ0WaHNbvFXB6JWDbzbokHeKQqfnpORLeYTHQq3lGj/OyN6mPmhHZK3+WaLX/fVzvKaQnB
	1X4VDfc/ceuc/BgJxOYxHAUWJnLCjmQANJrhazbYR30cLYp5uWad7Ybud0mLBQOk62yg6W6Syi9
	E063OBeuiKFezdqprmj6sBKWCUZ5W71OV8pg5unWuF8bA=
X-Gm-Gg: ASbGnctlek04Djy1OxjXUww1Vbny+MVdLM13EFGT9U3g3HxUi6MKeXuDYREsQVm5XT8
	qNoYoRrK7V7xTk7nLCe3+R3ZNKT4BzO7uPVs9kpS3I8GA/EyKw3jnBoYm9nzaB0dV87pF1pTaCn
	/0ZTY14MpCQCcv8a4siqAyq8281yGZ+xIw43bCAxvuZQ5YULa6p9Bma1mowzuoIpoA9z1TrCMao
	pSG8JtNTUVIn9BvCprlAiA9I/BS5FJfLzIHSu0XrMGHQlD/McIo1GBHefxUHF9QfMyZ5zT6YVXb
	cXt1koD2beT19XsHg2Or/06EoZvGChG3rVdLlgWdwQ8c8NF2vkfOIqI6yjW9p7DoBGtgHE7W00W
	gmVM=
X-Received: by 2002:a05:600c:1e89:b0:456:1a79:49a0 with SMTP id 5b1f17b1804b1-458930bd809mr17954675e9.8.1753859232833;
        Wed, 30 Jul 2025 00:07:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWiG8XoacA2V9hGrMWrRGZASVyY6zbY/2yo5JXCE1yu9+AuLi7Y2PJ7/t6H7MwMynEQgrQiw==
X-Received: by 2002:a05:600c:1e89:b0:456:1a79:49a0 with SMTP id 5b1f17b1804b1-458930bd809mr17954375e9.8.1753859232332;
        Wed, 30 Jul 2025 00:07:12 -0700 (PDT)
Received: from [192.168.0.6] (ltea-047-064-115-093.pools.arcor-ip.net. [47.64.115.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b7961ab17bsm1327440f8f.22.2025.07.30.00.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 00:07:11 -0700 (PDT)
Message-ID: <6cccc75c-df21-42d7-a742-1f9fc59bcc41@redhat.com>
Date: Wed, 30 Jul 2025 09:07:10 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mips: Replace __ASSEMBLY__ with __ASSEMBLER__ in the
 mips headers
From: Thomas Huth <thuth@redhat.com>
To: linux-mips@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <20250611090544.90032-1-thuth@redhat.com>
Content-Language: en-US
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250611090544.90032-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/06/2025 11.05, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> While the GCC and Clang compilers already define __ASSEMBLER__
> automatically when compiling assembler code, __ASSEMBLY__ is a
> macro that only gets defined by the Makefiles in the kernel.
> This is bad since macros starting with two underscores are names
> that are reserved by the C language. It can also be very confusing
> for the developers when switching between userspace and kernelspace
> coding, or when dealing with uapi headers that rather should use
> __ASSEMBLER__  instead. So let's now standardize on the __ASSEMBLER__
> macro that is provided by the compilers.
> 
> This is almost a completely mechanical patch (done with a simple
> "sed -i" statement), with just one comment tweaked manually in
> arch/mips/include/asm/cpu.h (that was missing some underscores).
> 
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Friendly ping! Any chance you could pick this up for v6.17 ?

  Thomas


