Return-Path: <linux-mips+bounces-13145-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOTvEIyJimmPLgAAu9opvQ
	(envelope-from <linux-mips+bounces-13145-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 10 Feb 2026 02:27:40 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D43115FAF
	for <lists+linux-mips@lfdr.de>; Tue, 10 Feb 2026 02:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AFF8300C027
	for <lists+linux-mips@lfdr.de>; Tue, 10 Feb 2026 01:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B741B26A0DD;
	Tue, 10 Feb 2026 01:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CoIFJ9gD"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1A5257849
	for <linux-mips@vger.kernel.org>; Tue, 10 Feb 2026 01:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770686856; cv=pass; b=mUFPcQ6tK7fanQXFHJlLTUAMZtbtAjHhLAp31BwrgXsXi7CU9nhcNEcVIrcnNIijInEAuTwtlzOoNImNqOklQjq7UzQumdjHzVg2GlykfdWGJc6OBC7EG4WpGzQAk/qcdIg4+/t5XODiVpxGXjjvwYPGYvhk5pKL/i2rtla1ueM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770686856; c=relaxed/simple;
	bh=SCjo7Ef55zh44/8UoLsoSqyzqn7OjE/L4/11ImGPxkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C3WmBEUYIas6+LGrWrCp5GqzWkIXdO0DA8D2kpa5kWbd5NPyQZV3GFoG/B9PcicS4kFujRmZQKMiRrn6+PQndXm5eylfhYA7GztN3gbFA4jBt+JvR4bIkpxbJhaoqXnl44erk5X6L1xiXkfkOL9850AX+ik/9gomzf5lNzahYAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CoIFJ9gD; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64d1ef53cf3so5535607a12.0
        for <linux-mips@vger.kernel.org>; Mon, 09 Feb 2026 17:27:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770686853; cv=none;
        d=google.com; s=arc-20240605;
        b=LIkFQh9NhF+Ffqqtqq7wcA0ceLhGhgz+qdbU+eEv3Nw65guF6fBOfUNWrZy2TUQ+K6
         vPMLXL3rcLZ+xOPIMinCLYo4cPwD3WoH6Re0sPwZIP7Tvtn/wzW2Rm0EWGThL2Ca3M6J
         4NrnMLvMCbVmXX7AmqlaH5JSB10pnDr4BHKqhLINrLCCaM7gwvZ4lvkztk1yQPd3Fq3H
         64dEP93xiOlM+PLXQGamSyzY0WLI/byQtCDifXTg5LwLrJqaewa4ytYzle7RflZQQ3cI
         PX5jZlJgSDuMnwlAUyCtlCspoz2zTYeVQUB+2LpN9IfbOEHR1U09esY4/K6MeJlvt42i
         uH8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sePhY3+7FDed9E+NZqtmjotVtiqisjqNp0aqjZx4AYw=;
        fh=0kYjNW0k/IPpfXVd43hMm6j3RPus/lMspsiQU1dU1pQ=;
        b=U5fxrPxFf9v1oVb13fYQTfxP/pCZfUgh9/TCwRXynO4znFghh4itavn/oeVc1rAD15
         4sn4OwnayNLB+G9dWMRbEhQ0D7bcGlxZ4VjhYj2o87BkTd/F62ZdAH7jLNxjPZBxNG/U
         DmefTwm8PpNw4P3xLF+QwLuanN13/XlezMaZ0u9YUG6DEUvlRtENcCWk+W5A8xSVwMrb
         Kn0HkoWG8HbMygFZMnVVxCR9QBB5CZQI91YtO00mC1OD7RQi0kBulpImiphd++FetJSO
         AozCC3X4tWF9gbkIEUqVdebCyUfsnF9uFpvYE2UvfI5j/29fMHgGB+x/07WfkiIm53XB
         F/Qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770686853; x=1771291653; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sePhY3+7FDed9E+NZqtmjotVtiqisjqNp0aqjZx4AYw=;
        b=CoIFJ9gDPxnEy/IQ6n+DanE1VXPJcqJphNumKDAHbajCxINzPPBXL+f57llOLxYQvZ
         slB9+UHFhMGisndnoEvirRug0Q8D/7OXjb62hSh3hAvNW/ptQ7vCh7cwEJkn0onkKU3L
         O92gWqLEuEbcVFW2/EV+2EJFscIR3fjHoPpaqLHhclzcfxZAZryVWttcwmQj2CguiWoI
         JKZVdUEcAqvAIKY4AB2ecrhErMiIPTwfWq/IO9ZopfE6ORzZx3gDJ2yhEVMSMXo7uwrR
         K62NUQXHTtlX5zq75znJ/OJCgX3G8YqoRuZR639HVCwi3QDjm+wlHx0sj4drp3kj5qBT
         YOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770686853; x=1771291653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sePhY3+7FDed9E+NZqtmjotVtiqisjqNp0aqjZx4AYw=;
        b=H2i+GAX1eoFXxjqs+BD6ukqZAJ1MMbFxDfFZF7rGwkDpOfpIcKH3guZOEYhz8G9UM/
         E+qnZ9Cgd8wdzleXzklfd23IhJSENvBJQYzdqmby8euHaba9HZSbeZ2473CHuR5EN8gO
         MCqdkNyiexY04ErKvkBOekrfh6y5gkLQYSM4YFrJCKhSbdjESTdFwAAoZdDs8zEMh9LX
         bVG4tsZXLotiP/ORroIRlVyl7KCJ5CpfcFyAnqdyGugPfFw8BNxAJ26J+uFtkyJZIr/I
         mYQvM4ds65MX24xKLUEa4/tGW5O8aMYhLDg5SSe9xM8fuHT8Zdlu3ryra7/qnySaNGp3
         4euQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp84mXZEq3o6GKFzIRMBNN5brufiReTkJq6WDnlIA1IHyDfw1UifqgxULprmisVKcAQhciZ6Bnr3TT@vger.kernel.org
X-Gm-Message-State: AOJu0YzR+SOsW4KmqPQWAY3Ei4A5HqWYP/wmxyQkz+oUHCPX/qdSJdtm
	XpkW6OGOGq5RMSuwjd031psiDchPbXKZ7jyp6JXPdipbgKzB1d7+ooi/SrxQM1M7/sKOwr93JDb
	C2lsQnT+z3y7v/xxO5SHCyYfMU1/ox3mdGps0
X-Gm-Gg: AZuq6aJSwGum19pPcp75LqeI5M4eiCApwBsdWAnbH3TOtOTIlDUKMRnDLUXz5ZVYgXK
	9l31Q+anOBQs89jUPvlIoVqN0Lzfu7w0tx0NwF+kmY7FXD0qmNv2ddqLjXffMQ1XunwEmupozDu
	LEvR9N9WpGw3BiUxaD5M2d1hcBoduDBMA34+MQDlin3cFRgxt6OgVAxS+sbu/561g53ZAlvUzuz
	ylcvULiVYdmEsjOXZTD0p0OXsPxXQO4toBrBHpRqMMdxUT337coaofEoO1r9qWUG4f4ZOci
X-Received: by 2002:a05:6402:146b:b0:658:1528:669 with SMTP id
 4fb4d7f45d1cf-65a0d144dcbmr262464a12.9.1770686853202; Mon, 09 Feb 2026
 17:27:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1770605931.git.zhoubinbin@loongson.cn> <d62faafc653efab602c8d6bfcdcee1cb217171b9.1770605931.git.zhoubinbin@loongson.cn>
 <aYoPyWS7o27G-AHh@lizhi-Precision-Tower-5810>
In-Reply-To: <aYoPyWS7o27G-AHh@lizhi-Precision-Tower-5810>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 10 Feb 2026 09:27:21 +0800
X-Gm-Features: AZwV_Qi5_a-cKTFI06iITBG5Gu1YQfAyT8X0Ih3cxfFWjkoclvcfYBubQp9RiT0
Message-ID: <CAMpQs4+NHVQTcxdsBYp6H7c4FZpsuTo=QpKKY09sgpppDEiuNA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dmaengine: loongson: New directory for Loongson
 DMA controllers drivers
To: Frank Li <Frank.li@nxp.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, 
	Xiaochuang Mao <maoxiaochuan@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org, jeffbai@aosc.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13145-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhoubbaaron@gmail.com,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[loongson.cn,kernel.org,vger.kernel.org,xen0n.name,lists.linux.dev,gmail.com,aosc.io];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,nxp.com:email,loongson.cn:email]
X-Rspamd-Queue-Id: 82D43115FAF
X-Rspamd-Action: no action

Hi Frank:

On Tue, Feb 10, 2026 at 12:48=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Feb 09, 2026 at 11:04:18AM +0800, Binbin Zhou wrote:
> > Gather the Loongson DMA controllers under drivers/dma/loongson/
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  MAINTAINERS                                   |  3 +-
> >  drivers/dma/Kconfig                           | 25 ++---------------
> >  drivers/dma/Makefile                          |  3 +-
> >  drivers/dma/loongson/Kconfig                  | 28 +++++++++++++++++++
> >  drivers/dma/loongson/Makefile                 |  3 ++
> >  .../dma/{ =3D> loongson}/loongson1-apb-dma.c    |  4 +--
> >  .../dma/{ =3D> loongson}/loongson2-apb-dma.c    |  4 +--
> >  7 files changed, 40 insertions(+), 30 deletions(-)
> >  create mode 100644 drivers/dma/loongson/Kconfig
> >  create mode 100644 drivers/dma/loongson/Makefile
> >  rename drivers/dma/{ =3D> loongson}/loongson1-apb-dma.c (99%)
> >  rename drivers/dma/{ =3D> loongson}/loongson2-apb-dma.c (99%)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index f630328ca6ae..27f77b68d596 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14777,7 +14777,7 @@ M:    Binbin Zhou <zhoubinbin@loongson.cn>
> >  L:   dmaengine@vger.kernel.org
> >  S:   Maintained
> >  F:   Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
> > -F:   drivers/dma/loongson2-apb-dma.c
> > +F:   drivers/dma/loongson/loongson2-apb-dma.c
> >
> >  LOONGSON LS2X I2C DRIVER
> >  M:   Binbin Zhou <zhoubinbin@loongson.cn>
> > @@ -17515,6 +17515,7 @@ F:    arch/mips/boot/dts/loongson/loongson1*
> >  F:   arch/mips/configs/loongson1_defconfig
> >  F:   arch/mips/loongson32/
> >  F:   drivers/*/*loongson1*
> > +F:   drivers/dma/loongson/loongson1-apb-dma.c
> >  F:   drivers/mtd/nand/raw/loongson-nand-controller.c
> >  F:   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> >  F:   sound/soc/loongson/loongson1_ac97.c
> > diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> > index 66cda7cc9f7a..1b84c5b11654 100644
> > --- a/drivers/dma/Kconfig
> > +++ b/drivers/dma/Kconfig
> > @@ -376,29 +376,6 @@ config K3_DMA
> >         Support the DMA engine for Hisilicon K3 platform
> >         devices.
> >
> > -config LOONGSON1_APB_DMA
> > -     tristate "Loongson1 APB DMA support"
> > -     depends on MACH_LOONGSON32 || COMPILE_TEST
> > -     select DMA_ENGINE
> > -     select DMA_VIRTUAL_CHANNELS
> > -     help
> > -       This selects support for the APB DMA controller in Loongson1 So=
Cs,
> > -       which is required by Loongson1 NAND and audio support.
> > -
> > -config LOONGSON2_APB_DMA
> > -     tristate "Loongson2 APB DMA support"
> > -     depends on LOONGARCH || COMPILE_TEST
> > -     select DMA_ENGINE
> > -     select DMA_VIRTUAL_CHANNELS
> > -     help
> > -       Support for the Loongson2 APB DMA controller driver. The
> > -       DMA controller is having single DMA channel which can be
> > -       configured for different peripherals like audio, nand, sdio
> > -       etc which is in APB bus.
> > -
> > -       This DMA controller transfers data from memory to peripheral fi=
fo.
> > -       It does not support memory to memory data transfer.
> > -
> >  config LPC18XX_DMAMUX
> >       bool "NXP LPC18xx/43xx DMA MUX for PL080"
> >       depends on ARCH_LPC18XX || COMPILE_TEST
> > @@ -774,6 +751,8 @@ source "drivers/dma/fsl-dpaa2-qdma/Kconfig"
> >
> >  source "drivers/dma/lgm/Kconfig"
> >
> > +source "drivers/dma/loongson/Kconfig"
> > +
> >  source "drivers/dma/stm32/Kconfig"
> >
> >  # clients
> > diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
> > index a54d7688392b..a1c73415b79f 100644
> > --- a/drivers/dma/Makefile
> > +++ b/drivers/dma/Makefile
> > @@ -49,8 +49,6 @@ obj-$(CONFIG_INTEL_IDMA64) +=3D idma64.o
> >  obj-$(CONFIG_INTEL_IOATDMA) +=3D ioat/
> >  obj-y +=3D idxd/
> >  obj-$(CONFIG_K3_DMA) +=3D k3dma.o
> > -obj-$(CONFIG_LOONGSON1_APB_DMA) +=3D loongson1-apb-dma.o
> > -obj-$(CONFIG_LOONGSON2_APB_DMA) +=3D loongson2-apb-dma.o
> >  obj-$(CONFIG_LPC18XX_DMAMUX) +=3D lpc18xx-dmamux.o
> >  obj-$(CONFIG_LPC32XX_DMAMUX) +=3D lpc32xx-dmamux.o
> >  obj-$(CONFIG_MILBEAUT_HDMAC) +=3D milbeaut-hdmac.o
> > @@ -88,6 +86,7 @@ obj-$(CONFIG_INTEL_LDMA) +=3D lgm/
> >
> >  obj-y +=3D amd/
> >  obj-y +=3D mediatek/
> > +obj-y +=3D loongson/
>
> keep alphabet order

Sorry, I'll fix it in the next version.
>
> Frank
> >  obj-y +=3D qcom/
> >  obj-y +=3D stm32/
> >  obj-y +=3D ti/
> > diff --git a/drivers/dma/loongson/Kconfig b/drivers/dma/loongson/Kconfi=
g
> > new file mode 100644
> > index 000000000000..9dbdaef5a59f
> > --- /dev/null
> > +++ b/drivers/dma/loongson/Kconfig
> > @@ -0,0 +1,28 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# Loongson DMA controllers drivers
> > +#
> > +if MACH_LOONGSON32 || MACH_LOONGSON64 || COMPILE_TEST
> > +
> > +config LOONGSON1_APB_DMA
> > +     tristate "Loongson1 APB DMA support"
> > +     select DMA_ENGINE
> > +     select DMA_VIRTUAL_CHANNELS
> > +     help
> > +       This selects support for the APB DMA controller in Loongson1 So=
Cs,
> > +       which is required by Loongson1 NAND and audio support.
> > +
> > +config LOONGSON2_APB_DMA
> > +     tristate "Loongson2 APB DMA support"
> > +     select DMA_ENGINE
> > +     select DMA_VIRTUAL_CHANNELS
> > +     help
> > +       Support for the Loongson2 APB DMA controller driver. The
> > +       DMA controller is having single DMA channel which can be
> > +       configured for different peripherals like audio, nand, sdio
> > +       etc which is in APB bus.
> > +
> > +       This DMA controller transfers data from memory to peripheral fi=
fo.
> > +       It does not support memory to memory data transfer.
> > +
> > +endif
> > diff --git a/drivers/dma/loongson/Makefile b/drivers/dma/loongson/Makef=
ile
> > new file mode 100644
> > index 000000000000..6cdd08065e92
> > --- /dev/null
> > +++ b/drivers/dma/loongson/Makefile
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +obj-$(CONFIG_LOONGSON1_APB_DMA) +=3D loongson1-apb-dma.o
> > +obj-$(CONFIG_LOONGSON2_APB_DMA) +=3D loongson2-apb-dma.o
> > diff --git a/drivers/dma/loongson1-apb-dma.c b/drivers/dma/loongson/loo=
ngson1-apb-dma.c
> > similarity index 99%
> > rename from drivers/dma/loongson1-apb-dma.c
> > rename to drivers/dma/loongson/loongson1-apb-dma.c
> > index 255fe7eca212..e99247cf90c1 100644
> > --- a/drivers/dma/loongson1-apb-dma.c
> > +++ b/drivers/dma/loongson/loongson1-apb-dma.c
> > @@ -16,8 +16,8 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/slab.h>
> >
> > -#include "dmaengine.h"
> > -#include "virt-dma.h"
> > +#include "../dmaengine.h"
> > +#include "../virt-dma.h"
> >
> >  /* Loongson-1 DMA Control Register */
> >  #define LS1X_DMA_CTRL                0x0
> > diff --git a/drivers/dma/loongson2-apb-dma.c b/drivers/dma/loongson/loo=
ngson2-apb-dma.c
> > similarity index 99%
> > rename from drivers/dma/loongson2-apb-dma.c
> > rename to drivers/dma/loongson/loongson2-apb-dma.c
> > index c528f02b9f84..0cb607595d04 100644
> > --- a/drivers/dma/loongson2-apb-dma.c
> > +++ b/drivers/dma/loongson/loongson2-apb-dma.c
> > @@ -17,8 +17,8 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/slab.h>
> >
> > -#include "dmaengine.h"
> > -#include "virt-dma.h"
> > +#include "../dmaengine.h"
> > +#include "../virt-dma.h"
> >
> >  /* Global Configuration Register */
> >  #define LDMA_ORDER_ERG               0x0
> > --
> > 2.52.0
> >

--=20
Thanks.
Binbin

