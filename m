Return-Path: <linux-mips+bounces-1388-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB9A85010A
	for <lists+linux-mips@lfdr.de>; Sat, 10 Feb 2024 01:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1671B25F95
	for <lists+linux-mips@lfdr.de>; Sat, 10 Feb 2024 00:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4285380;
	Sat, 10 Feb 2024 00:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gaoYixg3"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6BB365
	for <linux-mips@vger.kernel.org>; Sat, 10 Feb 2024 00:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707524415; cv=none; b=didXFy3hLI+HL+S+WL1XiFksgPiyMl4uTmywG+U+Q/7W1xxmrpAWt+BgzN/jtxXfsdCxfP/zqIbzdWTPxKze5AOVVSVdR6sAWlmXi5sc/LZClreFxRRALqsgSWOVCAWkA4Ek1cmg4Bdr3U4OnNNU7iIyQ9IPzRc8ZDB+3/llfsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707524415; c=relaxed/simple;
	bh=0xSehnWOhUJDEMMPQy+ntR0zNBeZLK2efFoW8K5pQW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTe7OKLYT1FMyh728h6uN9AS7SIgmeAfTBrXDPTtmTsXhIh2dKmuQ5bx7Sfw7H/YGO9d6bRximgGT2j7ujfGtitI2MZ6O3hSsgcSNhIGZWFIxaA9nAMOVFi1PiAOv0WLj1wKJTRijw0D5s+IMHV/j9+Xc6yfpee2ijqLS9kqduY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gaoYixg3; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6da9c834646so1277763b3a.3
        for <linux-mips@vger.kernel.org>; Fri, 09 Feb 2024 16:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707524413; x=1708129213; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3xeDP/fFDWc1FaB3KHKxe3CtekZS5GdE8FoXXkdCZ34=;
        b=gaoYixg3PNHBdwUBDMXHehi9CaXeK6Qk0G4FfuhFiYKBMWLoJLPjHdCbVuR7U8Vjr4
         JacuUe1IdJVUzRFzqCN6kJokJR3tJR8ekYnJ5uj1IpwOdzC3SDeCVB0X3uYaL4R/RzUO
         ATlbnusNZAyE8zXJabGAHpi1JAnPXSo+/gDzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707524413; x=1708129213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xeDP/fFDWc1FaB3KHKxe3CtekZS5GdE8FoXXkdCZ34=;
        b=H4Vc/hv610LBAD0t5yQfbhMOAyrHrdocnEW+zh73LqypLLQ7TRI6C0fzQrEMUur1/t
         hLNqTmpOYLd3KHbWzo9BJrGAnbCwl+XnMabGXbAOAUadCqinwJk0q8HrSwpAohJ/UcAD
         elD5p/AWNTWCKOqRflfYwlXHj7iN6uSh/Yd/KqH6YIbfmkyMCNCADDq7DqlxH4bAHg3w
         eTrhyoVCZkRz+yRq+kG7xvOswXqtHL/4XDPaSlX4oI+QZHwDrvM5wjXivcnDbdAb8Bsz
         buBCgXEbdpxMhP4P6+paDuTgqFTBkfMwX3IR2qlo08UUuJaDq0Z23IERr7yFKVObkkbj
         UFow==
X-Gm-Message-State: AOJu0YyN57KlKNlNRoAicBbh9TyB7G+YmybUU+1r4R5EsMmDEkXVmUuZ
	zd0tkJoxXZQoisg+po+EqKk+PVY/U53yb0VzpRm7Yq66+Gq54/7RawxK+nup8A==
X-Google-Smtp-Source: AGHT+IHGG5bvzmrn9ED2lC8Vqhz6kp2tJlcSJ6X+2ZZPbLUQCb06KGLYHbjXDO+ph4LGoZZBo0zjCA==
X-Received: by 2002:a05:6a00:1743:b0:6e0:540e:bf43 with SMTP id j3-20020a056a00174300b006e0540ebf43mr1056819pfc.33.1707524412865;
        Fri, 09 Feb 2024 16:20:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUfGHrJnljx2XckhnLiwGzFjO3g2MweYpXgXRSyekz83OtnJ4E1hV9lD09ACuUqtjeI/EcAe1tWbe9p+8pVU/BLGCarDM5pMfvdK9vVNvzszS6mMFUOHQbddOr4mD+ZXtFOZqrrHGxxAVb9vvc5udKrovz573DrrRfHcTgx0RpvByblN9FN/Ce06tjyTQHOjM3jSo/n4gZD6M6ztWUk4CAOJ6aekeZuOiqFHWKB2sotfDTaW06TPhvCwmyAcnJPwUxt+vwDVhLVm6ma3peazCo0NbWKwRY3eRJtz7p+JNCClOE+Qca0g2eJrrh7UYLrx6wt3TwZvcrZJTfSvvwcklYYPg==
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y20-20020a62b514000000b006ddb0dde293sm1136147pfe.65.2024.02.09.16.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 16:20:12 -0800 (PST)
Date: Fri, 9 Feb 2024 16:20:11 -0800
From: Kees Cook <keescook@chromium.org>
To: Erick Archer <erick.archer@gmx.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] irqchip/irq-bcm7038-l1: Prefer struct_size over open
 coded arithmetic
Message-ID: <202402091620.006E59FF9@keescook>
References: <20240209183128.10273-1-erick.archer@gmx.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240209183128.10273-1-erick.archer@gmx.com>

On Fri, Feb 09, 2024 at 07:31:28PM +0100, Erick Archer wrote:
> This is an effort to get rid of all multiplications from allocation
> functions in order to prevent integer overflows [1].
> 
> As the cpu variable is a pointer to "struct bcm7038_l1_cpu" and this
> structure ends in a flexible array:
> 
> struct bcm7038_l1_cpu {
> 	void __iomem	*map_base;
> 	u32		mask_cache[];
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
> 
> Signed-off-by: Erick Archer <erick.archer@gmx.com>

Yeah, looks right to me.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

