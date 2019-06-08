Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 547B23A206
	for <lists+linux-mips@lfdr.de>; Sat,  8 Jun 2019 22:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727408AbfFHUsr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 8 Jun 2019 16:48:47 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:32885 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727364AbfFHUsr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 8 Jun 2019 16:48:47 -0400
Received: by mail-wm1-f65.google.com with SMTP id h19so6391291wme.0
        for <linux-mips@vger.kernel.org>; Sat, 08 Jun 2019 13:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K6XyYBpZYTZIhNAqwvma6CPAxW9A+FG7+THYnS1wA+I=;
        b=KDDpbTwuwRIEEP8A988qq8gPEsMT3oakGgINblELgjNVwDsBCIsI84f69v/G9/Hmso
         i6ZaCJvfgqP0F2qVWdaMuu93L+dFTMkrSfSv2bCaVCPlKa5ou4c3UjvjzinTtSQ2vp/I
         U26JJrjLBP/61HRaZ0mENcpBbHhuHu2tFPijaeyx4TjzJsCdNFgfkNcrGjnFqL6o2M8V
         rn8MRDh6lVBMWszxOZav845SkST2m1jtqi2TEw7938tBeRblno1F3cmv0LNO/NOnJoBd
         /NqX8QHuNkBBzH5ZMZxo333Eswj1AC0OnaXm2Dp/lHSaPlsJ3bVt1kFGxx2EqE4A3pY5
         9bgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K6XyYBpZYTZIhNAqwvma6CPAxW9A+FG7+THYnS1wA+I=;
        b=d7xi13pxTxCb5V3P7+uHRqFOl6BsX518T+99gCAS5Bv/1jfUc4YLQ0qn0fCzpD1tOt
         sh35nEPdQ7Vx6R9TlryehJPlPDyu/qVkkRMjAZJvVOoPa2YBSZ2HjQtpZfJ8RfidEv15
         6T7JsKF1k1Iyqrd8berd5NuZJs75i4PrY955iZbqP5ATzZDWGQJx6UFdSw3hUKfCn+K0
         +lcnl72OELSaG48RJzY8jQziGoVRl4MhHys+bybBqwm0E95ODtYsE39w+kS74LpjYh+5
         zoEnhvDs01a8A0orgPU9Buu3lNb28+N+BuwdA7MA3ca4CxSbuYAQCa8UxQuGIfIQFKd8
         St/Q==
X-Gm-Message-State: APjAAAUx3pIMKf3lCJjY4HtWMLIbn7CVYLUnudSFkNmetPn/pPvAh/J1
        4/WZCKGmjapF37mEKISjR8E=
X-Google-Smtp-Source: APXvYqziyeGiwwN9mxUOB8c3wzr31hYnkEsgES+NJIIOaQXyyThiJZ4wdX0FRah1BBA5LUUd1jL4Dg==
X-Received: by 2002:a05:600c:2507:: with SMTP id d7mr7784045wma.2.1560026925293;
        Sat, 08 Jun 2019 13:48:45 -0700 (PDT)
Received: from kontron.lan (2001-1ae9-0ff1-f191-359a-8d64-e90a-f663.ip6.tmcz.cz. [2001:1ae9:ff1:f191:359a:8d64:e90a:f663])
        by smtp.gmail.com with ESMTPSA id f204sm4986394wme.18.2019.06.08.13.48.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 08 Jun 2019 13:48:44 -0700 (PDT)
From:   petrcvekcz@gmail.com
X-Google-Original-From: petrcvekcz.gmail.com
To:     hauke@hauke-m.de, john@phrozen.org
Cc:     Petr Cvek <petrcvekcz@gmail.com>, linux-mips@vger.kernel.org,
        openwrt-devel@lists.openwrt.org, pakahmar@hotmail.com
Subject: [PATCH v1 3/7] MIPS: lantiq: Fix attributes of of_device_id structure
Date:   Sat,  8 Jun 2019 22:48:06 +0200
Message-Id: <a7c5ff7cb94fda09ba72e7337c8c850efbf006d4.1560024463.git.petrcvekcz@gmail.com>
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

According to the checkpatch the driver structure of_device_id requires
to be const and with attribute __initconst. Change it accordingly.

Signed-off-by: Petr Cvek <petrcvekcz@gmail.com>
---
 arch/mips/lantiq/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/lantiq/irq.c b/arch/mips/lantiq/irq.c
index ef946eb41439..2df5d37d0a7b 100644
--- a/arch/mips/lantiq/irq.c
+++ b/arch/mips/lantiq/irq.c
@@ -347,7 +347,7 @@ unsigned int get_c0_compare_int(void)
 	return CP0_LEGACY_COMPARE_IRQ;
 }
 
-static struct of_device_id __initdata of_irq_ids[] = {
+static const struct of_device_id of_irq_ids[] __initconst = {
 	{ .compatible = "lantiq,icu", .data = icu_of_init },
 	{},
 };
-- 
2.21.0

