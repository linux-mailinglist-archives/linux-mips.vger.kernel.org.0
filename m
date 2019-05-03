Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FECF13356
	for <lists+linux-mips@lfdr.de>; Fri,  3 May 2019 19:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728821AbfECRvm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 May 2019 13:51:42 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34950 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728801AbfECRvk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 3 May 2019 13:51:40 -0400
Received: by mail-lj1-f194.google.com with SMTP id z26so1121757ljj.2;
        Fri, 03 May 2019 10:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QQUuLg/zS2tfsDPJ/SWrp4NtSrhhV6zRMowLIWOaos8=;
        b=tscQTSsdX0uvuETo/lXEstXhGPV0xHg/5z2O/HEl0htSa4teJd7jROGZofZeXoQZGh
         m1Bq80/JmIXmHOHRVSPOuqsOerDSouwC+CQpCGNWsrK1AwGmBg+ll2XvWyRTxyL7ILZ8
         NPx4IpkHxAMGOGRlxRviY2nnK2LOgdYWyzhbCZgAU1AnXaS8oWVRARWcdoVhdIiKAQMo
         fESSlfH1Y1icYTKhb4BX5TGxLcS01E9wzo5MIcyPujHTLhwf3mEjuJg8t4BoKDDHqUbK
         0qzZgWd94RIHJQ9A93WCcJv4f9WW+CGmYBsDn97N+8dpuWTH8pqM3GM+92rdkHdMDPVZ
         c1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QQUuLg/zS2tfsDPJ/SWrp4NtSrhhV6zRMowLIWOaos8=;
        b=alBdZexBALKFE229Ozs5wE1IxqFvokjR5zw24PPN+1aj68Rsn6Tu7Fg+QQWTYJuc44
         6D7wxRXwjzXzh8LaR3hoCKAWk9kS+vSSdI/Q0rqevnVNVum1i9b7zyZVUmFIcXExYSuU
         ZbowZP/VZTRDinPAMY3m8U85pEnCzwT7JlaJDwrs3pZQu5kDBHkcff/8SkqJDE8vQ5cO
         2WAR8Txi9wzIdgRWo8k7+dGhbocgzKO9rR5KvQsgDWQYh7zgn1LzZv76tAn8zbCZxGcY
         vsvtHyx0ZvkOKtqh7FwI+EcggfB3AJey3RUWPrL14OmEK1OjinD4FQBxzR1hocfQnoct
         aF8Q==
X-Gm-Message-State: APjAAAUyk5L3nbm5rkjrFHVVK5MLCoXoYhy/9+S6IMYRJWQlNVk+YMqp
        mH812+Q6VufkwXm206HoW84=
X-Google-Smtp-Source: APXvYqwiOJrUVTjSBUodRbF3hRfOWNf9xT5NZ7WKTZq2mTtJ9i2+MHvyJoWXpasFy5hhxntncNMv5w==
X-Received: by 2002:a2e:2d02:: with SMTP id t2mr5293405ljt.148.1556905898225;
        Fri, 03 May 2019 10:51:38 -0700 (PDT)
Received: from localhost.localdomain ([5.164.217.122])
        by smtp.gmail.com with ESMTPSA id z30sm533435lfb.87.2019.05.03.10.51.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 10:51:37 -0700 (PDT)
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Huacai Chen <chenhc@lemote.com>,
        Stefan Agner <stefan@agner.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Juergen Gross <jgross@suse.com>
Cc:     Serge Semin <Sergey.Semin@t-platforms.ru>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH v2 2/5] mips: Perform early low memory test
Date:   Fri,  3 May 2019 20:50:38 +0300
Message-Id: <20190503175041.7949-3-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190503175041.7949-1-fancer.lancer@gmail.com>
References: <20190503175041.7949-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

memblock subsystem provides a method to optionally test the passed
memory region in case if it was requested via special kernel boot
argument. Lets add the function at the bottom of the arch_mem_init()
method. Testing at this point in the boot sequence should be safe since all
critical areas are now reserved and a minimum of allocations have been
done.

Reviewed-by: Matt Redfearn <matt.redfearn@mips.com>
Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 arch/mips/kernel/setup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index ca493fdf69b0..fbd216b4e929 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -826,6 +826,8 @@ static void __init arch_mem_init(char **cmdline_p)
 		__pa_symbol(&__nosave_end) - __pa_symbol(&__nosave_begin));
 
 	memblock_dump_all();
+
+	early_memtest(PFN_PHYS(min_low_pfn), PFN_PHYS(max_low_pfn));
 }
 
 static void __init resource_init(void)
-- 
2.21.0

