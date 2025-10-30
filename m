Return-Path: <linux-mips+bounces-11929-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA3DC21FFF
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 20:39:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EFE984E0616
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 19:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9218F2FD7A0;
	Thu, 30 Oct 2025 19:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="SWPHrmV7"
X-Original-To: linux-mips@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55101F2C34;
	Thu, 30 Oct 2025 19:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761853139; cv=none; b=uhx0hMsPcGBz3r+eCdCRZv2EbagohXRQSi1Ba7pag8ho+Usr8YgRGwPcRr889zX8rTH/wn3uBDNPU5saymPWU43XAaZjeMqifVx7KPxo6OxcV2A3cq+w4d0ujgdClMTDsqVxIvjBeNgpaMbLMLbNE5Tiu648B7NiQkN4Pylj08w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761853139; c=relaxed/simple;
	bh=8FBRzEWP9o32osALYOm9piJ8ROkbp8kMjYaX4Q/uOEY=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=mtDo0VMFiGW4EbvO7fb8o6K+WAgFcT/G58osD6oo53ODx2DD8OW8ZL9R2jG1EWvgtSECrb+epAzhJCJ8WpmzkyseVjNPJXgeZhVLxzXnxTO4MaTt45cFe4Usecgor2yhuDePyul4jEDz1jcJSMJJyvF1Q3GRNjWrWZPAH8W6yKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=SWPHrmV7; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1761853129; x=1762457929; i=markus.elfring@web.de;
	bh=+77OxXe4H+zEagj7XuwlV+MC6EdOit8F406YA/c3Jpo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SWPHrmV7Hx279mcMy7BEmTLJkyPULz4DjIAraY8xlgGr57jfDUr58Vogdz6ucSCK
	 itcRDYH0RMhnXB6Jz/3oiufVsdK63o7DqPYBWTjUqUGhDC4G+2i8sjdy4u1uHeAeu
	 h3PUOWwP2QLMFsnWBZGvY8PPGWPu+sp1cWnEliAkuCP8Ap7YoYSWBDKsHLMKwxQKv
	 fcyadXiIbMAtAtsQURqPwsLUviKwvDFvH/hYQajTSTcoQ0fVaX0UGCy0L4PFWPPdr
	 KpuZq58PW+XoDZ9442Wk+9nsQIaFbgqcz2bf+X3815IIstS21+uEnMEBjjUgNVd8b
	 6zYVILeu3HVJUsZd6w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.248]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N4N9I-1wEahb2UZ4-00rT3n; Thu, 30
 Oct 2025 20:38:49 +0100
Message-ID: <2f7c926a-6a23-4b60-b905-859645026e4a@web.de>
Date: Thu, 30 Oct 2025 20:38:47 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-mips@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Florian Fainelli <florian@openwrt.org>, Maxime Bizon <mbizon@freebox.fr>,
 =?UTF-8?Q?Thomas_Bogend=C3=B6rfer?= <tsbogend@alpha.franken.de>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Miaoqian Lin <linmq006@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] MIPS: BCM63xx: Use pointer from memcpy() call for assignment
 in bcm63xx_enet_register()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qiVs1KLXinH0W01QzViAIUgFgCD/O4MqncBYb73UGd8lo4wXrA5
 X5twVb2+PvLXnM+YE4A0wLG2A3bZyy5I5+uWDunMx5A3JzhVzAxYsQmqCs2GLN0WIdExXvi
 8/6azKg9YrewAaMpdneTejBewIomYwjn1EyY64OcqeDa3Sgs3vKO07GSC4LHhYhmDfQztKX
 IyDEmQaOmdXXOFrwbdHsg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wQxOAj5/7aA=;bn+0dPe7fhFlI+N/5HwFm49uAfq
 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
 eId7qfgKtLnKWPoJmxJ/28dyCI=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 30 Oct 2025 20:32:07 +0100

A pointer was assigned to a variable. The same pointer was used for
the destination parameter of a memcpy() call.
This function is documented in the way that the same value is returned.
Thus convert two separate statements into a direct variable assignment for
the return value from a memory copy action.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/mips/bcm63xx/dev-enet.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/bcm63xx/dev-enet.c b/arch/mips/bcm63xx/dev-enet.c
index 8e73d65f3480..7a17135e8f13 100644
=2D-- a/arch/mips/bcm63xx/dev-enet.c
+++ b/arch/mips/bcm63xx/dev-enet.c
@@ -243,8 +243,7 @@ int __init bcm63xx_enet_register(int unit,
 	}
=20
 	/* copy given platform data */
-	dpd =3D pdev->dev.platform_data;
-	memcpy(dpd, pd, sizeof(*pd));
+	dpd =3D memcpy(pdev->dev.platform_data, pd, sizeof(*pd));
=20
 	/* adjust them in case internal phy is used */
 	if (dpd->use_internal_phy) {
=2D-=20
2.51.1


