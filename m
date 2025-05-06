Return-Path: <linux-mips+bounces-8940-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C16BAABF9A
	for <lists+linux-mips@lfdr.de>; Tue,  6 May 2025 11:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F4611C21582
	for <lists+linux-mips@lfdr.de>; Tue,  6 May 2025 09:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D3026C3BB;
	Tue,  6 May 2025 09:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F5g0noTT"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0D126B2A3
	for <linux-mips@vger.kernel.org>; Tue,  6 May 2025 09:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746523974; cv=none; b=CovOblspLqaun763zIa8V5LmtbVnSvaYyuAeIblIJlkVRvhaPv9tDqskJCOhNAiZeVJGHWpZ74Y4bMHPpauLVBUFpQ4ynvSgNm2bvduLupQ8942PGK7+JYMCWX2yj93WMTl/OFqUh4bSGzwcV0bwfESfCautgaRwKl4INrwI8qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746523974; c=relaxed/simple;
	bh=wt//UxgywGSXYRvzRt4PXjL5bjHJUnNsBGZo0dbvufU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WceVAkUoSggLfbVtDLZVFmMedPxJfR3Pt2RCZFwd6U8atST4K+2pqQqyEf0zMKcqh6cIl4tL+RT7Ze5qE0JKMFweJc75B3zJMW/rY7WHP/EvBEE2ko46vplP03/Eh83BJVohuBuo4rXh752dbO1PLBQzHD5SO627qhg9x3TgdXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F5g0noTT; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso35930765e9.2
        for <linux-mips@vger.kernel.org>; Tue, 06 May 2025 02:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746523970; x=1747128770; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nGT9uv0lzPx3oU6XAhFYncy4NYk5F/6MJ4HISb7Jycc=;
        b=F5g0noTTSTEWQcchUWTsbl/VsNboEl663VkP0OyhfZdJnhA3iD9SAu1+WMCTEbGYfA
         kP0K+J8Rm8oUs6qC4Vsi+0oMJBNVzh2OrQM4Yag2+4co/KNYF+8ikC7qgTDDg2ymKeLD
         vgRfeLQib+BsrhsjLJbhkHKpb6lNKLQDWdcOnQmUAtxTWG1W0lAo9l23DvPa+9MjxlhC
         7n8IgSaOA8Rqgry+P8rh47txpn2TqPBxfVr08hRz/xFwgbl3T7/dVMbjPEzIbFWm6ihL
         RTAZKY73C0+yGr8peLyULz/93l5a3LoOid4wYqc9OOo9oQlnkJPwnw/Ko6uBKZJKWGIE
         SUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746523970; x=1747128770;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nGT9uv0lzPx3oU6XAhFYncy4NYk5F/6MJ4HISb7Jycc=;
        b=ka/dRP2Bht1GeAxDsnYHcLRIk+rjVNXwhILABW1cjl8XBW1APjfbt69f4x4Okj61Qp
         4ZCu+hNTLj5cYCQVheMxN8sKq2qWL4+UISbPRrlM2yETJ87rg+oO59YxK7YKFT5cIZ4K
         iOZk/9Viue5c9WM6S6E9KhOTsd4UHSATXGSH4GUst4/TDZ8/vHXE36JqX2TRVlmHKnZm
         9HSPYChSGLF90o8hSEm7Bx4berOyu1sIaBr48Q3pm/+2D1+gbbNwt+jBdPCGZdN58YPs
         vWKeVI73hgxAzx2F3B3+vyz5dAACq/ZIs8s5v9yXC6K1zvP+i5OvCnqUdYBLL2z/b5w+
         ZptA==
X-Forwarded-Encrypted: i=1; AJvYcCVb9b4AWkmuFu71I14X5zH3lWW79TGM10p8H4daYKHc1mTlNVNkhr4S2CfIsviykUMRvGqUbubZ1MEd@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf7EJnR2YygtVFIZxfFTSXzrF4tAIekIruanUfQp0ltpIB0Svl
	Je8JCMs6+wDnnENvh5YEFYnBPqBcdikrYVmENmWczybszhcxxNNpxWlaFZsgA4TP73uPBiNlmSL
	n
X-Gm-Gg: ASbGncuORgzw22giWZUcZhcdiot9FM1RN+m6hwXj+glqdjBDDrCntu2EIaCxXDLKBaD
	QHjM+ko4EzJ4Yf00RLcWmvrVa/Hf1k8aDOGkWwxnqd51ZPsppde2T9vp3H747iEyUeqxTUDt03V
	+07NIbDYfC8DdQCwBJ/2t/81nmxb/gPwlltrg0sObXiCg4arFfzuZpRhiIWlbo40cM9zDzt85XF
	upu7h0LaI9XsAz9fvRsG2DleOubJ47gFmt8x909z3N5ouwDq4WVjycElLeYM5uKo9mEQOtxSSnN
	D2395HFaRb18LzFjtNmVWFnNyV7BQJz8R8irihomrUF7u5C0FubdIR8e
X-Google-Smtp-Source: AGHT+IHdLZzgnxP5h0abh3m/L4WAmBk1ccvvnKktbTa4WSRN5LJxHjEx/OsPWCml+VS+d3iYSSIb6Q==
X-Received: by 2002:a05:600c:8218:b0:43c:f616:f08 with SMTP id 5b1f17b1804b1-441bbec1835mr128722905e9.8.1746523970073;
        Tue, 06 May 2025 02:32:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b89ee171sm161598935e9.17.2025.05.06.02.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:32:49 -0700 (PDT)
Date: Tue, 6 May 2025 12:32:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] mtd: rawnand: loongson1: Fix error code in
 ls1x_nand_dma_transfer()
Message-ID: <aBnXPYLSNJASR51f@stanley.mountain>
References: <aBSEwag_ducqOwy7@stanley.mountain>
 <CAJhJPsUZz2kwMyWPDrc_ktb5O6ECcAyO1OrXXVWh9yvkrKRidg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJhJPsUZz2kwMyWPDrc_ktb5O6ECcAyO1OrXXVWh9yvkrKRidg@mail.gmail.com>

On Tue, May 06, 2025 at 05:16:03PM +0800, Keguang Zhang wrote:
> On Fri, May 2, 2025 at 4:39 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > The "desc" variable is NULL and PTR_ERR(NULL) is zero/success.  Return
> > a negative error code instead.
> >
> > Fixes: d2d10ede04b1 ("mtd: rawnand: Add Loongson-1 NAND Controller Driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > It's hard to know what the patch prefix should be here.  Ideally when we
> > add a new driver we would use the patch prefix for the driver.
> >
> > Tired: subsystem: Add driver XXX
> > Wired: subsystem: XXX: Add driver for XXX
> >
> >  drivers/mtd/nand/raw/loongson1-nand-controller.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/nand/raw/loongson1-nand-controller.c b/drivers/mtd/nand/raw/loongson1-nand-controller.c
> > index 6a369b1c7d86..8754bb4f8b56 100644
> > --- a/drivers/mtd/nand/raw/loongson1-nand-controller.c
> > +++ b/drivers/mtd/nand/raw/loongson1-nand-controller.c
> > @@ -371,7 +371,7 @@ static int ls1x_nand_dma_transfer(struct ls1x_nand_host *host, struct ls1x_nand_
> >         desc = dmaengine_prep_slave_single(chan, dma_addr, op->len, xfer_dir, DMA_PREP_INTERRUPT);
> >         if (!desc) {
> >                 dev_err(dev, "failed to prepare DMA descriptor\n");
> > -               ret = PTR_ERR(desc);
> > +               ret = -ENOMEM;
> 
> Thank you for fixing this issue.
> However, I believe -EIO is more appropriate than -ENOMEM, since
> dmaengine_prep_slave_single() can return errors other than -ENOMEM.
> 

It's not an I/O error so -EIO isn't correct.

There are a bunch of reasons it could fail but most likely
dma_pool_alloc() failed.  I think -ENOMEM is correct.

regards,
dan carpenter


