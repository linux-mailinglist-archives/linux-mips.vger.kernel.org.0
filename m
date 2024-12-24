Return-Path: <linux-mips+bounces-7182-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AB39FB9AE
	for <lists+linux-mips@lfdr.de>; Tue, 24 Dec 2024 07:12:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74483164566
	for <lists+linux-mips@lfdr.de>; Tue, 24 Dec 2024 06:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340B11494D9;
	Tue, 24 Dec 2024 06:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="RVXu0FEv"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F641487D5;
	Tue, 24 Dec 2024 06:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735020761; cv=none; b=X/9MDL2cxhmNEYlHTVEVgHtAtebZsNnwn7CcnFhXkypydPMzPCZWUFJbEoX6wgvOAfXkckZL4q09HLWENUyO8gmB4fx4zoJq5JEF0z/ENoAgfBVRePcx5XLbmQ5S5ZaPZb9P9Oy8OVNN4ssOCks8zzfsuBs1aymipslp3nNx3a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735020761; c=relaxed/simple;
	bh=0KwGciMbbMIvdCsfeKFBeBug/lObwJGpllXY4dqmF5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vBsqEURYh1h1ZgGHcwZ8iJHV/vfaVZ6EzE9dc6EStxWxBOitReMV4sUv9TsQSFqy4xnAqb/FZLmRgJApb3TALTxO3B9W7U49thAWe0HOVnnUPY91smhY0zkHuxJCzLU6d+pThs0mql4E9XnJvyp4yETwUgaECtgFoNhSr5ESABk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=RVXu0FEv; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1735020688;
	bh=IAzDc9MfMmq2YmPNIrP/dODV2uxxUZPudpTQKPDJALc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=RVXu0FEvUlfdLeWm30nHmY7kJS2FwoQOzdydFq2axEfLGWMkrauzunPSc1la3wqdz
	 LQiB6jEuqYi/nd1yJswnl9DGvq5QmXJ3HdscsroDt7zIZ22K8PmLSzw8BxeaGrpl0+
	 dBI7Cg5Pvm3/N/i0U0fBb1VQYLy7I/yatu+UFlYI=
X-QQ-mid: bizesmtpip3t1735020648tlxa9hx
X-QQ-Originating-IP: tPZRCzswTjBVcac3tacxG9Z6CVY2UcrpN8n8sRX2X9E=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 24 Dec 2024 14:10:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2400545881246479525
From: WangYuli <wangyuli@uniontech.com>
To: gregkh@linuxfoundation.org,
	sashal@kernel.org,
	stable@vger.kernel.org
Cc: jiaxun.yang@flygoat.com,
	tsbogend@alpha.franken.de,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	guanwentao@uniontech.com,
	baimingcong@uniontech.com,
	revy@deepin.org,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH 5.4~6.6] MIPS: Probe toolchain support of -msym32
Date: Tue, 24 Dec 2024 14:09:18 +0800
Message-ID: <183F7B3F0A07AC93+20241224060918.15199-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NSEFX6u+4l+K4yINnM6/bA/Wp3DrEuPgE13xTNC2cF0kKRo09Nvttn3X
	gkyynssj37O0TD7CIx+YWHyVb1uuKsM8QB68al9IvwuYtWSWdUXYmYeIH3swrTVG/Sv5U1B
	ohrTt12PcD4rvCGspDP2XcDGHhpg39VrvbzBG/nefM5kajWo6k8d9PiyxNBDZci1SSSxmMa
	YhcrFK/GMr+blq47ZFrV8Xiurm7v8JSgyZ9aibRQlgHT8dxcqnDPjxfU38O5D1sCzUEe+MQ
	PWJP3VHJ9Nxc3LzOda6g6z3mDuXMkDA+m6KV8XJNG+1Bf8R8c4huKMoF8X4eFEuTifIGBR1
	5YSVvmprKqVBNQbJ8T3cqNEyQ6IQ/7+oFJaglZcANYz7XX4LUMlcAc+CQlz3byWBGFuPVxS
	5m/qycf2qZU9DDoWJuop/Zpvvh4XfP/i6dc4DuK20JIyyK9gNy1+1+JOH05xuEP9zWVfi3Z
	5FcTTt/Gj0/AUXzHP3DzgEmlFsq19r+NNRAx4gFDvtoYkdWr2DmZiHgevOx8e84ARQIbN81
	fxK78Id84kHfUI6l+sK674QWqqzVoPuE7HhXeVLcbHQOgiJjq2I7e79965XT/7D+it+RbYm
	cb3FmxinPQoUVCukgDCnR0GtLxoaqBHdSwG7b+y9UY6j6cs9F0C0JVZTnvHV77xR13bCqHZ
	BWnzjNXtBGREDP/NJvZ7XcFkeMvitwGzqaEM+BiTwzLM7yIsgpHPSDXIB3TOniPiH/jBeRK
	c8/dcQvIGEMrcZR3mApcuQJVof8xfLUrqlcBd4Zh1QclywucoFpZoFTTDrfNOFeqjJOfo5B
	Tmo86kVwrfk0DO/UQp1qqXO4hxjaF1qNwat6wJuns71c2N6/5NNP8gTulhiSsuCt0cJ9glk
	ALl1V+OiwurOkch6kAF5lo+D1eJ45vV4C9xdLBqA7Y7HsvrA7TSlVTn2gXYOD77EzD/zP+e
	A6WIY2VVR7opq3ztQwQj6HRoIheKqeblZlzc=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

[ Upstream commit 18ca63a2e23c5e170d2d7552b64b1f5ad019cd9b ]

msym32 is not supported by LLVM toolchain.
Workaround by probe toolchain support of msym32 for KBUILD_SYM32
feature.

Link: https://github.com/ClangBuiltLinux/linux/issues/1544
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index f49807e1f19b..0888074f4dfe 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -299,7 +299,7 @@ drivers-$(CONFIG_PCI)		+= arch/mips/pci/
 ifdef CONFIG_64BIT
   ifndef KBUILD_SYM32
     ifeq ($(shell expr $(load-y) \< 0xffffffff80000000), 0)
-      KBUILD_SYM32 = y
+      KBUILD_SYM32 = $(call cc-option-yn, -msym32)
     endif
   endif
 
-- 
2.47.1


