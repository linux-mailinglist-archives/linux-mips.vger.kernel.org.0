Return-Path: <linux-mips+bounces-6847-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C42B89E1E5E
	for <lists+linux-mips@lfdr.de>; Tue,  3 Dec 2024 14:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8955E285454
	for <lists+linux-mips@lfdr.de>; Tue,  3 Dec 2024 13:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2A31F473A;
	Tue,  3 Dec 2024 13:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nFH216YS"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F401F130D;
	Tue,  3 Dec 2024 13:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733234160; cv=none; b=a2pXCsZ3swpJuNw6GqCEw3cmjTcuVd95NfmeC0stg0JhbpwYg/hsn+gpr5+xkNm6epC4THlv0lvRhbOJ/bySpaJ3kUZ5ZcOIYacZWJSKK7FhXeFgX4uG8XgpEf3MxCmhv66KkMITr4+zbjN9dLVVEx+7FXQRow9R7viIzOlLJxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733234160; c=relaxed/simple;
	bh=MdWR4geCX0sDA47jJ/SqTV1HnlhBmPs5PiPUOZHai9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c2CzGomfId6c1EwJJahbPfahtv+lFRY5R2Vy1knhbmXVJdf9+UPUrua8gz3saFqPEHnNVakYl6yxaiU3JQPWTnbbDF7A7DjFhN2mF/etczbAWD4VL2ZKoPspQSjo9qefkXQ/fZjBOuGtF1yFC0w2R/t8yqnaArFrlk6Om1ZgMLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nFH216YS; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 303C06000F;
	Tue,  3 Dec 2024 13:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733234150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0N40lnlE7TZQY7BMgIIS/Ptfi/+E+ziL+VaV/uRj/us=;
	b=nFH216YSECAavBAAEQy/JmLluUlIAnzZEj22CFez7JpTc9nkNDJhZ5pbysztC9wS1YrAJ8
	aNl/izHmVFbLPIiMu72g/6aiOuy7XiiylRuL/W1b82wpBPFg0WWHI5j6Bi09svyoCA9gxZ
	hYWJMEUesH9ec5+M7DgekzTUzQlfAChM/7evbR80gQbZsUT5XVKoSJjeyab1rfs7SUeA27
	YAMk9wCgafb7ZzIVAEHQwwRwBsw9H8SkY5mTPl21wswuFkLCUK6oF3nBgpsnapumi4uavQ
	ahooxJA2nw1J3ly43fyPopYJxFm8sag0Qcu3PViAjmcvMIPacxNdNFfXOG8hAA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Tue, 03 Dec 2024 14:55:47 +0100
Subject: [PATCH 4/6] nvmem: rmem: remove unused struct rmem::size field
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-rmem-v1-4-24f4970cf14e@bootlin.com>
References: <20241203-rmem-v1-0-24f4970cf14e@bootlin.com>
In-Reply-To: <20241203-rmem-v1-0-24f4970cf14e@bootlin.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: theo.lebrun@bootlin.com

The private structure used by the rmem driver contains
a `size` field that is unused. Remove it.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/nvmem/rmem.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/nvmem/rmem.c b/drivers/nvmem/rmem.c
index 0dc5c8237c7538efe4597c182d7bdb709b945851..ca89c2689031534ff316a48e03360aeec823b025 100644
--- a/drivers/nvmem/rmem.c
+++ b/drivers/nvmem/rmem.c
@@ -13,8 +13,6 @@ struct rmem {
 	struct device *dev;
 	struct nvmem_device *nvmem;
 	struct reserved_mem *mem;
-
-	phys_addr_t size;
 };
 
 static int rmem_read(void *context, unsigned int offset,

-- 
2.47.1


