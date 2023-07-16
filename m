Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BCA9754EFF
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jul 2023 16:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbjGPORG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Jul 2023 10:17:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbjGPORG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Jul 2023 10:17:06 -0400
Received: from h2.cmg1.smtp.forpsi.com (h2.cmg1.smtp.forpsi.com [81.2.195.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10BA010C9
        for <linux-mips@vger.kernel.org>; Sun, 16 Jul 2023 07:17:04 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id L2YZqBX8vPm6CL2YaqIOHG; Sun, 16 Jul 2023 16:17:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1689517024; bh=tAEGamY/x6EGfjLvIsf7epNT1w/7wqVxn/uag/blbPk=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=xam7mA7VVxtfFogRRn9btR6W7N/gdkOWh6wJRaqWo8xH6LnzctiIplI9D2kq69WAZ
         JClqX7AWV7mb6uIN8fHyZHix45IPK/sGN3VU1ed7OVduEClrK4QOCu4UFXEEh0TiJo
         PJwpAMyDSPZQM/2yHJ3Ban8U+bB1iXDqEIyrg9fxgIniEnAu5Mc6hGuEvlZVCM+bNg
         pJQzYQRBZyRHUF2+YQuwV1XZNjhNZRXeQxBZhMxWb6WCSJOdGW7V/mbfxGX552eyam
         Szb5hVQzlu/hUc0WXVtm41s+4fSN7TZMQfE/n1A2eewxCyyzdkWMU7WVrnZc6xt2a6
         OB0MlKIxxnUIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1689517024; bh=tAEGamY/x6EGfjLvIsf7epNT1w/7wqVxn/uag/blbPk=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=xam7mA7VVxtfFogRRn9btR6W7N/gdkOWh6wJRaqWo8xH6LnzctiIplI9D2kq69WAZ
         JClqX7AWV7mb6uIN8fHyZHix45IPK/sGN3VU1ed7OVduEClrK4QOCu4UFXEEh0TiJo
         PJwpAMyDSPZQM/2yHJ3Ban8U+bB1iXDqEIyrg9fxgIniEnAu5Mc6hGuEvlZVCM+bNg
         pJQzYQRBZyRHUF2+YQuwV1XZNjhNZRXeQxBZhMxWb6WCSJOdGW7V/mbfxGX552eyam
         Szb5hVQzlu/hUc0WXVtm41s+4fSN7TZMQfE/n1A2eewxCyyzdkWMU7WVrnZc6xt2a6
         OB0MlKIxxnUIw==
Date:   Sun, 16 Jul 2023 16:17:03 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>
Cc:     linux-mips@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v4 5/6] usb: dwc3: dwc3-octeon: Dump control register on
 clock init failure
Message-ID: <ZLP73wvnW8Ke+7RB@lenoch>
References: <ZLP7CSUm095ADtdw@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZLP7CSUm095ADtdw@lenoch>
X-CMAE-Envelope: MS4wfAo5o2wh7hs80bRLFm25WvE7unc2GiynDReoXiJkqPFumTamm+xrR5EXWvMqfGyafLQAUILkDvJab18hYsXcZwoKXVYAbextDuGSiZKKXCW8TIw1ShRJ
 at8UW9BL2lSqOks2ujQM0chbQizmPBlDSQuXbrXIoDFmBrrYjriISeqHcQgeARYc65U8akUnK5yrA14ldkEVR9Q4ipRWO5fvbLHoBUEQlYH8IvkBYt4fieiY
 3ROCqbrB3otWzLYBliI6P7gS741nofmYI3QmFfk+vblwjg1sq2rcDfV4VvmH2Ud5mjGUpe5WRAFOWBQ15qB9Cjz4T+APRpJTDdG6KPbTLKpM2uG7deQYzrkO
 FLe/Y36C
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ladislav Michl <ladis@linux-mips.org>

It might be interesting to know control register value in case
clock fails to enable.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 CHANGES:
 - v4: new patch

 drivers/usb/dwc3/dwc3-octeon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
index 45726b39adab..9116df7def86 100644
--- a/drivers/usb/dwc3/dwc3-octeon.c
+++ b/drivers/usb/dwc3/dwc3-octeon.c
@@ -299,8 +299,8 @@ static int dwc3_octeon_setup(struct dwc3_octeon *octeon,
 	val = dwc3_octeon_readq(uctl_ctl_reg);
 	if ((div != FIELD_GET(USBDRD_UCTL_CTL_H_CLKDIV_SEL, val)) ||
 	    (!(FIELD_GET(USBDRD_UCTL_CTL_H_CLK_EN, val)))) {
-		dev_err(dev, "dwc3 controller clock init failure.\n");
-			return -EINVAL;
+		dev_err(dev, "clock init failure (UCTL_CTL=%016llx)\n", val);
+		return -EINVAL;
 	}
 
 	/* Step 4c: Deassert the controller clock divider reset. */
-- 
2.39.2

