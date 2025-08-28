Return-Path: <linux-mips+bounces-10734-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2BBB3A38B
	for <lists+linux-mips@lfdr.de>; Thu, 28 Aug 2025 17:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D02385E171F
	for <lists+linux-mips@lfdr.de>; Thu, 28 Aug 2025 15:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F6925D1EE;
	Thu, 28 Aug 2025 15:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HtlJsaRb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F94F25A35F
	for <linux-mips@vger.kernel.org>; Thu, 28 Aug 2025 15:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756393571; cv=none; b=YK26ObfGO35up0vfxAH5u7roUIc6F3ObXN3wczmiyUq13anHC/2ubvjTPyVoU0GBBvYTPhzBUJWwgeXGDlY96G7bVTVYEETpFNy1P6MhMrhuOMxQlRP3QJkYG+3JWiVkme5Y8ZSKY1AU/TarBUaiE6SGM3uGC6GmD3L16QXdbzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756393571; c=relaxed/simple;
	bh=Ef83d0YHCFyXZ9JYCFn6uu+wEcqauHSJmdcfvFUnW4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iYWK5LKwvNai7uojGJ2nKE69zp5t+EMW8ZpS3ex/HJLucOdUVtrFjsfPwi1D8doWoSBXVIYyFdMirCSeUYJI09RMME1z68v7v4eMdpkrReYGVhFqZfwaQMrkxtOmVV26Y+pvGOE8xOy6IpmcdjUMzOGeKNtwtJIXLWR2S7oMGzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HtlJsaRb; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f3e4dfc5eso920557e87.2
        for <linux-mips@vger.kernel.org>; Thu, 28 Aug 2025 08:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756393567; x=1756998367; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmZzYFeRtHhCTqoukOzpWHGqKe1b+6GRRn1Jw/JtbH8=;
        b=HtlJsaRbJJ+D83KeKw5rgqxnOV0eXpO2PegIL6MombIPlh35pItmsIxXWggNbxC26T
         uwBRyylafQ/XSJ5k6siMY90H+99TFs3TKcD8sPZZ+2mtwuUyqzYwm4aONZvQjm5PjOzy
         YVuu7SHG/2Ee9V5QYuesopQBHtL8TieFh4H/tN8HuAvajIeuC6l1nEHdh9Byp8So1xKU
         rnYhAJHdWLU9Rc1c4HEYwZQ7hBsXXLVV4F2sqwbP7iSt4ntYj/w8qZRGgVLFrlBYtVRP
         JYTokGWOAmkDSH80oq33etkxmrMvX8nfskJlAh4ivVHVasWBP/WdDYlVNK4+CMHALRx4
         5T+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393567; x=1756998367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmZzYFeRtHhCTqoukOzpWHGqKe1b+6GRRn1Jw/JtbH8=;
        b=IA5RsCfpiH6yKcK5nbUwvWHDYbCypGjt35TGURIfogcfTO4oqggA5T7Xvd/bm3x6/L
         Jaoq3eREURxP76ucddKVcT47c/Hrent0cCVETgUN9WvzMkZlqdyIzF9xYGX6NBdIGSf/
         jxi/MMwQmxTwxyKzOFI2sOiG2V+oG75YdXMUtkvg1UyPlLBr+1cmQ3FUYECLVAf9BZ/o
         kScgxWmCe/nkGel0UEKoOxZqh2UToGyAnL5tM1PoM4mo6RvZ0Yxcv1/eDOs73F0FW9D8
         D/OExBmsCyCwHp7UZfq2f0cjQn07sMY3b65G9ieLKuOIYDI0CPvonea0ubNYYHUhdIGt
         gfMg==
X-Forwarded-Encrypted: i=1; AJvYcCU5AfQVNqNsI2zv0VD46wVTxJRuhR5iWyjLYfWSbDcnUEPa+o1bB3oq2WziNcbOH4RVADDU8cE9Ansg@vger.kernel.org
X-Gm-Message-State: AOJu0Yycj3o5sbEfaYUtjlxZLg9/tMLa9jwlWM6AMIEpKZsTlfxVQPg9
	ENc00Ejt1NuIDSjWzQp2jkCikh+lxgPZaP6ApYznQJuoUKBjdqB5g1MGyKYOl6iE+69/biiywVF
	BLtYbbpgDsfb8XkgUFzvGkn3N49VYMaWcAbYKnoZ2Cw==
X-Gm-Gg: ASbGncsCSWsJOhiZ6Ab7fuxzob1AuuHmlFPyGRUZXlDU2kman79ISNgkV3rk/pCKQNC
	bpBuTPw3N8qC5yB/g6OLfaBu89yW2WYWehXtSxg4akH6roaTI+pvy4tytiT8ewyQaBvwWVNosOI
	VIN6KZML6d7Je/41/I5JUC+pmL3PfG/nyvagKZNC2x4MP+FKIpWzu4Yydi85ZfKl3DCvzPJjhGs
	jTwhtpFc7ReyOekX5H1CJKzYYknq9ZQ+IoN44MFPQfvIqeq0Q==
X-Google-Smtp-Source: AGHT+IE3iToga29hoCNxE0T8DagXuUfkGuMta1TYBW4jpnncy+JoEDrvVPvrustOmHcaLq8T48+IshbcHhnVTj991MY=
X-Received: by 2002:a05:6512:a94:b0:55f:5704:806d with SMTP id
 2adb3069b0e04-55f570486bdmr2169702e87.21.1756393566910; Thu, 28 Aug 2025
 08:06:06 -0700 (PDT)
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
 <aLAYoDyz8Xie4Dhb@finisterre.sirena.org.uk> <CAMRc=Mdd3fmKjFAfbUB-AAhx-5_CR+c7f36pePkF1k_2LDoORw@mail.gmail.com>
 <aLBggd4rGHV_5zQ7@finisterre.sirena.org.uk>
In-Reply-To: <aLBggd4rGHV_5zQ7@finisterre.sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 17:05:55 +0200
X-Gm-Features: Ac12FXx5n8TdDo5k-Gc9YU8HcEZiyD1aufJb5T8PdE3CuzVh_XFc9j0GLQlkpOM
Message-ID: <CAMRc=MdgorsPpkkRF9amVhqPgzb5QBwFY87K-fZ04gONAkGCTQ@mail.gmail.com>
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

On Thu, Aug 28, 2025 at 3:58=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Aug 28, 2025 at 03:36:43PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Aug 28, 2025 at 10:51=E2=80=AFAM Mark Brown <broonie@kernel.org=
> wrote:
>
> > > It's failing prior to putting any output on the console.  I was also
> > > seeing an issue on i.MX6 so it might be all i.MX boards, same issue:
>
> > >    https://lava.sirena.org.uk/scheduler/job/1697667
>
> > > so it's possibly all the i.MX platforms failing.
>
> > Not even with earlycon? That's weird. There are no smatch warnings on
> > this patch and I can't see anything obviously wrong upon visual
> > inspection. I fixed all other issues but this one I can't test. :(
>
> This looks like it has something:
>
>    https://lava.sirena.org.uk/scheduler/job/1747304

Ah, now I see it, I confused two radix trees used in pinctrl with this
change. Cooking up a fix.

Thanks!
Bart

