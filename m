Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 297883A207
	for <lists+linux-mips@lfdr.de>; Sat,  8 Jun 2019 22:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727372AbfFHUsu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 8 Jun 2019 16:48:50 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42383 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727364AbfFHUst (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 8 Jun 2019 16:48:49 -0400
Received: by mail-wr1-f65.google.com with SMTP id x17so5395389wrl.9
        for <linux-mips@vger.kernel.org>; Sat, 08 Jun 2019 13:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=acjgtnfZM5+ljClU7KhpnoMYZUUlOHiWM5nNWs1Eo98=;
        b=hNfcyjqhuvXJAtaFSSotaRfOcxQ1ZnU9e1QriFcxjibGRhteg9Ucr9TtUqdmKmJX3P
         S2jW21TiOwDeMcNUxt3BWv/uj6t+NzlUfjSzbjMRr1317ye6mBEyvIMxLXYC4j6CSM01
         4LGHE06ttI7Wu+mCdmn7QJR+Vj6/M+tlu8FL9qogBYUBwDKXEZsKRanh1mtPFiuCO7FN
         QCTMKakHQWIzn5OeVEcpiMDCXgt/Gr9Scbka9erWngAdZHzVs0fyuY5+w07MAckUfBzc
         nywWVENiEslnTrsBEIxE/PmQM8lQyrFT4yIfbdlKusAJxyTnlPbmzeWknLQ3jwvUEdEL
         OCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=acjgtnfZM5+ljClU7KhpnoMYZUUlOHiWM5nNWs1Eo98=;
        b=AhvdakGN/lynYd7iPsw+CEYTNArD4WlucWWsVRO0nhioPau+VLC8fgDTbagGZHMJQ6
         7qNH0d6IqzuFO2AX+Ovkzt2vltgfLgR6I4ywqV2qofGcN2BxfMohup+Um/1HQ0Mr3xyn
         gJJAbU1xxKzVdt4maP49RhF4Z1rGzDTBMyGXmzfmV4SO9IkXO3r61xMtWGMqRMx4zgXc
         nghDG9sZU5j8omagShcAk6fGPVxumCsbdIrzu+301O/gw9w/h+hUfB1v5a2Gyor4iUSp
         u/FlbTbJN0Q+uMnRdhMz7K+KM21wQQFVHwy2IcyWglfYmZZGMFwTJDErcDTVkPL9QiYh
         gA0Q==
X-Gm-Message-State: APjAAAV6+gKyJB2rZ6c3gW+wp8lLkshMhY6eeGIX1tBgytFMJ8KLy/AJ
        QQsQ4TECt9s9lpVrYe/gCok=
X-Google-Smtp-Source: APXvYqzcB1B6B8BjfG4zuebkHlw6A/0J7EtIAvsIyA0gCg26GTnBSXxxa7/TM7FMVVg5P1sFeQveUQ==
X-Received: by 2002:adf:b447:: with SMTP id v7mr3710307wrd.208.1560026928461;
        Sat, 08 Jun 2019 13:48:48 -0700 (PDT)
Received: from kontron.lan (2001-1ae9-0ff1-f191-359a-8d64-e90a-f663.ip6.tmcz.cz. [2001:1ae9:ff1:f191:359a:8d64:e90a:f663])
        by smtp.gmail.com with ESMTPSA id f204sm4986394wme.18.2019.06.08.13.48.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 08 Jun 2019 13:48:48 -0700 (PDT)
From:   petrcvekcz@gmail.com
X-Google-Original-From: petrcvekcz.gmail.com
To:     hauke@hauke-m.de, john@phrozen.org
Cc:     Petr Cvek <petrcvekcz@gmail.com>, linux-mips@vger.kernel.org,
        openwrt-devel@lists.openwrt.org, pakahmar@hotmail.com
Subject: [PATCH v1 4/7] MIPS: lantiq: Remove unused macros
Date:   Sat,  8 Jun 2019 22:48:07 +0200
Message-Id: <1ebc11c9588ddf0afcec336b35b50751fe1e89f8.1560024463.git.petrcvekcz@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1560024463.git.petrcvekcz@gmail.com>
References: <cover.1560024463.git.petrcvekcz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Petr Cvek <petrcvekcz@gmail.com>

The last use of both macros was in 4.11.

Signed-off-by: Petr Cvek <petrcvekcz@gmail.com>
---
 arch/mips/lantiq/irq.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/mips/lantiq/irq.c b/arch/mips/lantiq/irq.c
index 2df5d37d0a7b..21ccd580f8f5 100644
--- a/arch/mips/lantiq/irq.c
+++ b/arch/mips/lantiq/irq.c
@@ -54,10 +54,6 @@
 #define ltq_eiu_w32(x, y)	ltq_w32((x), ltq_eiu_membase + (y))
 #define ltq_eiu_r32(x)		ltq_r32(ltq_eiu_membase + (x))
 
-/* our 2 ipi interrupts for VSMP */
-#define MIPS_CPU_IPI_RESCHED_IRQ	0
-#define MIPS_CPU_IPI_CALL_IRQ		1
-
 /* we have a cascade of 8 irqs */
 #define MIPS_CPU_IRQ_CASCADE		8
 
-- 
2.21.0

