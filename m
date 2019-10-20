Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90376DDEFD
	for <lists+linux-mips@lfdr.de>; Sun, 20 Oct 2019 17:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbfJTPCu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Oct 2019 11:02:50 -0400
Received: from forward106j.mail.yandex.net ([5.45.198.249]:41487 "EHLO
        forward106j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726373AbfJTPCu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 20 Oct 2019 11:02:50 -0400
Received: from mxback24o.mail.yandex.net (mxback24o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::75])
        by forward106j.mail.yandex.net (Yandex) with ESMTP id E049611A0438;
        Sun, 20 Oct 2019 18:02:46 +0300 (MSK)
Received: from iva8-ec9a273f19c6.qloud-c.yandex.net (iva8-ec9a273f19c6.qloud-c.yandex.net [2a02:6b8:c0c:1209:0:640:ec9a:273f])
        by mxback24o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id fyZ1B2MtBx-2koiHPFt;
        Sun, 20 Oct 2019 18:02:46 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1571583766;
        bh=ckH0pbymHSuMvVfs6fx1BnVr0F1K4m4N9amHYcMxKZI=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=TLX+umSKgYuDmHwv2iV4EJjUBQOZXx+0VL/J53xvpdj6u8B6Q4a8pRpu4KRYISSD6
         cqV30cRWKS023liW7QfcGnRvlRd4LvNXk6OtKa3BxRk7NcCDUfqP2LxLiVgEPxC/QH
         iqxfDVtCenCb1b0wGpASBjWmnsnU78tssY7Qf8kk=
Authentication-Results: mxback24o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by iva8-ec9a273f19c6.qloud-c.yandex.net (nwsmtp/Yandex) with ESMTPSA id H3HbL3CO93-2YHiGmav;
        Sun, 20 Oct 2019 18:02:43 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 6/6] MAINTAINERS: Fix entries for Loongson2EF and add myself to Loongson64
Date:   Sun, 20 Oct 2019 23:01:37 +0800
Message-Id: <20191020150137.19256-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191020150137.19256-1-jiaxun.yang@flygoat.com>
References: <20191020144318.18341-1-jiaxun.yang@flygoat.com>
 <20191020150137.19256-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Loongson2EF had been splitted from Loongson64 and I'm also going
to take care of Loongson64.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55199ef7fa74..6bd0df79d832 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10871,18 +10871,18 @@ F:	arch/mips/include/asm/mach-loongson32/
 F:	drivers/*/*loongson1*
 F:	drivers/*/*/*loongson1*
 
-MIPS/LOONGSON2 ARCHITECTURE
+MIPS/LOONGSON2EF ARCHITECTURE
 M:	Jiaxun Yang <jiaxun.yang@flygoat.com>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
-F:	arch/mips/loongson64/fuloong-2e/
-F:	arch/mips/loongson64/lemote-2f/
-F:	arch/mips/include/asm/mach-loongson64/
+F:	arch/mips/loongson2ef/
+F:	arch/mips/include/asm/mach-loongson2ef/
 F:	drivers/*/*loongson2*
 F:	drivers/*/*/*loongson2*
 
-MIPS/LOONGSON3 ARCHITECTURE
+MIPS/LOONGSON64 ARCHITECTURE
 M:	Huacai Chen <chenhc@lemote.com>
+M:	Jiaxun Yang <jiaxun.yang@flygoat.com>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	arch/mips/loongson64/
-- 
2.23.0

