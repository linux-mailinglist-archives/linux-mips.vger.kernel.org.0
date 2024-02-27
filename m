Return-Path: <linux-mips+bounces-1795-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 874EF869868
	for <lists+linux-mips@lfdr.de>; Tue, 27 Feb 2024 15:32:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B34AF1C2172B
	for <lists+linux-mips@lfdr.de>; Tue, 27 Feb 2024 14:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F0E145356;
	Tue, 27 Feb 2024 14:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vWr8qZTc"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6B113B2B3;
	Tue, 27 Feb 2024 14:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709044273; cv=none; b=rgMOOI/EfyuXhG57iXYGrUd9dg3tcg1FC+7L0PpUAeqZ1BAsyOqIRsbHTOqvpANuzO96y1jIsZPahz3fvKcd2ZLp8VLzyJ3mvKRoqzEzLtryqG7aOVQFPCJYrbx9I/TNDut1t95/4wYiLC6LCSarj3ncml4iMU/fLC3RgnEkdhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709044273; c=relaxed/simple;
	bh=yOjjXP4HCgGl1XepcSpUCqX/BLcyTWE1cdpJFoU1Sak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PPM/mVNbr80V93aIVweussXi76SxzGEZo4CLRC60taE6jkB2VFY5W0/2jr2WuY1zqvtoNOyAbLN4MlxAp1PSjsOguWaBwBVU2bKdHSpp65p8Y+tYhnetJgYBTm5XAES4di7dPctwoCIphVVTscdkdB44ZGrVfSPFl3pUyo6UHUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vWr8qZTc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F5BC433F1;
	Tue, 27 Feb 2024 14:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709044272;
	bh=yOjjXP4HCgGl1XepcSpUCqX/BLcyTWE1cdpJFoU1Sak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vWr8qZTcOwWDf68DSAxixvkFQIZDqSWn76NfLacOP11jfyRB0Frr5RIzUME/feMha
	 j+TfEnQijaQkafM+wQJob8FMF2qKo1MDQvU8HeQ9nxOsQQa6FA34N6DkABCxIO7NUA
	 mYQxeiA/+TIWf263hZlNglTRgk+yONELFeVVUrOQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	kernel test robot <lkp@intel.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.10 103/122] scsi: jazz_esp: Only build if SCSI core is builtin
Date: Tue, 27 Feb 2024 14:27:44 +0100
Message-ID: <20240227131602.076412471@linuxfoundation.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227131558.694096204@linuxfoundation.org>
References: <20240227131558.694096204@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

5.10-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 9ddf190a7df77b77817f955fdb9c2ae9d1c9c9a3 ]

JAZZ_ESP is a bool kconfig symbol that selects SCSI_SPI_ATTRS.  When
CONFIG_SCSI=m, this results in SCSI_SPI_ATTRS=m while JAZZ_ESP=y, which
causes many undefined symbol linker errors.

Fix this by only offering to build this driver when CONFIG_SCSI=y.

[mkp: JAZZ_ESP is unique in that it does not support being compiled as a
module unlike the remaining SPI SCSI HBA drivers]

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Link: https://lore.kernel.org/r/20240214055953.9612-1-rdunlap@infradead.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: James E.J. Bottomley <jejb@linux.ibm.com>
Cc: Martin K. Petersen <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202402112222.Gl0udKyU-lkp@intel.com/
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/Kconfig b/drivers/scsi/Kconfig
index 6524e1fe54d2e..f59c9002468cc 100644
--- a/drivers/scsi/Kconfig
+++ b/drivers/scsi/Kconfig
@@ -1289,7 +1289,7 @@ source "drivers/scsi/arm/Kconfig"
 
 config JAZZ_ESP
 	bool "MIPS JAZZ FAS216 SCSI support"
-	depends on MACH_JAZZ && SCSI
+	depends on MACH_JAZZ && SCSI=y
 	select SCSI_SPI_ATTRS
 	help
 	  This is the driver for the onboard SCSI host adapter of MIPS Magnum
-- 
2.43.0




