Return-Path: <linux-mips+bounces-12806-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A97D0B911
	for <lists+linux-mips@lfdr.de>; Fri, 09 Jan 2026 18:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13ABC315EF2B
	for <lists+linux-mips@lfdr.de>; Fri,  9 Jan 2026 17:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 492C6364E92;
	Fri,  9 Jan 2026 17:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXyugClR"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53CB23817E
	for <linux-mips@vger.kernel.org>; Fri,  9 Jan 2026 17:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767978523; cv=none; b=XbWV7DUYolBeQl8xryye4Z7o3A0kkmvvUY7XVpi/1vOJh5zd6wK6KGeH9cjOCR1nSORLgZeuKxZl75VbrrOtqnHPNLxJ4Y7VsC6nvhNay9M4e1HTdfbqF7eyct7clsXURa7pEyobIinwlz7kNg+6yYvtDJdI6Oi0hM5FK2VlGd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767978523; c=relaxed/simple;
	bh=Oj5XT7gzz6V+mgFqjrRZNuY8ClDDS/vylEH+eVJ2xkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dd2fQOSu26UJzVkJF6FRYJKhKeBmrLEqYn9bajfJzblWGyc8/WvAUhVwmhpKYJRYBf1uqfEbZi2xALSDNPwSdayGi6iixn4wJLvT96jZdQXx199baHpwL7p5p64dP/DCVy5trZuPBRHeyMafoR/jrrPtX+p+ooDYMP9cmskBYeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXyugClR; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-122008d3936so1985947c88.1
        for <linux-mips@vger.kernel.org>; Fri, 09 Jan 2026 09:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767978520; x=1768583320; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fhwhqtJUa1G9Nx32o/FtP8XZe5o3pLenUR9s9//PqGM=;
        b=JXyugClRzPxv+gINuTmXSJQ8EcE0P/Gvpr64+kGOVYQyzasJOJYZ1hhkDqyhQIvGUS
         61VvHcyt3YwNnVz2QbdF+HTR68Z+n5jQo5ZPWFJUn9P5IKM2imFCmGfSRKqLngwxR1hM
         BqSHKCbnSC0JGsT9kfhti+l3+si6R5aQ+Y4lhyaXu8SzBCyoTnDjsczU3LTNjGCmwvYh
         AyMnsjgwLWPah8+t7jBdV4weWPcUMlTr/fxUNUAr6Mtwn1MLa4CVErbdDUaUs+S2R9YN
         p36naihle0z+xsWPak+Hu232/Hg9nmNQCGInGqRf7JUNd79GSGdeFQKtLz5tY3tyEx3p
         FXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767978520; x=1768583320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fhwhqtJUa1G9Nx32o/FtP8XZe5o3pLenUR9s9//PqGM=;
        b=H/PpRq/kwsqIxWhRo8tuBKzJTEQqMPh0Kg4BnNt9Cuvso0GfRnX2swoiePSDylzjDX
         RxLcyjkmSKuwY5jOFk8Oms1HCE5RUbwB6DTbdyKg9arr0NVcxsZZfOk8fxoyd+ickrYY
         kk5nz1PMNrnXPDXAaqSF8qS6bcWjYK2sKu7fzkmd6/kAkQjH88aPPWoctsvdMyprarPX
         QQU9yDIqHnAnTW8kfc/Bxb/FpslNYECimso7eSnLsrEvEMf/lYU5J3hV/t+yuG6l3CBV
         0CqQuUXP9x5Fez+jbswO/5L1xebZur7vhi7mldlzADkybxJzV8Y26Cl2CiLn2GxThmvf
         aXIg==
X-Forwarded-Encrypted: i=1; AJvYcCVNFQOyFLuGwt2cHcR6fpTxA5kcPUsZlH4wMpl/ypdRI+Fa/5gSKjNTIFWNa3VqcdZA9BGPbOMJxIsK@vger.kernel.org
X-Gm-Message-State: AOJu0Yyaxs1wQLxHcenPL+16GgwOIfxLy+SH3YIq2U02SDYvk4vh8ngR
	k5IbIikgNq2RwmFcXmt/+7Ub45cTDMVMbyjFDpg7aTFY0osbExWQ9ADR
X-Gm-Gg: AY/fxX5lHZ8pOxfCOv89a1KV2ZDwhOl1AWq/QkjYTF09dMIwp6XOcA69ZIn9FTdWy0j
	UV5VQmnq4DqnrJqECBZc/iE3JXe01EQWrDD0U5rG3h1Lgpw2woXU8wZXWRd/poiSjzjxoKp2t3C
	hA2PCv5Z8uiOI12+hu/xzKiwL+mpohENkrPu1LrWGU40CwfGd4qmGY4Gx4gACJp4YeDlvVsy/He
	0VjPI8FLt7kV7KLrB0Ty6Pnlaorg2fsg9BoF4u2kT6K8URnAMcsrnuKuCOcTLHzCTKAMd34e03M
	yTAj9z9X/PkTzKZ6CKYqrBO4GbNDQi400QpMc/2bhJNCALBjet+6EEtDkd0JB8xmOI7QOjaUT1Q
	rXY2WZ2ThO74KHBJTMV+pQzE+a74HEIpeqbHkY6WU2khTlaSBFnVb9ff065QjrlJMRQDcERA/cU
	6u1UsUM0y6qfYQneEgJrNemjejo1HMC61AY6Y=
X-Google-Smtp-Source: AGHT+IF0XYbVCtQZkYft+0Wps7/tAcEc9PTYImYZJiepdGfxjC1QwtTJOXR0bcfPsOOi+CQ4RicAtA==
X-Received: by 2002:a05:7022:927:b0:119:e55a:9c04 with SMTP id a92af1059eb24-121f8b7b3e4mr9012115c88.32.1767978519349;
        Fri, 09 Jan 2026 09:08:39 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707b16e4sm11246399eec.26.2026.01.09.09.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 09:08:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 9 Jan 2026 09:08:37 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Brian Masney <bmasney@redhat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 10/13] watchdog: pic32-dmt: update include to use pic32.h
 from platform_data
Message-ID: <76129cc9-345b-4866-8cb9-b36e4374cf8b@roeck-us.net>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
 <20260109-mips-pic32-header-move-v1-10-99859c55783d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-mips-pic32-header-move-v1-10-99859c55783d@redhat.com>

On Fri, Jan 09, 2026 at 11:41:23AM -0500, Brian Masney wrote:
> Use the linux/platform_data/pic32.h include instead of
> asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
> is in preparation for allowing some drivers to be compiled on other
> architectures with COMPILE_TEST enabled.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 

linux/platform_data/pic32.h doesn't exist upstream, and I was not
copied on the patch introducing it, so I'll just blindly asume that
this works.

Acked-by: Guenter Roeck <linux@roeck-us.net>

Guenter
> ---
> To: Wim Van Sebroeck <wim@linux-watchdog.org>
> To: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/watchdog/pic32-dmt.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/pic32-dmt.c b/drivers/watchdog/pic32-dmt.c
> index ab0682492c85ad63160bb7da61cc74336698a4e9..12e3a8f63589862e3ed674ffb71ee4798755e56f 100644
> --- a/drivers/watchdog/pic32-dmt.c
> +++ b/drivers/watchdog/pic32-dmt.c
> @@ -12,12 +12,11 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/platform_data/pic32.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
>  #include <linux/watchdog.h>
>  
> -#include <asm/mach-pic32/pic32.h>
> -
>  /* Deadman Timer Regs */
>  #define DMTCON_REG	0x00
>  #define DMTPRECLR_REG	0x10
> 
> -- 
> 2.52.0
> 
> 

