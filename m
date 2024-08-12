Return-Path: <linux-mips+bounces-4851-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E53E94E810
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2024 09:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54B1D1F22286
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2024 07:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16D815886B;
	Mon, 12 Aug 2024 07:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Z4mW4LdR"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F1E158D98;
	Mon, 12 Aug 2024 07:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723448794; cv=none; b=gl9PgfaKE23CqVyvCfcDSoJ6KozKXHHymXlydOxFFjzmhfZYF+UTNIAKiJCACSlwxO4Plbe4aCdq35Nx/UN6rT74FUfa8CyiLFuPpc5mvYWoNN3zOX2URsxZIFY2S7F14S11t0jjcsLyIqDVElGecyMLQZi9rvgXZklKcTk/wUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723448794; c=relaxed/simple;
	bh=JwipMYReCtFtkI5rIct0HTrq5vaYhQxFIjXpOW2cNW4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cDs/i/GnXEutH186tZWyv68ckM4LZbZ8nSguYKaRfPr4YfD1VQ8GaXHMRILJDY+rdKXzVvfZgTuL3bhLUYCA2XyyzW6F5EkWHvLeyo8Y1TTVYhAnhBkna+D2NvWdCVkjjQWV47wx5VQte9wY9DBa5yX35eUTULE9Lj+glbZEaAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Z4mW4LdR; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0BAA60002;
	Mon, 12 Aug 2024 07:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723448783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EYJhz07idCmll0VNWnjmDisDihkjE0werNys1pVEO3Q=;
	b=Z4mW4LdRNvEZqdaZMcyTuoJ7VIbeeqc2hHDGsKNErW76JnRwY5FwmpMf+Yh+wWhT62BoZo
	VRn71biGCirvzb/WFkktT/vY8XMYPaLERYFBoD43yk+O1ad2nJIbTMiWdyc13CguY/RU/+
	kkG2AE9qoqiioGlJO144gJkUBblehNG8ZDzghMNO1MVwHVN75m6NeQ+5K7XsNvMe19gsf+
	NcMb9hghIJ9plw1Bxl2T6zC7EzpqPvpXcqi1WUeDqgOtFZpXtQ7YjQQzHT8j78pGCw0sVE
	ZKIq3ZDtUnUqynJRm8ObF/CH1NWfKNyxdM13zCav9u4dKssOoKvxS34BXohEsQ==
Date: Mon, 12 Aug 2024 09:46:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 3/3] mtd: rawnand: Add Loongson-1 NAND Controller
 driver
Message-ID: <20240812094621.1f4954d4@xps-13>
In-Reply-To: <CAJhJPsUfRpkK6sNuHR0tNfr24bnv8HhJc6FQ0W+_=WeRouhzJQ@mail.gmail.com>
References: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
	<20240430-loongson1-nand-v7-3-60787c314fa4@gmail.com>
	<20240506095938.4a910adc@xps-13>
	<CAJhJPsUfRpkK6sNuHR0tNfr24bnv8HhJc6FQ0W+_=WeRouhzJQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Keguang,

> > > +
> > > +                     nfc->data->parse_address(chip, addrs, naddrs, c=
md);
> > > +                     /* set NAND address */
> > > +                     nand_writel(nfc, NAND_ADDR1, nfc->addr1_reg);
> > > +                     nand_writel(nfc, NAND_ADDR2, nfc->addr2_reg);
> > > +                     break;
> > > +             case NAND_OP_DATA_IN_INSTR:
> > > +             case NAND_OP_DATA_OUT_INSTR:
> > > +                     offset =3D nand_subop_get_data_start_off(subop,=
 op_id);
> > > +                     nfc->len =3D nand_subop_get_data_len(subop, op_=
id);
> > > +                     if (instr->type =3D=3D NAND_OP_DATA_IN_INSTR)
> > > +                             nfc->buf =3D
> > > +                                 (void *)instr->ctx.data.buf.in + of=
fset;
> > > +                     else if (instr->type =3D=3D NAND_OP_DATA_OUT_IN=
STR)
> > > +                             nfc->buf =3D
> > > +                                 (void *)instr->ctx.data.buf.out + o=
ffset; =20
> >
> > The buf pointer feels clunky. You don't know for how long the buffer
> > you point to will be valid, please don't do that.
> > =20
> The buf pointer is used for DMA transfer afterwards.
> I referred to other drivers, and they used the same approach.
> https://elixir.bootlin.com/linux/v6.8.9/source/drivers/mtd/nand/raw/arasa=
n-nand-controller.c#L647

nfc_op is a local variable, it doesn't live past the function call.

> https://elixir.bootlin.com/linux/v6.8.9/source/drivers/mtd/nand/raw/rockc=
hip-nand-controller.c#L366

Thanks,
Miqu=C3=A8l

