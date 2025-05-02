Return-Path: <linux-mips+bounces-8902-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF253AA76A8
	for <lists+linux-mips@lfdr.de>; Fri,  2 May 2025 18:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 827CE18974A1
	for <lists+linux-mips@lfdr.de>; Fri,  2 May 2025 16:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021EC25D203;
	Fri,  2 May 2025 16:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IP5oh0e/"
X-Original-To: linux-mips@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6887925D1E7;
	Fri,  2 May 2025 16:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746201860; cv=none; b=d9q7dtQ8mFjsfE0HeQOU8sqAemdDC3x2c0VkGRlHhnMV7p6QbXNjd7M2eFDad1tSGqBDaZnD8XP/ZG5shsH4UWQxdyx0Q/8k/YzK6ntA7nTVBy9omrq/FH8OC1ohd1xrgn2iZewCqYlkJJVOU3hLmHHunyKpHTOhjC0pB8k+w98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746201860; c=relaxed/simple;
	bh=gwXN3uKkZvpWrE6+FvlOwjYwomgnhHuJFP/82khwbdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f48uTnIGgKvDSwcLWepBexAhadE4QcgFEc91ZYzyVWruGi5EW7fH6wntt1qUzq0nV1jNYzd+36WCO1RcG5D+afndGXxSAgB3E1MEvrQKKmFDben4ZCdVkZiGmCmpxig8+nexYvPnzDPBLwffzIBYSeZ4XGMUYhIY5LBs2lpGcr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IP5oh0e/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B348AF;
	Fri,  2 May 2025 18:04:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746201849;
	bh=gwXN3uKkZvpWrE6+FvlOwjYwomgnhHuJFP/82khwbdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IP5oh0e/+b5cd/A+M+O7BEm452PpzvvWGaOoOugaHEXe7aFfXRrvmKWZart6lZxYU
	 bSdrhAfFu3vMbOFaLsYxkXhuDiy42BLBXLtTJqEl2jraJduviw005hEHkCEPW3mZyc
	 Pn2DmelSm2H7aDV7m55cSF3iEfxlSNLEifjGBWIA=
Date: Fri, 2 May 2025 19:04:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [bug report] mtd: rawnand: Add Loongson-1 NAND Controller Driver
Message-ID: <20250502160408.GC15945@pendragon.ideasonboard.com>
References: <aBR535RZZT-sa6QZ@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aBR535RZZT-sa6QZ@stanley.mountain>

On Fri, May 02, 2025 at 10:53:03AM +0300, Dan Carpenter wrote:
> Hello Keguang Zhang,
> 
> Commit d2d10ede04b1 ("mtd: rawnand: Add Loongson-1 NAND Controller
> Driver") from Mar 20, 2025 (linux-next), leads to the following
> Smatch static checker warning:
> 
> 	drivers/mtd/nand/raw/loongson1-nand-controller.c:730 ls1x_nand_chip_init()
> 	warn: inconsistent refcounting 'chip_np->kobj.kref.refcount.refs.counter':
> 
> drivers/mtd/nand/raw/loongson1-nand-controller.c
>     690 static int ls1x_nand_chip_init(struct ls1x_nand_host *host)
>     691 {
>     692         struct device *dev = host->dev;
>     693         int nchips = of_get_child_count(dev->of_node);
>     694         struct device_node *chip_np;
>     695         struct nand_chip *chip = &host->chip;
>     696         struct mtd_info *mtd = nand_to_mtd(chip);
>     697         int ret;
>     698 
>     699         if (nchips != 1)
>     700                 return dev_err_probe(dev, -EINVAL, "Currently one NAND chip supported\n");
>     701 
>     702         chip_np = of_get_next_child(dev->of_node, NULL);
> 
> 
> The of_get_next_child() function drops the reference on the current
> child.  That's probably not what we want to happen.  This is similar to
> a discussion we were having earlier about of_find_node_by_name().

The current child here is NULL, so I don't think there's an issue.

> Then it takes a reference to the new child.

*That* causes issues that you outlined below.

> 
>     703         if (!chip_np)
>     704                 return dev_err_probe(dev, -ENODEV, "failed to get child node for NAND chip\n");
>     705 
>     706         chip->controller = &host->controller;
>     707         chip->options = NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA | NAND_BROKEN_XD;
>     708         chip->buf_align = 16;
>     709         nand_set_controller_data(chip, host);
>     710         nand_set_flash_node(chip, chip_np);
>     711         if (!mtd->name)
>     712                 return dev_err_probe(dev, -EINVAL, "Missing MTD label\n");
> 
> of_node_put(chip_np) before returning.
> 
>     713 
>     714         mtd->dev.parent = dev;
>     715         mtd->owner = THIS_MODULE;
>     716 
>     717         ret = nand_scan(chip, 1);
>     718         if (ret) {
>     719                 of_node_put(chip_np);
>     720                 return dev_err_probe(dev, ret, "failed to scan NAND chip\n");
>     721         }
>     722 
>     723         ret = mtd_device_register(mtd, NULL, 0);
>     724         if (ret) {
>     725                 nand_cleanup(chip);
>     726                 of_node_put(chip_np);
>     727                 return dev_err_probe(dev, ret, "failed to register MTD device\n");
>     728         }
>     729 
> 
> I think we want to call of_node_put(chip_np) before returning on the
> success path as well?

I would instead declare the chip_np variable as

	struct device_node *chip_np __free(of_node_put) = NULL;

and drop all the of_node_put(chip_np) calls.

> --> 730         return 0;
>     731 }

-- 
Regards,

Laurent Pinchart

