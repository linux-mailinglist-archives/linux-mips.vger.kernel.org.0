Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93C9D4BAC8
	for <lists+linux-mips@lfdr.de>; Wed, 19 Jun 2019 16:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729253AbfFSOIZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Jun 2019 10:08:25 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33919 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727076AbfFSOIZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Jun 2019 10:08:25 -0400
Received: by mail-wr1-f66.google.com with SMTP id k11so3600773wrl.1
        for <linux-mips@vger.kernel.org>; Wed, 19 Jun 2019 07:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darbyshire-bryant.me.uk; s=google;
        h=sender:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+y9bzA5rZ+qmsUEd3bhCbH2WgD9NFV6SJ1FMdwrd9pM=;
        b=TpFdcgBLCD1lwQXPLylBEolNP+/iaxIxFi/dTIYRU5xLi2NAyYTrhbEabsR0blg0Rt
         FOKjh6MqN9ScWrXx+qHOLPJKu931zV+QBO2XOctU5CpOzzC2BCHAAjuYnQAx1T1axg26
         YyrV79kophhzI9Y4uIi/fQY+iWMO/l1yNgxug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=+y9bzA5rZ+qmsUEd3bhCbH2WgD9NFV6SJ1FMdwrd9pM=;
        b=uWMWlM5IJQ7lIOi0jk9oBa3najciW2mpk+4IhAFftO1pmH8tlGOxoari7Y++t0ebSC
         bqvTzNYOms5ucWKmMsk4ChoQujZbCf5JPcxqp7QnjW9HIyInQ+uFq1cCnKKtZ98z6v/n
         SxtqbA1m8wm5wa4KnZ0I6L59VbVCYC1Ncwfo4Q8pTyRNOUAIKUooq2ZXgAy3ohJ+er8O
         hZpUmxI91k9X6OOk6RRNY7cytZmMscsZFxg1KmXnpCqsUm0DC7e9Lb5bA13X6/507Jbn
         x3nIgyjJ5dzplJhrNlJmw+h9f76FbeG+c4mKBGiJVG3dywi56NlgjktKpnhX4XYNiiiJ
         Lx7g==
X-Gm-Message-State: APjAAAUmG5y+S1WQN96PEKPY/KdpKxngSD3DGX/T9uwBfHwgA+/Q8I6J
        okis78z2cHO9TDOdVrj+wC9078/jwxNqRg==
X-Google-Smtp-Source: APXvYqzujAHCRb3ZIebzxtJQOz0yvSH68VJp9yCS7OeC67RlT2xFiLS6uVBD+NcsqLsFTubTA6qgog==
X-Received: by 2002:a5d:494d:: with SMTP id r13mr35127056wrs.152.1560953302471;
        Wed, 19 Jun 2019 07:08:22 -0700 (PDT)
Received: from Kevins-MBP.lan.darbyshire-bryant.me.uk ([2a02:c7f:1268:6500::dc83])
        by smtp.gmail.com with ESMTPSA id o126sm2482491wmo.1.2019.06.19.07.08.20
        for <linux-mips@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 07:08:20 -0700 (PDT)
From:   Kevin Darbyshire-Bryant <ldir@darbyshire-bryant.me.uk>
To:     linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: fix build on non-linux hosts
Date:   Wed, 19 Jun 2019 15:08:18 +0100
Message-Id: <20190619140818.44022-1-ldir@darbyshire-bryant.me.uk>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

calc_vmlinuz_load_addr.c requires SZ_64K to be defined for alignment
purposes.  It included "../../../../include/linux/sizes.h" to define
that size, however "sizes.h" tries to include <linux/const.h> which
assumes linux system headers.  These may not exist eg. the following
error was encountered when building Linux for OpenWrt under macOS:

In file included from arch/mips/boot/compressed/calc_vmlinuz_load_addr.c:16:
arch/mips/boot/compressed/../../../../include/linux/sizes.h:11:10: fatal error: 'linux/const.h' file not found
         ^~~~~~~~~~

Change makefile to force building on local linux headers instead of
system headers.  Also change eye-watering relative reference in include
file spec.

Thanks to Jo-Philip Wich & Petr Štetiar for assistance in tracking this
down & fixing.

Suggested-by: Jo-Philipp Wich <jo@mein.io>
Signed-off-by: Petr Štetiar <ynezz@true.cz>
Signed-off-by: Kevin Darbyshire-Bryant <ldir@darbyshire-bryant.me.uk>
---
 arch/mips/boot/compressed/Makefile                 | 2 ++
 arch/mips/boot/compressed/calc_vmlinuz_load_addr.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index 3c453a1f1ff1..172801ed35b8 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -78,6 +78,8 @@ OBJCOPYFLAGS_piggy.o := --add-section=.image=$(obj)/vmlinux.bin.z \
 $(obj)/piggy.o: $(obj)/dummy.o $(obj)/vmlinux.bin.z FORCE
 	$(call if_changed,objcopy)
 
+HOSTCFLAGS_calc_vmlinuz_load_addr.o += $(LINUXINCLUDE)
+
 # Calculate the load address of the compressed kernel image
 hostprogs-y := calc_vmlinuz_load_addr
 
diff --git a/arch/mips/boot/compressed/calc_vmlinuz_load_addr.c b/arch/mips/boot/compressed/calc_vmlinuz_load_addr.c
index 240f1d12df75..080b926d2623 100644
--- a/arch/mips/boot/compressed/calc_vmlinuz_load_addr.c
+++ b/arch/mips/boot/compressed/calc_vmlinuz_load_addr.c
@@ -9,7 +9,7 @@
 #include <stdint.h>
 #include <stdio.h>
 #include <stdlib.h>
-#include "../../../../include/linux/sizes.h"
+#include <linux/sizes.h>
 
 int main(int argc, char *argv[])
 {
-- 
2.20.1 (Apple Git-117)

