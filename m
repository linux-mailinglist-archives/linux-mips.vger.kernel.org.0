Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F20311F30C
	for <lists+linux-mips@lfdr.de>; Sat, 14 Dec 2019 18:55:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbfLNRzC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Dec 2019 12:55:02 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37242 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfLNRzC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 14 Dec 2019 12:55:02 -0500
Received: by mail-pl1-f196.google.com with SMTP id c23so2624696plz.4;
        Sat, 14 Dec 2019 09:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+BU/Ff9gTll4l1H4cHIf9pN8etRhbZ4P9b/IJDTytGQ=;
        b=etYuhZFIpCXV1kkHjldlFQSwc0TrxbWNSKhQinSIxVhNYBw8CEktZpcQFrLkDDF5K5
         +Hsam8gZ8taAgwKYcXtKae2DICNa/JmCyH3kvS7XB0zTRIY0TJHSeG68zdGm045/AUbR
         1Z1XSJoe2L4CqIeUX/+NIBoVqUBpAjYl91Yp/GeG2BvYdHn3A+WyBoXkLvsfKCYYcnbm
         JaTVP6TRg7evuPWJApVMdGiJG7Rfl3BAD4FOd0aTybSzCnxYWajApbMeCYieL/hV6qvf
         k6jIqlBdfGrtylYtS7K0+d2ygq+dZJ9r7ke8j7C2GWhYAbp2yLZxuLkpvIQusP4V85Qp
         ZO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+BU/Ff9gTll4l1H4cHIf9pN8etRhbZ4P9b/IJDTytGQ=;
        b=AdGje3babbpD7Xtr8sQQGQtbotfGsT20Pj22tjbuUmjpk+77861Sxmdjf1TN7quFxd
         5EWbP89H90osXBOU49Bng5lreUGYKYyRymq2qr2mvVlEUB4pSv5FggklVj3U66aOu3Bq
         inghQYpH3UPg++lx3J1DUpqYg/xcJDQ/Pk4Oj+soQRMDK4qa2ZNwJAqsTO8VQp5yJOLt
         4DHCHFD5U8hEKhw1rN3pkTs6x3DEGGB6yJSZQfCYFXb8M+WpZ2HJwRr+jzDNUp0UV+oU
         oqJWI7tDZ0l3bPMDCHnj4Cs/IomsSPMiLHW2r3b54oTO11tSekySzgltGClrQ1MHiXQg
         I6pA==
X-Gm-Message-State: APjAAAXWH4eJUGyiW94U6JnURfeVOdwdtKIZHPW9s7J/Dqtvur2IHGtL
        ALCmaqiP8Tp3xPG1gNzqdv8=
X-Google-Smtp-Source: APXvYqzDtz2PbMdoWI7FnmJ/zsXx+7KES2ydK86NxuECS3KFBEaYhRKYIxzKO0i61f2CWAU0CDUJ4g==
X-Received: by 2002:a17:902:9048:: with SMTP id w8mr6142048plz.294.1576346101451;
        Sat, 14 Dec 2019 09:55:01 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id d22sm16263997pfo.187.2019.12.14.09.55.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Dec 2019 09:55:01 -0800 (PST)
From:   Yangtao Li <tiny.windzz@gmail.com>
To:     khilman@baylibre.com, leoyang.li@nxp.com, khalasa@piap.pl,
        john@phrozen.org, matthias.bgg@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, kgene@kernel.org, krzk@kernel.org,
        mripard@kernel.org, wens@csie.org, ssantosh@kernel.org,
        jun.nie@linaro.org, shawnguo@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 04/10] soc: zte: convert to devm_platform_ioremap_resource
Date:   Sat, 14 Dec 2019 17:54:41 +0000
Message-Id: <20191214175447.25482-4-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191214175447.25482-1-tiny.windzz@gmail.com>
References: <20191214175447.25482-1-tiny.windzz@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/soc/zte/zx2967_pm_domains.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/zte/zx2967_pm_domains.c b/drivers/soc/zte/zx2967_pm_domains.c
index a4503e31b616..9f2a274d2759 100644
--- a/drivers/soc/zte/zx2967_pm_domains.c
+++ b/drivers/soc/zte/zx2967_pm_domains.c
@@ -113,7 +113,6 @@ int zx2967_pd_probe(struct platform_device *pdev,
 		    int domain_num)
 {
 	struct genpd_onecell_data *genpd_data;
-	struct resource *res;
 	int i;
 
 	genpd_data = devm_kzalloc(&pdev->dev, sizeof(*genpd_data), GFP_KERNEL);
@@ -123,8 +122,7 @@ int zx2967_pd_probe(struct platform_device *pdev,
 	genpd_data->domains = zx_pm_domains;
 	genpd_data->num_domains = domain_num;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pcubase = devm_ioremap_resource(&pdev->dev, res);
+	pcubase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pcubase))
 		return PTR_ERR(pcubase);
 
-- 
2.17.1

