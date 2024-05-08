Return-Path: <linux-mips+bounces-3167-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F297D8BFDA8
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 14:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA67B2859D9
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 12:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97DE56B60;
	Wed,  8 May 2024 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nF8mCKjC"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0828722071;
	Wed,  8 May 2024 12:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715172641; cv=none; b=sXGDODACVmairh7Yl29q4beZndePa4BmdYGYNAwP5nPAG31p33W3LRnLGMuDBOD0osT3TG2EXKukMCaZm0T5UhLXx/ytR2wosCHXrBbXaI4OTcF2zbXzM8yA7ZGYZmspRzbLr/UnOTHj4j5ev4vEK7BWhX3Zpq3hWHrcmFHFqks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715172641; c=relaxed/simple;
	bh=xxoigdMuZDH/elCkReVLK7gi7lt+nFEyJsXIqj3Mwp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BjwMn6+7EyG1tfZ6t+Su0vTpT+lAEqmQyHxKdPto5aD0HUfdh4a2LdcmkkM6j+DrTmKQu7jHjagNU3jRjkiP9QjJMucS6by2u+/KWw/sgCPthjIsUsZ6asKdxJym71ovwpWU3C2Hcp4cEDKNe2VlgsIkfJm+KPL1k5fAM6eZEUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nF8mCKjC; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51f74fa2a82so4951118e87.0;
        Wed, 08 May 2024 05:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715172638; x=1715777438; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5W3/T5hNFLBQFwQnjoXHkZWSTE3Wc9MBCfUpRXABUCY=;
        b=nF8mCKjCSwJBqHEu/jUWV4YdMn6DTOJ4/bCg5+0ihNSaJrbZrRtJna/vTYXHWWblPQ
         13lwIFvjp4Lx7q5il+heRbgrQy709mPXe/t7QrcxUnWItcwxw9bFBQB4/oxU01q1Q/vt
         oMYyqVcS0gjyoMf/NihJuxM9Wk/3MUyczhlVtB7332dVMYWvpveWscvmKN77EYPQyYbN
         vSpe9b0192MESngxPxVzXXvATMBBPu043dHnqELQ9+tQRVh3YSglXtu+eWHoOzRtlxdQ
         KKKP5OC3S+vBWnSYqbtMxGwWypW9Yh5bNvi2hwfwsezzqxQkVocJQer7ub/UrEXzbIDH
         i2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715172638; x=1715777438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5W3/T5hNFLBQFwQnjoXHkZWSTE3Wc9MBCfUpRXABUCY=;
        b=An5N85Lkw9CooRKi0XG/XkEoRFw9hRJZzH0bDCvnl0bCn58M9F4WJuH1HK27FBoLeT
         9liwiE+nnvQPPOxt2Q1jOWMtBPwg6KSTXmDKnVLF7MqnD13pyQ5MVmpLyJC24CdV1Zcx
         6ybM9xeXPpxb8PFkQIEjRaBhQje5ej8XuQYTrNyVnHAdvjecEZbX88/slJqPwwo0IeNj
         guG3Wt8g8nssHFJ76Xco+gzxVtQ9MmrIQOoXcBC6e5/SWX9hODrqtxWqlNuyFcciG0o3
         /H162cj1fwHGLIDCR3F+dN+q+3OSXc5jlZZ3vg1j2sEaw2pYNUdho+qSbvKPAQfLN2uK
         jnkA==
X-Forwarded-Encrypted: i=1; AJvYcCUzm2TyX8EbI1kYegQWO8c7WSk7EtpD/34+IOCm/3Ncn2uVlO9/lebB4NhOX39Iqq45VN8MmG/9iRT3OTZAvlTxaoBC+1riYH1u1j2DK2EK/6loLSraxTRpIP2Dw0tr2bIlelFa78QeIHnWyQvczpzkog35uETVc0K768zksVHnIeAmhRw=
X-Gm-Message-State: AOJu0YxqynJDP3WQEaE/T17moAg03QP/3JxXo9Uw/8YKwRk5YwyvJw4T
	ztg+oHXM4BysIASLAXcM/0WanKUxqqXOBx8WncDBN9fiDm/ZOeGD
X-Google-Smtp-Source: AGHT+IExQ9Bo3wFOlD3cPw8vNboAsh5CWVK1tusp2l9JO65IhQgGzC0hKoUwKiy+1C44igc64lZdvQ==
X-Received: by 2002:a19:8c11:0:b0:51d:804a:232 with SMTP id 2adb3069b0e04-5217c372ea6mr1996300e87.11.1715172637827;
        Wed, 08 May 2024 05:50:37 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id g3-20020a056512118300b00518e17fc331sm2499159lfr.157.2024.05.08.05.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 05:50:37 -0700 (PDT)
Date: Wed, 8 May 2024 15:50:34 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Paul Burton <paulburton@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/5] MIPS: Move mips_cm_probe after prom_init
Message-ID: <forgoxnzqnwreba7j57lgs6lgzny3zdnaqnpctr2qhtlcad3pg@l44sn4zf7hu3>
References: <20240507-cm_probe-v1-0-11dbfd598f3c@flygoat.com>
 <20240507-cm_probe-v1-3-11dbfd598f3c@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507-cm_probe-v1-3-11dbfd598f3c@flygoat.com>

On Tue, May 07, 2024 at 10:01:51AM +0100, Jiaxun Yang wrote:
> Move mips_cm_probe after prom_init so we can use fdt functions
> in mips_cm_probe to obtain essential information.
> 
> Impat for all systems that may have CM in system:

> - geneirc: Adjusted code to accommodate this change

s/geneirc/generic

> - Lantiq: No impact, CM configuration won't be changed at all
> - ralink: Called mips_cm_probe on it's own, in prom_init->prom_soc_init

> - malta: No impact, CM address comes from CP0_CMGCR

Are you sure about this? This was one of the problematic part I met
back when was trying to implement the feature.
arch/mips/mti-malta/malta-init.c:
prom_init()
+-> mips_cpc_probe()
    +-> mips_cpc_phys_base()
        +-> mips_cm_present(): mips_gcr_base != NULL
        +-> read_gcr_cpc_status()
        +-> read_gcr_cpc_base()
        +-> write_gcr_cpc_base()

So by moving mips_cm_probe() to being executed after prom_init() the
calls-chain above will be broken since the mips_gcr_base will be left
uninitialized. Do I miss something?

Please, note originally the mips_cm_probe() invocation was right
above the Malta's mips_cpc_probe():
3af5a67c86a3 ("MIPS: Fix early CM probing")

-Serge(y)

> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/kernel/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 12a1a4ffb602..732579c8f4f8 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -773,8 +773,8 @@ static void __init setup_rng_seed(void)
>  void __init setup_arch(char **cmdline_p)
>  {
>  	cpu_probe();
> -	mips_cm_probe();
>  	prom_init();
> +	mips_cm_probe();
>  
>  	setup_early_fdc_console();
>  #ifdef CONFIG_EARLY_PRINTK
> 
> -- 
> 2.34.1
> 
> 

