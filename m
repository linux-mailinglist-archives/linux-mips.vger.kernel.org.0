Return-Path: <linux-mips+bounces-8105-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 765EFA50F0F
	for <lists+linux-mips@lfdr.de>; Wed,  5 Mar 2025 23:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFA961882EB7
	for <lists+linux-mips@lfdr.de>; Wed,  5 Mar 2025 22:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8CE2066C7;
	Wed,  5 Mar 2025 22:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T9TQvKwL"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDA41FF1A2
	for <linux-mips@vger.kernel.org>; Wed,  5 Mar 2025 22:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741215037; cv=none; b=WSWN8qxRVDYlPQfBCk8TuOlmcBpyFEPAN57L4lrXG+yWARbqhOSfd6HvK1sTEOJvV0VPJIqvXNk4AJQJzfbjql/w/ULW9kfToyvnWw2GH3Y322NqrP/6D+WsyrVvbOg4+frfFUiG1RpbbWp/Nd2ePXsK6d/asRjnC7qcPdYcH78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741215037; c=relaxed/simple;
	bh=hINIG5kxOwV7liYzl/+ZFhE/Yh0+VkapvzoZ/yUMGP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IesuoBVhiDj4iZ+OIZuUUG7zAHkUstAh2IsLUvDCus6FkgMK1r7pn3VQ3q/P7ijsmllNagLgT45oi2kkMjdmbAI1ABWHalsuDIcCnMHqmXEPNVUhm04RpX+2aFhyX+VT2wB+xG8c6WHwoUg6eNxBy0oYUdnB84ka6MiUW9SlA3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T9TQvKwL; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4750a85a0ddso38091cf.1
        for <linux-mips@vger.kernel.org>; Wed, 05 Mar 2025 14:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741215035; x=1741819835; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RsjM4YASNleulr3tBXWY5lzfU3eAoHcF5KVgOaYjt5c=;
        b=T9TQvKwLN2u+9y36lckxvdsuTFx31lvq1x1zggBu878diCilZ7xUW+aqF5EBspIg0A
         HUaVZQAK7KkQx4aRLCsS56FN2fqEvRpI8JhGXQIHDTM7FxQvld3ErSslCA2ebNzk7eGq
         GNqny3TiwsJ+IiVthCaZJMfHX3zKrijEWOXdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741215035; x=1741819835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RsjM4YASNleulr3tBXWY5lzfU3eAoHcF5KVgOaYjt5c=;
        b=T7mkw9zUispWP1dNjwNS76vb8hG8mRsYszDiknLTCu/6Ma9iP9utrectwsUkg3iFYM
         J6CA0d5zJWRGUsE/Zknt2y+SvykW2DVnhmm0v8+v5+3UK6GCVAxHfrplSXNA7jVonUs9
         rcW0uKkYZ5N0jcW1YQY8RkTQSwUpB04W2U8l+rJbT4A64iRa87pglGz1svWZvxDxzK/L
         ul0xDjEWUQttO9wjgzjs99leOUVc4hvk1+9Z9PfT9Fcpnk3gccFUCWmw7wzSMl6+99L7
         Mog6ZX71XjlDky15pxGcYYa1ShqK9T+diyMwMIqfnjNgJYKp8PtROXUdL9OECg8MB0PT
         tlkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeyvBjF06w45XgnVX0cx0p+j0Lc9TqWo0kT4gSJx69X4QJDHyIf7w8eRxRtmyCzbxS8uR7BD7xJ432@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg0uuteFOtfzrAon/OIkPvDYErgj+zWEflVQbzZNwOVZQ146QD
	F1ycZzSmyMTqi6l8LAvcYD3JDFVdJ4B1pz0M0y0sh4HO2KfVnZl32mRcUlJ8GOHrHP8d1cyoXF7
	kfuii+mri4plBv9XjqCcJ/Zpzfa6pDz/lUt9+
X-Gm-Gg: ASbGncstWnFu+F64rLmzEp5xB9pmWeDPzcutj/49fDsLYkAckIheHbHglAd2xJRxY/2
	HfsTeZvQUaUccVzmhgOOsypFFgqBypUFvpBAbD7hU9psnSG7WsXe2jmRHEnrsgXy8L6l9K11ExP
	FtG+9k6pZqsL0eErxfsAtXkFyoO9d4FfhVdKWbnEgfR4lTUnGHsyLv0APBJxA=
X-Google-Smtp-Source: AGHT+IHvK+t3RyIjKaNCRJHSF0lsNgux1FRjfJb7Y820KcKp5rPghSBOwl1IAFSXci0ouoP0BoEyc1UcQ1d61NKzM3g=
X-Received: by 2002:ac8:5905:0:b0:475:1754:e044 with SMTP id
 d75a77b69052e-4751c567b75mr312741cf.3.1741215034513; Wed, 05 Mar 2025
 14:50:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305101025.2279951-1-george.cherian@marvell.com> <20250305101025.2279951-2-george.cherian@marvell.com>
In-Reply-To: <20250305101025.2279951-2-george.cherian@marvell.com>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 5 Mar 2025 14:50:20 -0800
X-Gm-Features: AQ5f1Jq5WN2NBjpsa146UgayYxAH8L0biqGumwPp8sUUsQ-SzcQC8JeVH7zSTCI
Message-ID: <CAODwPW_3BCfTcTu=K+6Q3PMe8DtWTiKFHC6+HO2q+cTqs=EPAA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
To: George Cherian <george.cherian@marvell.com>
Cc: linux@roeck-us.net, wim@linux-watchdog.org, jwerner@chromium.org, 
	evanbenn@chromium.org, kabel@kernel.org, krzk@kernel.org, 
	mazziesaccount@gmail.com, thomas.richard@bootlin.com, lma@chromium.org, 
	bleung@chromium.org, support.opensource@diasemi.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	andy@kernel.org, paul@crapouillou.net, alexander.usyskin@intel.com, 
	andreas.werner@men.de, daniel@thingy.jp, romain.perier@gmail.com, 
	avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, naveen@kernel.org, mwalle@kernel.org, 
	xingyu.wu@starfivetech.com, ziv.xu@starfivetech.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	imx@lists.linux.dev, linux-mips@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linuxppc-dev@lists.ozlabs.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"

>  static const struct watchdog_ops adv_ec_wdt_ops = {
> diff --git a/drivers/watchdog/arm_smc_wdt.c b/drivers/watchdog/arm_smc_wdt.c
> index 8f3d0c3a005f..794cf0086912 100644
> --- a/drivers/watchdog/arm_smc_wdt.c
> +++ b/drivers/watchdog/arm_smc_wdt.c
> @@ -90,7 +90,8 @@ static const struct watchdog_info smcwd_info = {
>         .identity       = DRV_NAME,
>         .options        = WDIOF_SETTIMEOUT |
>                           WDIOF_KEEPALIVEPING |
> -                         WDIOF_MAGICCLOSE,
> +                         WDIOF_MAGICCLOSE |
> +                         WDIOF_STOP_MAYSLEEP,
>  };

I don't think this driver can sleep, unless I'm missing something?
`arm_smccc_smc()` does a synchronous call into firmware that always
returns back to the caller.

