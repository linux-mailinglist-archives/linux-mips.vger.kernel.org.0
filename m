Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC422F14AF
	for <lists+linux-mips@lfdr.de>; Mon, 11 Jan 2021 14:28:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732649AbhAKN2d (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Jan 2021 08:28:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732338AbhAKN2c (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 11 Jan 2021 08:28:32 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DB97C061786;
        Mon, 11 Jan 2021 05:27:52 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id v3so9496131plz.13;
        Mon, 11 Jan 2021 05:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=TzGBogmpfFLHSaMXxd8I8+bOPYrX5vXlwh/zl2QbWek=;
        b=o6BIWUPjq0nRj6t2DXJ+Asf2yC7jcoL9P5ktV2GZ5/3Ivy50RoLqztJyjPgyiNaoHo
         qVAlSTdwLCzG+cywGjICDzBLZAGSGgLTcervhJukRClZwik3A5vB7raobdJI3HynfJk6
         m1Liv4HBgVzDTVtpY+2hwjCgT7Bef6p/0eyWwiuztJOSrZ14Be5nj6grroNoJkI3Pzbk
         3E1ury4WAPOEv3jL2PSPs3DnmzQvAx0bRwPKt5e10WckL6Jbg0dVWv1yDl3ZrXXLgFuY
         HaQ5oamU2RxVS9udBNHZohriw5isyiha5pIsqejYOw+DK5iZcC9yQGZHIUVZUSuKW/Fc
         Dl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TzGBogmpfFLHSaMXxd8I8+bOPYrX5vXlwh/zl2QbWek=;
        b=b1h8PZ6uMVcMTjQBEXC7ZuviW+YLZnseIokVCRnKTTJe0ICHMvBf00WSS36twgpcHG
         R7FdpO0S7qMWxWut44JpmVkeXVWYNqDqxSUVpK3NVlUa3TVIcvDcmOKQjjmn0trTBqPo
         rQFvPeJoP8tlkcNvh9a04MqjHg1TjBTRu+FNZS+ckovH/cY4sWqQXPpl0IV2LCBkBtnG
         6qC950HrgMCsbujyWVWYfKr1xDEB7MFOWNaxAwG8kb10tvODDlK2en89LiU6K8QslpL8
         uovtdZgSArPPEH/ee+yM/LnJIz//DZgipjUD9Ujr+nHJiTx8aqVK3NaWjNoe99vyimf1
         31ig==
X-Gm-Message-State: AOAM533qqvRysGyTFus9EYesqm5qoLlMEFuwvNlJOrZWROz4XHvmN0c/
        7NQYH9ndb9e8hGaBJnT9BIE=
X-Google-Smtp-Source: ABdhPJxB8Kijes6KXskrbzg0PSiZfoGxblHFzDrlutT3Yg4+rKfUVMmxwSA9igVsPMxPe6E8j3Jukg==
X-Received: by 2002:a17:902:cb95:b029:dc:3a38:c7df with SMTP id d21-20020a170902cb95b02900dc3a38c7dfmr16303189ply.49.1610371671565;
        Mon, 11 Jan 2021 05:27:51 -0800 (PST)
Received: from localhost.localdomain ([178.236.46.205])
        by smtp.gmail.com with ESMTPSA id v3sm19414640pjn.7.2021.01.11.05.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 05:27:50 -0800 (PST)
From:   menglong8.dong@gmail.com
X-Google-Original-From: dong.menglong@zte.com.cn
To:     alexander.sverdlin@nokia.com, paulburton@kernel.org
Cc:     tsbogend@alpha.franken.de, gustavo@embeddedor.com,
        dong.menglong@zte.com.cn, colin.king@canonical.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] MIPS: OCTEON: fix unreachable code in octeon_irq_init_ciu
Date:   Mon, 11 Jan 2021 05:27:25 -0800
Message-Id: <20210111132725.4513-1-dong.menglong@zte.com.cn>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Menglong Dong <dong.menglong@zte.com.cn>

The type of 'r' in octeon_irq_init_ciu is 'unsigned int', so 'r < 0'
can't be true.

Fix this by change the type of 'r' and 'i' from 'unsigned int'
to 'int'. As 'i' won't be negative, this change works.

Fixes: 99fbc70f8547 ("MIPS: Octeon: irq: Alloc desc before configuring IRQ")
Signed-off-by: Menglong Dong <dong.menglong@zte.com.cn>
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
v2:
- change 'Fixes' from 64b139f97c01 to 99fbc70f8547
---
 arch/mips/cavium-octeon/octeon-irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/octeon-irq.c
index bd47e15d02c7..be5d4afcd30f 100644
--- a/arch/mips/cavium-octeon/octeon-irq.c
+++ b/arch/mips/cavium-octeon/octeon-irq.c
@@ -1444,7 +1444,7 @@ static void octeon_irq_setup_secondary_ciu2(void)
 static int __init octeon_irq_init_ciu(
 	struct device_node *ciu_node, struct device_node *parent)
 {
-	unsigned int i, r;
+	int i, r;
 	struct irq_chip *chip;
 	struct irq_chip *chip_edge;
 	struct irq_chip *chip_mbox;
-- 
2.17.1

