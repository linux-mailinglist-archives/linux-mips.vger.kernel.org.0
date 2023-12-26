Return-Path: <linux-mips+bounces-828-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E06A381E5E3
	for <lists+linux-mips@lfdr.de>; Tue, 26 Dec 2023 09:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75E541F221D2
	for <lists+linux-mips@lfdr.de>; Tue, 26 Dec 2023 08:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62534CB20;
	Tue, 26 Dec 2023 08:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EiS7oCgl"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEBA4CB30
	for <linux-mips@vger.kernel.org>; Tue, 26 Dec 2023 08:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40d5b159350so1354545e9.2
        for <linux-mips@vger.kernel.org>; Tue, 26 Dec 2023 00:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703579082; x=1704183882; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E99Z3zKtzxhsKYnKxnP5BTPaha+ea8ivpNf+0g9T/ow=;
        b=EiS7oCgl1JEhO2XNK/Ub8Am9yET+DaIxXpT1+xBXl9aWRM9BZtUxod4rKQsFq4pUC9
         V1gwEy2OvC4VDdMJI9nQ0QI90RJmMl44gv7kbST0SENemUHgTcps41QEtAoszj5aq/18
         eZTKp9h7Yk5+DzgVD8mJ32UDq0yu6CxbYi9/mPbF5YTXLl0YEZjokaOnuSobopLAkpPX
         39rHgnZPv9JYJdyhUDdbXlqsI/rwTaebHxBTS83G2xHnej5zNRKBK7JLdG/gSw3bnret
         +Cd6LM9wn9X7k76rn+3tY5tyOf1nJDd65EMR3A76mXPZvKbaw/7tZjfnbOlebaxlLuB/
         1aGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703579082; x=1704183882;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E99Z3zKtzxhsKYnKxnP5BTPaha+ea8ivpNf+0g9T/ow=;
        b=gM7+KE6KCoyVzykFUsSEf+rYmXQB251QUd8esS8+Eux7V9rz8oqjFzLmcZ6F+pRkod
         1LoDuwtJfJlByJJvBwC2yIuVFJxsVcMVZa2O5iY2TkOhx57co4xz1qRfNj9UV9RFSh5n
         +Jwv37qTRmWLis9oVspLNj0+FMAaIVF5p0Oat5Z9GJTk+/JW1ztiUr80p4Qli9rg3huV
         tCmm7FOI15ebdoSB1EmNodMnxobJUXCANis1urHHJ1LTY7lwhCcyufyT4a0rxgGT7Vo4
         Zqgpo2SgJ60u2j2pgTDtvXaikG4C1lFkle9nRGWeNI4q04tbbEthkUBtVSDGugxlAsoy
         CtfQ==
X-Gm-Message-State: AOJu0Ywaa+s866Xo2WMP7UK+rFKTtMyh7C270Imdf5lde+jbBEI+gunn
	EHx9SfKiK0opwJsc2pSOoQJAiy61CXHskA==
X-Google-Smtp-Source: AGHT+IGvsNPDVStXoPkLJmAZzbVGB3NgD29AlkoTcgiFJNJ3bw/gTAOYb/ZTipDqE0qPIHSe/E90sw==
X-Received: by 2002:a05:600c:1615:b0:40b:4476:cd31 with SMTP id m21-20020a05600c161500b0040b4476cd31mr3685863wmn.13.1703579082195;
        Tue, 26 Dec 2023 00:24:42 -0800 (PST)
Received: from [192.168.134.175] ([77.132.56.139])
        by smtp.gmail.com with ESMTPSA id h7-20020a05600c350700b0040d2e37c06dsm19719282wmq.20.2023.12.26.00.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Dec 2023 00:24:41 -0800 (PST)
Message-ID: <e7a5aae4-f3f6-449f-8877-16bfcc880b57@linaro.org>
Date: Tue, 26 Dec 2023 09:24:40 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mips: fix r3k_cache_init build regression
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>,
 "kernelci . org bot" <bot@kernelci.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Zi Yan <ziy@nvidia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231214205506.310402-1-arnd@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231214205506.310402-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Arnd,

On 14/12/23 21:54, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> My earlier patch removed __weak function declarations that used to
> be turned into wild branches by the linker, instead causing
> a link failure when the called functions are unavailable:
> 
> mips-linux-ld: arch/mips/mm/cache.o: in function `cpu_cache_init':
> cache.c:(.text+0x670): undefined reference to `r3k_cache_init'
> 
> The __weak method seems suboptimal, so rather than putting that
> back, make the function calls conditional on the Kconfig symbol
> that controls the compilation.
> 
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Fixes: 66445677f01e ("mips: move cache declarations into header")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> My broken patch is currently in linux-mm, so the fix should
> be applied on top.
> ---
>   arch/mips/mm/cache.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
> index e5d19f4a38ba..b7ce73fba998 100644
> --- a/arch/mips/mm/cache.c
> +++ b/arch/mips/mm/cache.c
> @@ -205,14 +205,14 @@ static inline void setup_protection_map(void)
>   
>   void cpu_cache_init(void)
>   {
> -	if (cpu_has_3k_cache) {
> +	if (IS_ENABLED(CONFIG_CPU_R3000) && cpu_has_3k_cache) {
>   		r3k_cache_init();
>   	}
> -	if (cpu_has_4k_cache) {
> +	if (IS_ENABLED(CONFIG_CPU_R4K_CACHE_TLB) && cpu_has_4k_cache) {

Shouldn't we also check for CONFIG_CPU_SB1 enabled?
(See commit 641e97f31887 "Replace SB1 cachecode with standard
R4000 class cache code.")

With that:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   		r4k_cache_init();
>   	}
>   
> -	if (cpu_has_octeon_cache) {
> +	if (IS_ENABLED(CONFIG_CPU_CAVIUM_OCTEON) && cpu_has_octeon_cache) {
>   		octeon_cache_init();
>   	}
>   


