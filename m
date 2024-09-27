Return-Path: <linux-mips+bounces-5717-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C70988609
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 15:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 269D4281815
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 13:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2A618D620;
	Fri, 27 Sep 2024 13:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QytLK7YK"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9491618CBF9;
	Fri, 27 Sep 2024 13:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727442245; cv=none; b=ULD9qu1oRdaFkw6tFzWeDL5cFi55M/cLpDP80fRWYF+HTUEBLMUaDBEc7Jv/Z0zxHvUsCjkjzN+MPZdH9kUWokFzrdUXsLIo4+1MMEl8O+CM+xFsbWpwLtTVGmi5arnqmaUvDUePTmjyNq7tHJ1ggkGluHOv7OL7mKZdio/xRxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727442245; c=relaxed/simple;
	bh=lMZjaaCr3EBfndkZEzdIumPZ24tnOworlO7tnZ5+lEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YLUVFp2FiLEF0XDrDYLKZl069AM4cwnSY+DQIZGAJaUSSHFrMrH7T1+nUHsfpxoBDXnTIxh2EnCQhX468mWEIVlp+RiyHKKjCMdrjnZ3oE/zVSGsedOj8wA418Goxq3tkg5K8DWIhF65ij7wLR8JRcIJWeundnrF75cqMa4x8js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QytLK7YK; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e077a4b8c0so1558046a91.1;
        Fri, 27 Sep 2024 06:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727442243; x=1728047043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLZBoouw/VuTYq1d8wJ2tQsyjB5lc2Ro32qoC8DsyX8=;
        b=QytLK7YKJn7neczB3bLXKsGmCCbl0VMugxkmb76y0yvEgWyfc4W/8ow/jJjQbQMGsq
         8k4Vhs8fIT8oc8M50e6O7T4G98xJIvojZHY5vLmNThRXzT8t9mdbHYTF3kHwbt9z0vkF
         Uxxx5qz6gPlRw0HXvGv7ef6s5L6V+/Dw3oPSLbACHD5CaIQ8Jq6z6qwAWVzxjwjUb3y7
         4FnYHSIHNggRD5vImFyzDYl7V4SBZzWCPDlu1O//NiGUWsbYd/hGpGmwdyeDpQL2l2A5
         VFp6CBkfaXasJxQ1Xvh8oF0UAGJLx4dOjiajerR6LMjBRVSp8fl78TwKypZmXcqc37Q5
         Ujkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727442243; x=1728047043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lLZBoouw/VuTYq1d8wJ2tQsyjB5lc2Ro32qoC8DsyX8=;
        b=BjZYNicTtak1D7V+g9v6aPn741xrkFafmYzgNzbgtxM/xODxgmk88gVj+l7qggxrw8
         sG5H9Si9XO+sRY64ba0lkpqrSd2WTEVpe3mWfOyTvHgHWoXckUd3jKRbYTeD99z/SnEj
         IfLFvp/dMaIy2ut2C16+7oHnx/L4/EVltKWivDO4Tj+2HPPHqt7PqMhmQq3cFaw5n/uD
         kMVV63sLiiyPUJMTQFIEMblCLWy5ECelnr4qqBDIrxRLlwBpyLDUvyFvdEgMB3kkEbuO
         UfKxxJAlCe3K2VEY13Q22p/zeUTrkdWerQELLFdwSpltSQThtNXzC68UVNHnuqrHLfd1
         XIBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM0ZvYgoQFByMIHDRWwcHNHtb5Zz2fokMnsG2S+LepTKOKYbCcqDa1G5gvguQSfxtj8tvlgkcHNeVJr0w=@vger.kernel.org, AJvYcCVRNQVnx8xp+4Vv+chQ4OS+NZ9jQ/MRnG1zgDSs3fjjEojeAUiKBEVuJ9NUgJ5rRtRBslxE1BlU8vGGZOAZ@vger.kernel.org, AJvYcCVTtcp3UMYQFumBFqGon7PMrcQLgaoISTIXcGJm3wpI7hCxdq2k8p2VkSTdH/dCCChmwXiX5XGaTgD8xUtQqYe6A3Y=@vger.kernel.org, AJvYcCVVaVn3xe9gce6/4yizsE6WyfvWAtbF/k6VQVXzog5NUxGly+A0jUsg4fw/M90Ceu5GeVYiergifVmBqg==@vger.kernel.org, AJvYcCVwRQ705lyQXPMbUsf1Sy3tVXjGwcbUb0FSbULcKKMcoM6DYQUXolaQ0KjGRm+MwstpaP8xg4hWbFN9@vger.kernel.org
X-Gm-Message-State: AOJu0YzZinjBMtr0qnsDDlCOMWX6YR1HB6W9ez+j3pWYD/aeTrH7PuXX
	RttEa42HAbrhWfBXSovOkqGKJcFaYfYJHmBnT7wKTSKCHOcwHnQ1/mbEtY190Sc+cMnusgnPdAE
	TIaqDIFYm+A08VwNRSwFctVTY/80=
X-Google-Smtp-Source: AGHT+IFtB7KLDPn+GDWKySAL2J4hNThlacj2FyNRmL5tDSlTqDrYlCCyOxeg5M2NMx4sjqT6GHGIxy0O+b+GZDd+MQM=
X-Received: by 2002:a17:90a:8984:b0:2e0:855b:9b21 with SMTP id
 98e67ed59e1d1-2e09111a9ebmr10387052a91.8.1727442242759; Fri, 27 Sep 2024
 06:04:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1727438777.git.geert+renesas@glider.be> <7ff1bfb73a6d6fc71f3d751dbb7133b045853f64.1727438777.git.geert+renesas@glider.be>
 <00fd0f7d-e05b-4140-9997-b4ffe0fcd8e9@kernel.org>
In-Reply-To: <00fd0f7d-e05b-4140-9997-b4ffe0fcd8e9@kernel.org>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 27 Sep 2024 08:03:51 -0500
Message-ID: <CAHCN7xKywTnuW9W-5abwpq8txNYhN39G9OX8zJDy_j=fqJFPfg@mail.gmail.com>
Subject: Re: [PATCH treewide 10/11] ARM: dts: nxp: imx: Switch to {hp,mic}-det-gpios
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-mips@vger.kernel.org, 
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 8:00=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/09/2024 14:42, Geert Uytterhoeven wrote:
> > Replace the deprecated "hp-det-gpio" and "mic-det-gpio" properties by
> > "hp-det-gpios" resp. "mic-det-gpios" in Freescale Generic ASoC Sound
> > Card device nodes.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > This has a run-time dependency on "ASoC: fsl-asoc-card: Add missing
> > handling of {hp,mic}-dt-gpios".
>
> Therefore this should wait a cycle. Patch is good, although maybe we
> should keep both properties for backwards compatibility?

I also wonder what the point of the customer fsl-asoc-card is when
used in conjunction with a standard audio codec because the simple
audio card works just fine.  I think they have some special drivers
that need it like their ARC/eARC and HDMI drivers, but I have tested
several NXP boards using a simple sound card and it works fine.

adam
>
> Subject: drop "nxp" prefix.
>
> > ---
> >  arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi  | 4 ++--
> >  arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts        | 2 +-
> >  arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts       | 2 +-
> >  arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi       | 2 +-
> >  arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi | 2 +-
> >  arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts         | 2 +-
>
>
> Best regards,
> Krzysztof
>

