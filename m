Return-Path: <linux-mips+bounces-5127-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D01961CAE
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 05:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7D2A28535C
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 03:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220BA13C3D6;
	Wed, 28 Aug 2024 03:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="Tzxk7EE4"
X-Original-To: linux-mips@vger.kernel.org
Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67921142621;
	Wed, 28 Aug 2024 03:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724814290; cv=none; b=suOfZKqQyZIA9afvTVWhBKB6W7Q4jgAXun30RvZd12tYcUOTXEhfsYXoivN3iCxtj5xo+SaWqu9eXbNos/RMAxjRkjVr5QqOOvJRLHFnuyAEqHkE96YJXd5uOuWs4U0vB4YjGuQ1ZxaiPoVKUMNuV4EWjE0WMR8tpomDk35dsgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724814290; c=relaxed/simple;
	bh=lz0Wl6tXkfl8pfna/ISrsfq89jz1pL2rKhpWawBA1/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jmE991O1js2cwOQdnbD7BhEHZ3wI/sx9JoxbYYE5CokZE1PD5FR4OlrllFlw153w627BaMvVnu9IyEWM4rGI37SYJuKwmldI2xVCV4wVtAz8tYRGsgnBOSDQPtxkKdmZDtchmnjOImKpqWWcvBgY+iERP05iM25g62pwTQHhpgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=Tzxk7EE4; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1724814286;
	bh=lz0Wl6tXkfl8pfna/ISrsfq89jz1pL2rKhpWawBA1/c=;
	h=From:To:Cc:Subject:Date:From;
	b=Tzxk7EE4SjJ059ZJn7YicbwJYV2R/ycSQo4u9H1EIsbEDEmDq2GlmC4IoLePVXwxV
	 36oEAOhYGckxB/kwLb2RNmbuoytSWUKS9ya5tiRYwdkeKjZ4aRr0oGBNkU5ydlPHGy
	 2B+7hp9aVNbpB9kWwJpQDA30Lv7VyxRkEu4WUXIk=
Received: from stargazer.. (unknown [IPv6:240e:358:11b0:4f00:dc73:854d:832e:3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id BF0F36656F;
	Tue, 27 Aug 2024 23:04:43 -0400 (EDT)
From: Xi Ruoyao <xry111@xry111.site>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH] mips: Remove posix_types.h include from sigcontext.h
Date: Wed, 28 Aug 2024 11:04:14 +0800
Message-ID: <20240828030413.143930-2-xry111@xry111.site>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing in sigcontext.h seems to require anything from
linux/posix_types.h.

It seems only a relict: in a Linux 2.6.11-rc2 patch [1] the
linux/types.h include was unexplainedly changed to a linux/posix_types.h
include.  I can only assume it was just an error.  Finally headers_check
complained "found __[us]{8,16,32,64} type without #include
<linux/types.h>" and commit ae612fb05b0f ("headers_check fix: mips,
sigcontext.h") added back the linux/types.h include, but it didn't
remove the posix_types.h include.

Remove it now.

[1]:https://kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.11-rc2/2.6.11-rc2-mm2/broken-out/mips-generic-mips-updates.patch

Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 arch/mips/include/uapi/asm/sigcontext.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/include/uapi/asm/sigcontext.h b/arch/mips/include/uapi/asm/sigcontext.h
index d0a540e88bb4..d10afd13ee5b 100644
--- a/arch/mips/include/uapi/asm/sigcontext.h
+++ b/arch/mips/include/uapi/asm/sigcontext.h
@@ -56,7 +56,6 @@ struct sigcontext {
 
 #if _MIPS_SIM == _MIPS_SIM_ABI64 || _MIPS_SIM == _MIPS_SIM_NABI32
 
-#include <linux/posix_types.h>
 /*
  * Keep this struct definition in sync with the sigcontext fragment
  * in arch/mips/kernel/asm-offsets.c
-- 
2.46.0


