Return-Path: <linux-mips+bounces-8943-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE6AAAC387
	for <lists+linux-mips@lfdr.de>; Tue,  6 May 2025 14:12:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D7021C23314
	for <lists+linux-mips@lfdr.de>; Tue,  6 May 2025 12:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE8F27F195;
	Tue,  6 May 2025 12:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dw1lR27p"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AE127CCD3;
	Tue,  6 May 2025 12:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746533571; cv=none; b=hGkjdqy8Qo5p9HnEAjNra6gYgTo9Vt8UsZRTBNjwBatBReTeT/HlahshtsFW3OYWx597wZfbd3a2AOLX+yWPJaGrgktdH5VkaY2WfsteE7RdO78krSDs8VcFRQoOTc9WUF5pjPvWoYMEX8ACG2hGmbZPOAqwFdEYSw9Dj9eN2qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746533571; c=relaxed/simple;
	bh=GiE5Zjx147HgqV9OaPcJjaSRQG4ViEONfV5Hc+M9G9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QiHj0rB3fy1JfW6kjwHWPEIuChVL/k1VlBmzM6tlRbXiUcHDC8FFkoYyLbHLvCIvFlZB+QycLN3gYnZeaeClVlr733/w8DJ46yvqGb7uhAfBi31gY5bRM2gVtf51y27RurB4pA2XgAfutSpx2cHYZa2KJU2D99ojjth0IQzPUuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dw1lR27p; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-549b159c84cso6170612e87.3;
        Tue, 06 May 2025 05:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746533568; x=1747138368; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNTDYDfXv7z2jXvHR4xlgOAcYZHFC1OQrZAisODzUt8=;
        b=Dw1lR27pt/GeGuStZ0HW47Ri06tKUqaZ3rffaV/7YzfqIuNTV6JRYj+IIczfEhCCFe
         WaDu781VW7+D+IojAUaB2kqKeFYw+7noaZ78f7lUczYwEtU5M1Eik+mZdYMeOx2pqXq9
         xOPoL5/J2iYPD6MRWbodXHHuxZC3NIixEbxncbBFSJ8ubByqiQ0SCIOYPgXNV2rEAVXk
         DgujJtDDv/PdTINwcgWmuiutjtfqL3QfiAkuFmUG6hpnUeF5jfR3LSfE02jRPJSSfoqg
         jfUEK3d3O0XJWQ5iBs94xyGWQonguNuXeoMiDwZyAUQZnsX7vr3o+4seHGmqyW3IMApV
         Y0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746533568; x=1747138368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNTDYDfXv7z2jXvHR4xlgOAcYZHFC1OQrZAisODzUt8=;
        b=CsS5wbPSvcx0Zo615g2n742FhWyAZKT1XK3EBzli5H4nRLTZeAHRLp3LsQ8+WkBVlE
         vEyCe/Qhg/xwokvAXekKRX3OA05CvKpryq2c2YSsKHKakBq9OLLmF/DyfDzaP6u5StMJ
         Ke8ZvpIX+yUjf48fWgbomkWyJZZbtiRN2CmNQDK/My0sBe8Th7o7r0XXzjYFdoivYifG
         ZQyw2x3Tgd6OghPB6lLehlNs0DIA0hNHkf0Ys6CohUCY8Nrh66IIAk7vJLbQTsJp+Us3
         8+sflqjBKuY7oUzrvEE+jAaIEhIHsYoDOgFxuyoeS7TN7dXrQf3umKVPDw53isWY/lDd
         ECug==
X-Forwarded-Encrypted: i=1; AJvYcCVKDD/r3aJwQxZyGDUJO6fzxTu0xQyQeYOJSSjzCt2JOZUYem7dIdecJnWdFLgpKpMAh+C4Mdv4YZLOMfxr@vger.kernel.org, AJvYcCVba/oe71GGWXZGQc8Ul4mHabyH2u5+DG68R1WJZL9z7kweM4pkHxwCFQU0noL5y0c83ijH834wVApzBQ==@vger.kernel.org, AJvYcCVrmOEjQsrBLRQCf4hGWbHMqhA9wJOK6Tfb2Eb5mBMuPhi9nJpIB9mme1NlNkpwXjS21BL/Qfx9vvJHqrWHntg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqHz+nMSaAItCpWLij+WXfyX3dBBQ0O9/DkIJa6ovEgyBEBAvg
	xBRNOG4YlWynF8MJmbindbVFKPFMSwToaNdx/h/n+lb/AZnCMdhhvKYhe2fuxcXxCQ0BT0dNCxU
	D80I0YSPhC8qKJ9QiL3VMADFsEfo=
X-Gm-Gg: ASbGncsxEh14bz0vgYMYPzggG+37nwq9+rNjWCYjRKsNIqt/c6MgKk2D37PpD8Y4VY8
	Na5URZVPOYRMdvedEyXGkAyKcOHflXlay9lCcpgfDI8JORhCAOUVRtMTndJxzMtKXda2ty0Qmkg
	7AqCx/l54IDkLPDPTndp+/1Oo=
X-Google-Smtp-Source: AGHT+IEb0mXK6fJsSZngroFMqdEdkMdQecAMm47YJ6g9dg6uW8ksppjIknKnuoVQDZyrpDMeRGl6kPlDDntXd/HXFao=
X-Received: by 2002:a05:6512:ad0:b0:549:91e0:143 with SMTP id
 2adb3069b0e04-54fb49fd94emr983970e87.5.1746533567842; Tue, 06 May 2025
 05:12:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aBSEwag_ducqOwy7@stanley.mountain> <CAJhJPsUZz2kwMyWPDrc_ktb5O6ECcAyO1OrXXVWh9yvkrKRidg@mail.gmail.com>
 <aBnXPYLSNJASR51f@stanley.mountain> <CAJhJPsX2-Q+Yq86_Vdyxe-_SVR0j1e5buE8Yw+RbJgp6Kadh8Q@mail.gmail.com>
 <aBnvbYaE-tud_o0x@stanley.mountain>
In-Reply-To: <aBnvbYaE-tud_o0x@stanley.mountain>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Tue, 6 May 2025 20:12:11 +0800
X-Gm-Features: ATxdqUFxrF4BM4DqZ7edMLGkLqXagx31yQtm3t-mDISDZXy2WKaKjiAnI-dvmnw
Message-ID: <CAJhJPsV8Pb7gXFX2gqFVYcp4O7N=zL5V+QGkfYn73UYK67zYfg@mail.gmail.com>
Subject: Re: [PATCH next] mtd: rawnand: loongson1: Fix error code in ls1x_nand_dma_transfer()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 7:16=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> On Tue, May 06, 2025 at 06:01:15PM +0800, Keguang Zhang wrote:
> > On Tue, May 6, 2025 at 5:32=E2=80=AFPM Dan Carpenter <dan.carpenter@lin=
aro.org> wrote:
> > >
> > > On Tue, May 06, 2025 at 05:16:03PM +0800, Keguang Zhang wrote:
> > > > On Fri, May 2, 2025 at 4:39=E2=80=AFPM Dan Carpenter <dan.carpenter=
@linaro.org> wrote:
> > > > >
> > > > > The "desc" variable is NULL and PTR_ERR(NULL) is zero/success.  R=
eturn
> > > > > a negative error code instead.
> > > > >
> > > > > Fixes: d2d10ede04b1 ("mtd: rawnand: Add Loongson-1 NAND Controlle=
r Driver")
> > > > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > > ---
> > > > > It's hard to know what the patch prefix should be here.  Ideally =
when we
> > > > > add a new driver we would use the patch prefix for the driver.
> > > > >
> > > > > Tired: subsystem: Add driver XXX
> > > > > Wired: subsystem: XXX: Add driver for XXX
> > > > >
> > > > >  drivers/mtd/nand/raw/loongson1-nand-controller.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/mtd/nand/raw/loongson1-nand-controller.c b/d=
rivers/mtd/nand/raw/loongson1-nand-controller.c
> > > > > index 6a369b1c7d86..8754bb4f8b56 100644
> > > > > --- a/drivers/mtd/nand/raw/loongson1-nand-controller.c
> > > > > +++ b/drivers/mtd/nand/raw/loongson1-nand-controller.c
> > > > > @@ -371,7 +371,7 @@ static int ls1x_nand_dma_transfer(struct ls1x=
_nand_host *host, struct ls1x_nand_
> > > > >         desc =3D dmaengine_prep_slave_single(chan, dma_addr, op->=
len, xfer_dir, DMA_PREP_INTERRUPT);
> > > > >         if (!desc) {
> > > > >                 dev_err(dev, "failed to prepare DMA descriptor\n"=
);
> > > > > -               ret =3D PTR_ERR(desc);
> > > > > +               ret =3D -ENOMEM;
> > > >
> > > > Thank you for fixing this issue.
> > > > However, I believe -EIO is more appropriate than -ENOMEM, since
> > > > dmaengine_prep_slave_single() can return errors other than -ENOMEM.
> > > >
> > >
> > > It's not an I/O error so -EIO isn't correct.
> > >
> > > There are a bunch of reasons it could fail but most likely
> > > dma_pool_alloc() failed.  I think -ENOMEM is correct.
> > >
> >
> > Have you reviewed the implementation of ls1x_dma_prep_slave_sg()?
>
> The ls1x_dma_prep_slave_sg() has basically two error cases, buggy drivers
> and allocation errors.  Someone could argue that if people pass invalid
> data then the correct return is -EINVAL but in these cases it's a buggy
> driver and we fix bugs, we don't work around them.  So the correct
> return is -ENOMEM.
>

Yes, -EINVAL indicates a bug rather than a real error.
However, this assumes that the caller is aware they are providing invalid d=
ata.
Otherwise, they might be misled into thinking it is an out-of-memory
error (-ENOMEM).

> > Errors in this function can be caused not only by -ENOMEM, but also by =
-EINVAL.
> > Moreover, in most cases, the error handling logic for
> > dmaengine_prep_slave_single() returns -EIO when the function returns
> > NULL.
>
> There are some that return -EIO but hardly the majority.  Other places
> return -ENOMEM or -EINVAL.  It's not worth going back and fixing all of
> these but really -ENOMEM is the correct return.
>
> regards,
> dan carpenter
>

--
Best regards,

Keguang Zhang

