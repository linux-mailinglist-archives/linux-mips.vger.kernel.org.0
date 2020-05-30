Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 064B11E9114
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2020 14:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728304AbgE3MMi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 30 May 2020 08:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbgE3MMi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 30 May 2020 08:12:38 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53FCAC03E969;
        Sat, 30 May 2020 05:12:38 -0700 (PDT)
Received: from localhost.localdomain (unknown [142.147.94.151])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 59D582049D;
        Sat, 30 May 2020 12:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1590840755; bh=R7e/lLuhIwTLBmpeCCmWO3wYYEAI25FSKZglWnBA+ng=;
        h=From:To:Cc:Subject:Date:From;
        b=eW2X1W2V4ZHKfXp9K/Mi6uoXL8RdKo73klpTzerFopEXxrbdn/BykYbQu7B75Bxkx
         TZ4+k+j5rsvoAGOAx92FYIvSjpTHhgxhDlN1xDrypE3ZGwjZ5YvYH/LSvNmWo5AwbG
         pImFHn+/kjltEq1JfQBbts3ltuInqx+tb3jmS476HXjrJCkarTn2gb9aDbVTmGXa+4
         dzulu5+fcV0j/nctwLr4BNQ8WWiXNJOtMTe7RHHU/kuryIvaxVg4VQyNn9ptQqg0+u
         T1COkdhXjcQBWcBScWwmkU8JdY2MA6ORUT5GGhlPM/htBRux+0k6QlLMTuZ0vKhrrz
         8mN0VccYvIWIQ==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     maz@kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH 0/2] irqchip: loongson-*: Two small fixes
Date:   Sat, 30 May 2020 20:11:11 +0800
Message-Id: <20200530121113.1797678-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.27.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


Jiaxun Yang (2):
  irqchip: loongson-pci-msi: Fix a typo in Kconfig
  irqchip: loongson-*: Fix COMPILE_TEST

 drivers/irqchip/Kconfig                | 2 +-
 drivers/irqchip/irq-loongson-htpic.c   | 4 ++++
 drivers/irqchip/irq-loongson-htvec.c   | 4 ++++
 drivers/irqchip/irq-loongson-liointc.c | 4 ++++
 4 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.27.0.rc0

