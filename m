Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 282E71605D1
	for <lists+linux-mips@lfdr.de>; Sun, 16 Feb 2020 20:22:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbgBPTVg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Feb 2020 14:21:36 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([81.169.146.178]:13562 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726671AbgBPTVJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Feb 2020 14:21:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581880867;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=oqhgP+NtrwgBX56WD4djyrk4OHTirbJ1JPDtLAAIn4U=;
        b=Zq0exAHUW7mN6WAgqTWaIq3IQcsNs7q0p4lBZJ6SBxPmw74FuqNLXMt5k18mNJLBw3
        u2vjKRTMYRVgIO5WX+iO8qLwNkDOwzL4aoKxovy3GaaRqA9B2BBS7gaWJCw0vcOovu2p
        1CWIFviuiPz+xB0RcxzR9wq0N5ia56TySgJ959kbW2jLiFqRHGnNDoEW+Ic7hTwjia15
        8JbAtUYXlB8GRQqv0jnYc7rBvDrOoWNVz7eLBpP3sHpLmR/uXG0N+9N0HR7USwEupWaC
        thBmKdbDb33YA8BbRYKAug8KyclWaU1RB/zMAymtk4u7tpR8gR3njKUxHfNjQ+uj9RU0
        T34w==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M0OoPPevMB"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1GJKwJlg
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 16 Feb 2020 20:20:58 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andi Kleen <ak@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Subject: [RFC v3 9/9] MIPS: CI20 defconfig: DEMO HACK: make DM9000 a module
Date:   Sun, 16 Feb 2020 20:20:51 +0100
Message-Id: <71ea739c7be432da356b4d3f7dca8b7658f3d2fb.1581880851.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1581880851.git.hns@goldelico.com>
References: <cover.1581880851.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

It appears that reading the ethernet mac address from NVMEM,
i.e. through the jz4780-efuse driver, requires the jz4780-efuse
driver to be up and running before the dm9000 driver is probed.

This is because there is a registration mechanism for nvmem
devices and consumers scan the global table. If the provider
has not yet been registered, the required matching entry
is not found and the consumer assumes there is no nvram.

In the case of the dm9000 it will not wait but assign a
random MAC address.

It appears that if the dm9000 is configured into the kernel
binary, it will be probed first and the correct sequence is
broken.

If it is a module (or even both), the way deferred probing
works seems to serialize properly.

So this hack is for demo purposes only and makes the dm9000
probing being delayed.

A proper solution is to make sure the jz4780-efuse driver
is probed earlier than the dm9000 driver (or mac address
lookup).

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/configs/ci20_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 614dc18211bc..1d3d1d9b62bc 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -59,7 +59,7 @@ CONFIG_MTD_UBI_FASTMAP=y
 CONFIG_NETDEVICES=y
 # CONFIG_NET_VENDOR_ARC is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
-CONFIG_DM9000=y
+CONFIG_DM9000=m
 CONFIG_DM9000_FORCE_SIMPLE_PHY_POLL=y
 # CONFIG_NET_VENDOR_INTEL is not set
 # CONFIG_NET_VENDOR_MARVELL is not set
-- 
2.23.0

