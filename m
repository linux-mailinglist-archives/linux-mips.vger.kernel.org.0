Return-Path: <linux-mips+bounces-825-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 843AD81CE26
	for <lists+linux-mips@lfdr.de>; Fri, 22 Dec 2023 18:52:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81A301C20E6F
	for <lists+linux-mips@lfdr.de>; Fri, 22 Dec 2023 17:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EAEF2C1A3;
	Fri, 22 Dec 2023 17:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=telent.net header.i=@telent.net header.b="MQYlCEY3"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.telent.net (myhtic.telent.net [176.126.240.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03DC2C199
	for <linux-mips@vger.kernel.org>; Fri, 22 Dec 2023 17:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=telent.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=telent.net
Received: from noetbook (2.f.e.a.9.3.6.2.7.b.f.3.1.0.c.4.e.d.0.4.a.3.e.d.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:de3a:40de:4c01:3fb7:2639:aef2])
	by mail.telent.net (Postfix) with ESMTPSA id 420C11098E5
	for <linux-mips@vger.kernel.org>; Fri, 22 Dec 2023 17:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=telent.net; s=mail;
	t=1703267518; bh=Y6bzkN4ddIpwkYWRV27NQpN74wlMBUdX0BC2imLr0m4=;
	h=From:To:Subject:Date;
	b=MQYlCEY3b8QeA/+Z9vIM0xXm4aq/1Ro/k24JijVsMOsokQWiz8TDstU+OlnKq5BjS
	 tqX5VdncKhr0ZuPdI1IRmHJAluJcgRbgj+UWG/L68SwCsKYgstLIExtvE/yHDvMrkS
	 CjLX6mlckqGjKVaQa7dmjBw3yKABcFYp2CfDBYvs=
From: dan@telent.net
To: linux-mips@vger.kernel.org
Subject: question: malta doesn't use a1 for fdt from bootloader
Date: Fri, 22 Dec 2023 17:51:53 +0000
Message-ID: <87plyyrupy.fsf@telent.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Newbie question:

I noticed while writing some test automation with QEMU and U-Boot that
the Malta kernel appears to ignore any DTB provided by the bootloader, in
favour of using the one embedded into the kernel image. Is there a
reason behind this, or is it just not a thing that's been changed since
the board was converted to use device tree?

I patched my own kernel to check $a1 as the "mips generic" kernel does,
and it seems to work, but maybe I'm missing something? I did have to
rebuild U-Boot with different CONFIG options to make use of it (I don't
khow what real hardware Malta uses for a bootloader) so perhaps it has
limited use.

If the change is acceptable in principle I'll tidy it up and submit
a patch with all the proper procedure.

Opinions welcome

-dan


diff --git a/arch/mips/mti-malta/malta-setup.c b/arch/mips/mti-malta/malta-setup.c
index 21cb3ac1237b..52e731f9b4e2 100644
--- a/arch/mips/mti-malta/malta-setup.c
+++ b/arch/mips/mti-malta/malta-setup.c
@@ -192,7 +192,9 @@ static void __init bonito_quirks_setup(void)
 
 void __init *plat_get_fdt(void)
 {
-       return (void *)__dtb_start;
+       return (fw_arg0 == -2) ?
+               (void *) (KSEG1ADDR(fw_arg1)) :
+               (void *) __dtb_start;
 }
 
 void __init plat_mem_setup(void)

