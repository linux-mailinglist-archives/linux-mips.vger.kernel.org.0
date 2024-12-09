Return-Path: <linux-mips+bounces-6905-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5C99E9B17
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2024 17:00:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0839718866D0
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2024 16:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04BE9146A68;
	Mon,  9 Dec 2024 15:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CzeaPsD1"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB0013775E;
	Mon,  9 Dec 2024 15:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733759982; cv=none; b=qI0jO3RJZwVE0lrTeZZibJDNHpoXjUiv8iawUoLAyhH+DxCB2d6lry5svPHGe+tXLeEt3ZjcKPdXbSPe2y0DH5QB4A9Dc/oG6SOgc5yEG9b1sw4DRSC+y8gFtj0g1MFo6Cvt1gEVUIxt5MIvvDvgD6Y4fb20c+VrwAZL0Bju4Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733759982; c=relaxed/simple;
	bh=MdWR4geCX0sDA47jJ/SqTV1HnlhBmPs5PiPUOZHai9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RXBlfIkq8K8xTjnRoqgCECZtr/GOp+HRxzKO7Lfnq0wwg3vEZ0Ji9dgui7r4lVX0nPN9vZr+GvB3rc47Rof31TGPxdUsgxIq74bW/Leb/meKEjvGf/ndX6TPVjV1x6cc2SLPc/rZ9R+XDib4D2V6myzwPCBAd3D/4pKFWEzMfx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CzeaPsD1; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9597B20007;
	Mon,  9 Dec 2024 15:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733759979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0N40lnlE7TZQY7BMgIIS/Ptfi/+E+ziL+VaV/uRj/us=;
	b=CzeaPsD1d7DoArU5lhHLk6VONkZDgZetW6gGMTyZKw4DX6IO+AYRbeovm323S3e9/LuVsB
	ewQRLcWrdLfeoxDNRVJrOi3QU9Ou7RgcgB0Spf7N5KINSbW2+Ta/FP1U0ipgbhAIPUeANy
	j12Xq3NJJCx+IkLpRbL4xNFF7J02QfCi9WX1ojDO64AqMtBy29S9SBp7QIxfnSEhrFxYUm
	24NFqx0ocAPLk+skVnMa9c/danXz6TGIniVyewus2GG3zOkJ/+OJZPrzPJRMgp7fd6oL50
	r5ea5C2Ss41V8kBMqEB56KqT0bWF5awqG10F7+Wg0IoS3vFSZHMYbtcFWzpTrw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Mon, 09 Dec 2024 16:59:38 +0100
Subject: [PATCH v2 4/6] nvmem: rmem: remove unused struct rmem::size field
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241209-rmem-v2-4-cbc0e8c08a21@bootlin.com>
References: <20241209-rmem-v2-0-cbc0e8c08a21@bootlin.com>
In-Reply-To: <20241209-rmem-v2-0-cbc0e8c08a21@bootlin.com>
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


