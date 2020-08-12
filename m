Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0401A24231C
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 02:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgHLAP5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Aug 2020 20:15:57 -0400
Received: from crapouillou.net ([89.234.176.41]:52124 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726221AbgHLAP5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 11 Aug 2020 20:15:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1597191323; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rqt0QmQaBfDvBShfDeNyebNZVArGH+T4/867oxMIwgE=;
        b=v9zMHpJrZJb6k59vYKUXrJ8f2nqv49gpAcw3Sw3e8l/Osp9TTzYS9z8l9tU9ozHSQTn8il
        xQUBq4rxeG0pjT69LLuldQYA7meqHEfbNRSNN7K2q6myFl/HsFMmFA0NgMGo01sMwE1OUm
        9hA7A2tYGxl7I0x+SgEyNf8cIh0REmk=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        od@zcrc.me, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 05/13] MIPS: generic: Allow boards to set system type
Date:   Wed, 12 Aug 2020 02:15:02 +0200
Message-Id: <20200812001510.460382-6-paul@crapouillou.net>
In-Reply-To: <20200812001510.460382-1-paul@crapouillou.net>
References: <20200812001510.460382-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Check for the (already existing) "system_type" variable in the
get_system_type() function. If non-NULL, return it as the system type.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: Instead of adding a .get_system_type callback to the mips_machine
        struct, the boards now simply override the "system_type" variable
    	when they want to set a custom one.

 arch/mips/generic/proc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/generic/proc.c b/arch/mips/generic/proc.c
index 4c992809cc3f..cce2fde219a3 100644
--- a/arch/mips/generic/proc.c
+++ b/arch/mips/generic/proc.c
@@ -8,11 +8,16 @@
 
 #include <asm/bootinfo.h>
 
+char *system_type;
+
 const char *get_system_type(void)
 {
 	const char *str;
 	int err;
 
+	if (system_type)
+		return system_type;
+
 	err = of_property_read_string(of_root, "model", &str);
 	if (!err)
 		return str;
-- 
2.28.0

