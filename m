Return-Path: <linux-mips+bounces-1387-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15049850108
	for <lists+linux-mips@lfdr.de>; Sat, 10 Feb 2024 01:19:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B10E51F2113F
	for <lists+linux-mips@lfdr.de>; Sat, 10 Feb 2024 00:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35206380;
	Sat, 10 Feb 2024 00:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UYrDWC6t"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08EE366
	for <linux-mips@vger.kernel.org>; Sat, 10 Feb 2024 00:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707524357; cv=none; b=j18aSjZfmfcdkTMjEeD9KLgMubypWx6EKwReyW3uBNR/6b4Y4tgtefCda4ulUGkw2MPKARjIeKV0g/McMXDbbBudpr68JlkM853ECHhDtOEXwTUbDcLKjzeg5Ih+Z4yNDVt5in7+ZST7GEW57odhP+VAAwtKy1LdILDCBpoZg+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707524357; c=relaxed/simple;
	bh=iq6fpzNvbrNJsO1zqHNpHfgJclfdwgHoVjvfJjXyk8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LgM8Yz8sjLSc+bl1BHTnW1GtYofwA29F+4vnxJWJ3Ob5R8pOS7v3ideLuZP3Z0ExsUzF1+GPUTbbKBSnn+6Pe7xfrYcBNGWkkbmh58ZxBzGDZqgfHtYq/SfiwJwu3QnuB+u59MtIsLz2IDghUhWoZ4d9f0B05MQytDlxGXDLdNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UYrDWC6t; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d72f71f222so13290665ad.1
        for <linux-mips@vger.kernel.org>; Fri, 09 Feb 2024 16:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707524355; x=1708129155; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wpUjtDpALKnkVEQ80qom9sdufdRNVtjYZoE0nb9Fp9w=;
        b=UYrDWC6tIM7omHrmRTTJsCJUa2c/XicRE2tzQ2uRVBXOTu8734asInWDCqR6lE2Sa3
         CKUP+cdHX/SJx07MjXMaAySBfBEuR/GxyvhN//kdaqOv9tEXH8aqdbTIHLBc0lrvZn0v
         UrD0j8OqRmniFiHZBdtPxlPvWo+G5pGJ4P13Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707524355; x=1708129155;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpUjtDpALKnkVEQ80qom9sdufdRNVtjYZoE0nb9Fp9w=;
        b=Sdu/HUygOAkHgr/JsB2Pdg2auU9cHxX+hPEADA1lpDplb0s/qKpSlSUNP76nZJeSq7
         Hz1WheYL/zTj9H7dmzpRu6w1GcFA64y676eC/Z1xVf2yOKvpMWJO8ounDanOKW4F3ooj
         vNoi+4AtIAywdXbThicuxx/6GKh6NfFpaca7evnuocBqbHt4lAJEo8XZl94Nb5XP23Zq
         BMmFj0h5aJqL9qi0HwQL6ebhFolfK9RUjRdAOsmX4R3agyGw6UhQeBCG+TB0gZQffJO3
         u2Asr0G/2pRScMPz4imR1np6zjmYwXG9ykTH23R/5wvvNm8lqmL+hL1DWxvemlfYOMtS
         Nj/g==
X-Forwarded-Encrypted: i=1; AJvYcCXcbIOBKQGG2N5vMCJj6suCcmCsZ/BQUtXgEwtqcQ7KY+5u03dO74GdVgmuT/PgB2J+z7FMMNA4yq7y1zuqwDZrasNPj7ksc84Wnw==
X-Gm-Message-State: AOJu0YwYO8PMjclbvEuEPtwXBP19Hmg6CiNUecC/D0msUAJl0/EIA8vj
	lcuL+lJ2UgoBDNtZCDKu0oMcUgVoX3aXYdy3LRWAEzeuBYvFFZ8Xb8Ye2m2WwA==
X-Google-Smtp-Source: AGHT+IEEBZzTNPkIRqK2x7x6H9MYcqdhzdSNvyTXpmFuzJHAi/DDHjTK4INmh8ggJYegRx2ervn7bw==
X-Received: by 2002:a17:903:28e:b0:1d9:c0a0:b3c8 with SMTP id j14-20020a170903028e00b001d9c0a0b3c8mr1269965plr.17.1707524355084;
        Fri, 09 Feb 2024 16:19:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVWzJB3vM8kE82tscM0uXjwXFtLiuKgEcIbJeO/MfXudqoMVv4GPR4GutCMGagbghF3TM43L91pHWQJS0YbZ/USWxr4nMQdu0MHtSxprge0pe8hl7WtjsO+43KuUT3djqjHrBDavO1+OJZWU1QI2x/1JnJ7rWWr2Js/rTMw7+TfobFYaR2TUmrWW18msicFvg8bVxr92aNyEcu6ygqKoN5u9hsvGkwkax6dLEdx7HSj6H2a9G4Xr1hbxbLP+mC/QntrZNQsFcDIpyOSQ+mNfk6uvOZyU8Sb5zuncks=
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id m2-20020a1709026bc200b001d958f8ab2bsm2043788plt.107.2024.02.09.16.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 16:19:14 -0800 (PST)
Date: Fri, 9 Feb 2024 16:19:14 -0800
From: Kees Cook <keescook@chromium.org>
To: Erick Archer <erick.archer@gmx.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] irqchip/bcm-6345-l1: Prefer struct_size over open coded
 arithmetic
Message-ID: <202402091619.80D0AE3141@keescook>
References: <20240209181600.9472-1-erick.archer@gmx.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240209181600.9472-1-erick.archer@gmx.com>

On Fri, Feb 09, 2024 at 07:16:00PM +0100, Erick Archer wrote:
> This is an effort to get rid of all multiplications from allocation
> functions in order to prevent integer overflows [1].
> 
> As the cpu variable is a pointer to "struct bcm6345_l1_cpu" and this
> structure ends in a flexible array:
> 
> struct bcm6345_l1_cpu {
> 	[...]
> 	u32	enable_cache[];
> };
> 
> the preferred way in the kernel is to use the struct_size() helper to
> do the arithmetic instead of the argument "size + count * size" in the
> kzalloc() function.
> 
> This way, the code is more readable and more safer.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
> Link: https://github.com/KSPP/linux/issues/162 [2]
> Signed-off-by: Erick Archer <erick.archer@gmx.com>

Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

