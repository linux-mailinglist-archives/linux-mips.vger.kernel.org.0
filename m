Return-Path: <linux-mips+bounces-1759-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B257E867F40
	for <lists+linux-mips@lfdr.de>; Mon, 26 Feb 2024 18:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 533141F2F84F
	for <lists+linux-mips@lfdr.de>; Mon, 26 Feb 2024 17:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4CC12F59E;
	Mon, 26 Feb 2024 17:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWh/DySn"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FD612F38C;
	Mon, 26 Feb 2024 17:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708969751; cv=none; b=OqQ6YxXOPdeFE+SK89iOJT7QqN0OzXgCpqriJZ15HZpgSzRNG7isb5wc/MX30+hmYadmeNPlCX0Jmv5J6cAf8OaBVIvlAR87qnjjA0EM1iFVrkT/ZP4gNd1W3J9Y0akwHR9L9aatfPnKr2BxjXNOtBe2ll8UDWfEWI5hHaXIaqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708969751; c=relaxed/simple;
	bh=SdkZOIdfsdAR0iYA5ghNUJ2oMXM6ota2GiB86K3uBuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdrvV+Y3DJO1JDxuzFWZsjnsJ2Wlwoo18dLLY7qH03jGPPR9g0OE9VFoNm1X/KkOiwvx3nzC82Uf+Ggq9HAm75JjfPjMWV6pSSU8rpY32MPwChMLtI9cXlvyt0ZCbsQkMa22yGMYq7yT6fPee+KQlGAXso1xWZ+LTz74iLr2bF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWh/DySn; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e4e7e25945so1531124b3a.1;
        Mon, 26 Feb 2024 09:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708969749; x=1709574549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2BsS4tIYGDQjJXCQxQl+f5av4au5uoF2Mun1slK7JQA=;
        b=HWh/DySnWlptrul9IbNdxLjYaTgWYvumcHBWxR5FqN71zvOkIxTTydwJfcI7inRaD3
         n79+RuNRFJngPvdsvh79XqxJmgDUlhKdusYtlKu3vsCe3MA2om8KlHrspyAuMw/257jY
         2LsDToynCDk3Bm8LB9kmzjkk/sIXC6bewrxbeBvn8t2GYwzzFH20rR6dfzIAFC9GXuM/
         GZrwpX6p6Jz1rMq+dA8corkeSG/WyrUvpOOoCeUZBLo1rmHwOV90sJ6I/bXEy/J5kkR4
         NXCvjtt6NpnZEtx0zXfZCC+rDbEB39gQlqsWcoebzq5GXdwXGFWzDHVKqdvFNU4qOhlX
         d20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708969749; x=1709574549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BsS4tIYGDQjJXCQxQl+f5av4au5uoF2Mun1slK7JQA=;
        b=fmJx00M/St+b5GAcPbHAY2Il54FihOAnbYb6BkRPdp/1uwyUpnxS1VvFnI1/IQb3/L
         ebVs1/DkeX/s0EO51pov2pkEpMK3fmnhq5Smx3eOIriXZMaIrdQdAs0s+iVDknGOfblM
         rlF0HhOE4Ryb7SAee11xss9WJyjpRPIl8KMjLkXKV/3OHSKZhnRZXTjtIbN0Gp3kXrkU
         gpC6pwkaOhGXj8Z1+XDRedrBHY9k7AlZGjG2fuQSqwF0aPbjchrByIWLZy9aGl8t/s+H
         65610Wu921ilE14ND5wI3Cyn3myhmtO+A267P9Tg1pnZXZKid4xIfvLMqBoLC2OKd1x2
         CN9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIrM1Ymd6uUX/yY97q5oXke0niSbYse+aEpGn2vWTQiTTlUNyYaRj0euN1rTSr1Acx2iZyEjEl+uKcb3DJsW8Pl2lb5ES1rguVW1+U8WNv6Yaw1QDa3A4njjP1Z/HGMISUUK6i+35U+jeDug/WPTScHTL6T0Muz8PprExzF2tza9uQKaKYIKKjQBYFFjmWCygNuazQHaQL4upow0zStnQC
X-Gm-Message-State: AOJu0YwO6NBTIJZdsx0Me2kBXTo/qxJwpxN/W1qGdiEJVPYBfCIuvu4j
	rRxwF39Zkfi3aBmaAjRGqipTzbkgC0aYtd4TsDDBdFTfeSe84EXz
X-Google-Smtp-Source: AGHT+IFsBVQ6d9x5agbxMbddSYtV6eGl4MnyyLR4nq0IeDFMDMoFpVFwf7N8ww5kqnCzQAqZkJqhxQ==
X-Received: by 2002:a05:6a00:1daa:b0:6e5:1196:dc01 with SMTP id z42-20020a056a001daa00b006e51196dc01mr4246833pfw.18.1708969748967;
        Mon, 26 Feb 2024 09:49:08 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:5bfc:f2ad:5ebb:5c14])
        by smtp.gmail.com with ESMTPSA id a16-20020a63cd50000000b005dc87f5dfcfsm4344271pgj.78.2024.02.26.09.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 09:49:08 -0800 (PST)
Date: Mon, 26 Feb 2024 09:49:06 -0800
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
Message-ID: <ZdzPEmpS0fohSfiy@google.com>
References: <30d49088-283c-40f3-b97b-fd5f5174a467@gmail.com>
 <e5ef576b-70ee-4781-88e3-e728c1e7cb9c@gmail.com>
 <Zdko7JAFw_TBV-63@google.com>
 <a2544b2b-265d-499b-b235-e4075a9ef398@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2544b2b-265d-499b-b235-e4075a9ef398@gmail.com>

On Sat, Feb 24, 2024 at 10:31:17AM +0100, Heiner Kallweit wrote:
> On 24.02.2024 00:23, Dmitry Torokhov wrote:
> > On Tue, Feb 13, 2024 at 08:33:24AM +0100, Heiner Kallweit wrote:
> >> In a follow-up patch handling of the LED audio trigger will be changed,
> >> including removal of config symbol LEDS_AUDIO_TRIGGER. Therefore set
> >> the default trigger unconditionally to "audio-mute". It does no harm
> >> if a default trigger doesn't exist.
> >>
> >> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> >> ---
> >>  drivers/input/input-leds.c | 8 +-------
> >>  1 file changed, 1 insertion(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/input/input-leds.c b/drivers/input/input-leds.c
> >> index b16fc8194..176f1da7f 100644
> >> --- a/drivers/input/input-leds.c
> >> +++ b/drivers/input/input-leds.c
> >> @@ -18,12 +18,6 @@
> >>  #define VT_TRIGGER(_name)	.trigger = NULL
> >>  #endif
> >>  
> >> -#if IS_ENABLED(CONFIG_LEDS_TRIGGER_AUDIO)
> > 
> > Should it be simply changed to CONFIG_SND_CTL_LED?
> > 
> This would be another option. What is better IMO is a matter of
> personal taste. Setting the default trigger unconditionally may
> cause a negligible runtime overhead when the LED is instantiated,
> on the other hand it results in less code to be maintained.
> Do you have a preference?

I am less concerned about overhead than setting a non-existent default
trigger if the functionality is disabled. I would prefer having the
#ifdef.

Thanks.

-- 
Dmitry

