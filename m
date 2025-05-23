Return-Path: <linux-mips+bounces-9096-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A467DAC2276
	for <lists+linux-mips@lfdr.de>; Fri, 23 May 2025 14:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09F8B3B8328
	for <lists+linux-mips@lfdr.de>; Fri, 23 May 2025 12:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15AB923908B;
	Fri, 23 May 2025 12:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JpXl2pYk"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52311EDA39
	for <linux-mips@vger.kernel.org>; Fri, 23 May 2025 12:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748002573; cv=none; b=QHv3ckV9Ope1GUdzaYrNY9+JPvXkvePdS+Usd49xcn4sxXQLp1xjJw2S/GIQ2Ha68NsowbGHshordrOoRDYx7t1UjnLjYkbVfp0Ba/sNFcmK0Pmwx5FpvpROJNQe+xBkug9sDzC5OkHj5u8UMG9K8Ha6Ibt6ZTd2PEItorVRN40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748002573; c=relaxed/simple;
	bh=EgDWebAmLIsMgY7vDv9DECCxG0h/SjOmQ/R1MVSCVoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZJibW7yqZTAwa9yqiiMzGxO1DBC2bo7i3QwaJ0YWd/MIBedRPlsnzFM4ty8oVoEYL5m5FTdmYUpBfbJ7CuOt4znX89L+RToB97dJTX6TshfsD2g4Ogr31iX+X9X2VOmODonChNP0T6OZGIieR4bdni4Af6IopqztJAh9NmiUt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JpXl2pYk; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c9376c4bddso1036274085a.3
        for <linux-mips@vger.kernel.org>; Fri, 23 May 2025 05:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748002568; x=1748607368; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V8BApzo+tcGxUQ4qyRc5kFvmPIaCYVT6klZyuYrkTWg=;
        b=JpXl2pYkjD5mK51Ywj3Txhc41HbNJW+R5mWVbKoI5AFR+UE6hhHd4u+mnDej/X96m2
         PFkdj6OE5lmajGftoyS6f/x/QwNwpA4w7G9QlK9RhPr03omo04I3SqmMW/MvIsvXKUrQ
         htAKMuv0fj70bwRof8+9RLiGP39HD3ms0PIAeZGaAY2QIcv/M9TZ4bzUIxPRPecltozS
         BFjGz9I6GvQrVwaB+ZgGJ1ZxZLOzo++qfJyYn2eTUHUG7Noq3psAxhQzxQSy2VmuiTk+
         EMTV929DHmPRLeFCBBDqNggslOTW47Qnt8JZfizXfa84/a/0eEop2s8gWj+7WY5upE7i
         D5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748002568; x=1748607368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8BApzo+tcGxUQ4qyRc5kFvmPIaCYVT6klZyuYrkTWg=;
        b=UhSRA8HNARdJKlCHK/LlQBMvxX3wuS+yAD3jKMOWwQtsiHVEJlDh7YYlEdvZv/4Pwa
         D0EEPX9DRVdR57Ydku0VgiNlDp+E+HaZmu21CTngLeBBDSaEjVM2Df6Gdj4YJPfc1eGx
         O4/yggYq+FDSbWfb5Q09umcI9Mt8KB10j/8KZrxQpPxV1ZzDky/eRhIMa/dL1MzHjK+i
         XiGffkuTbVcndjZhO9bM0bsmxtO2OYCSNKCFe/a5x1D4mfqAYkWNJNK3DpUKWcjdNlv+
         CN/klmWCwOjsEt8of8P00c2AwqE6JYEYxVB+CDUVFBnUeUkPNO4dL/i3sBWs6jSouhe/
         ElZg==
X-Forwarded-Encrypted: i=1; AJvYcCWT1vC5HVxcwJoCrQ4U6viLlPyieflmzilUHjA/OQO/P3iiO/vvSet9Ses+dDhwzdzRTUPAzLeHiNg4@vger.kernel.org
X-Gm-Message-State: AOJu0YxY7B+0lFya9c9J9ozyDo1tJGzFbUyPk4oc+HW1znjz8hzQSnJK
	Mcr+FGZF2tuWDgAv6VlQ8iUOMKPrC8vSnroKGhNUpX0Hv7dEnnDksy9+O1hDh82Hm4wzIH6e9yh
	sQUDdJHTF29c7xTvW0b+uGLBvz1yWIBWk9c8TPUdBjg==
X-Gm-Gg: ASbGnctdPBwU8HG/CYF4H3D/aRnjol3olTsL8578DTW0LtJ12Fm4N/8ZkXll53WlreE
	r0h3As6eR3MFBt3vw/06+UqUs1YpFGkkcOV+nt2HPkCxRg0vm+dk6pXGIjfC7BhcwmWTU6SiQB4
	4y1W55oU3W8e1VrxYpjKPp7TAAzdZCx7qad9t9bpG5+lhUKLIT049xYWi7aQrCgKQ=
X-Google-Smtp-Source: AGHT+IFI9cZTC1Lw+RkjnHQgJAawN/JkLsHsZMeuSEx0h5hDWONvffxErgEONGaLu2y1YUsI+OSBxtKp0HDD02GjIeA=
X-Received: by 2002:a05:620a:45a7:b0:7c5:6410:3a6 with SMTP id
 af79cd13be357-7cee31badcdmr357640685a.27.1748002568177; Fri, 23 May 2025
 05:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYsZPSJ55FQ9Le9rLQMVHaHyE5kU66xqiPnz6mmfhvPfbQ@mail.gmail.com>
 <70d46cd3-80f4-4f5e-b0fc-fa2a6f284404@app.fastmail.com>
In-Reply-To: <70d46cd3-80f4-4f5e-b0fc-fa2a6f284404@app.fastmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 23 May 2025 17:45:56 +0530
X-Gm-Features: AX0GCFsCp7KO-IJd_ns8HQ1m2sgketC1fMATdiktIg7OhSVKCwGOqNM2CvlFqFs
Message-ID: <CA+G9fYs1FMx6Z23i8g-yM-cABvZ4yTmPhfpRs4R1LBoP7Cyo5Q@mail.gmail.com>
Subject: Re: mips gcc-12 malta_defconfig 'SOCK_COREDUMP' undeclared (first use
 in this function); did you mean 'SOCK_RDM'?
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-fsdevel@vger.kernel.org, linux-mips@vger.kernel.org, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Thu, 22 May 2025 at 19:32, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, May 22, 2025, at 15:22, Naresh Kamboju wrote:
>
> > ## Build log
> > net/unix/af_unix.c: In function 'unix_find_bsd':
> > net/unix/af_unix.c:1152:21: error: 'SOCK_COREDUMP' undeclared (first
> > use in this function); did you mean 'SOCK_RDM'?
> >  1152 |         if (flags & SOCK_COREDUMP) {
>
> SOCK_COREDUMP should be defined outside of ARCH_HAS_SOCKET_TYPES.
> How about reducing the scope of that check like this?
>
>       Arnd
>

Thanks for sharing a quick fix patch.
This below patch is applied and build test pass.

Tested-by: Naresh Kamboju  <naresh.kamboju@linaro.org>


> diff --git a/arch/mips/include/asm/socket.h b/arch/mips/include/asm/socket.h
> index 4724a563c5bf..43a09f0dd3ff 100644
> --- a/arch/mips/include/asm/socket.h
> +++ b/arch/mips/include/asm/socket.h
> @@ -36,15 +36,6 @@ enum sock_type {
>         SOCK_PACKET     = 10,
>  };
>
> -#define SOCK_MAX (SOCK_PACKET + 1)
> -/* Mask which covers at least up to SOCK_MASK-1.  The
> - *  * remaining bits are used as flags. */
> -#define SOCK_TYPE_MASK 0xf
> -
> -/* Flags for socket, socketpair, paccept */
> -#define SOCK_CLOEXEC   O_CLOEXEC
> -#define SOCK_NONBLOCK  O_NONBLOCK
> -
>  #define ARCH_HAS_SOCKET_TYPES 1
>
>  #endif /* _ASM_SOCKET_H */
> diff --git a/include/linux/net.h b/include/linux/net.h
> index 139c85d0f2ea..f60fff91e1df 100644
> --- a/include/linux/net.h
> +++ b/include/linux/net.h
> @@ -70,6 +70,7 @@ enum sock_type {
>         SOCK_DCCP       = 6,
>         SOCK_PACKET     = 10,
>  };
> +#endif /* ARCH_HAS_SOCKET_TYPES */
>
>  #define SOCK_MAX (SOCK_PACKET + 1)
>  /* Mask which covers at least up to SOCK_MASK-1.  The
> @@ -83,8 +84,6 @@ enum sock_type {
>  #endif
>  #define SOCK_COREDUMP  O_NOCTTY
>
> -#endif /* ARCH_HAS_SOCKET_TYPES */
> -
>  /**
>   * enum sock_shutdown_cmd - Shutdown types
>   * @SHUT_RD: shutdown receptions
>
>

