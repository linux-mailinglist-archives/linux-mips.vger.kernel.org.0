Return-Path: <linux-mips+bounces-12807-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D2CD0B857
	for <lists+linux-mips@lfdr.de>; Fri, 09 Jan 2026 18:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4347830317A2
	for <lists+linux-mips@lfdr.de>; Fri,  9 Jan 2026 17:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54EAF35A938;
	Fri,  9 Jan 2026 17:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KoxB2ket"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19A77E0E8
	for <linux-mips@vger.kernel.org>; Fri,  9 Jan 2026 17:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767978554; cv=none; b=uPev7BCLJcZYLTmipJ6clRsvnDtou4s+O88aOY7PcGZ1nJ1npu2ZAK4874z7LygyRSF/3bSSgZUKyVDLHVZPi5/y1RDCv1A/bGZ0YLG6UeOICFQwaefY7T+AEvJhFswo/bLYlxj3IkBRS43/1EN/SiLbB/Z+YoG6kNS8ieru9WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767978554; c=relaxed/simple;
	bh=K92SQokuv4dcUp+BpA8TJMIRTaZToe5MR1lfLU8ifOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bx0M/BQTMOic9JxqOkY22YfEbp1AL5BEHCSTPyPCZZssq3X1Z/UGDtufHaSysaVx5qU2NbYTyaWWjohx/UHSS0aVYk9v45zfbLqo6N2as74kZwG4rrYbYvIPCbaTmZxGLNfBJ3tA0oTnmWAyVY8C/rtirlFI6dwhiYk9SBEm1u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KoxB2ket; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b04fcfc0daso4354771eec.0
        for <linux-mips@vger.kernel.org>; Fri, 09 Jan 2026 09:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767978552; x=1768583352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWM3mOtMLKj7tsnRqDjM3d2lr1FosWLhvBASMvvKFDM=;
        b=KoxB2ket6le7vd11+8A8PPSYc67d76fcbI2gtOhxUOX0vQWjRpTREAIoFPSOyHz0tl
         fx+DYo/jZBroEI3mhojIf1LBAzBeYXFkzDVPTCU0lBrLR5zimuU5KnPOnPz0C+ryjtTg
         6Yh2BGRLdaiI2ZVZx5Pg6QgsdodVUxGi1rrjRJTw2vlzvtNDcqZj4IDwAhB5g8SOfxC4
         3wKk27iJL+If1KK4yUiA6aqb38dK3pvD7G7bxZqfO/KuPTvDuSmndACWTh6P1KYOdrj0
         JnbgfwvCLT1VK3mAY1ZR5BoVGBT6TXykETtcrBgYTdC9GuAQc2LIjt1889GPznPde56Q
         w0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767978552; x=1768583352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aWM3mOtMLKj7tsnRqDjM3d2lr1FosWLhvBASMvvKFDM=;
        b=K2LU4tnxK4R32tuDzkwnafWda1rc1ETZISj9S2t2l6lK+DtPb51I8L93xjB+L96xbA
         iMt6UZjs6UnwAjw2lLuRCYnA2+ds3+uYoeUJyHVA8rQAd3CZPXZrFjfzZqfInh0Y3MRw
         beFlaGDn/hIGW4x1SIwkssmcemPqPEZM/ZmVDN6tQqdEFtVCoxApYeOV44+xbjX7+4DS
         GWNz/XDIKeap6w0gmo5hSRHjBOjA8BqZy32VGef+Zrh7h9GLAQAPn1UL/y6Md5FQgVxT
         xMI5jj11hNyy1PYTEmy7u6yr1fk0DHZlZaoxMSe05GHT+G0LX6qb7ZDFKprlPHDGO9ar
         F7gw==
X-Forwarded-Encrypted: i=1; AJvYcCXynKiRpIpMBmTCSF8b2oAvWlH4qU5FN2fwxs5ZnY24AAdfZQ0eWab4uVp7HAaTiHE3K1zfs2i5FJrG@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuc1JeDV5rW1DnWudd0IUmpJpY2pB9mJ7xmIm1TbMIy57fcvvN
	PJgro0OnGKEMiFLxm1tEGbnFStoc8Q+S5tlpM59rPD8LDWFWPIUAorUT
X-Gm-Gg: AY/fxX7EnTo+Omr/0FJ/4Nq596dM6TcFZ7SdrlAzp3TscCbbojR4i54eWlZwfkwXeA5
	HOIhYYEtLFzq+u6DjegiBsi3FX9vaNGVw808LTUIEqbSIhys+ap+HsiiXB+c0dCi+1Hc/16HiLG
	nk+fMSz/eJYiWRKaC4AOPWbtQynmYde1T+e2T9JMpAQrLwGkFXtp1YfxKgoa75A6DOyCXbWqQuh
	C1Vhi9NU+eR2HObN9YGzs494BJbDlK2XoSfgFDSCxhzbnr9fhV9FYe3SeC2qNkzo5IyBAQju18l
	MkDg2d+405bHaiJrebw25tELyyJqEfYLncjFmmRPnC082uMSh6nAI1VVHibvXANhIbhrpu/iGUP
	ro2M8iXG7Q/BgcdgJMddJM7Omj+ln2NfFUiFw1TmUqzbGvTJB5dA4Pi/N1aW3NGLxj/q5LoBFn5
	8lubnlO0njY3GOVh9Euw5YAzqK
X-Google-Smtp-Source: AGHT+IGCtnFo8pb2corF6j0sOd4jbTm4LP3kVTOBB0SzQtNjglCr4A1HURCZKos+giFIElujOBgjkA==
X-Received: by 2002:a05:7300:8290:b0:2ae:598e:abe5 with SMTP id 5a478bee46e88-2b17d321a6dmr5690640eec.35.1767978551870;
        Fri, 09 Jan 2026 09:09:11 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1706a53f0sm11280114eec.10.2026.01.09.09.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 09:09:11 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 9 Jan 2026 09:09:10 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Brian Masney <bmasney@redhat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 11/13] watchdog: pic32-wdt: update include to use pic32.h
 from platform_data
Message-ID: <d40bcefe-4d11-43e4-9a62-2f4b2284830d@roeck-us.net>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
 <20260109-mips-pic32-header-move-v1-11-99859c55783d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-mips-pic32-header-move-v1-11-99859c55783d@redhat.com>

On Fri, Jan 09, 2026 at 11:41:24AM -0500, Brian Masney wrote:
> Use the linux/platform_data/pic32.h include instead of
> asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
> is in preparation for allowing some drivers to be compiled on other
> architectures with COMPILE_TEST enabled.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 

Same as with previous patch.

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
> To: Wim Van Sebroeck <wim@linux-watchdog.org>
> To: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/watchdog/pic32-wdt.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/pic32-wdt.c b/drivers/watchdog/pic32-wdt.c
> index 1d282de312ef1bd683529088fc88456983e8efb9..2e7186b85194645d40f32e69f198514fca83b601 100644
> --- a/drivers/watchdog/pic32-wdt.c
> +++ b/drivers/watchdog/pic32-wdt.c
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
>  /* Watchdog Timer Registers */
>  #define WDTCON_REG		0x00
>  
> 
> -- 
> 2.52.0
> 

