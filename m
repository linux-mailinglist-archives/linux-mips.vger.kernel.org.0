Return-Path: <linux-mips+bounces-10368-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DBDB2B500
	for <lists+linux-mips@lfdr.de>; Tue, 19 Aug 2025 01:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C774A3A5E7D
	for <lists+linux-mips@lfdr.de>; Mon, 18 Aug 2025 23:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9593827C17F;
	Mon, 18 Aug 2025 23:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lHaXPjCm"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0321B1FBE87
	for <linux-mips@vger.kernel.org>; Mon, 18 Aug 2025 23:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755560707; cv=none; b=u/+47QRksF6y1Hm5WmlFHBTX8pGak/mxE3nqqF86BVNLqP6jbBW/z5PVDKDazl5jL7yXNklcwBxVRScs79AoPcCyAzxhQoEB16SRs6mlXkBnTAMuRFFe74UnrQID5AGvHzcte6KYvf0UQk6262ygVvYRgrl5ofFu6h5qrHX/uxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755560707; c=relaxed/simple;
	bh=20GbQYSlKyvlXvDnnjkkcG80NKWGMOYxQbD0qXNg3pE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VGJLCLj1ijdooFS69Zxv3g6rU80F4XqnIAsEfnU3CyxtmqVyuZbV0nTTJNnpzX8ov1Ql1WKb3v0QfKt1n6Vu9+SjGHl3il2/aJBuGGip+H42JEatMbvssfGgSlpn7PiMMwwz/AGUq92UapXJnhRtswRijNxEMW6miaJboqY0ZOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lHaXPjCm; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3e57376f5ceso43895795ab.0
        for <linux-mips@vger.kernel.org>; Mon, 18 Aug 2025 16:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755560705; x=1756165505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tr/+srRnInstoyTTTLvFCgnYoosQgmYpeHv/fgPsY8Q=;
        b=lHaXPjCmWqCSTJlzeQINh6keuNXZoDwfyrV4BmVDS2OgG4FoqW5wRPsaEVUVEh/0dA
         U0DPFCZ77P6Y2cwZvz+bwFYMvApZpqmLYVhUdilEG0B/uCDJFvlXzGP8mKqO0oTf9Iwj
         ygWP+fnrs+xNkB1+lJScsKHracnMmctTB7/srQTD3Hm71P8v/SdCOaQ4PKJ7jlJ1AdUv
         1qhLt6RPk2yAaRHTy2d6buZ4EUW1vuPTGRDXUaxRTJ5qUdgTsj5m+kqhOqn/ZfXPnrNh
         qFT8S1aWmBAOWmpnVxzjGYnl6U7i/SYC1VjTPH+kzlfW+R5m7ho3SPJf6U8I7hfUk980
         EHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755560705; x=1756165505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tr/+srRnInstoyTTTLvFCgnYoosQgmYpeHv/fgPsY8Q=;
        b=f7zGuqMB6KN9V5n0p41/JQZgqbuAOcvUIGoArwk9GpamnH8Vw2PYC+ADPq8md0JkPM
         iUJPMW3RIkcLkv0oPtnU4HFJrHY4FRVBE/nfeNn2caFSAcf6otMovHd8d4Xgn5AQ4U8q
         pHX7VWvow/XexgqywaxfvF1GD1f2P/Kh6c/huilIbTLCyH0KGQ6bt3PYwfNsKzzO2+rm
         7PdWTJqWV2/AeavfEQt+o6Ceic60elVTdqhnzYRwoq0wjsoFou0R2vTexl2RYB0JnWY0
         XaofuAX1GXya0WG3BNwlqiOHU6PKbwd/qt8We/aoeZPrph6on9QIYMtfeIWFCf7jM4+9
         EUbA==
X-Forwarded-Encrypted: i=1; AJvYcCX0+322xXFXZV+rhuQX5xorHgCXqiajRkVd/d4eg7igcsEkIAzUJ3C63wDYRkTMCvSzHHX3q/Bg9Aw6@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrjjjxdh5qz88sTMJjC5A9dEqZA8lYEyhPnpzUyIYEMpYNBwgq
	zUEIHrvSB6iwM4soat2U94B/ELKH3EsyXJyLXfNN1yMdHuauQlddKbMmBijUEZGOCA==
X-Gm-Gg: ASbGncu0ntno10UfjbyRXgZZ8W96mcN0VEavUlNlfyqxKWrGavUn6eLjQWE4XvZzHpv
	Ups97XwnrXeoKoiZAmIcgjKRmWlbx3TZhtICX7yrtFpQ04HB7trtwqOUh/kcZZCvncoQT2+RDLv
	la7gpdXWvf1O/5upMUjvPOoUBxQZ2BMgQ6G5875QqG1DZn/lX0xPZ/UbAFafGitTdvUFpmPwfLW
	Q/qPfYJagGFTPJumv+FGqwtxyr3t3//QPK9ij8lbPcawo2eEMuABzGRMWGyEJ8s7QcI/no/w2ne
	XiBESo+9JwX+3ZNpVpQV7ppWo6ub8lT/cajnaDVV7uDbj+9B1HrkDfrncZnZxOpBIf7NtRWLn4N
	hwp3jTb5N9mwC67rY5R0rd9rVwDfze3/rrvF8THa3uyG7v8bhHEjK+pqrRtPT3ts=
X-Google-Smtp-Source: AGHT+IFgrO8Ncrqq+4A/cmmyJGbffL5WUyP9hfiMe85kNg5r66Z0zlRCako1lOTHiPISU60//YjCvw==
X-Received: by 2002:a05:6e02:2782:b0:3e5:4da2:93ad with SMTP id e9e14a558f8ab-3e676639feemr10482265ab.11.1755560704218;
        Mon, 18 Aug 2025 16:45:04 -0700 (PDT)
Received: from google.com (2.82.29.34.bc.googleusercontent.com. [34.29.82.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e57e58c57dsm38431015ab.4.2025.08.18.16.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 16:45:03 -0700 (PDT)
Date: Mon, 18 Aug 2025 16:45:01 -0700
From: Justin Stitt <justinstitt@google.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-hardening@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] MIPS: sni: Replace deprecated strcpy() in
 sni_console_setup()
Message-ID: <2xo5aonnmv5wfyomeh3ju6x4m2x3akr2kcjwx3c25fxwgdgczm@v6m5gtp3apsf>
References: <20250817183728.612012-1-thorsten.blum@linux.dev>
 <20250817183728.612012-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817183728.612012-3-thorsten.blum@linux.dev>

Hi,

On Sun, Aug 17, 2025 at 08:37:13PM +0200, Thorsten Blum wrote:
> strcpy() is deprecated; use strscpy() instead.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/mips/sni/setup.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/sni/setup.c b/arch/mips/sni/setup.c
> index 03cb69937258..fc7da12284f5 100644
> --- a/arch/mips/sni/setup.c
> +++ b/arch/mips/sni/setup.c
> @@ -13,6 +13,7 @@
>  #include <linux/export.h>
>  #include <linux/console.h>
>  #include <linux/screen_info.h>
> +#include <linux/string.h>

This include isn't strictly necessary but I suppose it makes the
dependency explicit.

Reviewed-by: Justin Stitt <justinstitt@google.com>

>  
>  #ifdef CONFIG_FW_ARC
>  #include <asm/fw/arc/types.h>
> @@ -80,7 +81,7 @@ static void __init sni_console_setup(void)
>  			break;
>  		}
>  		if (baud)
> -			strcpy(options, baud);
> +			strscpy(options, baud);
>  		if (strncmp(cdev, "tty552", 6) == 0)
>  			add_preferred_console("ttyS", port,
>  					      baud ? options : NULL);
> -- 
> 2.50.1
> 
>

Thanks
Justin

