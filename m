Return-Path: <linux-mips+bounces-1395-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1155D850D11
	for <lists+linux-mips@lfdr.de>; Mon, 12 Feb 2024 04:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6D9BB211BF
	for <lists+linux-mips@lfdr.de>; Mon, 12 Feb 2024 03:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E779F4428;
	Mon, 12 Feb 2024 03:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="FUpJaGEq"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB0A4411
	for <linux-mips@vger.kernel.org>; Mon, 12 Feb 2024 03:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707709991; cv=none; b=LEdlrNmhzM+lwWF7UVxqp968OoMovCtAtOkroX5uJqKNL8rkXoiUP952yCZkxBdaUyTE8lsRc2x1ys4mTaqDUcVNcMeLg7RLqwyUGUNhNs4H77/bQv2dWAwFjc/LS6ZKznlx9UVUi0nGEU5pIuZ/ayKmLaViQvFbH/Tt/usbWik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707709991; c=relaxed/simple;
	bh=HkMCBw0DGHALj+SwJeNyQL3YJIfK1uCy0Bfa6T+jdJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWnmYn9lO0viII69gr7CFaZ45vnkacLMhhLZOz4HKlzmd2KJq92oLZhCuJEt1ZdzwDFY7Vmnr1Ht42qMt08JRQ13K8wQmzxzd8uoEEFz0ArC1i+XJeEN0GhJoYcmj1jSxBxAp6XQbZmoMd0kXcybg0/ywhkqG0uNK3KQ4ENjI+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=FUpJaGEq; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dc236729a2bso2623926276.0
        for <linux-mips@vger.kernel.org>; Sun, 11 Feb 2024 19:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707709988; x=1708314788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=inoYkFy02Usw5aZpIo0v9tkTLH+MA6a15+xw5EX4KZg=;
        b=FUpJaGEqWbPSkjcbaUW6SWnad7qOWndHNN/I8bBiodMsMY/j2eToFu0CSs9HohhDAO
         JLt/Yd7ci1YhDalR7YHAKh/fEkbGsN/TDqYnQEtSAd5x9SowRfMzFZFYK5E5bVUuZd0w
         2yPkpsdFC2xFQsQXHqpiAkuGO4S4uRf5uJRUOnBvuRQ9XnWGAAfT4mA49EVbCZaPjuAo
         Nv8cixW4fbY5p7Mg4nB8tiOvuXL8hWrKqeiY8vD5iw3eSXXZdZZHcfx9OVujAFX7+JSj
         bIldEr0DZeIEuCMmcKdC9uTAHOVKp/qTq1QQa7jjm1EAB0RYRz/4eckM9flzmPpmZL0L
         xVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707709988; x=1708314788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=inoYkFy02Usw5aZpIo0v9tkTLH+MA6a15+xw5EX4KZg=;
        b=ALIeDO1dMtoEWj7QpAOgW2Vqa8Vm4WmSy/COabkoMdDJiDa1o4sZJpIsGtzcVKNprX
         izN3mPwNuXmu5z/VipcMqZpiJwpc2UIG5cMsDu6UXaGGmjehFtEh0Gu1HsxWN/qm6AVl
         eFJ2U+qhXPg5YuLthIhAampWkDnQ0jOhW3GLmGx4JdTgEAe1MGTtB+BElVJZtuVx2f7E
         phHvsKoyGD/zgnEJTn2p4uoip9IMVrVa32dKP2yI5Yrb7B5znUfMuW1Z2fuNG02sMKGV
         IailrruVnWiE4unQ0Xaez/XOk+4xyOwivk2NXz8BWLEBba503CMkk0INp0PcdYXP+fh1
         sHVw==
X-Gm-Message-State: AOJu0YzJK3yhG4oWBroMYI7Nrz5BTtQcL7Fx2IhgYoz3yJo9b/YV34bt
	ZeOGR+bipByb8x/RH6D7mEMSB94z7C6GWqJGkYU6UBIYQYp6E/ZeI074nYdLHno=
X-Google-Smtp-Source: AGHT+IHL5MMYEd6Tdu2zhzq3q3mUC0DiI3Id8m1CcO2LYxT5rJcWGiFEws38+qzB6pZwj2tc2hfMHw==
X-Received: by 2002:a05:6902:1b90:b0:dc7:443d:d9da with SMTP id ei16-20020a0569021b9000b00dc7443dd9damr5276409ybb.4.1707709988724;
        Sun, 11 Feb 2024 19:53:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWxRCBA6JSrWoNOmSBHvQf6ESrYKH1hwruGLxZRxzTpi22WVw8Zh02svYy6czO+Oebs6yEURoeqiGjs2EbvjVYTaJJ7SYXcjUatOekFnR3JBPHY2vrgP8nVOcY7R74nPTohxElbXP0sRsqSbCHso925i9S5LbST0C601VGvLw==
Received: from ghost ([50.146.0.2])
        by smtp.gmail.com with ESMTPSA id t5-20020a25aa85000000b00dc254858399sm1117808ybi.2.2024.02.11.19.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 19:53:07 -0800 (PST)
Date: Sun, 11 Feb 2024 19:53:06 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH] MIPS: Add 'memory' clobber to csum_ipv6_magic() inline
 assembler
Message-ID: <ZcmWIhn8/G2QK+jP@ghost>
References: <20240211160837.2436375-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240211160837.2436375-1-linux@roeck-us.net>

On Sun, Feb 11, 2024 at 08:08:37AM -0800, Guenter Roeck wrote:
> After 'lib: checksum: Use aligned accesses for ip_fast_csum and
> csum_ipv6_magic tests' was applied, the test_csum_ipv6_magic unit test
> started failing for all mips platforms, both little and bit endian.
> Oddly enough, adding debug code into test_csum_ipv6_magic() made the
> problem disappear.
> 
> The gcc manual says:
> 
> "The "memory" clobber tells the compiler that the assembly code performs
>  memory reads or writes to items other than those listed in the input
>  and output operands (for example, accessing the memory pointed to by one
>  of the input parameters)
> "
> 
> This is definitely the case for csum_ipv6_magic(). Indeed, adding the
> 'memory' clobber fixes the problem.
> 
> Cc: Charlie Jenkins <charlie@rivosinc.com>
> Cc: Palmer Dabbelt <palmer@rivosinc.com>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  arch/mips/include/asm/checksum.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/include/asm/checksum.h b/arch/mips/include/asm/checksum.h
> index 4044eaf989ac..0921ddda11a4 100644
> --- a/arch/mips/include/asm/checksum.h
> +++ b/arch/mips/include/asm/checksum.h
> @@ -241,7 +241,8 @@ static __inline__ __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
>  	"	.set	pop"
>  	: "=&r" (sum), "=&r" (tmp)
>  	: "r" (saddr), "r" (daddr),
> -	  "0" (htonl(len)), "r" (htonl(proto)), "r" (sum));
> +	  "0" (htonl(len)), "r" (htonl(proto)), "r" (sum)
> +	: "memory");
>  
>  	return csum_fold(sum);
>  }
> -- 
> 2.39.2
> 

Thank you for looking into this. It fixed the failure on my mips64el
qemu setup.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


