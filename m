Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1A1145476
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2020 13:40:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728931AbgAVMkC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jan 2020 07:40:02 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37024 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728731AbgAVMkB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Jan 2020 07:40:01 -0500
Received: by mail-wr1-f66.google.com with SMTP id w15so7127179wru.4
        for <linux-mips@vger.kernel.org>; Wed, 22 Jan 2020 04:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndmsystems-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1VxX43mS0iWUpbkE5n95NgX2FTZO3NdGDZP/Z4S/IGE=;
        b=Fb5pQoU1ctZ9lPR9YUEJPAibeMCFTCP8VrleQodfeto8e/z9pbKmbymipTUPDjyZid
         l+rWGRxRAAh8RoeDMZIk30KoclIWAZh5UqmBzPiesZmToJp3OJ6dxtkQqkH6Ljb2g7m5
         1B/5b6FgTRfwK1Bwk6NEBrR2iw78BxWZiLC5V9g+dR+ypODibZSNR7aNvxgu2INGXuGs
         UNnyT9iRE6M/Tu/k4oASO9I+pPC+2R3j4pK8fiiTlcYYDHFb58cp6tDr97X8H7rOpF05
         R0I4DpZRpM3s11WHuBss9pb8T/MzuSSp3LMqhMLpVVo5pDhoANDpIYJohQ3QlJS7uIrw
         F/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1VxX43mS0iWUpbkE5n95NgX2FTZO3NdGDZP/Z4S/IGE=;
        b=WjEywCdC5KJma3boQMkDAGgiFM7F1MJnTh8srCDsA110JLaTg4eOwOvyEvvRCuaPLm
         y3q0VN8YkmsKdhzKxSJPcb7PZbKcME8SElgAo4WsWND+dvdfxQrNjolqZjmf0/sPxuSS
         eY4sthqh7xnAY5d1uMK370j0vL/uhJSbYiflzzYokpSo9SYzPwMnqDHp+XcZ5szbfgzH
         yIvRhD9I+A7oqtytMYParnl7e40boq2+QF0uxddnc0irgnnfmivPADciVVCNoVsHoFYT
         MLvWDc/6VuZkrfQfR6tkDIPyfD+mRP1e00FQ2+f1cdoUpsZ2y2csQ1mHlGBQUY81huAj
         eXjg==
X-Gm-Message-State: APjAAAUuq6xn9CB79aP1oFzthL97pfZgB6LjfbGyyQMUgURI2fkIkMsW
        +Z2nnV6DsoUdSlzrRW3/yg0Xme98YObvqwVt+gP5kA==
X-Google-Smtp-Source: APXvYqxEei9vxIzoKTMFvJrKoh4gJ306MA/qsmhlSCdtv2ugncchWijKTkwhZpCwyJxcDFKnKuY0Pg==
X-Received: by 2002:adf:ec4c:: with SMTP id w12mr11534785wrn.124.1579696799115;
        Wed, 22 Jan 2020 04:39:59 -0800 (PST)
Received: from cbox-EPYC.ndm9.net ([2a01:4f8:13b:67::2])
        by smtp.googlemail.com with ESMTPSA id g25sm4833490wmh.3.2020.01.22.04.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 04:39:58 -0800 (PST)
From:   Sergey Korolev <s.korolev@ndmsystems.com>
To:     linux-mips@vger.kernel.org
Cc:     s.korolev@ndmsystems.com, Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: sync-r4k: do slave counter synchronization with disabled HW interrupts
Date:   Wed, 22 Jan 2020 15:39:08 +0300
Message-Id: <20200122123909.8188-1-s.korolev@ndmsystems.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

synchronise_count_slave() called with an enabled in mips_clockevent_init()
timer interrupt which may decrease synchronization precision.

Signed-off-by: Sergey Korolev <s.korolev@ndmsystems.com>
---
 arch/mips/kernel/sync-r4k.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/kernel/sync-r4k.c b/arch/mips/kernel/sync-r4k.c
index f2973ce87f53..abdd7aaa3311 100644
--- a/arch/mips/kernel/sync-r4k.c
+++ b/arch/mips/kernel/sync-r4k.c
@@ -90,6 +90,9 @@ void synchronise_count_master(int cpu)
 void synchronise_count_slave(int cpu)
 {
 	int i;
+	unsigned long flags;
+
+	local_irq_save(flags);
 
 	/*
 	 * Not every cpu is online at the time this gets called,
@@ -113,5 +116,7 @@ void synchronise_count_slave(int cpu)
 	}
 	/* Arrange for an interrupt in a short while */
 	write_c0_compare(read_c0_count() + COUNTON);
+
+	local_irq_restore(flags);
 }
 #undef NR_LOOPS
-- 
2.20.1

