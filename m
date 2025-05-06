Return-Path: <linux-mips+bounces-8942-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAEAAAC23B
	for <lists+linux-mips@lfdr.de>; Tue,  6 May 2025 13:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C16D3ABE1E
	for <lists+linux-mips@lfdr.de>; Tue,  6 May 2025 11:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00672798EC;
	Tue,  6 May 2025 11:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q8h74pHz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAE0276042
	for <linux-mips@vger.kernel.org>; Tue,  6 May 2025 11:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746530165; cv=none; b=Q0wrwDluZS2cvi3W7vgwDl+WGhn7DFl2SohsKJ2bTdSWpZFSpu0SApTK2keaxYvgePYjut10wt3poel6IuJjnnIWqaPvxMjlFoW0M3nQ/aCXxUYdQLDZ9C9Lsr00HHfN9IIVzXVrNd6/3thY4e4NP4JrTVVjDCaXFeD8Sy3M7pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746530165; c=relaxed/simple;
	bh=Ic6iSBqqOYzgqBs0HWZuf5LIeAmlU/Dk/nOP/28CaHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=In9T0yQ+LArHOQYB+15Te4LUYhmYUYsGKg5jAc2T5MPdScLezty4lWD8E4SRVanL5OSHJwz+1bZf1zUj6pAG6hBB3MHEP03SDRqEIOBZAK/UB9BmEOUcewZOSLWlFjJBFQWMlPhLz49ij2PUr6w2Fqr8jYo9gYEGbqBb+OPp6mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q8h74pHz; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so51342075e9.2
        for <linux-mips@vger.kernel.org>; Tue, 06 May 2025 04:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746530162; x=1747134962; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AZCwgOWOOCWTlbTNg+Glm3yWO7Px7uzRJr4qQIo37HE=;
        b=q8h74pHzgCsX2aFWHKuI7jWS0k5ifTSuGh+hdR6G4sVgVqHRmD1nLZVAyQUfUYq96e
         IsNxObUHqkcVkzSJM+sg+NtKaa7b4SxyC1/i8voGv7GDeCApBd12VY+NUmdvNXn3EVcU
         NercAKKrONxgUJetuGfmvQnIzbYgXWgawWRu2Pm9OOy5bw5aOeO/YrYppAXRS4okSHzg
         /B00IqjDsFL7OSQqw6rWVuLyddk3duXdNt075YOQh9NYu6Wa/XhVKLfB+NOtpVjWO+Gg
         d/wQjO298/WcGJmABbtOoU29QmhdXDjU1CET7U5dHIRKOXZrmr3k1jaTvdXRvL1aiRYl
         k3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746530162; x=1747134962;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AZCwgOWOOCWTlbTNg+Glm3yWO7Px7uzRJr4qQIo37HE=;
        b=XVi+h09GTUb6qb8SUf7dIaSt5FmrKTw+zx+rSRALjM9SY+TxisKQED/S9ZlJmqMxnR
         rMjGk5pKWSaA9NLuw2QwN+gXjm6K277KtCqIHHgoJOARxkV84Jz7vDY5DwDvgfNjgfF0
         KcP4mZ2amRIZzMTN16LRcHpzyxqx9VNN9a41b5/+c+mxFEouGaI1Ct0LI4KUuni16sAd
         n1qCN1HipRJt9oStYz33AFM+/9jKMn/33is4wfYbis+6MdhDVAXVwUlFcOBXgfmYinJA
         8+UM8l5GMMzx2/JNmvuNYoP+SPNVfVSnesI51p7QjzK4wtg4BZ9B5ThZfAmI9LVmS44n
         TanA==
X-Forwarded-Encrypted: i=1; AJvYcCUHW4YqtiuIaTCtgSftoTjdtJSJVwvbfmrWMXdazM+cfJ9c+recQwtZZeUbIXtYMg5QpvEQx50wOUua@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1emWkYCfdrtBstH4W+F6edN+pgCm+2dOsc/g+N2NnWFnBVup7
	xDowsFtQ05Tx+csl/kpQpqD9TyXwzPQY8srz301VVNCwT8dLSBN+2sgwA2xkKkg=
X-Gm-Gg: ASbGncsI5Cw+IjA7LjT6N4mosCSHEVGPZl22Q1yQCwhVUOKgBukU6HHqAT8557UdbfE
	9y3EpM4lT8EQqjeQrjhWRw0OklNsNrG+ukgfqooEYmTGCeEKJ8IlBCdRY1GPYr8H34LUj9B/EmH
	SAl1rJaOk2hee4uAz8+9VPkbGy56WS58QO/wkbUbQeIRJQmBykxPD2+WH8ukkWLlCOS/S13w51x
	4h+DEX3vLInz58QPhcsWowKruAqQkf5DNix4kokf2gShLCGJKSYhcelppe75vxYmktut8xoyzRf
	xs6ruUR8wY1XKS4/jJ7KqAh/K+SgCR4dJIiOhFqjTzZdkNEz3RQKh6wk
X-Google-Smtp-Source: AGHT+IEb/FzHjC2BdixzCZvpPpVp5jderqE1DM9mJQuUaUitas1wO3yPRwuVgog0ub9hO25i19Te4w==
X-Received: by 2002:a05:600c:4ec6:b0:43c:e8a5:87a with SMTP id 5b1f17b1804b1-441c48dc0a1mr103108985e9.16.1746530162207;
        Tue, 06 May 2025 04:16:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b8a286b9sm164637705e9.28.2025.05.06.04.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:16:01 -0700 (PDT)
Date: Tue, 6 May 2025 14:15:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] mtd: rawnand: loongson1: Fix error code in
 ls1x_nand_dma_transfer()
Message-ID: <aBnvbYaE-tud_o0x@stanley.mountain>
References: <aBSEwag_ducqOwy7@stanley.mountain>
 <CAJhJPsUZz2kwMyWPDrc_ktb5O6ECcAyO1OrXXVWh9yvkrKRidg@mail.gmail.com>
 <aBnXPYLSNJASR51f@stanley.mountain>
 <CAJhJPsX2-Q+Yq86_Vdyxe-_SVR0j1e5buE8Yw+RbJgp6Kadh8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJhJPsX2-Q+Yq86_Vdyxe-_SVR0j1e5buE8Yw+RbJgp6Kadh8Q@mail.gmail.com>

On Tue, May 06, 2025 at 06:01:15PM +0800, Keguang Zhang wrote:
> On Tue, May 6, 2025 at 5:32 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Tue, May 06, 2025 at 05:16:03PM +0800, Keguang Zhang wrote:
> > > On Fri, May 2, 2025 at 4:39 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > > >
> > > > The "desc" variable is NULL and PTR_ERR(NULL) is zero/success.  Return
> > > > a negative error code instead.
> > > >
> > > > Fixes: d2d10ede04b1 ("mtd: rawnand: Add Loongson-1 NAND Controller Driver")
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > ---
> > > > It's hard to know what the patch prefix should be here.  Ideally when we
> > > > add a new driver we would use the patch prefix for the driver.
> > > >
> > > > Tired: subsystem: Add driver XXX
> > > > Wired: subsystem: XXX: Add driver for XXX
> > > >
> > > >  drivers/mtd/nand/raw/loongson1-nand-controller.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/mtd/nand/raw/loongson1-nand-controller.c b/drivers/mtd/nand/raw/loongson1-nand-controller.c
> > > > index 6a369b1c7d86..8754bb4f8b56 100644
> > > > --- a/drivers/mtd/nand/raw/loongson1-nand-controller.c
> > > > +++ b/drivers/mtd/nand/raw/loongson1-nand-controller.c
> > > > @@ -371,7 +371,7 @@ static int ls1x_nand_dma_transfer(struct ls1x_nand_host *host, struct ls1x_nand_
> > > >         desc = dmaengine_prep_slave_single(chan, dma_addr, op->len, xfer_dir, DMA_PREP_INTERRUPT);
> > > >         if (!desc) {
> > > >                 dev_err(dev, "failed to prepare DMA descriptor\n");
> > > > -               ret = PTR_ERR(desc);
> > > > +               ret = -ENOMEM;
> > >
> > > Thank you for fixing this issue.
> > > However, I believe -EIO is more appropriate than -ENOMEM, since
> > > dmaengine_prep_slave_single() can return errors other than -ENOMEM.
> > >
> >
> > It's not an I/O error so -EIO isn't correct.
> >
> > There are a bunch of reasons it could fail but most likely
> > dma_pool_alloc() failed.  I think -ENOMEM is correct.
> >
> 
> Have you reviewed the implementation of ls1x_dma_prep_slave_sg()?

The ls1x_dma_prep_slave_sg() has basically two error cases, buggy drivers
and allocation errors.  Someone could argue that if people pass invalid
data then the correct return is -EINVAL but in these cases it's a buggy
driver and we fix bugs, we don't work around them.  So the correct
return is -ENOMEM.

> Errors in this function can be caused not only by -ENOMEM, but also by -EINVAL.
> Moreover, in most cases, the error handling logic for
> dmaengine_prep_slave_single() returns -EIO when the function returns
> NULL.

There are some that return -EIO but hardly the majority.  Other places
return -ENOMEM or -EINVAL.  It's not worth going back and fixing all of
these but really -ENOMEM is the correct return.

regards,
dan carpenter


