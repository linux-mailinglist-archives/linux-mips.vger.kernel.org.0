Return-Path: <linux-mips+bounces-10722-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61653B39F18
	for <lists+linux-mips@lfdr.de>; Thu, 28 Aug 2025 15:37:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBAE03A77EB
	for <lists+linux-mips@lfdr.de>; Thu, 28 Aug 2025 13:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0931B3115A7;
	Thu, 28 Aug 2025 13:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="anyIY6bq"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4A9220F2A
	for <linux-mips@vger.kernel.org>; Thu, 28 Aug 2025 13:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756388217; cv=none; b=n0AXndqVbSvARd1kRLwUhD9X9c3uHZZNJtoY6IJsgBONU5AQdq4FNOQIgcQbeVD1dPl0D5j3Ggo280pCuVoB8ndlLRqOObDcRQB0qTE5NoE+HebdPmwPR46KE2FpuG4Qg7m12MhZG7rT2wQzeQ6AJhGUQfwJeP7J87zoEjXpw6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756388217; c=relaxed/simple;
	bh=Dhz0H3gxyGM+rtfeLPQ0WqeuSnXhqTSw/EjNYLEea7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t/kcbeViBafQTVpoHlSjXj0JtXklT/0KkYvM54lKNWvX7GtH/fKtt/Su59SrhR8KkEDhBORQwG+w8wTooVVhzXaNBHaJgip/sTisLzyOQqrX8E7ETroGgpqdYNFs5FKBPBFbVdplO/OYjiWJorI4Q9gNy4g4pK95nEdJKFMojWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=anyIY6bq; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f6186cc17so442961e87.2
        for <linux-mips@vger.kernel.org>; Thu, 28 Aug 2025 06:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756388214; x=1756993014; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vO3s8KTMvJZFdHoHnp5Qdx1sAV4PfJarnSm1ctLLZ3E=;
        b=anyIY6bqVld6bKz8zoUj4u6nWSrlXYXFKJEP89W77u18bB/2lG+RYlILX7aQPRPShc
         nJl6ZKM2A4uOlfQ16kJb/njGo8qy4IkWcTgx2TLc4dyU63llworYglBgTaLn3owQZ4L0
         imd5Vd2uYCxy23QscTs3SksqZWsN/oAfvVeVXfQtFM9pZLTxL1/Qw2fEncFn4cIXDx71
         zgsGax3Zka2RpeEv/ElE2kOz37Z0i6dUtst5MwCzMX3X6hjjQz/PDMQHE9HW4VXvW4Dk
         vrfoSYCc8aGrcEU5TXPVPrm7hzs9clPI/vinO7Fvu9cWxTaTUgUEwyEXZ/gx/tpIC9+m
         C3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756388214; x=1756993014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vO3s8KTMvJZFdHoHnp5Qdx1sAV4PfJarnSm1ctLLZ3E=;
        b=DI7+NDt2vmNnE69YfCZY7O94uu2CVypXE/0LLfjalXcMY5Fydd356HkNy/CNqVIw4e
         r1ofTo8oDzRu58T++A2NsFodDehkvvKILK2WS0KWfU0wEo6I90Bp6IVYhSIl22aQhgye
         nx1ywS7JgHqBml6YIYQ0U46o/m8fcJh6w0TMf3dHz+QYdfEt5COTjb6X2qid5amtyKfe
         2FjARdH5VtWlJ5eJY0dKcUIOFBy7bG2ycseVysxFH8/HJWPYbCJXQq6G300u8KM4MY+g
         PaEOHAGi2DhSlAr8/l2LK5PeeaRSzOIvnxKjgnW5V58V4uC1Dxo2tbPVoCOzv9YFXB06
         1yVA==
X-Forwarded-Encrypted: i=1; AJvYcCXCnq+RXr5vEhY1+wknTSGRL6I02IoJKRiS1xR1ywS82qs6iaV5PjmRukJZhdYu78SKBYsFBwesMwds@vger.kernel.org
X-Gm-Message-State: AOJu0YwSyPaqjokfbpSkV5exaIV6JFx1HdQv1Tj3RzsKAtZ9KuxSNbCx
	vfmjd5FGKYFKSzfznZ7TMaPdwb91G8bcqiW9t1x0RHBN4sP22AZfCUkO0wc4FE+mCLa5PLng+5L
	j4hju2YzSiZyQRldnJs3o3lzRFwdzA1RGDS0DScNHIw==
X-Gm-Gg: ASbGncvGKAcT7YGp6Lqo+55eh4nJ7NKNYQSjXOvCk49ddbO6xegb36FsjI7UECJoV9t
	A7WHbXpM+apiZZxrCm+i2yYjAg28O8I8jgiYlQj1PPxVrAumT2NBQqn+OM+iYKW9J3TIqyqquWc
	0q35d9jswvTXL5gBy6UZuiFVgGCLhPjd4O8Qpv6fUUiJruOpmDRGPAuaC3XBpCmoIXOG+hEYagD
	ayeK/P8UX0a1ciDh4GJHdzm3voO/MOmLYVOuJc=
X-Google-Smtp-Source: AGHT+IGjT2OYHV9mzILkObbuSFLpi9Xf+oP+6Uws6rzp7smTv5kAfs8i0u8RIWSnII9gINWFQq3zddWVjDxSq4eH8MM=
X-Received: by 2002:a05:6512:245b:b0:55f:51b3:9419 with SMTP id
 2adb3069b0e04-55f51b39621mr1791521e87.50.1756388214118; Thu, 28 Aug 2025
 06:36:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
 <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com>
 <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com>
 <534ad082-08fa-42c0-9c24-f0c11af7d5b2@sirena.org.uk> <CAMRc=Mdn0_yPXyYq4sbvH4P9-h71vEc4arLPBfSk1PiEFaB7jQ@mail.gmail.com>
 <1804d9dc-8814-47d4-af88-c819c3f17bc0@sirena.org.uk> <CAMRc=MdKgqa+vjhHvD2+Tjw5NwBtFv-0aUivi5UuEQd+n4KxmA@mail.gmail.com>
 <aLAYoDyz8Xie4Dhb@finisterre.sirena.org.uk>
In-Reply-To: <aLAYoDyz8Xie4Dhb@finisterre.sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 15:36:43 +0200
X-Gm-Features: Ac12FXwlaqUs0TeuR0_lKNQwkWNyJ4q4Po7liyAa4ioyozolnG0jRU9pqqtYG0I
Message-ID: <CAMRc=Mdd3fmKjFAfbUB-AAhx-5_CR+c7f36pePkF1k_2LDoORw@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 10:51=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Wed, Aug 27, 2025 at 06:46:28PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Aug 27, 2025 at 12:22=E2=80=AFPM Mark Brown <broonie@kernel.org=
> wrote:
>
> > > I've just got the log I linked above.
>
> > So, I've been looking at this bisect email and clicking the links to
> > LAVA jobs and I can't find anything. Does it fail to build? Fail at
> > run-time? I'm not sure how to read this.
>
> It's failing prior to putting any output on the console.  I was also
> seeing an issue on i.MX6 so it might be all i.MX boards, same issue:
>
>    https://lava.sirena.org.uk/scheduler/job/1697667
>
> so it's possibly all the i.MX platforms failing.

Not even with earlycon? That's weird. There are no smatch warnings on
this patch and I can't see anything obviously wrong upon visual
inspection. I fixed all other issues but this one I can't test. :(

Bartosz

