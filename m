Return-Path: <linux-mips+bounces-1711-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21682862098
	for <lists+linux-mips@lfdr.de>; Sat, 24 Feb 2024 00:23:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5B201F22949
	for <lists+linux-mips@lfdr.de>; Fri, 23 Feb 2024 23:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E12E14CADD;
	Fri, 23 Feb 2024 23:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ql8tm/gY"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD17C1419B3;
	Fri, 23 Feb 2024 23:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708730609; cv=none; b=kNAliC4IjqI5/yqZQkLqZyOuBQ0UZHg/4QKcSofiQcY5UB0I3GQ9UC+9EUwOCE2xgz7UuM8y1GVAUxeTZQya05tL+nUPQt81ixGW3TnUaIUlxTZjPtntbdYaWgl3rHvdA/drX5DruBjZFcaEV8gD1OI+GHuJ2klHzdoxQpCqzfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708730609; c=relaxed/simple;
	bh=N6kOf4nA1kfeVKu4bUDVNAmyfanJ9PZTJlYfgdcivVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fmVvCP8wFMlIQ22PPGJ25RikNhTOVEdl6EmqLWWpTAW2YH2grGguEx+Mt/WxQzLxmV7mNfXkSmepbwqHfvt9zDKfEssKfpLOtWEU3GAz5lprwK8timZnNoNFhE+8Rbqwdw/FANjM7g+CKBuHDpkstyR47bIoRQ1oRjxooOu4dug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ql8tm/gY; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1dc1ff58fe4so8462275ad.1;
        Fri, 23 Feb 2024 15:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708730607; x=1709335407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FiqHwwDIFlgu953RnTsKDugOiVMOZzq+GWo/eDFLupM=;
        b=Ql8tm/gYPjFLmsgDQXaHY+9gOmkOpsyd3Xrp8HNpKrvgAACMy33uLGcMkq1wH40tfw
         ttDzePz1YRCtrEfB0lEbPvHXqKZ3xORqlk4nctFgDcSrej9DRuoVPWvCF8ZlBE+PhpWw
         kEdEqn/R8BPIeSPZrc396yTWbjgUi/gExWifHynQCv1+NIlucTJ6KRolybCeQn4FV/pR
         38//KeGty4ioKzhsp3dKukLtEsuwxQ0RhfJFcQhT7wkUJQvJ2j6dZLEgx4rLOnZIrBKn
         wfvgj/1BN7o+1sKbkS+y175fob/Ne5dEj+Nmketg3CuoS28fAKUB9sODPRWVqwyiQd7a
         MvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708730607; x=1709335407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FiqHwwDIFlgu953RnTsKDugOiVMOZzq+GWo/eDFLupM=;
        b=Dr3L/jDmut/4GgH7SfLhcYzaCGaBnEmnrTgjxNyrTLbmLhP7hD072+zqRHxSroI2lU
         Y2h19gsQcytEC0GQ6XUBFThxJN2U1iiMvgXSHOsBNeKoZ8XmF3Kq8QhSDkG/GFII0UEo
         gpKtMLqhPWNzST/ox857WXsvWmW/Wm74pZL6J3Mldz1tYRWmR9sl8twdlNqXGvJg7jTm
         JQqwZFqVJhaqw6mesowqF1cN9i8CdxYFYyPWTthO1zEr5d3UvpAFwGxmkQX+0fGeEODH
         Lj81+zPp5MM2SyTX5GCkU3mZ0hk+EuVgSVmTJ26nKBF38Z5q8+5HObe0U2LPNrZJVTFQ
         Rgpw==
X-Forwarded-Encrypted: i=1; AJvYcCUHOq5kTseoTgxRP/gM/QYeciCszSmx+Bi6j6N4NUdiQiO9U1KxlHdj16dt3arHeY6Ymhf11AgUZcLTdBgW5Oqp6bNHkuFZqEr54pn45F2qwZ7hFuJuxdHqDgoL7/yywaDG8MWXQCrqsQnufxBeZxc92Ge/D+jP8ftLicZRVWwY1/EcqYWPZANzb3e1zMDj0EJUsXP9ptNU3pUQhFkuf1aa
X-Gm-Message-State: AOJu0Yx1MeiOOzuJ/bGAit3iYOH3H1w18gacsz7ZgbRz0HpjC+1iCOmW
	HHJKKqImBV76NAodh710PzHDlv+63uC6nkLZ0/uD2LIjZN3FfRxr
X-Google-Smtp-Source: AGHT+IFEAfawHMf5nBlmAJcBqwc+dhP+Td4J3SQO4+9ntTDwOu1ddqXWhazOMBAKnIl7MU/frKuiLA==
X-Received: by 2002:a17:902:ec8b:b0:1db:2ad9:9393 with SMTP id x11-20020a170902ec8b00b001db2ad99393mr1556242plg.48.1708730606848;
        Fri, 23 Feb 2024 15:23:26 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:f0c6:1cdc:5abd:78b8])
        by smtp.gmail.com with ESMTPSA id kr7-20020a170903080700b001d74502d261sm12194960plb.115.2024.02.23.15.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 15:23:26 -0800 (PST)
Date: Fri, 23 Feb 2024 15:23:24 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	linux-sound@vger.kernel.org,
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH 3/4] Input: leds: Prepare for removal of config option
 LEDS_AUDIO_TRIGGER
Message-ID: <Zdko7JAFw_TBV-63@google.com>
References: <30d49088-283c-40f3-b97b-fd5f5174a467@gmail.com>
 <e5ef576b-70ee-4781-88e3-e728c1e7cb9c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5ef576b-70ee-4781-88e3-e728c1e7cb9c@gmail.com>

On Tue, Feb 13, 2024 at 08:33:24AM +0100, Heiner Kallweit wrote:
> In a follow-up patch handling of the LED audio trigger will be changed,
> including removal of config symbol LEDS_AUDIO_TRIGGER. Therefore set
> the default trigger unconditionally to "audio-mute". It does no harm
> if a default trigger doesn't exist.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/input/input-leds.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/input/input-leds.c b/drivers/input/input-leds.c
> index b16fc8194..176f1da7f 100644
> --- a/drivers/input/input-leds.c
> +++ b/drivers/input/input-leds.c
> @@ -18,12 +18,6 @@
>  #define VT_TRIGGER(_name)	.trigger = NULL
>  #endif
>  
> -#if IS_ENABLED(CONFIG_LEDS_TRIGGER_AUDIO)

Should it be simply changed to CONFIG_SND_CTL_LED?

> -#define AUDIO_TRIGGER(_name)	.trigger = _name
> -#else
> -#define AUDIO_TRIGGER(_name)	.trigger = NULL
> -#endif
> -
>  static const struct {
>  	const char *name;
>  	const char *trigger;
> @@ -35,7 +29,7 @@ static const struct {
>  	[LED_KANA]	= { "kana", VT_TRIGGER("kbd-kanalock") },
>  	[LED_SLEEP]	= { "sleep" } ,
>  	[LED_SUSPEND]	= { "suspend" },
> -	[LED_MUTE]	= { "mute", AUDIO_TRIGGER("audio-mute") },
> +	[LED_MUTE]	= { "mute", "audio-mute" },
>  	[LED_MISC]	= { "misc" },
>  	[LED_MAIL]	= { "mail" },
>  	[LED_CHARGING]	= { "charging" },
> -- 
> 2.43.1
> 
> 

Thanks.

-- 
Dmitry

