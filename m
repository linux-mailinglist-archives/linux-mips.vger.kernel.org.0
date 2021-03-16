Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C07BC33DBBE
	for <lists+linux-mips@lfdr.de>; Tue, 16 Mar 2021 18:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236180AbhCPR7F (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 Mar 2021 13:59:05 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:55421 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239399AbhCPR6s (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 16 Mar 2021 13:58:48 -0400
Received: from mail-ej1-f72.google.com ([209.85.218.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lMDxu-0003iX-6l
        for linux-mips@vger.kernel.org; Tue, 16 Mar 2021 17:58:46 +0000
Received: by mail-ej1-f72.google.com with SMTP id bg7so7979167ejb.12
        for <linux-mips@vger.kernel.org>; Tue, 16 Mar 2021 10:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6yF86hItxVjdF00mkSd3V9reGH3tNOZvxmWSGP21D5c=;
        b=shWmcw1aW+p4LFV9avgpilJp/+xSU7DtgfjyHXN6FqJt6J295uM5ONoZOlRnwG4TvK
         kXARyiFn1KdfQx2GJWNrcYyzC7BjZ+imAfgQFNaniSFCutlan8iTE8FLo7jbV1P17SWv
         K5/yKgUTfx2cHk+aOsPeqKr5ROjms8tMwB30J8QixkBuXTSRmoC4xeiv9yZxS+YHgrc3
         zyZqSF31SFIMckNEOgXTFrejOJlh0fLn6fbR9JebwZ+uokGWkvQCEtR5PyAGDRnYlYbW
         smoknYf7/ojpoonKSK1klVh9ob/fJRXBjT9w4Ihc6akdBJlKnFzOPLQjoHMyQUJbwvxT
         tOlA==
X-Gm-Message-State: AOAM5317R3rVz1I7ZmmVuc0QEsO07lcltEXKplf1UTsG70kgf4/vF1Re
        6N4TmV9sD1IUKVUrzTwN4gZwTOIyErKzT+CPpIp00B9jjt14yJRgvrWkpMDMewkLPEgOFCMfmNh
        6hd20SbHakXkUR8rG0L1g/Anr311NtOcV9aBcKvg=
X-Received: by 2002:a05:6402:8d7:: with SMTP id d23mr38353358edz.256.1615917525834;
        Tue, 16 Mar 2021 10:58:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxizmFWFc7QpRfLd8R4IVOXUZ7C6tYUXVLXOgwdmYrenYqYy0+6m8vxkgzfJFApBbM5vwKsHA==
X-Received: by 2002:a05:6402:8d7:: with SMTP id d23mr38353340edz.256.1615917525678;
        Tue, 16 Mar 2021 10:58:45 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id bm6sm9927848ejb.50.2021.03.16.10.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 10:58:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
        balbi@kernel.org, linux-usb@vger.kernel.org, digetx@gmail.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] MIPS: ralink: define stubs for clk_set_parent to fix compile testing
Date:   Tue, 16 Mar 2021 18:57:25 +0100
Message-Id: <20210316175725.79981-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The Ralink MIPS platform does not use Common Clock Framework and does
not define certain clock operations leading to compile test failures:

    /usr/bin/mips-linux-gnu-ld: drivers/usb/phy/phy-tegra-usb.o: in function `tegra_usb_phy_init':
    phy-tegra-usb.c:(.text+0x1dd4): undefined reference to `clk_get_parent'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/mips/ralink/clk.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/mips/ralink/clk.c b/arch/mips/ralink/clk.c
index 2f9d5acb38ea..8387177a47ef 100644
--- a/arch/mips/ralink/clk.c
+++ b/arch/mips/ralink/clk.c
@@ -70,6 +70,20 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
 }
 EXPORT_SYMBOL_GPL(clk_round_rate);
 
+int clk_set_parent(struct clk *clk, struct clk *parent)
+{
+	WARN_ON(clk);
+	return -1;
+}
+EXPORT_SYMBOL(clk_set_parent);
+
+struct clk *clk_get_parent(struct clk *clk)
+{
+	WARN_ON(clk);
+	return NULL;
+}
+EXPORT_SYMBOL(clk_get_parent);
+
 void __init plat_time_init(void)
 {
 	struct clk *clk;
-- 
2.25.1

