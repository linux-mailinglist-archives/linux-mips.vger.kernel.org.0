Return-Path: <linux-mips+bounces-5749-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 574F49918BC
	for <lists+linux-mips@lfdr.de>; Sat,  5 Oct 2024 19:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCEA11F2202F
	for <lists+linux-mips@lfdr.de>; Sat,  5 Oct 2024 17:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0363158A3C;
	Sat,  5 Oct 2024 17:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aiPWDcxQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192F2158A13
	for <linux-mips@vger.kernel.org>; Sat,  5 Oct 2024 17:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728148445; cv=none; b=ogDpEKZENWXh3Ja1c8nHxZ6bCd2EfHV/CFrV7BdZSK0Q07KO3fASZE5RweutNSLtkyj0WhW/NYbTrdcYb2GYPnpeL69SCVkuolIViBD0Ame5uyq7UXmW3gditjHGbOqom9zS9bFBzDP2S+vlfQ23M9pQXny01gC/WH6RlPMz80U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728148445; c=relaxed/simple;
	bh=kOY8bHCUVhC0yHlFTIntvQOQcHjqsdTdYD6eNsJAWxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gQN4HSt2479BTJ4M3b+nl+dHoWZ23yqGwKC7W5DDcSfVjTiA3Ms7IcMSqPT+OkGa+L7OOs6OpNbPeNs/4FcI5yXvRdFnRhQl/y7QXzCv9YgCrKx4RIB0wysnxFKs8mWgRku0TiNYdCEDSJNhg33NzYKF7FfJ1jOpomMQHte3Yq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aiPWDcxQ; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7d666fb3fb9so1782589a12.0
        for <linux-mips@vger.kernel.org>; Sat, 05 Oct 2024 10:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728148443; x=1728753243; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d+vL4rnKAcRWy/BUE6jAqCKdidayjqwnsDQnh1rx2zc=;
        b=aiPWDcxQNK7Jssy5qZwVqYTSC1VV53YFLBwRugL3+wJOQ6zh3C7pIjpyGDnkVhtWB9
         cCVssbhPu0sbR43YMhlfSPee+GiKDoZou6khcVZz03FXrvEYXvV8b+rJQRY4EI3Gf7Vd
         dTtjguViPX7g/88YVFKgDQ+xfn60cUB5R665FvJQiBlcty2JTl2RHAYEKYduoNaqo+FY
         jMQjsohj2oIMs8Nb2bM5T/k1vP66uoW3byCKePI5aBuvF1qCMmgD1zPsxA3W78kkZhSL
         WpRb76/GQWjJWaBuprbDTpSNd8x61XGsd9H5tX73XNDc1OoE57dRin/K03uccCCu6W8F
         tMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728148443; x=1728753243;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d+vL4rnKAcRWy/BUE6jAqCKdidayjqwnsDQnh1rx2zc=;
        b=RrqUz/U/dqPqKoPvA2w/KUkcWSM9JmepU1Dt2Qcp4W0yAO+pteetd57E+qgmxsXI0w
         1f8CkvDKIiYwUKPZAUQNs23nW2GOrBwYqs2EjA34Ii5lsZVyOzlXw+DioN0uNgHJ8R7f
         lrw38d905G0QZz4TolwATYYnCbUJxcqX2W7v5qukrYX/mBduibHd22yCjsWz5cMpgi6P
         U6JX9xlLZETOQ97FyUAr8kaVb2dU8DTjwIygN9u6OFNThbNAR1Qj4UayKvGrFz8XPLHm
         0BPQpacets2hIVu0N9fQ/O9raCUJnKVZIYezbsFbycIISvNWb96oiSaGPhTu4ZiApsJs
         Ogkw==
X-Forwarded-Encrypted: i=1; AJvYcCXzqiFJUzXjFrjqkRpF/h34k8ton4auxJSDGWYqDYwLxz9P2pSE1rjVESh7DCfafSDE4TWm2OEYSrg4@vger.kernel.org
X-Gm-Message-State: AOJu0YylJZI5CpwLzxZ4uC4JUVP6InP0x9SegfqD75Cs4CvYBWchW9uX
	nqx42Ag4Z3Wq8XtQdV5aRYV+WOGJqN2p3KZGQ94aX7TfrnZWYUlem3LSQizVux0=
X-Google-Smtp-Source: AGHT+IFyeSaZ/mX0gHS9Rgt1KvLjRdPDDqOZ19D3tlNlq221lO03ztxwxmd18OQJDpTQCgw1WknJ4g==
X-Received: by 2002:a05:6a20:9144:b0:1c6:8c89:88c9 with SMTP id adf61e73a8af0-1d6d3ae1752mr16549274637.18.1728148443249;
        Sat, 05 Oct 2024 10:14:03 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d7cfa4sm1697426b3a.196.2024.10.05.10.14.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2024 10:14:02 -0700 (PDT)
Message-ID: <24761ba0-99bc-4637-a76c-f29be10a1753@linaro.org>
Date: Sat, 5 Oct 2024 10:13:49 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] asm-generic: use asm-generic/mman-common.h on mips
 and xtensa
To: Arnd Bergmann <arnd@kernel.org>, linux-mm@kvack.org
Cc: Arnd Bergmann <arnd@arndb.de>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>,
 Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Damien Le Moal <dlemoal@kernel.org>, David Hildenbrand <david@redhat.com>,
 Greg Ungerer <gerg@linux-m68k.org>, Helge Deller <deller@gmx.de>,
 Kees Cook <kees@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vladimir Murzin <vladimir.murzin@arm.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org
References: <20240925210615.2572360-1-arnd@kernel.org>
 <20240925210615.2572360-4-arnd@kernel.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240925210615.2572360-4-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/24 14:06, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> mips and xtensa have almost the same asm/mman.h, aside from an
> unintentional difference in MAP_UNINITIALIZED that has no effect in
> practice.
> 
> Now that the MAP_* flags are moved out of asm-generic/mman-common.h,
> the only difference from the its contents and the mips/xtensa version
> is the PROT_SEM definition that is one bit off from the rest.
> 
> Make the generic PROT_SEM definition conditional on it already being
> defined and then include that header from both architectures, to
> remove the bulk of the contents.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/alpha/include/uapi/asm/mman.h     |  2 +
>   arch/mips/include/uapi/asm/mman.h      | 65 +------------------------
>   arch/parisc/include/uapi/asm/mman.h    |  3 ++
>   arch/xtensa/include/uapi/asm/mman.h    | 66 +-------------------------
>   include/uapi/asm-generic/mman-common.h |  2 +
>   5 files changed, 9 insertions(+), 129 deletions(-)
> 
> diff --git a/arch/alpha/include/uapi/asm/mman.h b/arch/alpha/include/uapi/asm/mman.h
> index 8946a13ce858..1f1c03c047ce 100644
> --- a/arch/alpha/include/uapi/asm/mman.h
> +++ b/arch/alpha/include/uapi/asm/mman.h
> @@ -5,7 +5,9 @@
>   #define PROT_READ	0x1		/* page can be read */
>   #define PROT_WRITE	0x2		/* page can be written */
>   #define PROT_EXEC	0x4		/* page can be executed */
> +#ifndef PROT_SEM /* different on mips and xtensa */
>   #define PROT_SEM	0x8		/* page may be used for atomic ops */
> +#endif

Surely not conditional within arch/alpha/...

> --- a/include/uapi/asm-generic/mman-common.h
> +++ b/include/uapi/asm-generic/mman-common.h
> @@ -10,7 +10,9 @@
>   #define PROT_READ	0x1		/* page can be read */
>   #define PROT_WRITE	0x2		/* page can be written */
>   #define PROT_EXEC	0x4		/* page can be executed */
> +#ifndef PROT_SEM /* different on mips and xtensa */
>   #define PROT_SEM	0x8		/* page may be used for atomic ops */
> +#endif
... only conditional here in asm-generic.


r~

