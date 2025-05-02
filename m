Return-Path: <linux-mips+bounces-8900-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 81323AA6CA2
	for <lists+linux-mips@lfdr.de>; Fri,  2 May 2025 10:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2C657A50BF
	for <lists+linux-mips@lfdr.de>; Fri,  2 May 2025 08:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC22122B5A3;
	Fri,  2 May 2025 08:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pgkeSmGo"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECAB22A7F6
	for <linux-mips@vger.kernel.org>; Fri,  2 May 2025 08:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746175177; cv=none; b=OhZQjcp3dhw3CmG+02NjMdgrCUg2keDwc2bmFhoGdqzBgoL7IzeQEUnhKIY/Z5MDgwC9mMTlkf1gyzim+Bbz5oFyBFKNKBL+4YpTF7Mtil5WRWAN3oWDVPaMLZN0HG0MZ4in7RvT1Lyu72LyvTx4Pjmmja/xe0XifXdVR3hGkO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746175177; c=relaxed/simple;
	bh=Fc6VGyglFbCU4Zg5Mw2hQNZJJof9kthAbyW2Wut9M2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dOVUnR4C/19z/C2ICXje3LIVcTjpqpxblCIaSu6z6wfKghu586JqINxpOUSLsQuAoEGw59kjpeEUcJo30i+2hwkZ5H8mNUVBd/yzSZH5q75KU7k8QwGPFmHhh2BksfEaHnTZ+fwlZ2+KaAflK4sBOh8+QFyO7i+iPbz3w4NuFLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pgkeSmGo; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39ee5a5bb66so955534f8f.3
        for <linux-mips@vger.kernel.org>; Fri, 02 May 2025 01:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746175173; x=1746779973; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YTp1n3CXi4d/IkYoP7iNGIaUGP0jg9QVzJw7i5UhA5Y=;
        b=pgkeSmGoxGb3NfuIJob4Qla0scUPSMXoTsndHmbdmjevpXYIfbDx4MAZn4oT6YbLOm
         xw0IrMORmI9j9tflWnq3tb+KApmrfvvNjN5AQhARq+w+0R5nmLM9mnMKFqCS5XJPyHxo
         ZGy4DKfP0RBUJXBZsDPWD3ETQHuMl8oOD/lLf24/i+dn38TW/79l2ayYffez7wkm2LB6
         E0vFUMDR1QP3WqhZwGzws5jaC+Bu7ylByJz58gdyGInOUsMUythMtSzs2KESFQncXLsF
         nIyZ795yXc42yqI0ohwTiiqGI0EFaOaE6ACA90QLsHmK26oLqIN//JN+vcHHfpJhFdED
         g1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746175173; x=1746779973;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YTp1n3CXi4d/IkYoP7iNGIaUGP0jg9QVzJw7i5UhA5Y=;
        b=tEYt+5PZm22cvH5cU57nh6bOwTBTkee3QvvI5Z2RwUUNB6IuFfMhpbMImZcSf4eK8J
         Dv3vEuiICPhnAiJf7YfbyUxo9TJ+2uaopUgVbtv/Q6DWgowKigyNTyfjJ0LmrUUvp2hC
         LyjKcq6vjZaIYnQ5etCeFB6BNUjRdUbO3xOV1nbqqh1MfVcgLXgnPnHlVHnQI63WthLW
         N+0v4axgL+3HXFd7kmAjtegBleeaVgEfZMdjkwA5eFQbRgSULLPLz1njSLAUrf83YdMa
         3OGgNMWQzaZFBOwwOL65LdON8mLgvcHSMqItB7bvLtdgPOGWFfr6DdHJJgpCMti7iCSf
         BOow==
X-Forwarded-Encrypted: i=1; AJvYcCVIn1EsAAenzVbMbOTA9zhhzDFGD+5+z8fyZWdUSUklKjavSlKUxRa2vjib+jrINowfwmX0glRzNjsi@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3OoLj+2xx72wlsVf7Y22bYQ0J15L/OJqdi+WuS6kNG25WST6D
	XsE2KKdtmR7+hAIiGyozpDrLE+nnXKGmq8hKwKALHCwwlbNSW6Lafg6+oBTowrU=
X-Gm-Gg: ASbGncuHoucnXHZMHe01TDPyNoliDvU4UnJW7f4Kp/RIETAffrdnF0PN8096kUuVSmB
	bwvFSBwR5uUg7HpZ6pPBUVU0BoG2oyDwBUYtbNu+QLkSw2qqTX8toi6qBtJWr3NLIkaF7uLAZoT
	ut6ybWL1/RaEzR3GB9fhvgW3WmZ6RWiBJz9pNwtkcAjsTLuVzlSKXatJguQa5DkoEnQl4+1Ugpl
	/ohWX6TP7qH2MpUu9jsKmPtjxi3S71P2CQSTxySevOfLpkQhxgRenfRgJmGcaUqbI4JQ2wBGxaq
	V4ZllWuthfnqEddgBMYur3Etf5jU2pF3DHawNLQQ9wRNuA==
X-Google-Smtp-Source: AGHT+IGb74sv8hsGiSyin0BDmnbpMA2IZnPZBnAg8xwnjuUfYCPDX9NlYI/bGPAEUyHsmHQ+F3zSMg==
X-Received: by 2002:a5d:588b:0:b0:39c:1f10:ba54 with SMTP id ffacd0b85a97d-3a099adeae2mr1444276f8f.35.1746175173327;
        Fri, 02 May 2025 01:39:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099ae0d2csm1473852f8f.2.2025.05.02.01.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 01:39:32 -0700 (PDT)
Date: Fri, 2 May 2025 11:39:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] mtd: rawnand: loongson1: Fix error code in
 ls1x_nand_dma_transfer()
Message-ID: <aBSEwag_ducqOwy7@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "desc" variable is NULL and PTR_ERR(NULL) is zero/success.  Return
a negative error code instead.

Fixes: d2d10ede04b1 ("mtd: rawnand: Add Loongson-1 NAND Controller Driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
It's hard to know what the patch prefix should be here.  Ideally when we
add a new driver we would use the patch prefix for the driver.

Tired: subsystem: Add driver XXX
Wired: subsystem: XXX: Add driver for XXX

 drivers/mtd/nand/raw/loongson1-nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/loongson1-nand-controller.c b/drivers/mtd/nand/raw/loongson1-nand-controller.c
index 6a369b1c7d86..8754bb4f8b56 100644
--- a/drivers/mtd/nand/raw/loongson1-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson1-nand-controller.c
@@ -371,7 +371,7 @@ static int ls1x_nand_dma_transfer(struct ls1x_nand_host *host, struct ls1x_nand_
 	desc = dmaengine_prep_slave_single(chan, dma_addr, op->len, xfer_dir, DMA_PREP_INTERRUPT);
 	if (!desc) {
 		dev_err(dev, "failed to prepare DMA descriptor\n");
-		ret = PTR_ERR(desc);
+		ret = -ENOMEM;
 		goto err;
 	}
 	desc->callback = ls1x_nand_dma_callback;
-- 
2.47.2


