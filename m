Return-Path: <linux-mips+bounces-8939-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F28AABEFE
	for <lists+linux-mips@lfdr.de>; Tue,  6 May 2025 11:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D79F11C408AF
	for <lists+linux-mips@lfdr.de>; Tue,  6 May 2025 09:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8B226E15F;
	Tue,  6 May 2025 09:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LsLyrCFr"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6873A26FA4F;
	Tue,  6 May 2025 09:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746523006; cv=none; b=nWWKjdbN7BMDGwagGXG8YBxm1CptOGiIxBL6melryFPJ0dIBc3ByzW28zEvQcbm0RorgAiz7OvP6orbIZfTu4w4WLglkOWhh8i8Wuh+bEL33/4k/3+uy5hUovPmGA544sBhC9Upjj28d8I+lW8Y7fTw2+lfqA4v7pzji/xfqWg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746523006; c=relaxed/simple;
	bh=nRFtA0I4OFRgZKas2V+4TF+RIvrJztMih/WYQj0oNJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LNG2hQ7IprFkyubiPCY7cVs3kYOddoySALCQjfhk8Ktjpml1WzufSTfqGJIMWA6tk5C8EfjML5DulP/++LjvmOnK0/O+3JEONb6fj5cV/znQd27DXhYmkrCAbD0DQGfh6CytEXQtP75vmcLwCOSNHjiFE7W0N0g/7MXX4fMciRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LsLyrCFr; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54af20849bbso6198146e87.0;
        Tue, 06 May 2025 02:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746523001; x=1747127801; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFhdrQg9VjOK5o+w3dNEthEuz25cmcD0YW5MAF0oO54=;
        b=LsLyrCFrS/nt6hiLE69QHY1IqIm14mu2aZWh19yfQ6R6iWe9x39A9cs33oW5RHso5V
         TdYRCiWQZrv1hMMeU/8dA4HrgMqwQqddZjM1ln4FSglDHI55B0d2A7pkJj8+rKvDa7DU
         yUCL+OuDz+90qvLhqFNZvJocds/msacJ+xdXY1CIrU9nU9sYg06VMhMCxhqwz45pvt/l
         7LNyWmO1Rlp4rjEP2s4YMuDuweGAdefCKLM2dsx5dQKoFpAKMlkwGUfEbnw1ys++0gjC
         JgVIZyy+GfaNI5cIqB3tof/yOnQRh0vjSJEWJQcptkdgOSMjt+FxaOwsRJzEhIqGBHs3
         s0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746523001; x=1747127801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFhdrQg9VjOK5o+w3dNEthEuz25cmcD0YW5MAF0oO54=;
        b=J9jLz+HSwT+2Em/mZydcH9LbgDEAUJr2/amuBFHqOBEkw4/QDA/rYQZaRpRcZ/3/25
         4Y8H2LhUV13l8nqLfEmN63cnxT4nZ0D7nx8NeG0ewDdyBjQ0aaXf4vbxHB2zBtlt7MuK
         FKq1GGn47Iu13wLy6Ir6+0G9XBvdf/4rK7awFcDeUJL17xk8qCX/8WzbQvCURJt41FMR
         w71Tj7IJAEUq0McvWJdyT3MesRFribBUvCu25WoXoAPd35dsK/nsnolD7sGmIPXNgEvF
         7qvy1H/Zs+JtSyBkPKUt4sQRcQ3R6zl0x/TMxjfSwx4gAae4EGPAPWBhUT/U+5rvP5lM
         i/ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoUuJoNTLvudEHQR9ZHO9i1E4PdE5u0H5y22wxlGlq9FgQKhHOKdkpfzBJOcKtAnzJlJpZTnjL5FIUPg==@vger.kernel.org, AJvYcCVtHLBMxcefth8a4OSGQLi33jU+KfNBL2D2zrthd20i5qwWYx8lWRa2S1c/72OXS69mZv4Dc9uSyj+QXgNmwyo=@vger.kernel.org, AJvYcCW72zmi8s0o/kg7TF8+8jzXSkVtjV9U+NCjy+hz95+JfMdzc9zKSmWDn/A2dprI+dgvfYFOBioaRliyc3c1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7liRQrGdctgQgPnJp3AaOA6aqsZpKsV53kPhmHmvX++qOgdac
	fUwy3zGWMppFiPIfzPs8jGSY6CCpGIJJGwsxQL8053t0lOl2cavRBWbAGUcwr6xj/q6b+6dv1Kv
	zR/FDg78bU/ns1LzkDGnmlL/xy7VYYAqZilg=
X-Gm-Gg: ASbGncvoOwKncG4Eyo/y7p0C9zHDuO+wgNo85sHCuIZOkvhoeNwlV+XN1a6MqmeOc8L
	JhQhCyN5+P/62PsOcrl1YR84BcOgOBGO00dHlVHAxK787CEdRbOI4wMCFH1NfY/egKa/PXQdiEC
	DBiRUSE+Ng7w0nMvVEMiKw5uU=
X-Google-Smtp-Source: AGHT+IFg6WE7j8FSGTac7AwWN6IfBm6BGTQTRX79tY25IYyGnXzIH3FUSkGCAyHgyH2w/ZukrNan9JItD5yPEyQJP8U=
X-Received: by 2002:a05:6512:6cc:b0:545:a2f:22ba with SMTP id
 2adb3069b0e04-54fb4a67cb6mr724690e87.37.1746523001039; Tue, 06 May 2025
 02:16:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aBSEwag_ducqOwy7@stanley.mountain>
In-Reply-To: <aBSEwag_ducqOwy7@stanley.mountain>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Tue, 6 May 2025 17:16:03 +0800
X-Gm-Features: ATxdqUFNvs-6aP2yLuFUCy6zY-YKCHM9vIIJ1LromY7V5gmh-56UOb_wQLCMNr8
Message-ID: <CAJhJPsUZz2kwMyWPDrc_ktb5O6ECcAyO1OrXXVWh9yvkrKRidg@mail.gmail.com>
Subject: Re: [PATCH next] mtd: rawnand: loongson1: Fix error code in ls1x_nand_dma_transfer()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 4:39=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> The "desc" variable is NULL and PTR_ERR(NULL) is zero/success.  Return
> a negative error code instead.
>
> Fixes: d2d10ede04b1 ("mtd: rawnand: Add Loongson-1 NAND Controller Driver=
")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> It's hard to know what the patch prefix should be here.  Ideally when we
> add a new driver we would use the patch prefix for the driver.
>
> Tired: subsystem: Add driver XXX
> Wired: subsystem: XXX: Add driver for XXX
>
>  drivers/mtd/nand/raw/loongson1-nand-controller.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/raw/loongson1-nand-controller.c b/drivers/m=
td/nand/raw/loongson1-nand-controller.c
> index 6a369b1c7d86..8754bb4f8b56 100644
> --- a/drivers/mtd/nand/raw/loongson1-nand-controller.c
> +++ b/drivers/mtd/nand/raw/loongson1-nand-controller.c
> @@ -371,7 +371,7 @@ static int ls1x_nand_dma_transfer(struct ls1x_nand_ho=
st *host, struct ls1x_nand_
>         desc =3D dmaengine_prep_slave_single(chan, dma_addr, op->len, xfe=
r_dir, DMA_PREP_INTERRUPT);
>         if (!desc) {
>                 dev_err(dev, "failed to prepare DMA descriptor\n");
> -               ret =3D PTR_ERR(desc);
> +               ret =3D -ENOMEM;

Thank you for fixing this issue.
However, I believe -EIO is more appropriate than -ENOMEM, since
dmaengine_prep_slave_single() can return errors other than -ENOMEM.

>                 goto err;
>         }
>         desc->callback =3D ls1x_nand_dma_callback;
> --
> 2.47.2
>


--=20
Best regards,

Keguang Zhang

