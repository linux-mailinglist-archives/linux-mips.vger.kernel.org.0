Return-Path: <linux-mips+bounces-5057-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7F995DEA0
	for <lists+linux-mips@lfdr.de>; Sat, 24 Aug 2024 16:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 971B81F21D39
	for <lists+linux-mips@lfdr.de>; Sat, 24 Aug 2024 14:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26AFF17A5B4;
	Sat, 24 Aug 2024 14:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mork.no header.i=@mork.no header.b="by51OAYF"
X-Original-To: linux-mips@vger.kernel.org
Received: from dilbert.mork.no (dilbert.mork.no [65.108.154.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5257B1714DA;
	Sat, 24 Aug 2024 14:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.108.154.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724511400; cv=none; b=ps/GJ277IAONRCMfHGQRaUh1+L+NqkXFXIjohtIKUKo682rdQOYW3HMtt7D0knEwg15l374C5E8MkIWdlWkRwQjNf15XTQKdukslrCRgkQ4c4o31+Uf1XtKjWr7hyfJwdCCNnFgK7nX2o3xzGPbbBVjK62/4GJ3uBZjyIUg2DpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724511400; c=relaxed/simple;
	bh=KnjeP6vwYigDLYTJd5twaAha0YX82Wvm0lMe7Iqakjk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=sdwFcvPF+DXg2/gzc1AOGkax7DhtpTcLW9U0kQn7ElmEgdMIcM/IAKsGvCpTCxHxCils8MBbv5VSUT+bfSxy4ZhUIRhug3jgFvo5kYjnS8b8Bh5CdjTnhOkZqeSRrTCTkqPsFUFRmyBoL63lE6nc147Jihl+rHCj/FsxJT0Gt40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mork.no; spf=pass smtp.mailfrom=miraculix.mork.no; dkim=pass (1024-bit key) header.d=mork.no header.i=@mork.no header.b=by51OAYF; arc=none smtp.client-ip=65.108.154.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mork.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miraculix.mork.no
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:10da:6900:0:0:0:1])
	(authenticated bits=0)
	by dilbert.mork.no (8.17.1.9/8.17.1.9) with ESMTPSA id 47OEfaq23717667
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sat, 24 Aug 2024 15:41:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1724510496; bh=n3Pt+wchlafO18tsiqz0oH+0puGudvk0SfFT3Jbisac=;
	h=From:To:Cc:Subject:Date:Message-Id:From;
	b=by51OAYFUGm8fVCo6TwX9TpeJMOORdHyk41/w6kysPhbr42P5pEOf3i14DPhcwiCd
	 TBlNVI1fKYo5OMdOzhTBuFjyLybm9KfOQ4lQKS+mBEWBImgWL3eOzQYQOq/5F32uKI
	 TuYwQUF9Uker7Pf98Av09orr/AwA1691Q5Ymw8dU=
Received: from miraculix.mork.no ([IPv6:2a01:799:10da:690a:d43d:737:5289:b66f])
	(authenticated bits=0)
	by canardo.dyn.mork.no (8.17.1.9/8.17.1.9) with ESMTPSA id 47OEfZNw1964325
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sat, 24 Aug 2024 16:41:35 +0200
Received: (nullmailer pid 1464847 invoked by uid 1000);
	Sat, 24 Aug 2024 14:41:34 -0000
From: =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "Steven J . Hill" <Steven.Hill@imgtec.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>, stable@vger.kernel.org
Subject: [PATCH] MIPS: fw: Gracefully handle unknown firmware protocols
Date: Sat, 24 Aug 2024 16:41:33 +0200
Message-Id: <20240824144133.1464835-1-bjorn@mork.no>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 1.0.5 at canardo
X-Virus-Status: Clean

Boards based on the same SoC family can use different boot loaders.
These may pass numeric arguments which we erroneously interpret as
command line or environment pointers. Such errors will cause boot
to halt at an early stage since commit 056a68cea01e ("mips: allow
firmware to pass RNG seed to kernel").

One known example of this issue is a HPE switch using a BootWare
boot loader.  It was found to pass these arguments to the kernel:

  0x00020000 0x00060000 0xfffdffff 0x0000416c

We can avoid hanging by validating that both passed pointers are in
KSEG1 as expected.

Cc: stable@vger.kernel.org
Fixes: 14aecdd41921 ("MIPS: FW: Add environment variable processing.")
Signed-off-by: Bjørn Mork <bjorn@mork.no>
---
 arch/mips/fw/lib/cmdline.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/fw/lib/cmdline.c b/arch/mips/fw/lib/cmdline.c
index 892765b742bb..51238c4f9455 100644
--- a/arch/mips/fw/lib/cmdline.c
+++ b/arch/mips/fw/lib/cmdline.c
@@ -22,7 +22,7 @@ void __init fw_init_cmdline(void)
 	int i;
 
 	/* Validate command line parameters. */
-	if ((fw_arg0 >= CKSEG0) || (fw_arg1 < CKSEG0)) {
+	if (fw_arg0 >= CKSEG0 || fw_arg1 < CKSEG0 || fw_arg1 >= CKSEG2) {
 		fw_argc = 0;
 		_fw_argv = NULL;
 	} else {
@@ -31,7 +31,7 @@ void __init fw_init_cmdline(void)
 	}
 
 	/* Validate environment pointer. */
-	if (fw_arg2 < CKSEG0)
+	if (fw_arg2 < CKSEG0 || fw_arg2 >= CKSEG2)
 		_fw_envp = NULL;
 	else
 		_fw_envp = (int *)fw_arg2;
-- 
2.39.2


