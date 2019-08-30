Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35194A2E96
	for <lists+linux-mips@lfdr.de>; Fri, 30 Aug 2019 06:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbfH3Efl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Aug 2019 00:35:41 -0400
Received: from forward103j.mail.yandex.net ([5.45.198.246]:42402 "EHLO
        forward103j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725648AbfH3Efl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 30 Aug 2019 00:35:41 -0400
Received: from mxback30j.mail.yandex.net (mxback30j.mail.yandex.net [IPv6:2a02:6b8:0:1619::230])
        by forward103j.mail.yandex.net (Yandex) with ESMTP id E5D5D6741178;
        Fri, 30 Aug 2019 07:35:38 +0300 (MSK)
Received: from smtp1p.mail.yandex.net (smtp1p.mail.yandex.net [2a02:6b8:0:1472:2741:0:8b6:6])
        by mxback30j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id 32U7f9lBw7-Zcri6gdt;
        Fri, 30 Aug 2019 07:35:38 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567139738;
        bh=vrMkaB9xn2ZE/mMPhncAwnoH2UZZVYCo5x0BeJ38aIs=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=Q0hLb42eEIAgd3tuXr+Ysh9mGKETNBAamYbgahhoX534I1WvSgPi/GbolwJaMyjLJ
         y934WyjHDo7olFddOMSZraquQ9GMTx/GmDaKFp89Y0P0ZfLi+H/GzLPbItXfvez1iY
         bcW9zXpyaN8n2Nn6b5QS74PbqEcDP9KlPuOQVWMQ=
Authentication-Results: mxback30j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id vFuwVxmDwr-ZUDG4Ds5;
        Fri, 30 Aug 2019 07:35:36 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v1 18/18] MAINTAINERS: Add myself as maintainer of LOONGSON64
Date:   Fri, 30 Aug 2019 12:32:32 +0800
Message-Id: <20190830043232.20191-13-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190830043232.20191-1-jiaxun.yang@flygoat.com>
References: <20190830043232.20191-1-jiaxun.yang@flygoat.com>
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
index 242970af939c..e14edf51ee15 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10758,6 +10758,7 @@ F:	drivers/*/*/*loongson2*
 
 MIPS/LOONGSON64 ARCHITECTURE
 M:	Huacai Chen <chenhc@lemote.com>
+M:	Jiaxun Yang <jiaxun.yang@flygoat.com>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	arch/mips/boot/dts/loongson/
-- 
2.22.0

