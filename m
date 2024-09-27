Return-Path: <linux-mips+bounces-5721-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C50F988987
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 19:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12DE0280D9E
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 17:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7DB61C173C;
	Fri, 27 Sep 2024 17:10:04 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88374166F23;
	Fri, 27 Sep 2024 17:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727457004; cv=none; b=EsyrrBEkM9b3dX3vkV2NPFmFChArRBK4aQ0x3ZGian+z5j9ZXYIwrF3Q98diITApo9jH7EUkCiDgd5/sNT1M1uHUNuw8ixSn15PaZspKJ9qRDgf3qzRjvsKpEh0p5Aw58hxnf5HL11N8Xh1gkPm/zqdrgPTC53j1AUUL2dBxpNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727457004; c=relaxed/simple;
	bh=msPFs0oHddcTpnqpQnU8/vyIsstY5Hmuyz7ku4/n+Vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hY9KvFgSqoLMa3ca63ilYxQMI6rsioaK9DVTyT+J/2GknegR2tyxgQVT5Gq6AOu6AeD9TAw50TolbJvYyvuOR5ZKXHy3v3Mz3+wiW7VEbUQaV9aYQw1cPRFgLX6gpEkHvnRIwLKZhrrX7Qdkk9UmfnufBLXSFcwXg7scPEB7sio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6dbb24ee2ebso23637957b3.1;
        Fri, 27 Sep 2024 10:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727457000; x=1728061800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoY6H2xihm8sOHd6/SknfHzEtRV3+jpw8m+Q4KMLP+g=;
        b=tRMjiYTYypx9L5PJMkd2xnLL3moT3CPImD8m2IP5kg6+UZyqhOtanwT5HRBm0hfYCg
         EsYGdbIG2PDapDWCNGv5U6GT5CPT4KgP++qj0Sr+qmqfAIfTFW1FhTeNfxgdGzLu3YAk
         hJjPYhds4pYAL0KcSG30KLN/EzQeEdH3HJ6KOu5b3hivPceLTOz81PiMYsJJacYl8XC0
         1I+JeHlxchtrGIXL4P5SY4jHFhzALzFXqXa/zOhGlvwC3qD1qDwvTeGW5eR808jcxOxm
         SVzF1lA3pHYJbkNGSc5EbFq3tg56zj2MuAfv/FTSHBRssTZE+yMP0ewQ4uqiz3uXiBWS
         LlDw==
X-Forwarded-Encrypted: i=1; AJvYcCUd116sw7wmtstG8rMa8beP1eJqHLZsUY38pW6J1Y92lGvLy6v0MQ6/QubmZ1UNCqrK2vBISGjhXqm4@vger.kernel.org, AJvYcCUlvnq7+bYxTMuoSQIrLDRvkYnkR+9dRxzt+N4HFSTUFhaNxfIQIbLXZl74gZED8ay0F/vWuxxrK+mccZMmlMjrI4g=@vger.kernel.org, AJvYcCVtfOniakizM2ulrNzIcv0jpfPfWcCnONf3Qs2qvZuTSHgYXBQR/AlMJ8ttOsiSosqulEtn2MeVXCbzqA==@vger.kernel.org, AJvYcCWKPKr3EcOJK2ym4rzDPqMIm6B/L4zF5Un8VhU4WCWKZNjxmGdH/vfcECRuVZPstzoyfkV+VF55y5sOfts=@vger.kernel.org, AJvYcCX3YJey9Uh8g/JSiuIW312UPZp4Wkdu80R4dGmkJWlcBW/xKPfvvLbE1UBR2PLKe3cZzzTvF9HnW5Rx6BHb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0pHOHX0sDBMj6OB2LUB8/RGEt8+HCY7iBF4KI8vYkmID4IOWf
	LH0QsxHwXGcYTZqJdqwLEC/zOJQjqlp+tOQGxjtUKeSi1xRmWiu1WnJwgRHq
X-Google-Smtp-Source: AGHT+IHlJToKTAzVgAYZKGZ99dEqKZ1IEZ+5wIjrGIZT5k3uFU+ceirE6auatgIXjGrDTfARDQ6h1g==
X-Received: by 2002:a05:690c:4911:b0:6e2:e3d:4dda with SMTP id 00721157ae682-6e247544eb3mr33866507b3.17.1727457000404;
        Fri, 27 Sep 2024 10:10:00 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e245388265sm3604807b3.111.2024.09.27.10.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 10:09:59 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6dde476d3dfso20291487b3.3;
        Fri, 27 Sep 2024 10:09:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrOXltbnbNNZxfPRXnTcPKUru5KvKS9O1I2oBYV45ig8vwMmz4Ei6zu5xIQ0eQfN5WqLc8PZ7GZPuQWA==@vger.kernel.org, AJvYcCV0MsNBukM+FDLBa9rCwezuhjlMVIvYELoFRZXBjLmEjfsnV+AzS/J8LcHWxgYd3rVTPsa0i+Pb4Ex4W+4=@vger.kernel.org, AJvYcCWLPWfonlVFYNxpTqRRbUg8mHrnmdAHQ2NfoFulCtu6GVfCq6Wdog4C2KLtn36p/nkwjEJJaxVh3T7J@vger.kernel.org, AJvYcCWs9rc42AnN83gB176lsVK8iPBiM2ucRf2JFK1nkkFw2ifYLqvdAFGNw7dI/8Z1giRM0SSDtVywym4BR0ng@vger.kernel.org, AJvYcCXqxR15tyRkjq+z6FJyalTwvGiTVVui03u5mEerUvVxCWd4eNL5o+yaMdgT68tS3TXpUnP28w/4ai7BQXleTR3BY9s=@vger.kernel.org
X-Received: by 2002:a05:690c:112:b0:6e2:985:f4df with SMTP id
 00721157ae682-6e24dc9c710mr22157267b3.44.1727456998718; Fri, 27 Sep 2024
 10:09:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1727438777.git.geert+renesas@glider.be> <4455919.MSiuQNM8U4@phil>
In-Reply-To: <4455919.MSiuQNM8U4@phil>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Sep 2024 19:09:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXVBfp0ZJ5Me93p1fB9-ac00WcAYOb9jkG=D+wm01j+qw@mail.gmail.com>
Message-ID: <CAMuHMdXVBfp0ZJ5Me93p1fB9-ac00WcAYOb9jkG=D+wm01j+qw@mail.gmail.com>
Subject: Re: [PATCH treewide 00/11] ASoC: Clean up {hp,mic}-det-gpio handling
To: Heiko Stuebner <heiko@sntech.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, Adam Ford <aford173@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-mips@vger.kernel.org, 
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heiko,

On Fri, Sep 27, 2024 at 4:45=E2=80=AFPM Heiko Stuebner <heiko@sntech.de> wr=
ote:
> Am Freitag, 27. September 2024, 14:42:15 CEST schrieb Geert Uytterhoeven:
> >   - The second patch updates the Audio Graph and Simple Audio Card DT
> >     bindings,
> >   - Patches 3-9 converts various DTS files to use the new properties,
> >   - The last 2 patches convert Freescale sound device nodes to use the
> >     new properties.
> >
> > All patches can be applied independently,
>
> though I guess dts patches should wait till patch 2 gets applied
> somewhere, so that changed dts and changed binding can again find
> together in linux-next?

Yes, if we want to avoid introducing new dtbs_check warnings in linux-next.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

