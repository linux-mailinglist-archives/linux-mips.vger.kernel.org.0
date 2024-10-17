Return-Path: <linux-mips+bounces-6114-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C0C9A1DEC
	for <lists+linux-mips@lfdr.de>; Thu, 17 Oct 2024 11:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15B951C2179F
	for <lists+linux-mips@lfdr.de>; Thu, 17 Oct 2024 09:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B7A1D88B4;
	Thu, 17 Oct 2024 09:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzhZNiFH"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01191442F6;
	Thu, 17 Oct 2024 09:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729156432; cv=none; b=bIOoUazGk3+k1737gCvbBLJoVd4+U9xDVFQzdi28JJgEWnPzP26lIXlO1Zpzznv5rFSsIth6/rEI1YncDdLF0EDHr/YE9/hEn75eYpdBi7Z1fEkCyjMU6HvyQykJLvxUwbDChCJIdzKfNCRbb/RNvLqi5QyvhHiYfx7h4LekJuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729156432; c=relaxed/simple;
	bh=6B56F/7gGKWcaxA+AMvOG3Bsj/8V7vGGsAc06OtW1Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sxVMiuNhXns1td8t3ACgbyVGxvrdQhnoK7AH4OYzh1QWmh3WjpnzibcLT8bFR5VB2+lzCQQz4sdo+MrcabBuAo6I/rOmLcWnAkjijSITS+VxHWj5TcvX5NKbkzZjb0caUU3f0ScI8CGCsBfqkiJOP4xVHU6FkKC/oPDUCyYiLkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzhZNiFH; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20c77459558so6345635ad.0;
        Thu, 17 Oct 2024 02:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729156430; x=1729761230; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QnDW4UWPXXutZ1QDoKHkijshs1CsONS/w/tjSEp29Ow=;
        b=DzhZNiFHW37dxR4aJ8kO4lALUm86VGsztXgJpqCLoRQVU5H3RlFHUiIfVP7NBvQEdA
         NNKdmTbL9Qi6nlxs9ZlPDszpuZm1tH7oboN8yJzLqkfdILPplJq6S65iri+7VozmTQpv
         ku0HbrpptrxMER01Swp4RNtaDmAH0338g7pdgnUegRF7qM5HYjWpLGCX28/0GQ1f05cJ
         1nCbAyPWJcphXb2eUvulgia4g7BZUUc8eXlk+Pp3+i+1ewSIkT1vlc8l4GzOeaZJ+X+3
         EopZXAFBcybnBcD3tI2Mtf1L9jGPMwzHguT9FmTS9rD3F+ZXIrGSME5NUDgRqRknPGad
         lTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729156430; x=1729761230;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QnDW4UWPXXutZ1QDoKHkijshs1CsONS/w/tjSEp29Ow=;
        b=TDE8kcQaejCeamrCmYz6ZiaPIzmnTpyvP+Lr08RhFlvCpMAq7K/M2hHEybzlsPkhk9
         pqxY9eww21ZjLAcxVGnTXT3VZe+8VGlkvM19gqdNwR0IUuvBy+JXyNyJt8klelvoU/QH
         AKkcnPWoDJVab6lwd8kwm3aApZMZeMFl350TCFXM0xu6csgJwJlnGLqBtVN35gLuyGAs
         lEpq3Q/CuOXlh8CAW8DojiSy3R15mN2YEUx0rjh+r2e2fialQJxnB8I1XxA1Z9PluSoo
         PJcaWfs30FMJDpoi2+weGFxaCFnkFghva7wBHmSUeBW/FQ1EMFsymFcI49q0dWEDCzCe
         LthQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNl5CPhjTK/896b2xtQTnpzBHu1NqVH4FtHXhXP1SAy/z00kLRrPbeWPupHRfjXpSB88jN6ZXy8/Ih42Bg@vger.kernel.org, AJvYcCW4M4dTJsjJG4Ojf9LJoTa555GqXrg/Nm9i9L62NXzLgp+FfCyO0CjWxG7o0eqtmwjWrQWlLfOdyyeK9Q==@vger.kernel.org, AJvYcCXt0ooazqIs70I1ApKYO6pg4H1M+7AgXC9dsFRsrsAU6m5M4sVdbol4qoc0wdzxNXID2oT6aHVCcO7NrbcMzus=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBnVJzwWoS4lBx0IBTNr82aXqop2MInZhSA/ET5DLmjGgq6EtM
	78O4/fu/fBaNYam5QGQSj5miAINzkFqNEFcYZFIGRk0HDIPiphdf
X-Google-Smtp-Source: AGHT+IE4YIqZAjh2RM9aiRS2XVdzVST4w+5ARVIJ4Q6/br7ZWK8Q0aQUqsm0LCRu9Uf9AOOjGTnjcQ==
X-Received: by 2002:a17:903:190:b0:20c:f648:e39e with SMTP id d9443c01a7336-20cf648e4f7mr165674215ad.58.1729156430094;
        Thu, 17 Oct 2024 02:13:50 -0700 (PDT)
Received: from mail.google.com (125-239-144-11-fibre.sparkbb.co.nz. [125.239.144.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1804b5e5sm40592205ad.197.2024.10.17.02.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 02:13:49 -0700 (PDT)
Date: Thu, 17 Oct 2024 22:13:42 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: tsbogend@alpha.franken.de, bvanassche@acm.org,
	paulo.miguel.almeida.rodenas@gmail.com, gregkh@linuxfoundation.org,
	ricardo@marliere.net, zhanggenjian@kylinos.cn,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: paulo.miguel.almeida.rodenas@gmail.com, linux-hardening@vger.kernel.org
Subject: [PATCH v2][next] mips: sgi-ip22: Replace "s[n]?printf" with
 sysfs_emit in sysfs callbacks
Message-ID: <ZxDVRru_o_5nqGl5@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace open-coded pieces with sysfs_emit() helper in sysfs .show()
callbacks.

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
Changelog:
- v2: amend commit message (Req: Maciej W. Rozycki)
- v1: https://lore.kernel.org/lkml/Zw2GRQkbx8Z8DlcS@mail.google.com/
---
 arch/mips/sgi-ip22/ip22-gio.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/mips/sgi-ip22/ip22-gio.c b/arch/mips/sgi-ip22/ip22-gio.c
index d20eec742bfa..5893ea4e382c 100644
--- a/arch/mips/sgi-ip22/ip22-gio.c
+++ b/arch/mips/sgi-ip22/ip22-gio.c
@@ -165,9 +165,8 @@ static ssize_t modalias_show(struct device *dev, struct device_attribute *a,
 			     char *buf)
 {
 	struct gio_device *gio_dev = to_gio_device(dev);
-	int len = snprintf(buf, PAGE_SIZE, "gio:%x\n", gio_dev->id.id);
 
-	return (len >= PAGE_SIZE) ? (PAGE_SIZE - 1) : len;
+	return sysfs_emit(buf, "gio:%x\n", gio_dev->id.id);
 }
 static DEVICE_ATTR_RO(modalias);
 
@@ -177,7 +176,7 @@ static ssize_t name_show(struct device *dev,
 	struct gio_device *giodev;
 
 	giodev = to_gio_device(dev);
-	return sprintf(buf, "%s", giodev->name);
+	return sysfs_emit(buf, "%s\n", giodev->name);
 }
 static DEVICE_ATTR_RO(name);
 
@@ -187,7 +186,7 @@ static ssize_t id_show(struct device *dev,
 	struct gio_device *giodev;
 
 	giodev = to_gio_device(dev);
-	return sprintf(buf, "%x", giodev->id.id);
+	return sysfs_emit(buf, "%x\n", giodev->id.id);
 }
 static DEVICE_ATTR_RO(id);
 
-- 
2.47.0


