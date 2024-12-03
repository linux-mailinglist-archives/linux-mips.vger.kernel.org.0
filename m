Return-Path: <linux-mips+bounces-6846-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A77DE9E1E5B
	for <lists+linux-mips@lfdr.de>; Tue,  3 Dec 2024 14:56:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 314A7166C30
	for <lists+linux-mips@lfdr.de>; Tue,  3 Dec 2024 13:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09511F4292;
	Tue,  3 Dec 2024 13:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="na/Hj1X2"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FAF1F12F2;
	Tue,  3 Dec 2024 13:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733234159; cv=none; b=VIMjARt0tRcYgi6D6JpddAIsidewn9SFEkH9RM3jBJCAEW8EtGt6c6BibBRnnQCxCUDZw1GybFiFTaawZ14Kw/m5qJAzXmeRQVS8gkFLz5SkjRijZGkkSYKaQ52L2jOowhy96HyAIeDnWajpnsPw/ZG8/qz61c31yWSFToQ+2yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733234159; c=relaxed/simple;
	bh=BCAbN9+hhUpSq62Zs2Q0dGIwhF6v/NoYlHMxxEJlrjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AveiruckCPwHoQ+yFoWf5IViyco/Fcwa66GHS/VCWZltbOXykMOAi73If/l/tgL/CbbAyejTlMSXCPpkab24nl/wjYL6rAsXK4oODs2toKikFHDT5dcAokIyCQD9lhbkf38fiNu5KSw7NOQKBlvH/4PMVGBybw1JFqwPJxCQk1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=na/Hj1X2; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDB426000D;
	Tue,  3 Dec 2024 13:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733234149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QIIUswryJGOD7vz1EWBwFcVso7Qevi29wufjM5nkywY=;
	b=na/Hj1X2WAZC1lPJAACPkXP56t/lAHgg3qTsml9maFnMhWJJTeR6Udxd5OqaeQUI7dUhUP
	J/c+xIB19Dsm1NZFK1xxw9HsmwzuOEMDh/pVK2HWnnePVT9XKJVNllKqDp+KyQMMnbeX0X
	xTTfTLhoDUf4Yz8Nybfm5S7jWXaaZ2+woARWxGF05tTrf3YLErmP7kd7Yi2FQeZSdYEBDI
	E2j02SWu+8LI1dwwKCV3PxGZfuEmfDmk21GVS4zepoW5ihfGFazkNqTuvQTqQ1o4b7LYGk
	v0mwlVVRMnsZ/Wo3x7KCcot/1UmJ4MXZ580x3XObZ1i2S4wU5/KS1HL4Zw5Nww==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Tue, 03 Dec 2024 14:55:45 +0100
Subject: [PATCH 2/6] nvmem: specify ->reg_read/reg_write() expected return
 values
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-rmem-v1-2-24f4970cf14e@bootlin.com>
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

Both ->reg_read() and ->reg_write() return values are not easy to
deduce. Explicit that they should return zero on success (and negative
values otherwise).

Such callbacks, in some alternative world, could return the number of
bytes in the success case. That would be translated to errors in the
nvmem core because of checks like:

	ret = nvmem->reg_write(nvmem->priv, offset, val, bytes);
	if (ret) {
		// error case
	}

This mistake is not just theoretical, see commit
28b008751aa2 ("nvmem: rmem: Fix return value of rmem_read()").

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 include/linux/nvmem-provider.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 3ebeaa0ded00c8d12230e5be7eed045a89a82669..515676ebe59875fa0ab8a4e772542bdc90ead8e3 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -92,8 +92,8 @@ struct nvmem_cell_info {
  * @read_only:	Device is read-only.
  * @root_only:	Device is accessibly to root only.
  * @of_node:	If given, this will be used instead of the parent's of_node.
- * @reg_read:	Callback to read data.
- * @reg_write:	Callback to write data.
+ * @reg_read:	Callback to read data; return zero if successful.
+ * @reg_write:	Callback to write data; return zero if successful.
  * @size:	Device size.
  * @word_size:	Minimum read/write access granularity.
  * @stride:	Minimum read/write access stride.

-- 
2.47.1


