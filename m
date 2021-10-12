Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0365142AF9E
	for <lists+linux-mips@lfdr.de>; Wed, 13 Oct 2021 00:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233369AbhJLWZY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 Oct 2021 18:25:24 -0400
Received: from mail-pj1-f44.google.com ([209.85.216.44]:39545 "EHLO
        mail-pj1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbhJLWZX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 12 Oct 2021 18:25:23 -0400
Received: by mail-pj1-f44.google.com with SMTP id ls18-20020a17090b351200b001a00250584aso2931924pjb.4
        for <linux-mips@vger.kernel.org>; Tue, 12 Oct 2021 15:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KvNVbiOgl4gmeLNH3jhx3vmUh0xrt+FCTJY6lTPCRrw=;
        b=EvV03PyZdKKYyDLz6Of/LaoQT77YnMeG/jVmtk4+d79YDi9SgzkNdQJ6D4vYQ971/D
         mxzbjBli69gSn+ZuLhRU/pmoSK5XcxUgr8KJ+GeM23XYyO4ZrIDxnJMMG6MaNVQkhSZW
         SMzIzNIokW7G/enqJcSkBe71owJzP+K9twpbdYPtVdu4f2FDs6qcMq6Sd3KohJ3JFRsV
         vQ3nzgU005EkRfOM3b95n6A5UGK85BKyFaFmboETpbuM0kc/ah45YF6B4bmfRbMocsnJ
         UG22uRPWobBtbiqe1VNYIDQvGVOxLlA9BSKcDiUZgOxhVi7EKoUQlWa761HC3bxUN8KJ
         uamg==
X-Gm-Message-State: AOAM532lNee4hM68VG1JPT62I6A3six9DefoRHXyJ4lJgc1w0xlzCrQ8
        oo77DV+X2liv9Ct0oyuYtJU=
X-Google-Smtp-Source: ABdhPJzfYrOYISpOhC4bJ64oTs+k0F6LhfbT2X8Ag9iCUj7d+2Sc9/0p/IgeR+FxrV3as8UNPWy1/g==
X-Received: by 2002:a17:902:9684:b0:13e:32cb:c95d with SMTP id n4-20020a170902968400b0013e32cbc95dmr32833371plp.31.1634077401163;
        Tue, 12 Oct 2021 15:23:21 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com ([2620:15c:211:201:8c1a:acb2:4eff:5d13])
        by smtp.gmail.com with ESMTPSA id z11sm11771640pfk.204.2021.10.12.15.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 15:23:20 -0700 (PDT)
From:   Bart Van Assche <bvanassche@acm.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Bart Van Assche <bvanassche@acm.org>, linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: sni: Fix the build
Date:   Tue, 12 Oct 2021 15:23:12 -0700
Message-Id: <20211012222312.3782068-1-bvanassche@acm.org>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch fixes the following gcc 10 build error:

arch/mips/sni/time.c: In function ‘a20r_set_periodic’:
arch/mips/sni/time.c:15:26: error: unsigned conversion from ‘int’ to ‘u8’ {aka ‘volatile unsigned char’} changes value from ‘576’ to ‘64’ [-Werror=overflow]
   15 | #define SNI_COUNTER0_DIV ((SNI_CLOCK_TICK_RATE / SNI_COUNTER2_DIV) / HZ)
      |                          ^
arch/mips/sni/time.c:21:45: note: in expansion of macro ‘SNI_COUNTER0_DIV’
   21 |  *(volatile u8 *)(A20R_PT_CLOCK_BASE + 0) = SNI_COUNTER0_DIV;
      |                                             ^~~~~~~~~~~~~~~~

Cc: linux-mips@vger.kernel.org
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 arch/mips/sni/time.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/sni/time.c b/arch/mips/sni/time.c
index 240bb68ec247..ff3ba7e77890 100644
--- a/arch/mips/sni/time.c
+++ b/arch/mips/sni/time.c
@@ -18,14 +18,14 @@ static int a20r_set_periodic(struct clock_event_device *evt)
 {
 	*(volatile u8 *)(A20R_PT_CLOCK_BASE + 12) = 0x34;
 	wmb();
-	*(volatile u8 *)(A20R_PT_CLOCK_BASE + 0) = SNI_COUNTER0_DIV;
+	*(volatile u8 *)(A20R_PT_CLOCK_BASE + 0) = SNI_COUNTER0_DIV & 0xff;
 	wmb();
 	*(volatile u8 *)(A20R_PT_CLOCK_BASE + 0) = SNI_COUNTER0_DIV >> 8;
 	wmb();
 
 	*(volatile u8 *)(A20R_PT_CLOCK_BASE + 12) = 0xb4;
 	wmb();
-	*(volatile u8 *)(A20R_PT_CLOCK_BASE + 8) = SNI_COUNTER2_DIV;
+	*(volatile u8 *)(A20R_PT_CLOCK_BASE + 8) = SNI_COUNTER2_DIV & 0xff;
 	wmb();
 	*(volatile u8 *)(A20R_PT_CLOCK_BASE + 8) = SNI_COUNTER2_DIV >> 8;
 	wmb();
