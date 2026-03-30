Return-Path: <linux-mips+bounces-13988-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8B62OrBGymnn7AUAu9opvQ
	(envelope-from <linux-mips+bounces-13988-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2026 11:47:28 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3343587BA
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2026 11:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8B9403007B21
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2026 09:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED811339B1;
	Mon, 30 Mar 2026 09:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AiwnveCN"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F54F2DCF7D
	for <linux-mips@vger.kernel.org>; Mon, 30 Mar 2026 09:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864009; cv=none; b=WvAEHRCiE4I4J6JvrD7/dbD+dOhJVy+w2uK5x0vL51/e58kYDrZuJ+c1w/B8Q++2Ind+uAzkqpKqtHoIp8CzuFMryL3vwt+RKmX9cElRtkLkjGltRov6Eg3wV2IXJRZAeKseP0uGT5DgqRs5B/Z8i2+Ewy5h3pflN0g9baXnaus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864009; c=relaxed/simple;
	bh=rkENCAFXVPg8Vm5Yjv2svx8VboTG0ChrUDmwOaHMmLU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X/+OTZN6Tw+He3BYIAcaBX0AF2pWcBuerKYiktBuJLc/tAjnANhDBRnxSGgU6MIxzXtgtajKVNB2zvfc8M2RQst1pvtOHBsG3MFJtUfflnw5QlC5tdUX6zPnVlFM0CWRUiDGj6c+yrUvC8pT72V3VREvcIQsK/i0RHSkLSyXizg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AiwnveCN; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso51073035e9.0
        for <linux-mips@vger.kernel.org>; Mon, 30 Mar 2026 02:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774864006; x=1775468806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KB9XdEZzwQk9ZkOw1f9p1S3D3aBhNh5rnIRSiDx9O6E=;
        b=AiwnveCNFoOLm3OyOco+IHXSqAsUDydD0CKNr1wzhMozxoJH0wZvj4R6Ad7ohDmKzk
         Rm2c5nKxY9IwmI4kakBOamPwxTqC2L3O1etwJtwOxv0sBhf8grAqu6KrtI7KLTEevVWv
         Tr8ZOASNkmX3+dB995CF+M7DuvAgzv19XmJcYt5g6MOVyLVQ2lFlY43w3UnfuFmpgU0z
         7FIwdG6h+wBqmWkp+2OoBOYOU8ALKm553Diwqave5cEMC0LmmwxJ7t1y2feJP5a6cRBK
         t1xA4Sqxm7wWl/7zxUDdnJFlSj2u7Cj2rSgr4g9oME6Uso68PNFgI+O6ZVZsKSdeHUxt
         3NKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774864006; x=1775468806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KB9XdEZzwQk9ZkOw1f9p1S3D3aBhNh5rnIRSiDx9O6E=;
        b=UFbxr7y2T0rnkIUKEgBhUBsIJHeYQVC9ej0DgjAX/2cqlGICjhvWt3XUmNz67wasUr
         v//U2X2a/HktUTag4uUtwwt1CJMHZ1AL7XfFu2g/JgTaIWflHybQfNf/3xODnh5kcvDm
         ol25kiqCaWJRa8fxp3nmru5I+J/zoIPri96OsG1JsjtUTuzomQnm1C8tMQpG51ZkkIWC
         j+KORmTqOSdrM4RGMaazJLfbpjc5rPz3vdNYMkdyJUbO3xBmn53XcYKt8y9foboS/8vA
         0hl2jetY2Q6R81zWJ1DKOrspEQLda6A8GQynY2oI05EOxmY9tkDcg040023FoguVBN3D
         p6WA==
X-Forwarded-Encrypted: i=1; AJvYcCUt1CBLSbhHlipG2PtOCj1DzW1bVMtSrZSCASPeDYqOVDRPkNq+3l9VTCWvp14HxmLJvmgTqq6+OKBW@vger.kernel.org
X-Gm-Message-State: AOJu0YxdKSvFiYtZlE+aUJPoyZEL9KP3tq8KDFuFxI8ntkWC3iWizFgN
	9aoHEESV540uZbwhfgTdYsLWCaOWce28U1izxlmMrF59XGKwzNy6opr8vYt78wOH
X-Gm-Gg: ATEYQzzUm/Si4csM09tOw2lSkIH4mcXH1uWvAru9hk+SDNJnferT4ywFgN88IpM2th2
	4TpRtyMF4+dHA7ERuH6sJt9yUFRLQRon5Hx45k/jmW1VLYFWdNzLo4d0Iu2TfEVq9FCVQLTmqiY
	4X3QFHNx0jNG5oxDpagpbumpbhI6/YfNUAfavDwrRZnkO17Gre5vsSOcWFjvslGnNUOtySXSzyj
	Yx1ZVBj7zuGnfRvgDqF3CIainH9EkXsUGX3YXVFixFy4bqo62JHGev90HrvNDXuxTzIZdu2Lfe9
	4a8Z3btH2pVe2NMOS0eGbmb4rQSHh5xBQx4WjO/ToAfnk4exvAP+aOt4nrfnN3E4luoQeddVT0W
	9DMcxK+j+vkZyZzxUuHDrGPEHOwnn1ZW10nKKku7kgO6h8YWa1Xbjs0FqqjSmCrL88xVWDR1nBl
	RlTyJhAa9onsRD2PeHlT1g/1B0YBeWo9P1oVlfdPrfpV2Ns+Am/tQt31s229TMmondqBp7o6s=
X-Received: by 2002:a05:600c:a44:b0:485:9a50:3384 with SMTP id 5b1f17b1804b1-48727efcb32mr208627715e9.25.1774864005614;
        Mon, 30 Mar 2026 02:46:45 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c845b8sm247112145e9.4.2026.03.30.02.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:46:45 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:46:44 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Fix the GCC version check for `__multi3'
 workaround
Message-ID: <20260330104644.1da584e1@pumpkin>
In-Reply-To: <alpine.DEB.2.21.2603300218310.60268@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2603300218310.60268@angie.orcam.me.uk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-13988-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,orcam.me.uk:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,gnu.org:url]
X-Rspamd-Queue-Id: EE3343587BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026 02:54:09 +0100 (BST)
"Maciej W. Rozycki" <macro@orcam.me.uk> wrote:

> It was only GCC 10 that fixed a MIPS64r6 code generation issue with a 
> `__multi3' libcall inefficiently produced to perform 64-bit widening 
> multiplication while suitable machine instructions exist to do such a 
> calculation.  The fix went in with GCC commit 48b2123f6336 ("re PR 
> target/82981 (unnecessary __multi3 call for mips64r6 linux kernel)").
> 
> Adjust our code accordingly, removing build failures such as:
> 
> mips64-linux-ld: lib/math/div64.o: in function `mul_u64_add_u64_div_u64':
> div64.c:(.text+0x84): undefined reference to `__multi3'
> 
> with the GCC versions affected.
> 
> Fixes: ebabcf17bcd7 ("MIPS: Implement __multi3 for GCC7 MIPS64r6 builds")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601140146.hMLODc6v-lkp@intel.com/
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Cc: stable@vger.kernel.org # v4.15+

Reviewed-by: David Laight <david.laight.linux@gmail.com.

Although it might be worth just deleting the version check.
__multi3 is unconditionally defined for sparc64 and that is a much
more complex function rather than the pretty trivial mips64 version.

> ---
>  arch/mips/lib/multi3.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> linux-mips-multi3-gcc10.diff
> Index: linux-macro/arch/mips/lib/multi3.c
> ===================================================================
> --- linux-macro.orig/arch/mips/lib/multi3.c
> +++ linux-macro/arch/mips/lib/multi3.c
> @@ -4,12 +4,12 @@
>  #include "libgcc.h"
>  
>  /*
> - * GCC 7 & older can suboptimally generate __multi3 calls for mips64r6, so for
> + * GCC 9 & older can suboptimally generate __multi3 calls for mips64r6, so for
>   * that specific case only we implement that intrinsic here.
>   *
>   * See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82981
>   */
> -#if defined(CONFIG_64BIT) && defined(CONFIG_CPU_MIPSR6) && (__GNUC__ < 8)
> +#if defined(CONFIG_64BIT) && defined(CONFIG_CPU_MIPSR6) && (__GNUC__ < 10)
>  
>  /* multiply 64-bit values, low 64-bits returned */
>  static inline long long notrace dmulu(long long a, long long b)
> @@ -51,4 +51,4 @@ ti_type notrace __multi3(ti_type a, ti_t
>  }
>  EXPORT_SYMBOL(__multi3);
>  
> -#endif /* 64BIT && CPU_MIPSR6 && GCC7 */
> +#endif /* 64BIT && CPU_MIPSR6 && GCC9 */
> 


