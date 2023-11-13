Return-Path: <linux-mips+bounces-33-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1D47E9F10
	for <lists+linux-mips@lfdr.de>; Mon, 13 Nov 2023 15:45:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AB0B1C2030E
	for <lists+linux-mips@lfdr.de>; Mon, 13 Nov 2023 14:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA14D20B2D;
	Mon, 13 Nov 2023 14:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qF9JMBBP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5IDGdCbN"
X-Original-To: linux-mips@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3FD1F5FC;
	Mon, 13 Nov 2023 14:45:40 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9B1A19AD;
	Mon, 13 Nov 2023 06:45:26 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 314712187C;
	Mon, 13 Nov 2023 14:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1699886724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=C55/Qkp749YOdFLW3Ql7AV3TyMx7ZOja0OEUL1O7cmw=;
	b=qF9JMBBPs6ELBULaJOXIQpMdwXEebNyty/ILRRrgEWaAkekhfn9984wQY7H6/cBJC+bZAE
	Zg4Fbai+9c8354J73virj+hNnWpkzFP4OQxSEINqwU+LfokvIO65p4+e6Vf2MmcGc2QENO
	5A2JFHjJRc86q/DoCgcxY21Jo4DlYqw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1699886724;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=C55/Qkp749YOdFLW3Ql7AV3TyMx7ZOja0OEUL1O7cmw=;
	b=5IDGdCbNOcZw4YEcqrXFOuDhcXXlLZTpdU/bEj2+Qwa1iJdVEBcvyWfBzZq5VYQwN0+vNW
	D6DGVF2logXv5JCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F2E5613398;
	Mon, 13 Nov 2023 14:45:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id oS+aOYM2UmX/MwAAMHmgww
	(envelope-from <jdelvare@suse.de>); Mon, 13 Nov 2023 14:45:23 +0000
Date: Mon, 13 Nov 2023 15:45:22 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org, netdev@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>
Subject: |PATCH] stmmac: dwmac-loongson: Add architecture dependency
Message-ID: <20231113154522.0bca3521@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Only present the DWMAC_LOONGSON option on architectures where it can
actually be used.

This follows the same logic as the DWMAC_INTEL option.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Keguang Zhang <keguang.zhang@gmail.com>
---
I'm not familiar with the hardware, so please let me know if the
dependency needs to be adjusted somehow.

 drivers/net/ethernet/stmicro/stmmac/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-6.6.orig/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ linux-6.6/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -269,7 +269,7 @@ config DWMAC_INTEL
 config DWMAC_LOONGSON
 	tristate "Loongson PCI DWMAC support"
 	default MACH_LOONGSON64
-	depends on STMMAC_ETH && PCI
+	depends on MACH_LOONGSON64 && STMMAC_ETH && PCI
 	depends on COMMON_CLK
 	help
 	  This selects the LOONGSON PCI bus support for the stmmac driver,


-- 
Jean Delvare
SUSE L3 Support

