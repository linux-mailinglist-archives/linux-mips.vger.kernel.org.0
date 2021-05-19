Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CEDF3889A2
	for <lists+linux-mips@lfdr.de>; Wed, 19 May 2021 10:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343590AbhESIph (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 May 2021 04:45:37 -0400
Received: from lucky1.263xmail.com ([211.157.147.135]:33310 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343589AbhESIph (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 May 2021 04:45:37 -0400
Received: from localhost (unknown [192.168.167.139])
        by lucky1.263xmail.com (Postfix) with ESMTP id 530FDAC85B;
        Wed, 19 May 2021 16:44:08 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [124.126.19.250])
        by smtp.263.net (postfix) whith ESMTP id P23404T140628100904704S1621413847650280_;
        Wed, 19 May 2021 16:44:08 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <0496d28cf825df5af05f8635364a7ba2>
X-RL-SENDER: zhaoxiao@uniontech.com
X-SENDER: zhaoxiao@uniontech.com
X-LOGIN-NAME: zhaoxiao@uniontech.com
X-FST-TO: tsbogend@alpha.franken.de
X-RCPT-COUNT: 5
X-SENDER-IP: 124.126.19.250
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   zhaoxiao <zhaoxiao@uniontech.com>
To:     tsbogend@alpha.franken.de
Cc:     paul@crapouillou.net, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, zhaoxiao <zhaoxiao@uniontech.com>
Subject: [PATCH] arch/mips/boot/compressed/string.c: Fix build warnings
Date:   Wed, 19 May 2021 16:44:05 +0800
Message-Id: <20210519084405.27364-1-zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fixes the following W=1 kernel build warning(s):
arch/mips/boot/compressed/string.c:11:7: warning: no previous prototype for 'memcpy' [-Wmissing-prototypes]
 void *memcpy(void *dest, const void *src, size_t n)
       ^~~~~~
arch/mips/boot/compressed/string.c:22:7: warning: no previous prototype for 'memset' [-Wmissing-prototypes]
 void *memset(void *s, int c, size_t n)
       ^~~~~~
arch/mips/boot/compressed/string.c:32:15: warning: no previous prototype for 'memmove' [-Wmissing-prototypes]
 void * __weak memmove(void *dest, const void *src, size_t n)
               ^~~~~~~

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
 arch/mips/boot/compressed/string.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/boot/compressed/string.c b/arch/mips/boot/compressed/string.c
index 0b593b709228..d28996509f91 100644
--- a/arch/mips/boot/compressed/string.c
+++ b/arch/mips/boot/compressed/string.c
@@ -8,7 +8,7 @@
 #include <linux/compiler_attributes.h>
 #include <linux/types.h>
 
-void *memcpy(void *dest, const void *src, size_t n)
+static void *memcpy(void *dest, const void *src, size_t n)
 {
 	int i;
 	const char *s = src;
@@ -19,7 +19,7 @@ void *memcpy(void *dest, const void *src, size_t n)
 	return dest;
 }
 
-void *memset(void *s, int c, size_t n)
+static void *memset(void *s, int c, size_t n)
 {
 	int i;
 	char *ss = s;
@@ -29,7 +29,7 @@ void *memset(void *s, int c, size_t n)
 	return s;
 }
 
-void * __weak memmove(void *dest, const void *src, size_t n)
+static void * __weak memmove(void *dest, const void *src, size_t n)
 {
 	unsigned int i;
 	const char *s = src;
-- 
2.20.1



