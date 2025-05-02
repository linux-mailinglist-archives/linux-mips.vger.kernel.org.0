Return-Path: <linux-mips+bounces-8898-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9D9AA6C0C
	for <lists+linux-mips@lfdr.de>; Fri,  2 May 2025 09:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25D7A7A4679
	for <lists+linux-mips@lfdr.de>; Fri,  2 May 2025 07:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C472253A4;
	Fri,  2 May 2025 07:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CJwbSugC"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23301C5F35
	for <linux-mips@vger.kernel.org>; Fri,  2 May 2025 07:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746172391; cv=none; b=McCe2uy8R8qGVv4E/iH9Nd8xOhdXQRpCa2guTSCKy8Ok69zhNlveYsP3JYSm3EXfUKfkl3QdbovPCuL23Q9caaXF6IjEVTBLkeQLjQtckd9idEOXUBhZK02VFHVYCFAAE9ZEOkjecY2HRJdK9/2pTFYvgaqpR2iT5Nx0VcwPkzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746172391; c=relaxed/simple;
	bh=5ZCByJJL0Ye6jvativsjrsfB/Ql+BeNq0mFm8G1cuO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b2VZ3efWKfb2UtCdIWkkneu4r0li3+l/URpAPV8XpInKCHKzEMj9sQzTLsx455fobOwyeB86T3wqSl6wuTmvJdk3vxEZ+pIZLZxpswn4BvJF968dcfHKJ4XQ4EXlZNtiPwkHK50QCQ8vQSpfBqEUq24bneLHXyc/HbLUQ0WMsRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CJwbSugC; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c266c1389so1286987f8f.1
        for <linux-mips@vger.kernel.org>; Fri, 02 May 2025 00:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746172388; x=1746777188; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YIYUYTbkSYrP8WnVzdIpYswDWWAUAS3GFOeRKeDzwWg=;
        b=CJwbSugCwj4+hVoKHUavJngh2taNQQJ9QGtte4zb11JY1khMBQ5KXfhBh5MZWK3EOj
         bICZi17K1WkNTR+5ajyOaHTztaiD+Xv0OTCWE/nIYpf/lugCLazp/OgLmvt2LY1sCyE2
         gaS4rRy5KZq+qkksPtjfEFJzbyDedI6J05RtNwnRYP2f8wY7Vi0H5awrv5pWE6cF3xLB
         F7bWLQMEdB19/UXfhUJahOgsZY5Odn5xyJelQ+Pd2QAIGfd0xj9nBEuniZnEj88S+XJq
         SJ/F6degAkzfJYYppqk1n12drVwYHP1iujzkw68e5T2+zCzd7WWarov68mRu/7XEF2BE
         rPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746172388; x=1746777188;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YIYUYTbkSYrP8WnVzdIpYswDWWAUAS3GFOeRKeDzwWg=;
        b=W1yIVl6hULeJSyRj814Z1blm9G153EyudARJBsUT42EHNoCseuTnXDHXPXGKJoJLin
         +UKiwE/9h40TCckw/9qV+tPL1o0fBuUh2V6hBWcBmoeUm+6cVdIuS0oSR24pBJ8tFFlT
         vbQGk2OTmBRJxc16CdqE6K9uNn+/JxaLcYQJSLBRD24+YzGQjb6cH9CvWXY/ijNd6Pp9
         9h1yZOodhvhsLq5lOUrs6Vk5x2xs8I1/9fueyW0pCptdQeiUyL+L7nwWnU5m9Fjt0eES
         bpGnJZuT5UUd5GmJRhFHnEQW0TOMwutxyLuakVXOt5jK6jPXkdzmyIxJsWUi628I2X8x
         Mj6Q==
X-Gm-Message-State: AOJu0Yzn9hydi/4+HjxL/x54iVpVDSKXEgIrC7TWGBFPpjkS4StkyS34
	4SxSpoBxGMXdPFYp+AQuOAiO5Gmb/Pz85mBJGdVs35RDSIqDpYed4XHD+D7S79Y=
X-Gm-Gg: ASbGncuKhht/IFaLxH/Qka1njq+bsPi4yiDjuPJr6ZC9hVDcyfRC/B4pZiJ1xUmoKYQ
	wovijkoNyzTtCqimtA0fblq699jpn26kRnA5czbyZItCRBo3/ojyWj6m60VAUV+APzximn6uIAA
	kqt3KNARhkny7IKRHVTOtwR0LTQZqf1G3GQIXqTEKp447avT15IWBSYk0Q95nwgjNGDrdrivjfz
	59tnw9/nRqQYJ+NaOqORRhTaDkhIckXaATkIlgU8eHSr+qUtWGt8R0cOcw5ff7V/7q08ESR1okP
	7qvnxBXIjhvgt1HSldE7l4g35O+ICRIOY9lnkQiZQaAd7A==
X-Google-Smtp-Source: AGHT+IFUF0mleYLp1kLBLB8JmgDr7cOlyFKFxJ+vLZzJOkd+YMspUaspCgieTiAUbD8s7VruSkm7fQ==
X-Received: by 2002:a05:6000:1008:b0:3a0:99b1:bab5 with SMTP id ffacd0b85a97d-3a099b1bae6mr1003895f8f.57.1746172387978;
        Fri, 02 May 2025 00:53:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b8a315d3sm36125375e9.36.2025.05.02.00.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:53:07 -0700 (PDT)
Date: Fri, 2 May 2025 10:53:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org
Subject: [bug report] mtd: rawnand: Add Loongson-1 NAND Controller Driver
Message-ID: <aBR535RZZT-sa6QZ@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Keguang Zhang,

Commit d2d10ede04b1 ("mtd: rawnand: Add Loongson-1 NAND Controller
Driver") from Mar 20, 2025 (linux-next), leads to the following
Smatch static checker warning:

	drivers/mtd/nand/raw/loongson1-nand-controller.c:730 ls1x_nand_chip_init()
	warn: inconsistent refcounting 'chip_np->kobj.kref.refcount.refs.counter':

drivers/mtd/nand/raw/loongson1-nand-controller.c
    690 static int ls1x_nand_chip_init(struct ls1x_nand_host *host)
    691 {
    692         struct device *dev = host->dev;
    693         int nchips = of_get_child_count(dev->of_node);
    694         struct device_node *chip_np;
    695         struct nand_chip *chip = &host->chip;
    696         struct mtd_info *mtd = nand_to_mtd(chip);
    697         int ret;
    698 
    699         if (nchips != 1)
    700                 return dev_err_probe(dev, -EINVAL, "Currently one NAND chip supported\n");
    701 
    702         chip_np = of_get_next_child(dev->of_node, NULL);


The of_get_next_child() function drops the reference on the current
child.  That's probably not what we want to happen.  This is similar to
a discussion we were having earlier about of_find_node_by_name().

Then it takes a reference to the new child.

    703         if (!chip_np)
    704                 return dev_err_probe(dev, -ENODEV, "failed to get child node for NAND chip\n");
    705 
    706         chip->controller = &host->controller;
    707         chip->options = NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA | NAND_BROKEN_XD;
    708         chip->buf_align = 16;
    709         nand_set_controller_data(chip, host);
    710         nand_set_flash_node(chip, chip_np);
    711         if (!mtd->name)
    712                 return dev_err_probe(dev, -EINVAL, "Missing MTD label\n");

of_node_put(chip_np) before returning.

    713 
    714         mtd->dev.parent = dev;
    715         mtd->owner = THIS_MODULE;
    716 
    717         ret = nand_scan(chip, 1);
    718         if (ret) {
    719                 of_node_put(chip_np);
    720                 return dev_err_probe(dev, ret, "failed to scan NAND chip\n");
    721         }
    722 
    723         ret = mtd_device_register(mtd, NULL, 0);
    724         if (ret) {
    725                 nand_cleanup(chip);
    726                 of_node_put(chip_np);
    727                 return dev_err_probe(dev, ret, "failed to register MTD device\n");
    728         }
    729 

I think we want to call of_node_put(chip_np) before returning on the
success path as well?

--> 730         return 0;
    731 }

regards,
dan carpenter

