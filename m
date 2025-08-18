Return-Path: <linux-mips+bounces-10369-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CED79B2B528
	for <lists+linux-mips@lfdr.de>; Tue, 19 Aug 2025 01:59:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B0B0527792
	for <lists+linux-mips@lfdr.de>; Mon, 18 Aug 2025 23:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E2E27B348;
	Mon, 18 Aug 2025 23:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mffIIZQB"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D78A27A931
	for <linux-mips@vger.kernel.org>; Mon, 18 Aug 2025 23:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755561530; cv=none; b=Fr7Q++nLwopN+TjS16xeK08ZbzFtu+wURaSI6HB/yM7+ZJ4vqhfg783H3Z8FkFcA3MOV1Q7oK9eNcktepZz1ODA5D38Q73+ImH1s6jq7MO0XXlxFmZEOZjd6VP4EcEFI1vh54NNgtW38ZqHAkSczU3wBu1oEXHp4jhTZ1GtlDKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755561530; c=relaxed/simple;
	bh=glVk/hY3UV087gQCtno8h+R3ZP+p7PuN1b//8T9JP7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vA2EDCTiN6kTu9JSwcZ27nGAFkAkp0/fmBaa4BDZUymm4WDFJNzhvjhIUVixQbh0tPzmg/Xz2Nzvrrdgn3FQvLMrvotIliZHpY8ilEzCiInx0F8vV4RNpvUaO4Hh8+P0ln0x55zE1z1SDKvrNrbnPUg1S14UvSdkpcCvq2DEL5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mffIIZQB; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3e575ff1b80so21786635ab.3
        for <linux-mips@vger.kernel.org>; Mon, 18 Aug 2025 16:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755561528; x=1756166328; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i19yi9n59eMxo8uVt+mvLfPM1/Jk8FxebqQQMeUMWso=;
        b=mffIIZQBPNk6uCAAQSeq90VMwd+6Vm8I5APcRrg+MvbgbrVGOqT+e1VEkMDFn3TQCn
         2FPd+ucQLZ+e/0lkXeqHTvjAcpyeEFc3Z/Pel8E7USfdvtWYUko64R4PvpFMUkikAbGm
         YOWbpOpIRakQzg/XkXKAd2QVlFlHtoPMxu9wh0URzJ2T4fTDIVZQasfNH0WmRh4MJGHP
         E3Hb7RKdbryPQTTsdz0P5Y0fQhJTGnBbyV6dTDe5zHoPoauUgUHAPk/SR7kq+4iuxdUD
         nbRDRtJ6HWPSotQnB/IvudTZgopRER4k1GDsBByztdnVwxjxzGWQInb1rNUO+MhsFoCo
         sGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755561528; x=1756166328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i19yi9n59eMxo8uVt+mvLfPM1/Jk8FxebqQQMeUMWso=;
        b=Fpy4Ap+aqDcr6ClAs68E1aCJosNeDxF/tK+EU3tZNfJAiK7AFbWk9QU8YAu5h6dYwI
         s3Ebw01xxVgfVadnH/bjBM8CYHtFU4gJO/0L8Hb/RiqPyYW7rDGpLgEOj6WjdMW84oMH
         g79zrUrS2TnYLDvrfgPxNqrW8ST621SXSUOueyOFlDDVtIfLYP/uy4+cN1wRVBqmzWli
         XjbKtYuOf8YrA0yNDHADpYZQWrTpCKUdHdDwXzxb35ySdjSIotLWrUIrGtA61kWWftcg
         WVK0jwJle9c7FLP5vDIthMe0xzqfJg8DGA6/G4oGEZVQ0gzpR5XMdsURFtcPXVkAq+/Q
         53NQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3yMTuLWxtTQRy2/s3YmKG0ShHa6KEo+siL7rj9dhp/CIMGfLbKiLfCuikwallCZZBvxbnA4NivI4X@vger.kernel.org
X-Gm-Message-State: AOJu0YzXahlssrig7OSoC14OnuysdYEgh80fmnWN6pOwgSbXO3ymW952
	HFmfRTfCOn3adKL72Edb7ryNvFYge48Davy5isO4CCe6AYrfKymMiTyG9W8q9vCMbw==
X-Gm-Gg: ASbGncscsu4EdA5swcW/XFMwoQLCULCcLmAPbWbLQOYQbc3sjvPU+2C2TuMF59f8YqT
	QbgerJDvbrBOBwZ1+eQAklU/UEkX16f2tOsGPAQcJpvoxZN7V/tLOx8l7naVgaIT72OUyUjb6qJ
	NMPvUM7fdtSiAckKzsm88nA3p3MYRKUhwNeij7s6/4z4buwWKxhtNW0dgDsuXvhjwlX2ZzoH9Oc
	ur1bbKhM6avcMedrzwE3ZYRUNJuvg4eD6jlEjhcHoIQo3wvXl8FKKjXgIs29CNAySr2b5ueskU4
	VbUgYHzoslDkTu0Y4LYCkEmCeB9145F66wX1t0GBJh++/vJz7Z2ASqkw3cgzKmQuxaF3cXcRwhQ
	ty8GXTpUrTdJ/GOaIi2fX0/JMou8rzndO+jDmyt1BHZUQUUNCx6TwEn0pZGeDirwOaz6FGLPZbw
	==
X-Google-Smtp-Source: AGHT+IEz/EI+LZtyAIW9MjYSAxlsQgeLXFtkoryUpRnIuhRS73z7iBfg2JLP0JM/2ebqh0wR5R8r8g==
X-Received: by 2002:a05:6e02:1947:b0:3e5:7de6:c348 with SMTP id e9e14a558f8ab-3e6765ce30dmr12922565ab.3.1755561528238;
        Mon, 18 Aug 2025 16:58:48 -0700 (PDT)
Received: from google.com (2.82.29.34.bc.googleusercontent.com. [34.29.82.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50c94781b7csm2898883173.15.2025.08.18.16.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 16:58:47 -0700 (PDT)
Date: Mon, 18 Aug 2025 16:58:45 -0700
From: Justin Stitt <justinstitt@google.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-hardening@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] MIPS: arc: Replace deprecated strcpy() with memcpy()
Message-ID: <yisgcmjp5cj27yozthudyrdpfcovhcrgpqbyip5kcum4aa7qwl@52bccatjuiak>
References: <20250817183728.612012-1-thorsten.blum@linux.dev>
 <20250817183728.612012-5-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817183728.612012-5-thorsten.blum@linux.dev>

Hi,

On Sun, Aug 17, 2025 at 08:37:15PM +0200, Thorsten Blum wrote:
> strcpy() is deprecated; use memcpy() instead.
> 
> Use pr_debug() instead of printk(KERN_DEBUG) to silence a checkpatch
> warning.

I'd like to see more reasoning for why you chose memcpy() here. With api
refactors like this I think most folks want to know if 1) there is any
functional change and 2) why you chose the api.

> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/mips/fw/arc/cmdline.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/mips/fw/arc/cmdline.c b/arch/mips/fw/arc/cmdline.c
> index 155c5e911723..86b0e377b713 100644
> --- a/arch/mips/fw/arc/cmdline.c
> +++ b/arch/mips/fw/arc/cmdline.c
> @@ -42,12 +42,13 @@ static char __init *move_firmware_args(int argc, LONG *argv, char *cp)
>  {
>  	char *s;
>  	int actr, i;
> +	size_t len;
>  
>  	actr = 1; /* Always ignore argv[0] */
>  
>  	while (actr < argc) {
> -		for(i = 0; i < ARRAY_SIZE(used_arc); i++) {
> -			int len = strlen(used_arc[i][0]);
> +		for (i = 0; i < ARRAY_SIZE(used_arc); i++) {
> +			len = strlen(used_arc[i][0]);
>  
>  			if (!strncmp(prom_argv(actr), used_arc[i][0], len)) {
>  			/* Ok, we want it. First append the replacement... */
> @@ -57,8 +58,9 @@ static char __init *move_firmware_args(int argc, LONG *argv, char *cp)
>  				s = strchr(prom_argv(actr), '=');
>  				if (s) {
>  					s++;
> -					strcpy(cp, s);
> -					cp += strlen(s);
> +					len = strlen(s);
> +					memcpy(cp, s, len + 1);
> +					cp += len;
>  				}
>  				*cp++ = ' ';
>  				break;
> @@ -74,6 +76,7 @@ void __init prom_init_cmdline(int argc, LONG *argv)
>  {
>  	char *cp;
>  	int actr, i;
> +	size_t len;
>  
>  	actr = 1; /* Always ignore argv[0] */
>  
> @@ -86,14 +89,15 @@ void __init prom_init_cmdline(int argc, LONG *argv)
>  
>  	while (actr < argc) {
>  		for (i = 0; i < ARRAY_SIZE(ignored); i++) {
> -			int len = strlen(ignored[i]);
> -
> +			len = strlen(ignored[i]);
>  			if (!strncmp(prom_argv(actr), ignored[i], len))
>  				goto pic_cont;
>  		}
> +
>  		/* Ok, we want it. */
> -		strcpy(cp, prom_argv(actr));
> -		cp += strlen(prom_argv(actr));
> +		len = strlen(prom_argv(actr));
> +		memcpy(cp, prom_argv(actr), len + 1);
> +		cp += len;
>  		*cp++ = ' ';
>  
>  	pic_cont:
> @@ -105,6 +109,6 @@ void __init prom_init_cmdline(int argc, LONG *argv)
>  	*cp = '\0';
>  
>  #ifdef DEBUG_CMDLINE
> -	printk(KERN_DEBUG "prom cmdline: %s\n", arcs_cmdline);
> +	pr_debug("prom cmdline: %s\n", arcs_cmdline);
>  #endif
>  }
> -- 
> 2.50.1
> 
>

Thanks
Justin

