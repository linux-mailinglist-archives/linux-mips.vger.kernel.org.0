Return-Path: <linux-mips+bounces-6904-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F38529E9B13
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2024 16:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F5271888AFE
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2024 15:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C43113E02D;
	Mon,  9 Dec 2024 15:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FBvl4Bwt"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D019136E21;
	Mon,  9 Dec 2024 15:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733759982; cv=none; b=GViaW+WF05C0uWyChx1PEfdi1iQAI+kuw3yCCAV/Oy7yFwOknK2Z55KcU+hUQQNuzahaJxsHd2I01g69I1SqX3QMJtj84QdrH8Z85VOxrMUnGqVnFjwB3PDOwCg4Q1QkHXKWfa6K5iT9feQ0MVJwuXVwdHpiVZTIz3ndlcjpwXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733759982; c=relaxed/simple;
	bh=BCAbN9+hhUpSq62Zs2Q0dGIwhF6v/NoYlHMxxEJlrjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CKYvqSwpFbhE4+7htKQPe0XVFRqOoDVtESwD/1qb2MR/PuiZreBXf9GCCLpwu4ewGEsiHeNgOD1H7iSHZnJ/OrAfnCn4sr1u0JC+j3tpY7wm0pVVdB/DmtKsFjsWwVfpY2axIF/d8zXamVq084jCEQKQkEp8KXra5YYizoTp/LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FBvl4Bwt; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 462AD20005;
	Mon,  9 Dec 2024 15:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733759977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QIIUswryJGOD7vz1EWBwFcVso7Qevi29wufjM5nkywY=;
	b=FBvl4BwtugjRw+Q/BBxmabHVufGyAHjmtF1fxbluOqiTlA9XKO9xthyAYOmOQMiiKoJWP5
	X9iCndNzARnj4Ng55oGHYJ1ImZAPM8UDUpY3lGRzxTy3i8L8mro+v59tEPsRhOOl2ePVDe
	pQGfYukhT5HMdye8ryV8TrdSiiSKeMjFRvIvf2yekrghNiKamSJYd9vERE1eXxi9utwWK1
	H1O4bWXrK6LG+IJaaNQK+4uZgFYfVe5+dOMdyHIHFLYNpZSDjidEWAeKPiWxiCRxE8uZA7
	/dcEamxNXa2Man5fTyrXX6aGT5djI8goFVN/i7+P/d4qnAiJAg5urcZABecxew==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Mon, 09 Dec 2024 16:59:36 +0100
Subject: [PATCH v2 2/6] nvmem: specify ->reg_read/reg_write() expected
 return values
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241209-rmem-v2-2-cbc0e8c08a21@bootlin.com>
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


