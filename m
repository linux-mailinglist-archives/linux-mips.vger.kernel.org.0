Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32C133A208
	for <lists+linux-mips@lfdr.de>; Sat,  8 Jun 2019 22:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727424AbfFHUsw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 8 Jun 2019 16:48:52 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44630 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727364AbfFHUsv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 8 Jun 2019 16:48:51 -0400
Received: by mail-wr1-f68.google.com with SMTP id b17so5395037wrq.11
        for <linux-mips@vger.kernel.org>; Sat, 08 Jun 2019 13:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nds0LhX8tAhIs/UmD34qgTUz4OBaMwTfQsiXTSUrrtY=;
        b=FckPL98ZyAAlP2fwiYD5PrZvh+RJJ+ExMIDDKpihDG8xUqewTzo6zY1DoGYJQlzChp
         KvJrC/F+dgybfJVdqrqgkpJC5xjrlzf1hqE+uEqZuGPT2S9LRZv8M/lWxDEZ8kGv+IbV
         TX24I3pOic7Nhv8ErCJvo39ygYmRB/VkrzJxrGYeAR39lvf9aUzRsWXjZFlifoWCaGtA
         aK35GcJh5yqMQKf2WE4JbLv2BAp+nPeL55x60MkYyuWvhXi+twYG18zXPi84eRMOKUOa
         UyZx8vyqqyoMMGkTD6gf4Fym5o5UUfk0roSOUhWBqVfnwLDcgLH84msBXuq7YxRlz4xL
         B8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nds0LhX8tAhIs/UmD34qgTUz4OBaMwTfQsiXTSUrrtY=;
        b=QMdaikgelkoqCsM6OqDzV+2RqEw/9DxPeHJMpPEpmvnbywKy23mCu0CYKVLuWf6cbV
         Byx4BAb/9zd94bjkGncQ7F2pO3HjrZsJrYQA2d0oI8+UYcV/Mid7CAFbXWCtXLi94c4o
         1lpCfH/ClLlLfH+xC24tM01/7sEjlMNawo99NyDSeiNPchKLeUoykQrD9vEKtBWgJNX1
         NrkLUqGFO3LW1N9kfMZJvggtIaOnvGN2Ri2Sm0+wEkJpnCF2Ul4zfCTxVxu1lD1rVntH
         SCEyN+SXbwG/bdzd+dwmfsMTNNHU+1F/VClOoR5tXA3f8TFrXUUaqeFysEX0dyPVuHIS
         Hf3Q==
X-Gm-Message-State: APjAAAXvCqqhSE0SnvquYemfvWJ0gH5fNetrNivquiDWuyFGk5xNqVbL
        E1seG9LZRHH/SdsacQL40ns=
X-Google-Smtp-Source: APXvYqxyiqmModKRNJa2gzhqx+MmQaWTzNO58qfJV3yUsY08DwvAS+YcLp6B+FnDI4NsSoEnA58qKw==
X-Received: by 2002:adf:ecca:: with SMTP id s10mr22013347wro.168.1560026930311;
        Sat, 08 Jun 2019 13:48:50 -0700 (PDT)
Received: from kontron.lan (2001-1ae9-0ff1-f191-359a-8d64-e90a-f663.ip6.tmcz.cz. [2001:1ae9:ff1:f191:359a:8d64:e90a:f663])
        by smtp.gmail.com with ESMTPSA id f204sm4986394wme.18.2019.06.08.13.48.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 08 Jun 2019 13:48:49 -0700 (PDT)
From:   petrcvekcz@gmail.com
X-Google-Original-From: petrcvekcz.gmail.com
To:     hauke@hauke-m.de, john@phrozen.org
Cc:     Petr Cvek <petrcvekcz@gmail.com>, linux-mips@vger.kernel.org,
        openwrt-devel@lists.openwrt.org, pakahmar@hotmail.com
Subject: [PATCH v1 5/7] MIPS: lantiq: Fix bitfield masking
Date:   Sat,  8 Jun 2019 22:48:08 +0200
Message-Id: <478abd4c3d8073e6a20de2eedf22d982b79f2a4d.1560024463.git.petrcvekcz@gmail.com>
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

The modification of EXIN register doesn't clean the bitfield before
the writing of a new value. After a few modifications the bitfield would
accumulate only '1's.

Signed-off-by: Petr Cvek <petrcvekcz@gmail.com>
---
 arch/mips/lantiq/irq.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/lantiq/irq.c b/arch/mips/lantiq/irq.c
index 21ccd580f8f5..35d7c5f6d159 100644
--- a/arch/mips/lantiq/irq.c
+++ b/arch/mips/lantiq/irq.c
@@ -150,8 +150,9 @@ static int ltq_eiu_settype(struct irq_data *d, unsigned int type)
 			if (edge)
 				irq_set_handler(d->hwirq, handle_edge_irq);
 
-			ltq_eiu_w32(ltq_eiu_r32(LTQ_EIU_EXIN_C) |
-				(val << (i * 4)), LTQ_EIU_EXIN_C);
+			ltq_eiu_w32((ltq_eiu_r32(LTQ_EIU_EXIN_C) &
+				    (~(7 << (i * 4)))) | (val << (i * 4)),
+				    LTQ_EIU_EXIN_C);
 		}
 	}
 
-- 
2.21.0

