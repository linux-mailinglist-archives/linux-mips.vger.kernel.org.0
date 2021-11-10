Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3108D44CDD4
	for <lists+linux-mips@lfdr.de>; Thu, 11 Nov 2021 00:28:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234027AbhKJXbP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Nov 2021 18:31:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233979AbhKJXbP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Nov 2021 18:31:15 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4590C061766;
        Wed, 10 Nov 2021 15:28:26 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id d3so6708372wrh.8;
        Wed, 10 Nov 2021 15:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xmg+wcD36KQKOBOyI1GdhM50VeBjvFt5XQzCsw0TeJ4=;
        b=nm6ldRfh+/kyOXwmb7akPuKNHq6HwCPDZvSmbDkEU0Ii0z3uGJcOx4ZHu7JlENwavF
         SOfGJoatI7DPuF6H2Xa8Q8qh9i62VFNw9nrpQFlTFSg+AIMIXumzAy+FZyg0jJ694FAR
         SDYJmBQJPzH7snbppl4t+Qh3X5pYqEEitZvGepifRfZzc93cdIXKaAswp0koLer++4Fr
         IHPTTUboKDNVUnGEqLv3Yf16RkpmJKU8mexU+qAm4JKnEqdOnHfuQNRW0W46Y2RzkF9z
         R9rTXJLEe9JshQTEvJFMNcmDPK/2KnZR1J3wncT+797Pb+UN+kZVFcd7Wyckk76H4lfg
         ryTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xmg+wcD36KQKOBOyI1GdhM50VeBjvFt5XQzCsw0TeJ4=;
        b=b2U6Z6uKcxOLWN4bAo1m4JZVsQl0fvkJiLiHvqelpUkQNsmo3pKxMemiOi0GyZ1nd/
         wWGxkqOYfzHpKi9B7tK9ws09rPcJjF3IAKb3+5nfAM2nZbgPu34Ru1SiOTJQSinP6mGb
         1WRUgVAEyVr7phAhpF4wvGK8q209+gB8wcV9HEiN3PIa3e9ZSldAQP6jaZJI50hp5DXE
         6g/HMGxpmIajfEblSpVuy9hADDGxLeNjCNn8k+WDpzH6IjYll+6yovu6MzoetoGDLVjA
         rJgOsOLfUar3YS0JHBAe4In6LZIJ+hRWQnXcdyJwK7Q3kQB4dbHg9DtmDLfhgfCJGaIP
         XM7w==
X-Gm-Message-State: AOAM533moSpebzonGIuD1YU3DmUHt5n4MJMXXyq5JJBf9/vWT/a4Jh35
        oQO71DnkOR8nzg==
X-Google-Smtp-Source: ABdhPJzJbeQCehDUvPV3Pq5UvUBXVHEUTvsURZL4bYfQ6xemGlNq6lxtcRMS6xT/maa+fIhBODQbIw==
X-Received: by 2002:a5d:550f:: with SMTP id b15mr3280302wrv.212.1636586905338;
        Wed, 10 Nov 2021 15:28:25 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id c1sm1229688wrt.14.2021.11.10.15.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 15:28:24 -0800 (PST)
From:   Colin Ian King <colin.i.king@googlemail.com>
X-Google-Original-From: Colin Ian King <colin.i.king@gmail.com>
To:     Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][V2] MIPS: generic/yamon-dt: fix uninitialized variable error
Date:   Wed, 10 Nov 2021 23:28:24 +0000
Message-Id: <20211110232824.1372368-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In the case where fw_getenv returns an error when fetching values
for ememsizea and memsize then variable phys_memsize is not assigned
a variable and will be uninitialized on a zero check of phys_memsize.
Fix this by initializing phys_memsize to zero.

Cleans up cppcheck error:
arch/mips/generic/yamon-dt.c:100:7: error: Uninitialized variable: phys_memsize [uninitvar]

Fixes: f41d2430bbd6 ("MIPS: generic/yamon-dt: Support > 256MB of RAM")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
V2: Use correct email address in SoB.
---
 arch/mips/generic/yamon-dt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/generic/yamon-dt.c b/arch/mips/generic/yamon-dt.c
index a3aa22c77cad..a07a5edbcda7 100644
--- a/arch/mips/generic/yamon-dt.c
+++ b/arch/mips/generic/yamon-dt.c
@@ -75,7 +75,7 @@ static unsigned int __init gen_fdt_mem_array(
 __init int yamon_dt_append_memory(void *fdt,
 				  const struct yamon_mem_region *regions)
 {
-	unsigned long phys_memsize, memsize;
+	unsigned long phys_memsize = 0, memsize;
 	__be32 mem_array[2 * MAX_MEM_ARRAY_ENTRIES];
 	unsigned int mem_entries;
 	int i, err, mem_off;
-- 
2.32.0

