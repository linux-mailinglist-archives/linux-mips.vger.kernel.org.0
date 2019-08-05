Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7C381742
	for <lists+linux-mips@lfdr.de>; Mon,  5 Aug 2019 12:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727357AbfHEKmA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Aug 2019 06:42:00 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38987 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbfHEKl7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Aug 2019 06:41:59 -0400
Received: by mail-pg1-f196.google.com with SMTP id u17so39520906pgi.6;
        Mon, 05 Aug 2019 03:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=p5jjpcdDzHpRpFEJ82N+9ogzkGbCG4DxOKAh/lPRgAc=;
        b=ppyM4JE+4cBJz+cCgBEtbQr/xGuH5ZjITqTjUH2hpsSjqqEqWIMqKQu/5OXwamwPze
         BQcjJ34JOke4cEaU8v4PTzkeaImyvnwdAS3LAB14GI4Yd4P5TSWaBcq/CJUPn0rfDq/G
         3aaLRRYObIq+jw4BGxk4ReK2v/79j7sbZp+pAoDzPWGdUXnh35FQZ8puhJFSgFbxDuEK
         nVMfwnt5Bu8pI2zr/zm0NN2Zkz09N7N+8Ih4wd4Z04HN3rXVCZg/6BpRTGF1IkAuaR87
         yC9mCO4QjOP46vFfisboJHi+cwsfLM85BLjRCEWjaWHktuf6pKcF6vcPqCt1yZOtLf+a
         8LEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=p5jjpcdDzHpRpFEJ82N+9ogzkGbCG4DxOKAh/lPRgAc=;
        b=Oje0tBu+EHUhctW9oge6fIVfHoSs/yARWLKUuys18u2+Mc4NQzG/MYGDQsMR0s9dw5
         T/h5wU4x8b9vMfQaPfqnADriieAXslBhz+Ebf7LyCjNmTVBPz2uX7McWwnYrdHWvA7Bb
         Hs/bZU821+l6lM2X6KpYCilWf3zXfjDTiQq9uh3y6wi7Pa9DGuNYnoWylOw9byFuzHaY
         ZlAWCZ8TSPo5ZT4e8GjZySdOcqHuUvtGrfkVLfCMFX5hmxVDTXrGv/0D/ZBUSush0i/b
         6+hzMjBh5s7swrPUqQgG/099wec4fQ8PB1ub87gXy5M0nsUf/4vWls0mTQnms0jT/ykU
         iZww==
X-Gm-Message-State: APjAAAVtvrw5toVViWUQ0SWRsRXMDom2itp3z/MGhclhv5PBWW4v35/k
        YJcn0NLJXFF/ellluXr0WCMVfVwG
X-Google-Smtp-Source: APXvYqzSMNe96BZi2wu5yOZQ9nH/f9E3OoRhCWjjHxzOftVFfbn+nzmDqbNuXVPEebUSXviEEKKQ9Q==
X-Received: by 2002:aa7:81d4:: with SMTP id c20mr72881388pfn.235.1565001719226;
        Mon, 05 Aug 2019 03:41:59 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k36sm85297551pgl.42.2019.08.05.03.41.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 03:41:58 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        "Gustavo A . R . Silva" <gustavo@embeddedor.com>
Subject: [PATCH] MIPS: OCTEON: octeon-usb: Mark expected switch fall-through
Date:   Mon,  5 Aug 2019 03:41:55 -0700
Message-Id: <1565001715-22966-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Since commit a035d552a93b ("Makefile: Globally enable fall-through
warning"), cavium_octeon_defconfig builds fail with

In file included from
arch/mips/cavium-octeon/octeon-usb.c:12:
arch/mips/cavium-octeon/octeon-usb.c: In function 'dwc3_octeon_clocks_start':
include/linux/device.h:1499:2: error: this statement may fall through
  _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/mips/cavium-octeon/octeon-usb.c:399:3: note:
			in expansion of macro 'dev_err'
  dev_err(dev, "Invalid ref_clk %u, using 100000000 instead\n",
  ^~~~~~~
arch/mips/cavium-octeon/octeon-usb.c:401:2: note: here
  case 100000000:
  ^~~~~~~

Mark the switch case to expect fall through.

Cc: Gustavo A. R. Silva <gustavo@embeddedor.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/mips/cavium-octeon/octeon-usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/cavium-octeon/octeon-usb.c b/arch/mips/cavium-octeon/octeon-usb.c
index 1f730ded5224..8a16ab37aa11 100644
--- a/arch/mips/cavium-octeon/octeon-usb.c
+++ b/arch/mips/cavium-octeon/octeon-usb.c
@@ -398,6 +398,7 @@ static int dwc3_octeon_clocks_start(struct device *dev, u64 base)
 	default:
 		dev_err(dev, "Invalid ref_clk %u, using 100000000 instead\n",
 			clock_rate);
+		/* Fall through */
 	case 100000000:
 		mpll_mul = 0x19;
 		if (ref_clk_sel < 2)
-- 
2.7.4

