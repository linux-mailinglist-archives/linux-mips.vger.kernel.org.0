Return-Path: <linux-mips+bounces-485-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA118031D9
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 12:57:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2742A280F24
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 11:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E567922F14;
	Mon,  4 Dec 2023 11:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pUskY87v"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98CE22F10
	for <linux-mips@vger.kernel.org>; Mon,  4 Dec 2023 11:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8E3C433CB;
	Mon,  4 Dec 2023 11:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701691047;
	bh=bYK15xB2ytVHbb2n+GAjb9+qJ0IKJuMx6deotQJ5QHM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pUskY87vBF60hK9aIEAt+QS0uxWl+d8yqh+vB1rNFa5tCPcB1nVNU2xouUhVSWRYT
	 QrGULGl3xtt9ik9oAaqSQdF5Aur/ON4iNB0wFxdeq2oG9+PFBJSPooGbmOjjQoZRif
	 W+mJcmTkeynW7TIMiaiE5h5Uvg7hLOTUb8aSgiutEpw13EmupBFUHTi3/+Yozqfsof
	 G06QdLFYU5Thu3KXXba3mhvxn30pJBQboP2qTo493jllAnzHgO+Cv2oSrpPnPEBz0+
	 oIKpK/1JKzpFSesSvtuWCylh7kTNWONeaLb4KX1nY/umzQjBHYu5C+Kvdhdulj0GzB
	 zXfxSkOLZ2Dew==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mips@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Andrew Morton" <akpm@linux-foundation.org>,
	"Stephen Rothwell" <sfr@rothwell.id.au>,
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH 04/20] mips: rs870e: stop exporting local functions
Date: Mon,  4 Dec 2023 12:56:54 +0100
Message-Id: <20231204115710.2247097-5-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204115710.2247097-1-arnd@kernel.org>
References: <20231204115710.2247097-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

These four functions are exported, but don't have any users, and no prototypes,
which now causes warnings:

drivers/platform/mips/rs780e-acpi.c:35:6: error: no previous prototype for 'pm_iowrite' [-Werror=missing-prototypes]
drivers/platform/mips/rs780e-acpi.c:41:4: error: no previous prototype for 'pm_ioread' [-Werror=missing-prototypes]
drivers/platform/mips/rs780e-acpi.c:47:6: error: no previous prototype for 'pm2_iowrite' [-Werror=missing-prototypes]
drivers/platform/mips/rs780e-acpi.c:53:4: error: no previous prototype for 'pm2_ioread' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/platform/mips/rs780e-acpi.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/mips/rs780e-acpi.c b/drivers/platform/mips/rs780e-acpi.c
index bb0e8ae0eefd..5b8f9cc32589 100644
--- a/drivers/platform/mips/rs780e-acpi.c
+++ b/drivers/platform/mips/rs780e-acpi.c
@@ -32,29 +32,25 @@ static u8 pmio_read_index(u16 index, u8 reg)
 	return inb(index + 1);
 }
 
-void pm_iowrite(u8 reg, u8 value)
+static void pm_iowrite(u8 reg, u8 value)
 {
 	pmio_write_index(PM_INDEX, reg, value);
 }
-EXPORT_SYMBOL(pm_iowrite);
 
-u8 pm_ioread(u8 reg)
+static u8 pm_ioread(u8 reg)
 {
 	return pmio_read_index(PM_INDEX, reg);
 }
-EXPORT_SYMBOL(pm_ioread);
 
-void pm2_iowrite(u8 reg, u8 value)
+static void pm2_iowrite(u8 reg, u8 value)
 {
 	pmio_write_index(PM2_INDEX, reg, value);
 }
-EXPORT_SYMBOL(pm2_iowrite);
 
-u8 pm2_ioread(u8 reg)
+static u8 pm2_ioread(u8 reg)
 {
 	return pmio_read_index(PM2_INDEX, reg);
 }
-EXPORT_SYMBOL(pm2_ioread);
 
 static void acpi_hw_clear_status(void)
 {
-- 
2.39.2


