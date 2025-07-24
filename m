Return-Path: <linux-mips+bounces-9916-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E861B108BB
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 13:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C947D7AFF2A
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 11:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6378B26CE01;
	Thu, 24 Jul 2025 11:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AxNtpO5D"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A9126A0AF;
	Thu, 24 Jul 2025 11:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753355609; cv=none; b=rB7bfe6xppOhTJbSWGlhTMB86GlSWbi2UzPitCbIQLD6HAHALbLSmXB9mN0NgGrl9Xq9UJIa8oh1rGe8fspwWHYE6s3jtGih9aA1mnpWZ8JI7Bfmu1Q3jPW3odR+ky7YoaDpBNvbT1Uq84swFYUjwd4XLiv9hpho/AWiGrjcPSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753355609; c=relaxed/simple;
	bh=+xsk3eLTqVSLGwJ2sXxrjX5jHw9wBvQeSl2HaOa9FDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPX2ZhcxZBKWc0ud1E/U3Ba2VF7dx3igx4LlCBM3eDZw9h9j8FlHr3Zg1JLEbvqGv4rhvUgw0/zBr2rexECBoYzG+5OFikwd2kpZFVPIOcvipO9S1qiBaITPtkE+UDM2G49yZzinvBj3SdJ/AQp58hgKHOu4/yZkNtsNMqvXlmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AxNtpO5D; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae3ec622d2fso134833466b.1;
        Thu, 24 Jul 2025 04:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753355606; x=1753960406; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZNixusr+c3cACc4GCTidZUQE/E0dLpa/Bb6bVcQhms=;
        b=AxNtpO5DIHSsRjjyovHtPDGYA+NKHESbyEpMSkOIoOqJjeSi4TSxhkuEYhBPVqo/ja
         XrJvDpkKXOTZxNoRoG+v1RCpkx7STK+Z25hxoMprW5MZGDF6GjhXABbQZpx1WanTOa9A
         k0thij43Vc2/6VL9aHbOrw7lgRR0dsMY8vzYgoSOotZPEmf1pzzECpVkV39KOh6xFqoY
         4B7S3oRGFGmBdn69ZVoSCrgQ4VhekkdNw+AhT0BjcxcfSd71OViI+qXjMOe6DvVZRaSx
         Mz8ML8TuY8uQhwIb2tpndtqDZRvQx/K0XkKCSdfCY7lgNIYKSh8dYNHfscAvQ6Xktw+H
         rfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355606; x=1753960406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZNixusr+c3cACc4GCTidZUQE/E0dLpa/Bb6bVcQhms=;
        b=vq9q/8CfykK6plBVVi1B8s0SEG+78ZfYp5SGG424SwotEv3/oLd8xchBHzW4KKqtTf
         knLhT1RCgFgeHaMI3VLzmTEXr3f7ftISdhXDU5Zj3UqaW8AB3/Nd68JhQZqvrKoJ82L5
         CMuUL5qLWCspQPLblVpmCb1aOzWyx/NnNRyRFU5oHBJCXPOiXIywSrDDwvpYoeKBlrTP
         4R/bN7fLCmVf3fig5SI5JTGf5FTmJef/7NSE1XVqnqdxY9HGCiNZURRuuwChNOl2htjv
         rAdWEHND/x3bCK9QPHjSVQGmXNTe8mTDzLSWT63G8q3qDSkktQqdY/agyQgnTHOyf/Uu
         xRNg==
X-Forwarded-Encrypted: i=1; AJvYcCUdqrV3iBHQUPbrs726ElTgXABClarpUMZtFwORjOATf+nR8LJ4UhVwQWyH0bOqk+5hM/SnBQvKaH7yBly0eW7VLDw=@vger.kernel.org, AJvYcCV8H4bOnadWVsN5A/HrtYNhjy7CJO/ckHr5xY/n93weSMRrnMSi+5MXu7TAriSmBpTS9q/r5C35D9lDYhgq@vger.kernel.org, AJvYcCVC6PpUHIixdtfr17AurYyYwMzttO2dkGxH7KaYT3ixMFwZi0CakkAYB/ujkmLbaNAWzIOoSmkeoXmpHKIL@vger.kernel.org, AJvYcCVs7nO7nZiWhlRHSlUQUB37VlBJJ0m4g+OoEzu97NsLisnnmStSa11mVRhFV7whooYGQ9n1z2cnFEf3Fg==@vger.kernel.org, AJvYcCW4JUk6xhEZ9/w3lulCW91baYOsOp+/O4RgoCf1+gjPOcUYJ7jgEGo9F8HxD6Vh8Zpv6OcnJPYeduAnGQ==@vger.kernel.org, AJvYcCWDMLVSKKiUjIs/hbtMDOi2ImZo1u9BxrCub5V+I9ujrCqOPcPCsINffALTgwDAPqWNYbk0NGuwN2hGUw==@vger.kernel.org, AJvYcCWinreuYOjTtgg9QdQVuCdnGYbzN/xoutRHCIsJvmutbjriuupw3DUYrSfIvbxUUyxukcero9T8hMIb+HSE1l7i@vger.kernel.org
X-Gm-Message-State: AOJu0YyouimeAmgIMYhW5ij4/rVGSN6n97+j8LVEDw8aJe+bWystlMnG
	Xcs6nI3zD2s+/9hz5k3TA2Degk88DlqkHmtl4oCPSXUPzWuQH7vsXXP5qPHPzl1lBOt8AH5iSoU
	74gcJsvd7Yova8RD05IQWbdiBGsTe0Ys=
X-Gm-Gg: ASbGncuCj7Riql345BQNFmtCIICMEMGEmi+e2ecHyUyUZSS2X8quHylsCHU7/uodwKF
	lF6Uwj0YbGipujLS7xIfv5oidG9rgmPRnJTyYqxtbxQtAPpmxao8IinJ7wReZtiW0u9+cedKB6Z
	S0D5IpPrxM+a/VFfGgw7p42KwKM9HB3Up+ecZF4XZZu3+lADtmZdok9hoao041YA64obRG48y98
	W1Nc9Xb400f7hLridvm
X-Google-Smtp-Source: AGHT+IELZnhRssUojeUfzx03q7k6D/HSNcNEJ5i+elToR/sTLOJXIaiozbv7LfFc6lY38aKQkwYpn9FdGW+sEeYsiSw=
X-Received: by 2002:a17:906:f581:b0:ade:2e4b:50d1 with SMTP id
 a640c23a62f3a-af2f895ad43mr692412466b.29.1753355605638; Thu, 24 Jul 2025
 04:13:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-1-af4db9302de4@linaro.org> <e1253b8a-4940-417f-b530-09e57c6a8932@lucifer.local>
In-Reply-To: <e1253b8a-4940-417f-b530-09e57c6a8932@lucifer.local>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 24 Jul 2025 13:12:49 +0200
X-Gm-Features: Ac12FXx4uwXTilr-eVY-szF3msWYq6-eRwPAeJOQDJhF69DCjZUNeC203FQ8yl0
Message-ID: <CAHp75VeWbhuL1pYvEza44Pnb5YUufgY=1WYXSx2nNMJVfcytTA@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] lib: provide kmemdup_const()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
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

On Thu, Jul 24, 2025 at 1:10=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> On Thu, Jul 24, 2025 at 11:24:29AM +0200, Bartosz Golaszewski wrote:

...

> >  extern void *kmemdup_noprof(const void *src, size_t len, gfp_t gfp) __=
realloc_size(2);
> >  #define kmemdup(...) alloc_hooks(kmemdup_noprof(__VA_ARGS__))
> >
> > +extern const void *kmemdup_const(const void *src, size_t len, gfp_t gf=
p);
>
> Please drop extern, it's unnecessary.

It's all over the header. This should be done as a precursor patch and
I know that usually people push back on doing that. I gave up on this.
Kernel is going to rot sooner or later... :-(

> >  extern void *kvmemdup(const void *src, size_t len, gfp_t gfp) __reallo=
c_size(2);
> >  extern char *kmemdup_nul(const char *s, size_t len, gfp_t gfp);
> >  extern void *kmemdup_array(const void *src, size_t count, size_t eleme=
nt_size, gfp_t gfp)


--=20
With Best Regards,
Andy Shevchenko

