Return-Path: <linux-mips+bounces-7796-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E0412A3865F
	for <lists+linux-mips@lfdr.de>; Mon, 17 Feb 2025 15:30:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAE2B7A312C
	for <lists+linux-mips@lfdr.de>; Mon, 17 Feb 2025 14:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FB4223324;
	Mon, 17 Feb 2025 14:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="PNz8qJQE"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508102222D1;
	Mon, 17 Feb 2025 14:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739802629; cv=none; b=alHND+XlHgVQIqOpEfMcrLoLPwNOsmtIBhX2HZyMQosoTKO0mERPekL7UTxo/JDSMvq+wtz/cGS94Uy4rGQUZjn+FBIwO3grwGoyrPGW6Kz5EfImql4I2g8w113CFZPUQp1NCN2oXgAMW2uIPp84DbW9cChkHlCItGmF/BjpBs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739802629; c=relaxed/simple;
	bh=6W38HnMoM02FeD/4gKkUEkBfnJV8uKPHjWXFtps1n4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LsnFXIOnL4Js8DChSXQCAcJzrLEfYPluNZDuXyGoG7JrPSCgchYXU7ImvehAMJQp2kZ4Iispv+Qn1en/vSrvqE5u+SgXDD6TbrrmWEvKUoL+O0VSdg4rkspb4pi3kfBj5wDpjQyFMGETa5U/F/Bm2SzP6gbfv97Qe8S3HTPJw5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=PNz8qJQE; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739802556;
	bh=ICrYfIMdRyLi6bSIUaXAWF/Sg8ouynOQp8zGu6bv2lk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=PNz8qJQEnHDT6pjQR8Oyk7mh5VYopnjiN96EKE4C4IWEE+CSrhsvdbPIIKxOR+eob
	 WsKTHbTwotIh0xfyD6id7L4xVpgFyzCB6MQncA4Ap0WhmnOlRmCOWo/9X/T8A6J272
	 OwvRn9CM9EOOmO0FeqxJ+QPF18f3vQJ84EbyDgrI=
X-QQ-mid: bizesmtpip2t1739802545t9gehyg
X-QQ-Originating-IP: gl7iPpHAs8Isdwy+RYFXbYcLmrR6vcYt3rPJ3dUqAvM=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 17 Feb 2025 22:29:03 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14437388959003599824
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: chenlinxuan@uniontech.com,
	guanwentao@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	macro@orcam.me.uk,
	masahiroy@kernel.org,
	niecheng1@uniontech.com,
	tsbogend@alpha.franken.de,
	zhanjun@uniontech.com
Subject: [PATCH v3 2/2] MIPS: Eliminate Redundant KBUILD_SYM32 Checks
Date: Mon, 17 Feb 2025 22:28:57 +0800
Message-ID: <17393503EFD3A534+20250217142857.49414-2-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <8ABBF323414AEF93+20250217142541.48149-1-wangyuli@uniontech.com>
References: <8ABBF323414AEF93+20250217142541.48149-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MPAlP4yRn0xgrBQ8ixtC4LZjDWNuCl6ENFSYjEU1j4Gv629JDj6CXsMn
	e3W6YZkOPxzLn33jCqXfB8reVakrmL6AcmUToFcl8ZBNmQfN7vjxtlfDPGyy96BU09nIVrG
	Z+WldLTum0PzmVjA2jBthTjVToksdGcvsZzWCPuSBxeEt4CX1ztZv2EFQ4bFssEkd3YRhEz
	0rPTgof0d9jYJZWnee3Yi33mcA7+9QBckYharu7N21HNWfJVvQht+MLquqnPO64kSE9Ne0N
	9B1DIswoOt0KLgV298NOBDXIMha7F1oDn3T5RnsmFhLoySMRop4tsG3z6F6kiGx0PS8V0jH
	lLoPe3zLCN2FRjziDFXjaAdiZ98cpb8GvMQpdQurdSvjvMVDi7YcOYnKnHCdm/THeR5ZJSW
	KeMiG1M4zW9hb1RwnlqVEucrcW0MM9o9L/jDr+GnseVTFPnzJv+KcisKqUbLI4NIBEcI39B
	C8z+pw5fC3YzychC8brn0DTMZSF8QKitICxoDWbLchwk7SCC2NGqLbrPCsWj2PLpjkN0vtz
	dV9KpEYXTqi/LtmB6DX/0wK4OeTKNJEIkF0y/zIgu24dx5QDN/sQ7a0qfxJWWBSboxqS+HZ
	Q5GaiwIkSuf6OCEkIZB9Gh4m6vmrkwtDyXFxZKPirRTV8hCn6i+Wm4cFOy6IwrzULKMQRE7
	tHRJuoAiivETki7qYbukLj2KKA3K6Voi6S025kvRkO1ucQ2o9TJmiS2/G32D6eqQTj9xO4L
	ofGuAzXM0mF25GLOkAAKAzLORVFDgZwnUdPhWRpk476wLfL+BU0RnWKv88YNuPVXWHYzZMD
	ele+CNhOVpi4gnnlQwv6wTqcZy6vzC4jBRB8YWFAm+ZwkW6SJxMEpgsq8piNLAddrQOrBSt
	axCx4GtpyRFlQxNTHPYm7xDhEUKlZ3NaALQ1KlV0xro9Fr43aTvGR4y5BkvJCrPr8lt873m
	liOalRqh1/uX8o3GjXTofQ1pzub/kxhQ5wieOs5uEKkfAg3xXiEJ/+Dl8ZksTvlc1sKmCai
	sNTIGInLHeExgvQqKMYHbAPvYCtBWdz4OVi/FDjVE+LDaoOf2O
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

Given that KBUILD_SYM32=y is a prerequisite for this statement to be
executed, it's logically redundant to verify KBUILD_SYM32 is y again.

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 89928d6d4b5b..c302115ea42e 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -303,7 +303,7 @@ ifdef CONFIG_64BIT
   endif
 
   ifeq ($(KBUILD_SYM32), y)
-    cflags-$(KBUILD_SYM32) += -msym32 -DKBUILD_64BIT_SYM32
+    cflags-y += -msym32 -DKBUILD_64BIT_SYM32
   else
     ifeq ($(CONFIG_CPU_DADDI_WORKAROUNDS), y)
       $(error CONFIG_CPU_DADDI_WORKAROUNDS unsupported without -msym32)
-- 
2.47.2


