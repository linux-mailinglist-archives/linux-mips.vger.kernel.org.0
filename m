Return-Path: <linux-mips+bounces-13-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C177E88C1
	for <lists+linux-mips@lfdr.de>; Sat, 11 Nov 2023 04:02:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24726B20AD9
	for <lists+linux-mips@lfdr.de>; Sat, 11 Nov 2023 03:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D466E538B;
	Sat, 11 Nov 2023 03:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FRbxmVQS"
X-Original-To: linux-mips@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD305258
	for <linux-mips@vger.kernel.org>; Sat, 11 Nov 2023 03:02:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 405BD449A;
	Fri, 10 Nov 2023 19:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Jd3dbI5OGBjKBW+7cOzwRrn7JY1+6AG5uhO4OH3lR4k=; b=FRbxmVQSM/vQbxXwlO3/8GjdIR
	YH4VKN2LWodCq68nLjxwR4fyLRjABZz02tpPD7Sgxf1fKuOhAImUT6agC8priqrfO4NCrfZz1oD6Q
	Aw+0VOHoFWc6B6Y2g+TWKek1IFc3SwkOPKRnxQt1NK0boq+Z4h744VJ/Utw9wNhPVPNow0mUgzZ/F
	WxUmmVbsaVRgRKQnVGUJUakA3jPbUGldLFyhKZaWt3wtp7XRFYZ+iAwuGWmMtqczisTRxoFDECTlH
	GpWq5TBcCdltp4qpm/QqAwTAEzGSkidpV6TC2CCX4I3QxxRgJiv8bcieKtDqeB10D4vDEhXMLEEWb
	9S7RT8Jg==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r1eGE-009uCi-0H;
	Sat, 11 Nov 2023 03:02:15 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	kernel test robot <lkp@intel.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Ralf Baechle <ralf@linux-mips.org>,
	Jiri Slaby <jslaby@suse.cz>,
	linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: SGI-IP27: hubio: fix nasid kernel-doc warning
Date: Fri, 10 Nov 2023 19:02:13 -0800
Message-ID: <20231111030213.31595-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ip27-hubio.c:32: warning: Function parameter or member 'nasid' not described in 'hub_pio_map'
ip27-hubio.c:32: warning: Excess function parameter 'hub' description in 'hub_pio_map'

Fixes: 4bf841ebf17a ("MIPS: SGI-IP27: get rid of compact node ids")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: lore.kernel.org/r/202311101336.BUL1JuvU-lkp@intel.com
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Jiri Slaby <jslaby@suse.cz>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/sgi-ip27/ip27-hubio.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -- a/arch/mips/sgi-ip27/ip27-hubio.c b/arch/mips/sgi-ip27/ip27-hubio.c
--- a/arch/mips/sgi-ip27/ip27-hubio.c
+++ b/arch/mips/sgi-ip27/ip27-hubio.c
@@ -21,7 +21,7 @@ static int force_fire_and_forget = 1;
 /**
  * hub_pio_map	-  establish a HUB PIO mapping
  *
- * @hub:	hub to perform PIO mapping on
+ * @nasid:	nasid to perform PIO mapping on
  * @widget:	widget ID to perform PIO mapping for
  * @xtalk_addr: xtalk_address that needs to be mapped
  * @size:	size of the PIO mapping

