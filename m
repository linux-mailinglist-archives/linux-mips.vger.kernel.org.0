Return-Path: <linux-mips+bounces-8028-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5133A487E7
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 19:36:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98C593B5360
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 18:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29A7199223;
	Thu, 27 Feb 2025 18:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JF3XOS5M"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8054717A303;
	Thu, 27 Feb 2025 18:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740681398; cv=none; b=IeK4Rkzo6C3t9XT5EF3a3/M55c8iMAQqg4WcrfBQYQT0EgnHzG8U8PLHY2+Fe3QF9dx0VFAwmQW2zhg8cPjRvpjJwvlAk5QiPiaw1m7l9wXtuIitS2LjfvjRmrC6youYcP02TxSIAdFAB5GIUT7/VPGU57luc0KryVTUtfipkDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740681398; c=relaxed/simple;
	bh=qGam9q2Wb8/VVNVvHNeMZHt9Ml2j0ZC7vdhzuxX/ZWE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RrEN5472Hj9+KYRzha651ewEdpezIE6Euq6Bx49F9mBSrv0NQtRs5kP6K4JpMhW5cjZdeuJ55d9q8i0Bf5upwNKxtlWb/tK7XZigU+p/eyaYKvealkJ/oeM1nXnTnfRd1gBgJtcwBceXmX2ex6NAmhU/GBuno/4qnQXQvZ1wWSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JF3XOS5M; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2211acda7f6so31022465ad.3;
        Thu, 27 Feb 2025 10:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740681397; x=1741286197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QpIlxxPEai/SDn4PIrxxbnvGT1Avpr1LrIq94eXJgOg=;
        b=JF3XOS5MdT6qrfAfRw7ZDLUPoRT7pul9MyVtrnVxeeV+ZwoTpJKwVMPJPP5YAPOx5a
         raORxgmAUw1VkT5M5/TyHLODNZK/03tfGLmqbsoXb+Ns8GHvSk7HUWNWwSkD2psN7nJ0
         /kH2WzOyhEvJHMd4mGWmfcXRNa7thCxd17hTFxgHmNSAbblSpAWNYX+piskmuIZzVTVn
         LTnpBcUTOjH4QE7Yw2ppF8J/BuK7pOjVhnP/PVnXoqGv5lkovFkzLjIsKFSMkaNRzXkw
         8JH/o58AJeLT+nj55DMtPpuG0FttOy1GSdLMMsItYYsDaufp2+zufNWe1StTcZLC/rSC
         G8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740681397; x=1741286197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QpIlxxPEai/SDn4PIrxxbnvGT1Avpr1LrIq94eXJgOg=;
        b=DrmCNEGBLPiEx7aRc5D7G7LFnumWrxQEDIiIQBmJPWo+awPmVQ7AnFBAHSy/+jfaVO
         yO0CGzZRNSsc54XQIPZPUeYCSK0pLZcxwopX5FiUKDHUt6WYLo3iV/hzQ9e1mqsm+YQW
         q97G+iyKa7ZL7SazlzstWj4KAffjLxVVlfCRK1qA9doOUb9QoG6dq1d8Jcwyd0gq4qwL
         JXk5Wca/SaSEHeNIlIoLC1tsADysDPNbVc1hY+HmBQBQm6WgWXFaim6SebJamH6nGCjb
         nAjDTnUSVxwnMN5zo2hLC4Mt9oFV/8vkSF+qe4432wIQi8dGaAFLN0JhZ8ag8Y8znZuP
         YREw==
X-Forwarded-Encrypted: i=1; AJvYcCWBcYeurs6He42xov02gTP68zPO6vbETnpoygD8uhoiCvZaTncBWdoBkjFO29BCsZ659HstqVJG9+pwpss=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPEOPiwWOutJnf9EqUAx4Djyn0Bg0AKA+ze7XtZc3hytlzPDeT
	qNPqhCJQHrgt7tKMCLGCOCwXl2nMftCvdujOCw1/E5IODPbEYEaB5t9KWQ==
X-Gm-Gg: ASbGncsBgOWdtbkiqbBDnbmSpdJ7irih3isiiyOFqM7MB+DRpufEfcpc1QNHXJWT/CH
	DLzi6narmIAsm2fRjrJxKgFYhkZKUIuj2XUtOaWhnzvBXcJClkoFqKsg0S56uFpI6qnh1GLOkfp
	GGSVYeDfzjqGK01FjOUnLU26P/N5skrIAErQVhs0TOyhpeRHL7SwPohsCFiCW2WQF2z1JeWENCv
	BJxPe1yuaA93hG+EJuF2K1f6ERDXdGJCxi48NJBzx8F/hI23+UcU5r/zm1/4qMgBUo63KmLYskb
	H4WLr34Lp5FxEM3chZN7tVq8CP2ZWpR7y8Eg
X-Google-Smtp-Source: AGHT+IG6rRWnF57hS836EW9gX5+d7s9O45VdwXJEMzi2XPiXXEc1SPVloTwINp9oRbk1GJfJ7mv4pw==
X-Received: by 2002:a05:6a20:c998:b0:1ee:c7c8:cb0 with SMTP id adf61e73a8af0-1f2f4e72965mr200189637.38.1740681396572;
        Thu, 27 Feb 2025 10:36:36 -0800 (PST)
Received: from embed-PC.. ([2401:4900:1cb5:84b:96dd:21a7:7ff3:7964])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7ddf29e9sm1831809a12.10.2025.02.27.10.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 10:36:36 -0800 (PST)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Fix Macro name
Date: Fri, 28 Feb 2025 00:06:28 +0530
Message-Id: <20250227183628.7915-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing underscore in PCI_CFGA_BUS macro definition for consistency.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=219744

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 arch/mips/include/asm/mach-rc32434/pci.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mach-rc32434/pci.h b/arch/mips/include/asm/mach-rc32434/pci.h
index 3eb767c8a4ee..e17ce82d02ba 100644
--- a/arch/mips/include/asm/mach-rc32434/pci.h
+++ b/arch/mips/include/asm/mach-rc32434/pci.h
@@ -167,7 +167,7 @@ struct pci_msu {
 #define PCI_CFGA_DEV		0x0000f800
 #define PCI_CFGA_DEV_INTERN	0
 #define PCI_CFGA_BUS_BIT	16
-#define PCI CFGA_BUS		0x00ff0000
+#define PCI_CFGA_BUS		0x00ff0000
 #define PCI_CFGA_BUS_TYPE0	0
 #define PCI_CFGA_EN		(1 << 31)

--
2.34.1


