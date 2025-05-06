Return-Path: <linux-mips+bounces-8941-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76214AAC0B5
	for <lists+linux-mips@lfdr.de>; Tue,  6 May 2025 12:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E255A1C25A3F
	for <lists+linux-mips@lfdr.de>; Tue,  6 May 2025 10:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8CCD2777F2;
	Tue,  6 May 2025 10:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSI4RiUe"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3AC26D4D3;
	Tue,  6 May 2025 10:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525720; cv=none; b=W1SCPdy10V166qmZTPNEI7yBDCb4WtQh41WyUwxy7eimrAAtMRsMUQaG+RhdGvnmwFCplHZpQ5zV0gQaTrSYGb3zHHsJbFtq6HIqPk/QH3tcfnxO+aWpQFIhSqjHsIaOvIGYOyFoueg9tvLccAfKPUQOxxmNWgq6uLaCKk6Akec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525720; c=relaxed/simple;
	bh=gWbLewIEIOv0mJH1hEnsytH9AJCQaeLV0UIudMsUeFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XFL1YUcQqo4CZef3R8ZhU2DlqLBaX7e5fclPDuQyu4Cdkpnjo2IyarDkjRV2BQ7Sw5DrZZlIboKOZ5DenxWWtzHIkDe/Lz8kPHjOwGZao2AEMQFWPERiuZAmmwxxlOFBuBTIG3eZZJ78SlmmIRQrZJpMTFquWRDZ1sIn5FNpUAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSI4RiUe; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5499c5d9691so6441294e87.2;
        Tue, 06 May 2025 03:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746525714; x=1747130514; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbTMYRXxjWwDv34DNkvnpHKQi/e+RgRDGWrhgBctL18=;
        b=bSI4RiUeOMHnpfULLNLB0UgsG860rfogDKbndQmiqKSvbwEdReODNAtd4Srr5hL9WT
         /w7pqAOMQnZPvKIJYMJWkhi8sSKxDqdphupLbR84G9Wb7X3DYXQEGBjSf532ZnobOA93
         AwiLHvh98xqtcGxV+6QlH5YPqAutGqe12rETu7JaaRdqIkK/R/Gz8bCjEFy4ax/Jrg7s
         r46pkE6fkU7TfUbBu41iKu55ftLI2m/DdcXMbDH1gjnvxEPD8NxC4RsbyAkWapNe89qH
         L2T8pAId/9KwPPz4En5+3kWiCfR0XQkevv7ZCE6G5ED72b45VwxAmbW+b6/V0+a/zIaY
         +KFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746525714; x=1747130514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbTMYRXxjWwDv34DNkvnpHKQi/e+RgRDGWrhgBctL18=;
        b=e1AeZkWNySgAqHWdS+hdFSPqf8Z81WIY4agtG0K6dE/XWMcC+1K0mJUCuazAzhmas/
         6izflvnZH+iWkP5l9Vf1X5KnXF1659DuaVNaHM18KcEBYHLog/pPNMCNcV/TY9LVATE0
         gxqjPUIzEdOaPFAP82iROjkIw1uXjUTtQ2EJ84EIiGhh7PGIuK62XgsHc0VXxE4aR1X8
         S4ZZDfYMbe3a9pOgtNepON1YhDPkB9bK8bxYVXTJkW9HNcF0NQvy7xP9vb0AvTKqLsXa
         Ey2Lgf6/l3H7GkhhN9Wp+dQqr+OL650PUrDpNLbV5QuahVHiubdyxuFWD6HJXSbPyLlM
         IOmA==
X-Forwarded-Encrypted: i=1; AJvYcCV8IGgbNu8HjkRs9QslkRkGNfFPUF1UIcdEjchTOy9PlQgoj9B5jEBHe0vgCBPqkFatPlRxjpp9U0fAcg==@vger.kernel.org, AJvYcCVXfBnLcs4nFhwd+Rj8oKSqihB86Pjse0BIsq+3+xSrosxqcZthnDD1zv4QcULM4W7JpoZp38ECTvzbCSBd0h8=@vger.kernel.org, AJvYcCW1RxTWm7ApZJzQT3UXyj86cTjfPgOHotGjwZQmd23S4VFRom3zC4+47YTUKQe1SnMtb+2kBI+rsXFtCwzW@vger.kernel.org
X-Gm-Message-State: AOJu0YzLLqtiH71b0Ofw34TeXolic/tPU8kicKm6YXuWKkVb+dXD4zPQ
	+agvKEpUKjZ1eN6Qa8dRLZE4lGKasGDlg0KFYpVQQyVnS9lh8ueSwmZPjVqBlkZX3JyEYq+x6Vw
	a+S+RLZ1FG/pcL6Cxb65DDzCm7Jc=
X-Gm-Gg: ASbGnctjzjcCV/DLXBaaNE8o9dA46Z9BvTtOXO1d/hXOoQRJxVDfiT1roizV1kdT73N
	WRs6xDnSFS02zvzg1xy719r/0Y76XOlg/QhxDcnI1thvUyX1kMDaMzsvS4y/XmjI0r3VZ8LVA5u
	GEhjmjL+opY7tEnteIe6Da7vE=
X-Google-Smtp-Source: AGHT+IGv0RdCR9/f9UfmoOB9YYGS3ew7syQiCP7mmHmSMLskA/JEOQ42E6LtkmFRgOw2dMJXoDe5ainLTW0mtckViVE=
X-Received: by 2002:a05:6512:31c8:b0:54d:65e8:31b8 with SMTP id
 2adb3069b0e04-54f9efb759fmr3022300e87.5.1746525713807; Tue, 06 May 2025
 03:01:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aBSEwag_ducqOwy7@stanley.mountain> <CAJhJPsUZz2kwMyWPDrc_ktb5O6ECcAyO1OrXXVWh9yvkrKRidg@mail.gmail.com>
 <aBnXPYLSNJASR51f@stanley.mountain>
In-Reply-To: <aBnXPYLSNJASR51f@stanley.mountain>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Tue, 6 May 2025 18:01:15 +0800
X-Gm-Features: ATxdqUFgHZm6UcwG7A_xWG4kv2LDq7RKrYskxuQhJqrp2afgGaTv65Pp7s5MCYs
Message-ID: <CAJhJPsX2-Q+Yq86_Vdyxe-_SVR0j1e5buE8Yw+RbJgp6Kadh8Q@mail.gmail.com>
Subject: Re: [PATCH next] mtd: rawnand: loongson1: Fix error code in ls1x_nand_dma_transfer()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 5:32=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> On Tue, May 06, 2025 at 05:16:03PM +0800, Keguang Zhang wrote:
> > On Fri, May 2, 2025 at 4:39=E2=80=AFPM Dan Carpenter <dan.carpenter@lin=
aro.org> wrote:
> > >
> > > The "desc" variable is NULL and PTR_ERR(NULL) is zero/success.  Retur=
n
> > > a negative error code instead.
> > >
> > > Fixes: d2d10ede04b1 ("mtd: rawnand: Add Loongson-1 NAND Controller Dr=
iver")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > > It's hard to know what the patch prefix should be here.  Ideally when=
 we
> > > add a new driver we would use the patch prefix for the driver.
> > >
> > > Tired: subsystem: Add driver XXX
> > > Wired: subsystem: XXX: Add driver for XXX
> > >
> > >  drivers/mtd/nand/raw/loongson1-nand-controller.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/mtd/nand/raw/loongson1-nand-controller.c b/drive=
rs/mtd/nand/raw/loongson1-nand-controller.c
> > > index 6a369b1c7d86..8754bb4f8b56 100644
> > > --- a/drivers/mtd/nand/raw/loongson1-nand-controller.c
> > > +++ b/drivers/mtd/nand/raw/loongson1-nand-controller.c
> > > @@ -371,7 +371,7 @@ static int ls1x_nand_dma_transfer(struct ls1x_nan=
d_host *host, struct ls1x_nand_
> > >         desc =3D dmaengine_prep_slave_single(chan, dma_addr, op->len,=
 xfer_dir, DMA_PREP_INTERRUPT);
> > >         if (!desc) {
> > >                 dev_err(dev, "failed to prepare DMA descriptor\n");
> > > -               ret =3D PTR_ERR(desc);
> > > +               ret =3D -ENOMEM;
> >
> > Thank you for fixing this issue.
> > However, I believe -EIO is more appropriate than -ENOMEM, since
> > dmaengine_prep_slave_single() can return errors other than -ENOMEM.
> >
>
> It's not an I/O error so -EIO isn't correct.
>
> There are a bunch of reasons it could fail but most likely
> dma_pool_alloc() failed.  I think -ENOMEM is correct.
>

Have you reviewed the implementation of ls1x_dma_prep_slave_sg()?
Errors in this function can be caused not only by -ENOMEM, but also by -EIN=
VAL.
Moreover, in most cases, the error handling logic for
dmaengine_prep_slave_single() returns -EIO when the function returns
NULL.

> regards,
> dan carpenter
>


--=20
Best regards,

Keguang Zhang

