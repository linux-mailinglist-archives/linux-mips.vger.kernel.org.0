Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A73D225906E
	for <lists+linux-mips@lfdr.de>; Tue,  1 Sep 2020 16:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728409AbgIAO1l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Sep 2020 10:27:41 -0400
Received: from crapouillou.net ([89.234.176.41]:45308 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728060AbgIAO1g (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Sep 2020 10:27:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1598970418; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pv8t6eZQwKe+7ukpfvfRewZxi85dPebobIiJKndKFcA=;
        b=CzZ+0a4Oqagv4fj5P/eW9dz+6LVKMHQPmfFDpnl6ZuehrZ7TtbeK5zQit6vA+MFPJwj8H3
        6xj7nsll9p3eTRuUC7kxo7UKA+pUNTk41mbVI3+eAe67aoJE/SVoKqsleKbN6jLra4QvKU
        jHXLTG/c/Wv3ub9azN2qkD3BMDkuU+0=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Terrell <terrelln@fb.com>
Cc:     od@zcrc.me, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 1/2] lib: decompress_unzstd: Limit output size
Date:   Tue,  1 Sep 2020 16:26:50 +0200
Message-Id: <20200901142651.1165237-2-paul@crapouillou.net>
In-Reply-To: <20200901142651.1165237-1-paul@crapouillou.net>
References: <20200901142651.1165237-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The zstd decompression code, as it is right now, will most likely fail
on 32-bit systems, as the default output buffer size causes the buffer's
end address to overflow.

Address this issue by setting a sane default to the default output size,
with a value that won't overflow the buffer's end address.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: Change limit to 1 GiB
    
    v3: Compute size limit instead of using hardcoded value

 lib/decompress_unzstd.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/decompress_unzstd.c b/lib/decompress_unzstd.c
index 0ad2c15479ed..790abc472f5b 100644
--- a/lib/decompress_unzstd.c
+++ b/lib/decompress_unzstd.c
@@ -178,8 +178,13 @@ static int INIT __unzstd(unsigned char *in_buf, long in_len,
 	int err;
 	size_t ret;
 
+	/*
+	 * ZSTD decompression code won't be happy if the buffer size is so big
+	 * that its end address overflows. When the size is not provided, make
+	 * it as big as possible without having the end address overflow.
+	 */
 	if (out_len == 0)
-		out_len = LONG_MAX; /* no limit */
+		out_len = UINTPTR_MAX - (uintptr_t)out_buf;
 
 	if (fill == NULL && flush == NULL)
 		/*
-- 
2.28.0

