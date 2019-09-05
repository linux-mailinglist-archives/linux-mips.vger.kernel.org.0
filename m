Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0ED1AA669
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 16:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390029AbfIEOru (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Sep 2019 10:47:50 -0400
Received: from forward106p.mail.yandex.net ([77.88.28.109]:45269 "EHLO
        forward106p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389773AbfIEOru (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Sep 2019 10:47:50 -0400
Received: from mxback23o.mail.yandex.net (mxback23o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::74])
        by forward106p.mail.yandex.net (Yandex) with ESMTP id 99C801C811AA;
        Thu,  5 Sep 2019 17:47:47 +0300 (MSK)
Received: from smtp2o.mail.yandex.net (smtp2o.mail.yandex.net [2a02:6b8:0:1a2d::26])
        by mxback23o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id A9CRhuXvjK-ll3GAu2K;
        Thu, 05 Sep 2019 17:47:47 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567694867;
        bh=8aD9dO3AAn4axkTRS17W2/QjWZFlCar4FyR3QVxMvuY=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=IwNKxOS+GX0MbDQSkMUPJAL/M3ZSTQhKCQTZZpQ+5sm6OpXyuUWXYItXDtkab7aG1
         bMcXLkEBMN9HjJ3Q0Q3WtQt9cM4Lz4ghNnHcQp/3/0tzzBrWemZFtJjDoUtX4Lib3L
         70hbtDON22/ewUKLUuWIgVysQAkL/K8+ynycbMfM=
Authentication-Results: mxback23o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp2o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id zkoybIaMjG-lexWkLJH;
        Thu, 05 Sep 2019 17:47:45 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 19/19] MAINTAINERS: Add myself as maintainer of LOONGSON64
Date:   Thu,  5 Sep 2019 22:43:16 +0800
Message-Id: <20190905144316.12527-20-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
References: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

I'm going to help with LOONGSON64 maintainance as well.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 836b21baeb20..36b656ded1b7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10753,6 +10753,7 @@ F:	drivers/*/*/*loongson2*
 
 MIPS/LOONGSON64 ARCHITECTURE
 M:	Huacai Chen <chenhc@lemote.com>
+M:	Jiaxun Yang <jiaxun.yang@flygoat.com>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	arch/mips/boot/dts/loongson/
-- 
2.22.0

