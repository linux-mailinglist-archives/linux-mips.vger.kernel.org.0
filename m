Return-Path: <linux-mips+bounces-9912-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC086B10879
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 13:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE7F11765B1
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 11:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71BE26B2D2;
	Thu, 24 Jul 2025 11:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCIyTMqu"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7E626B0BE;
	Thu, 24 Jul 2025 11:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753355100; cv=none; b=QCDXDIW70zs+HsQPMU419+ARAspjJgnB09scX+bjLFqUafsNq1VyqIahFQQTEDe3/D9fikLS8W9VZTA6APwf5UO7WSfsHghrCtfALk4NT+R1Hf6ZBAJojZ7K/YBd3OiLjm1ev/Ne1AzzrIO6CAyDGIYsCScWbvmmBZbxT9w7kkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753355100; c=relaxed/simple;
	bh=igMiFZD+4/xHRfFv0ukEPDyxclLRIIklR7KHCUrrWFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YYAd2jr7GyalGLiQ6X9R3PQSiQTzKvc2rRu2CfXTvZzC/9SSt99k5aaluCkYnOpNTjgZ08QuwNwxN0ONQucAnw9TfaMOJfFSG9GDQdNtzQ7qOnwEZvoZXHj4W/ZGDCMc+K1vvY30TOQtb6MupZho5slgd/VPIJSjgDTIs8HxYHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCIyTMqu; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so3498182a12.0;
        Thu, 24 Jul 2025 04:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753355097; x=1753959897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIUwmPHAS5I/CUOP00py81w0hjNzvTvkcVdQbKas/DA=;
        b=XCIyTMquI3r7gLojxtddyYInXAV4SfPARqR2yceoOrodLKVDvRCX4w33WxWv5pjDsw
         7Ia0Mt3CSE7abk/9spC/c4ti1rKasxfGeKM3plKA++mvFJ4MrgLBMd8qxgdA9sNHWvr8
         jMbnmtUxhm5E3aouXJH2mkDCmCQvtCEpSW3djojdtpFbSxJNQs/r/+wrywJsceZ46PK7
         vsRDCmXjPLEBObnzPBxswk0uT4+07sPJLuxKBbW9ek/W6oWsCHFspJ22U9xSE6/T6x/D
         grrkIymf2lBG2O7Yl6Ocr+te/VMuaxtcUCPO1DVkYFwOdIw4AFsBkLjRM/jnFzSmKtRQ
         g47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355097; x=1753959897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIUwmPHAS5I/CUOP00py81w0hjNzvTvkcVdQbKas/DA=;
        b=IpshgJJOOwV650oitIkovl4DWpFkuwYHzIdSRIv7GXvkrVAGYBZyLWQ4nPFflxFVkV
         Qp6/sm+jfhwiYMHdePavY9RJ/fKcGbPWiCNXVmhKNm+RlyeKummKiGCSp1GCFXkqPeiC
         oWSK77Hy9EGihyIR1RA80YbHsLpRNjFLZ4WIOUt5geJOqwsnS7totqxxJuXMjfIMSQxJ
         K5L2X+o1V3/5L/pMn4hIDS2XfrkOXCzhz6GsowjYL3tTEJoGeunTORH3t3Y8UIYtLQ34
         r7RmhfcVf84bCt2zYmDPf9mxZhkE0Zk1Q6YgcLs6KLs7f8QsI4j/HnXNGIdVuCUFHM4l
         vZEg==
X-Forwarded-Encrypted: i=1; AJvYcCUArrNmZ4+XdX5JoXI+n88C/FIDGoC+nhJS4C0QBXVwL7LCUnAWGXdjgsW9S3BXyVdh+EPvxJfj1FgP3QOg@vger.kernel.org, AJvYcCUMRy9Y9Yc720/fzQEuSuosC9vlju4dhHwCgtbllLiHGsCd3KPasz8YmVIkDPrH4C9xPWvwQjF4LE/4SVEP@vger.kernel.org, AJvYcCVmTc9KNldWG4UivRqnYngbzri1TvoSixIwqNvARo8C2FD+PfKO0YhaRgg2fDDAZq7XlUPm/idoqZh8SA==@vger.kernel.org, AJvYcCVt7Q36Y30H4LMUufi1L1FfxkNx7DSCTHBsA3bE8htyKOl3Wh5kBWaiFdwU3JOOG/Xm84skydKLOLe2d50u3qn4@vger.kernel.org, AJvYcCWIl9DnKDSmF4kQh+YVIwU2S4dlc+ABDuGUceWYE2nhjjSc4BJZSojUUuzl8hQKppG32y2dC3P0Y/ZM/A==@vger.kernel.org, AJvYcCWlNwS0VZzR4pV+LtBbXQ8ItzQoKKL999I+TfQb481KnG1YSJNLmgQygUBv45f7OCxB1cB0xvb/2fteWuHA0GBeOIk=@vger.kernel.org, AJvYcCXndcRMSGA7kj0Ig8jBDjjmHPancsh7rtlwu0Ha0ZPanoZ/hPPMbs9b8dVASXQwsi5qnAn2qQs8CdSR/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5PY1Bz+2XMIPc1vqTR4aTWJhjgoEvmSWRczCRuX8AOYzuiDfZ
	qwCmiTMxFfK0WftWT7pmvyu0DsWbjbKl2KeUnvLN4RIQBzix9iG8yBqRq2PsaAqb7MwbkHLeyC/
	YVuLDSRQMwcSCD86N1/31jmzEiA3SIDk=
X-Gm-Gg: ASbGncv5oKkWXRecSN67NCQXOUPaCyFU4UW4beQIEyTdlt7pAcpt1Q1DqyuK8BtSQbV
	i3gk5s7gulB+sGm+loZMpGoXCxu/BXXX2Tl+Cwo7kP2Gl3d1xUcmJxXvHLZqhNhqEuvKoVvUWUM
	AwjcRb+mQ/8fD6PRFTBFtAJkVyxjo5sdokMSKClq9SC1iw+YvCYWLWwIvHRBzWMs8ueC6rDBUja
	Zs6nz3ftg==
X-Google-Smtp-Source: AGHT+IHPG9CppWQlW2WG11oa6jW9jIvsCOFaEPh9C4R84HymaGR9H07ZVvtMJ1em3UaqkyymENVRG1C3VhJB+3+pi38=
X-Received: by 2002:a17:906:478a:b0:ae0:7e95:fb with SMTP id
 a640c23a62f3a-af4c1e2633dmr202631066b.5.1753355097066; Thu, 24 Jul 2025
 04:04:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org> <20250724-pinctrl-gpio-pinfuncs-v3-1-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-1-af4db9302de4@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 24 Jul 2025 13:04:20 +0200
X-Gm-Features: Ac12FXwYO9py2pad9YYkUaWtcE51AjTlJa3erYsopqu9ohpn5SMp_S7iBIXDS4k
Message-ID: <CAHp75VdoZr0YCm3Pc7F5jOV8Q-H9K+gje2fi71nonHoXq2YPdQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] lib: provide kmemdup_const()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 11:24=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Provide a function similar to strdup_const() but for copying blocks of
> memory that are likely to be placed in .rodata.

Makes sense, one nit-pick below.

...

>  extern void *kmemdup_noprof(const void *src, size_t len, gfp_t gfp) __re=
alloc_size(2);
>  #define kmemdup(...)   alloc_hooks(kmemdup_noprof(__VA_ARGS__))
>
> +extern const void *kmemdup_const(const void *src, size_t len, gfp_t gfp)=
;

Can we locate this in the similar order to the C-file? I would put it
before kmemdup_array().

>  extern void *kvmemdup(const void *src, size_t len, gfp_t gfp) __realloc_=
size(2);
>  extern char *kmemdup_nul(const char *s, size_t len, gfp_t gfp);
>  extern void *kmemdup_array(const void *src, size_t count, size_t element=
_size, gfp_t gfp)

(below left for the context)
> +
>  /**
>   * kmemdup_array - duplicate a given array.

--=20
With Best Regards,
Andy Shevchenko

