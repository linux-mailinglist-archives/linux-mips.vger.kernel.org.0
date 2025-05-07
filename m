Return-Path: <linux-mips+bounces-8949-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAA6AAD332
	for <lists+linux-mips@lfdr.de>; Wed,  7 May 2025 04:20:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA3364C6AE7
	for <lists+linux-mips@lfdr.de>; Wed,  7 May 2025 02:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18A9183CCA;
	Wed,  7 May 2025 02:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bj9HSiTb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF95A13C914;
	Wed,  7 May 2025 02:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746584400; cv=none; b=POH2y5yPOFlOxEl9uE3cKcTwljWFp7WVkzgoAtMI31zZijW4pZQokSyZT1wy5egXySAw2Eeh7anaHDMS0yxkDLTM/tZGiocuQOL8UzGW5wIfv4UMevVlolH3rJS0UtUc3ZbJX0V9e3vahdTRGg5Mm/sD1ZNbEDTg8Fj1+85hKyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746584400; c=relaxed/simple;
	bh=dK5KwvpoPPpCJMgqkgFhHp+qB5mNKwSWZ8VM7QF4B/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rHof8vSsNQhqGcJaNEAioBwAME52z1PzP8tSqGgafaMOXuCqzvS2NUal+BcyUxxK7fW1fYFVNOZxT+3cyG+CS2oXCryLy0cKHosCSfGdzxxEQcwgw6XUbpp9EkIJhq4if86eqkTUyp3w4m/TjhxVAXRedfMUAInZvFyRH22IIC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bj9HSiTb; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-549963b5551so7194305e87.2;
        Tue, 06 May 2025 19:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746584396; x=1747189196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3dHw7mgAZZaKFqI8wqICcNj5nSVnoaIaacPp8z1E6o=;
        b=bj9HSiTbD0obJl2DyoIijTyVlBOF2AyTlP6e1V/szyQQCmVLkjfyGhFqm0WBsfTlKg
         dC864rkrXjGFLAR8ZnV4bMaLnfflfq5XFFDbIVaojAU3NhUdzCiVOWo1ubWYoOJs3ntY
         o+u0NEPPbEZJ1St4Ge78tjjRLYxwBWj3QLH4PmB049VPI6RGsU4p0EbXc7zfpcJu1Pjy
         RvYAsp2h/mfmkD5QvDpoAMu66x0HQxgLqiQkuJBQV0EJ/wxG0SV6zavXM9wusdLw6W39
         f7JkZ3IAd5Bks5l6K5JPXSDF81994qML6cM4u912zaElXT0v87pxN7iPQFjk1sX4IvkA
         IJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746584396; x=1747189196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3dHw7mgAZZaKFqI8wqICcNj5nSVnoaIaacPp8z1E6o=;
        b=nWVAw7bW+qX/3y6wKyV3Nc0sQYc3T9hc2brNS/XIAGaM96LYml12FJn79x2GuAAe5A
         6rJWndIMI1uUrtswwl9rDDFiq77XD5iSQvyn3ZnNlmw5Mf7AjKqFZdApm6XEEGkD828t
         +sjIFrKqeUJRjBqhGECxO8uFy1gO4/z1kn0AowlePhd7jjhYhvVRZoF+4bpnyz1swCcz
         NCOMwSvvt3uYoVZgWVJfqfJh0oAUb4GQ+swvzRsIg683QqzUKL1L2bYevqYSbtjDkkrT
         5gYMBvfVFRvsStRo6/T73Ce6aWElqLISbgsfCbdsLcXE0I58qrgdMtDgGmrcWROw8oBO
         KBwg==
X-Forwarded-Encrypted: i=1; AJvYcCUZTC4JW/SgNQYNBqOdtThD5YQIG8Vpot6utDhKPUGHnOYwoppxC+DqOhMzFJjDnjn4w9IlgKHhqCYOOQ==@vger.kernel.org, AJvYcCXGrH5lOu4qQY1459FNhtSN4cnr529z9beoIcxI4kgaaS1UXW0H8m1Trs6oZ4C01lUsuSIhLWCzawHZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyy9trp3e3JFLrFpC/tl34XetBLEw59By30JiHhshowGqL/+X6
	nsBVSbU4ApNLvNAUvR85LQcCcvDJT56mDjEeBwYIAAgjPHRgwbGJrIAC9saUK9E6xHRTkDRaA08
	QAO3sH2LwvIRTclVP9U4PJM0DDjZl3t5ZEK8=
X-Gm-Gg: ASbGncsinaGY8w3tKuUkInBVlrS3N+p70tYfv+0N5vF6Yjv4xdVtZlIEFoqGV8+EdRv
	0hLnFgO9D6l1FKmwn21M6kB71pmlv4SNIN6eyvqy+GIDjfKum7O6e/lLZkhMd/TSkVKvwWXtRmQ
	arLeanMF/UqwL26rvw+ZI/4SI=
X-Google-Smtp-Source: AGHT+IEHHSrM8lUGjXyC29XgpCoALFPav9UBwvGwJSEF9oEir0MtBc94KvC6Bdeq3rGHG/CFZD3Kt7jc8rEFpB3+fZs=
X-Received: by 2002:a05:6512:20d8:b0:54b:117b:952e with SMTP id
 2adb3069b0e04-54fb95ba664mr432780e87.55.1746584395709; Tue, 06 May 2025
 19:19:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aBR535RZZT-sa6QZ@stanley.mountain> <20250502160408.GC15945@pendragon.ideasonboard.com>
In-Reply-To: <20250502160408.GC15945@pendragon.ideasonboard.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Wed, 7 May 2025 10:19:18 +0800
X-Gm-Features: ATxdqUF2q4OqYQGMItnm4chuLq1HIZNkbYYaj1fKHzu44gfS5dx8BLdSbU8WwtQ
Message-ID: <CAJhJPsWTeimkQGzdtT+dAdO1d6KhjW7myvgQeuNj85_qCdNG7w@mail.gmail.com>
Subject: Re: [bug report] mtd: rawnand: Add Loongson-1 NAND Controller Driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-mips@vger.kernel.org, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 3, 2025 at 12:04=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, May 02, 2025 at 10:53:03AM +0300, Dan Carpenter wrote:
> > Hello Keguang Zhang,
> >
> > Commit d2d10ede04b1 ("mtd: rawnand: Add Loongson-1 NAND Controller
> > Driver") from Mar 20, 2025 (linux-next), leads to the following
> > Smatch static checker warning:
> >
> >       drivers/mtd/nand/raw/loongson1-nand-controller.c:730 ls1x_nand_ch=
ip_init()
> >       warn: inconsistent refcounting 'chip_np->kobj.kref.refcount.refs.=
counter':
> >
> > drivers/mtd/nand/raw/loongson1-nand-controller.c
> >     690 static int ls1x_nand_chip_init(struct ls1x_nand_host *host)
> >     691 {
> >     692         struct device *dev =3D host->dev;
> >     693         int nchips =3D of_get_child_count(dev->of_node);
> >     694         struct device_node *chip_np;
> >     695         struct nand_chip *chip =3D &host->chip;
> >     696         struct mtd_info *mtd =3D nand_to_mtd(chip);
> >     697         int ret;
> >     698
> >     699         if (nchips !=3D 1)
> >     700                 return dev_err_probe(dev, -EINVAL, "Currently o=
ne NAND chip supported\n");
> >     701
> >     702         chip_np =3D of_get_next_child(dev->of_node, NULL);
> >
> >
> > The of_get_next_child() function drops the reference on the current
> > child.  That's probably not what we want to happen.  This is similar to
> > a discussion we were having earlier about of_find_node_by_name().
>
> The current child here is NULL, so I don't think there's an issue.
>
> > Then it takes a reference to the new child.
>
> *That* causes issues that you outlined below.
>
> >
> >     703         if (!chip_np)
> >     704                 return dev_err_probe(dev, -ENODEV, "failed to g=
et child node for NAND chip\n");
> >     705
> >     706         chip->controller =3D &host->controller;
> >     707         chip->options =3D NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA=
 | NAND_BROKEN_XD;
> >     708         chip->buf_align =3D 16;
> >     709         nand_set_controller_data(chip, host);
> >     710         nand_set_flash_node(chip, chip_np);
of_node_put(chip_np);

By adding the line above, all other of_node_put(chip_np) calls can be remov=
ed.
Thanks for reviewing!

> >     711         if (!mtd->name)
> >     712                 return dev_err_probe(dev, -EINVAL, "Missing MTD=
 label\n");
> >
> > of_node_put(chip_np) before returning.
> >
> >     713
> >     714         mtd->dev.parent =3D dev;
> >     715         mtd->owner =3D THIS_MODULE;
> >     716
> >     717         ret =3D nand_scan(chip, 1);
> >     718         if (ret) {
> >     719                 of_node_put(chip_np);
> >     720                 return dev_err_probe(dev, ret, "failed to scan =
NAND chip\n");
> >     721         }
> >     722
> >     723         ret =3D mtd_device_register(mtd, NULL, 0);
> >     724         if (ret) {
> >     725                 nand_cleanup(chip);
> >     726                 of_node_put(chip_np);
> >     727                 return dev_err_probe(dev, ret, "failed to regis=
ter MTD device\n");
> >     728         }
> >     729
> >
> > I think we want to call of_node_put(chip_np) before returning on the
> > success path as well?
>
> I would instead declare the chip_np variable as
>
>         struct device_node *chip_np __free(of_node_put) =3D NULL;
>
> and drop all the of_node_put(chip_np) calls.
>
> > --> 730         return 0;
> >     731 }
>
> --
> Regards,
>
> Laurent Pinchart



--
Best regards,

Keguang Zhang

