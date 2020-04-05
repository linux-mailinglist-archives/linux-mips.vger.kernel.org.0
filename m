Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5233219EA0C
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2020 10:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgDEIkw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 5 Apr 2020 04:40:52 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17581 "EHLO
        sender2-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726308AbgDEIkw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 5 Apr 2020 04:40:52 -0400
X-Greylist: delayed 920 seconds by postgrey-1.27 at vger.kernel.org; Sun, 05 Apr 2020 04:40:51 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586075102;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=jlfqA7A2mmN1MCE9Hu767OVJ/7u6nHkaQCRHUH9vIcI=;
        b=IYYgMZyiU3o33Tg3dO7svxhHO1GN8WczdboM3eNpfiTMRRuPToWQZQ1D1P0vOtPW
        GFw4GM2403Fnmo03B47ozPxh3shyipdmVSbiuom2uHSay74TLw1tJHmxfT4+kjK3nmb
        Skx/wzzg19y3Ke3LC6V6Kf/CoRVnCLrvRGcfjzvc=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1586075100036667.996448622306; Sun, 5 Apr 2020 16:25:00 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org
Message-ID: <20200405082451.694910-1-jiaxun.yang@flygoat.com>
Subject: [PATCH] MIPS: malta: Set load address for 32bit kernel correctly
Date:   Sun,  5 Apr 2020 16:24:49 +0800
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

LLD failed to link vmlinux with 64bit load address for 32bit ELF
while bfd will strip 64bit address into 32bit silently.
To fix LLD build, we should supply a 32bit load address for 32bit
kernel.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Fangrui Song <maskray@google.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>
---
 arch/mips/mti-malta/Platform | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/mti-malta/Platform b/arch/mips/mti-malta/Platform
index 2cc72c9b38e3..f9b49cba1764 100644
--- a/arch/mips/mti-malta/Platform
+++ b/arch/mips/mti-malta/Platform
@@ -6,6 +6,10 @@ cflags-$(CONFIG_MIPS_MALTA)=09+=3D -I$(srctree)/arch/mips/=
include/asm/mach-malta
 ifdef CONFIG_KVM_GUEST
     load-$(CONFIG_MIPS_MALTA)=09+=3D 0x0000000040100000
 else
+ifdef CONFIG_64BIT
     load-$(CONFIG_MIPS_MALTA)=09+=3D 0xffffffff80100000
+else
+    load-$(CONFIG_MIPS_MALTA)=09+=3D 0x80100000
+endif
 endif
 all-$(CONFIG_MIPS_MALTA)=09:=3D $(COMPRESSION_FNAME).bin
--=20
2.26.0.rc2


