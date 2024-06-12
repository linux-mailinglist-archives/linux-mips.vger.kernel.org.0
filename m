Return-Path: <linux-mips+bounces-3609-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B41B90501A
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 12:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 821DD281A23
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 10:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4DD16F0CF;
	Wed, 12 Jun 2024 10:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="4FZdA/4V";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EN8eI+yL"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F260D16EC0C;
	Wed, 12 Jun 2024 10:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186941; cv=none; b=AeKE5ujUeEL7+1ZHp27IpklEd4sW4iHphfTEwZGf+rl4VEaw71Bdeep865WKMhtMp+otqvIkBwPjShyW9B1ojAyoEj/QZqGe3/dfRO9UcSj44W3YB01TdosP1S1qKblL7zabGXWx3k2of0BR0Sf9Yb3w7/OHeu7hZSIDxBNtYkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186941; c=relaxed/simple;
	bh=Embr0TKLx5iYgCLJ66BYlrqU0srhuqzIluwscdMBkfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ogdVlnoJTwag77l8TLGbiS725reZvByqa39vSLX1JnM6AFbqtllsuA+SgpXYI6AoU0Pa1lxuy1TFC4g+q8bz2VILSkDTiH+4pqCyHe5Qj04ME9C8MKxNLgbkRWl6KesiHJvWE+pIJfbQJQI5AAkX2WJ2TNVZxv7S9onkuCHch2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=4FZdA/4V; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EN8eI+yL; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 0B2CD13801A5;
	Wed, 12 Jun 2024 06:08:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 12 Jun 2024 06:08:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718186939;
	 x=1718273339; bh=tk4IVoqVAM0ME4+KEqkpOlUkifqUHcflAEys9ulfhUY=; b=
	4FZdA/4V9PYk4Egk+wxXlHemnyGh8q8A8pr7nPL1JS5q+ryO/jvLmxWk4ulw41ZM
	SaoZrklyNisnqiU2a+teH5ct6KchOWfYwujikEe14eQRf4FDFMoc2dmEVF9jVpzT
	2HhB+w5Z+kleJu4e77V63WtTA9b9AUigKYuuFCLeDYS6vgiWYiLFJKMadlGiP5q2
	uXcv3glKU5dzrsytzEm+SI3jkY7nOw0YFCmqmMCYFuAj+77ZDT0XNVf1hRSI/W9E
	QH4S742nGWrDILTnMy8AfssCjIxD6fCCVcbvNpNeix6ycUwrPzdVUpTWOEcr9r8n
	Ivp3jPBUTD2s9adNtFa0lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718186939; x=
	1718273339; bh=tk4IVoqVAM0ME4+KEqkpOlUkifqUHcflAEys9ulfhUY=; b=E
	N8eI+yLt9he/ssAifxfMqrODqZwsUHDDw29XC1XTh1x6kZ0G1Xz8u27Q1ePUwJy9
	VaJa8z+064fQRc6kF5EoOv0NvlsEf1NsAMZiJAuoezrl5sGCA+wChIC/aLD86gIf
	kVy8x5jWzKP61+DDKVxtGKmzC5E5zFzOmcWupLP0vU8g9Y1Q6dOCIwJUPZo35F1b
	5UsfXyy8IM6q60mq+jKfqSzu22olewiTYFZnBd1za0VSYsEWp3EOpXAZvRAb4j+5
	Xv0k7RaSQYTqD/cXdw2eBQ8Vo9JbdK2AUlNzIQ1O2KozO6ErTPYFfoay8W5Md4gA
	uAvFiDwdVWbDY15rN/8wg==
X-ME-Sender: <xms:unNpZsosKaHqsXFiBYOHvZLqQUem6BcXQPyXjeWIdgLa0TLB7ARkdQ>
    <xme:unNpZiqq81ppcXhhLC5-ncJt54DkSHATJ8E8Hz8tAFkkvUs82_Hq0lS2YbFZ0xMEh
    AppQkdxFumWyeSjuEk>
X-ME-Received: <xmr:unNpZhOIueaHW1YtaNg2NqeCQLonILBsEbF2Lrcm5IyZIv3vtjBXVsM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:unNpZj5upx39D3puT5aD3E1QKydhcYD_uup9ljZ_4biDnQzOonGbVg>
    <xmx:unNpZr5owa4oNrB8goVzk6ILea0IzNqXZqRegxoFhVCyA3KV0F5QsQ>
    <xmx:unNpZjjpggDRQmXYdFOhi5dDlXzrtNBs-h2jAyI1qesEJaUXIC0iDQ>
    <xmx:unNpZl4ug9fU1X8xxs5JQipVe5NT5A-KSkWunG2JlPheKUwvy1xpDQ>
    <xmx:u3NpZoymayjPJ8d65L6oU-YiwFPjSI3IjpPexVpEQTEox8IidqASLkhJ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 06:08:57 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 12 Jun 2024 11:08:54 +0100
Subject: [PATCH v2 2/6] MIPS: malta: Move SMP initialisation to
 device_tree_init
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-cm_probe-v2-2-a5b55440563c@flygoat.com>
References: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>
In-Reply-To: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>
To: Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=957;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=Embr0TKLx5iYgCLJ66BYlrqU0srhuqzIluwscdMBkfA=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTM4m39glec7EUeLV/9c6ryp5fpkvabTpjI6URMmPrFU
 a5WOmteRykLgxgXg6yYIkuIgFLfhsaLC64/yPoDM4eVCWQIAxenAExEaT7DP9OLfHKRWmmlO3xY
 eFWr/ght8vP4+t3w5afD2f4SeWtlzzL8U5hTtiFngw5vq2OXbEjj0piXBonJb/4ZL1r+dZmV95R
 nHAA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Move SMP initialisation to device_tree_init as what generic platform
did, this allows us to move mips_cm_probe to a later point, as CPC
needs to be probed after CM.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2: New patch
---
 arch/mips/mti-malta/malta-init.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/mips/mti-malta/malta-init.c b/arch/mips/mti-malta/malta-init.c
index 000d6d50520a..f67247d7fc69 100644
--- a/arch/mips/mti-malta/malta-init.c
+++ b/arch/mips/mti-malta/malta-init.c
@@ -284,12 +284,18 @@ void __init prom_init(void)
 #ifdef CONFIG_SERIAL_8250_CONSOLE
 	console_config();
 #endif
-	/* Early detection of CMP support */
+}
+
+void __init device_tree_init(void)
+{
+	unflatten_and_copy_device_tree();
 	mips_cpc_probe();
 
 	if (!register_cps_smp_ops())
 		return;
 	if (!register_vsmp_smp_ops())
 		return;
+
 	register_up_smp_ops();
 }
+

-- 
2.43.0


