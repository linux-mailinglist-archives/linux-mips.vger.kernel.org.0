Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB843AA0A
	for <lists+linux-mips@lfdr.de>; Sun,  9 Jun 2019 19:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732672AbfFIQym (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 9 Jun 2019 12:54:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:56466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732232AbfFIQym (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 9 Jun 2019 12:54:42 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2B2C1206BB;
        Sun,  9 Jun 2019 16:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560099281;
        bh=RraCkwXdzglEq/7vdS33A/72ye87OZQO/agCNTF+Lok=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iQ9H+R0F5+7AkyHiqmkf7t5PkL4v2JjulhjI5Acol1RCXfSdXN00HbCLxuU6gADgJ
         92Cj03/vE4WZN064QpzOyXulQNmsfXsAbobhlJKHFXOCwND60yXSbPByCc5/ZVZtGA
         Zm/WpIKqmDQmvQ326i84GaUe2NCYZZ/oPQFV1IOM=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        Kevin Hilman <khilman@baylibre.com>, linux-mips@vger.kernel.org
Subject: [PATCH 4.9 75/83] MIPS: pistachio: Build uImage.gz by default
Date:   Sun,  9 Jun 2019 18:42:45 +0200
Message-Id: <20190609164134.297251914@linuxfoundation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190609164127.843327870@linuxfoundation.org>
References: <20190609164127.843327870@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Paul Burton <paul.burton@mips.com>

commit e4f2d1af7163becb181419af9dece9206001e0a6 upstream.

The pistachio platform uses the U-Boot bootloader & generally boots a
kernel in the uImage format. As such it's useful to build one when
building the kernel, but to do so currently requires the user to
manually specify a uImage target on the make command line.

Make uImage.gz the pistachio platform's default build target, so that
the default is to build a kernel image that we can actually boot on a
board such as the MIPS Creator Ci40.

Marked for stable backport as far as v4.1 where pistachio support was
introduced. This is primarily useful for CI systems such as kernelci.org
which will benefit from us building a suitable image which can then be
booted as part of automated testing, extending our test coverage to the
affected stable branches.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
URL: https://groups.io/g/kernelci/message/388
Cc: stable@vger.kernel.org # v4.1+
Cc: linux-mips@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 arch/mips/pistachio/Platform |    1 +
 1 file changed, 1 insertion(+)

--- a/arch/mips/pistachio/Platform
+++ b/arch/mips/pistachio/Platform
@@ -6,3 +6,4 @@ cflags-$(CONFIG_MACH_PISTACHIO)		+=				\
 		-I$(srctree)/arch/mips/include/asm/mach-pistachio
 load-$(CONFIG_MACH_PISTACHIO)		+= 0xffffffff80400000
 zload-$(CONFIG_MACH_PISTACHIO)		+= 0xffffffff81000000
+all-$(CONFIG_MACH_PISTACHIO)		:= uImage.gz


