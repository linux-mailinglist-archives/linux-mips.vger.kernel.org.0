Return-Path: <linux-mips+bounces-9206-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA08AD3960
	for <lists+linux-mips@lfdr.de>; Tue, 10 Jun 2025 15:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E12EF3BC51F
	for <lists+linux-mips@lfdr.de>; Tue, 10 Jun 2025 13:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803E511185;
	Tue, 10 Jun 2025 13:28:12 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FFD246BCA;
	Tue, 10 Jun 2025 13:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749562092; cv=none; b=E0F1nBQR4FgqTTMNUd7lrarES9ioGOl19gj9SftW4ONqh4XTy12gtGZVahkoQywdfBSqds8oAJO+2Nx6UQaGeqwdT9l3qR/7ON2ULonW3/MMAZCn1O5DYpdMb38q5P9op86SK8XbqHEvOyoM1MJ8bT3IojX02ygouIfh/xpli9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749562092; c=relaxed/simple;
	bh=+L3jzkKnWIUuLdXlGGfp+Ll4nStf0dlE2KK1RyXsqjs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=laJbm+qFIMT0Cl33uf+cF8rFjFBBbmOAOrmvg+j7cMUeveQhpk9ONklLMPHWvevR+pm1ctpispf82gNl+m9NAGjG/2STJ4JwVZ/VkXE14F4/tbNglT+LJQjO7UzufsDgBZkJT8pzGics3NAvG81kBMbnoGe94Frc1m0zuznEk78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB99C4CEED;
	Tue, 10 Jun 2025 13:28:08 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] MIPS: txx9: Constify bin_attribute arguments of txx9_sram_{read,write}()
Date: Tue, 10 Jun 2025 15:28:04 +0200
Message-ID: <ff858783dd1a716f2ca661fb4a814fad8cb1480a.1749561996.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If CONFIG_MACH_TX49XX=y:

    arch/mips/txx9/generic/setup.c: In function ‘txx9_sramc_init’:
    arch/mips/txx9/generic/setup.c:839:32: error: assignment to ‘ssize_t (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, loff_t,  size_t)’ {aka ‘long int (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, long long int,  long unsigned int)’} from incompatible pointer type ‘ssize_t (*)(struct file *, struct kobject *, struct bin_attribute *, char *, loff_t,  size_t)’ {aka ‘long int (*)(struct file *, struct kobject *, struct bin_attribute *, char *, long long int,  long unsigned int)’} [-Werror=incompatible-pointer-types]
      839 |         dev->bindata_attr.read = txx9_sram_read;
	  |                                ^
    arch/mips/txx9/generic/setup.c:840:33: error: assignment to ‘ssize_t (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, loff_t,  size_t)’ {aka ‘long int (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, long long int,  long unsigned int)’} from incompatible pointer type ‘ssize_t (*)(struct file *, struct kobject *, struct bin_attribute *, char *, loff_t,  size_t)’ {aka ‘long int (*)(struct file *, struct kobject *, struct bin_attribute *, char *, long long int,  long unsigned int)’} [-Werror=incompatible-pointer-types]
      840 |         dev->bindata_attr.write = txx9_sram_write;
	  |                                 ^

Fixes: 97d06802d10a2827 ("sysfs: constify bin_attribute argument of bin_attribute::read/write()")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/mips/txx9/generic/setup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/txx9/generic/setup.c b/arch/mips/txx9/generic/setup.c
index 0586ca7668b42eaa..5a37e8b234a39c14 100644
--- a/arch/mips/txx9/generic/setup.c
+++ b/arch/mips/txx9/generic/setup.c
@@ -776,7 +776,7 @@ struct txx9_sramc_dev {
 };
 
 static ssize_t txx9_sram_read(struct file *filp, struct kobject *kobj,
-			      struct bin_attribute *bin_attr,
+			      const struct bin_attribute *bin_attr,
 			      char *buf, loff_t pos, size_t size)
 {
 	struct txx9_sramc_dev *dev = bin_attr->private;
@@ -791,7 +791,7 @@ static ssize_t txx9_sram_read(struct file *filp, struct kobject *kobj,
 }
 
 static ssize_t txx9_sram_write(struct file *filp, struct kobject *kobj,
-			       struct bin_attribute *bin_attr,
+			       const struct bin_attribute *bin_attr,
 			       char *buf, loff_t pos, size_t size)
 {
 	struct txx9_sramc_dev *dev = bin_attr->private;
-- 
2.43.0


