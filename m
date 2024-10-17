Return-Path: <linux-mips+bounces-6112-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 843379A1DD7
	for <lists+linux-mips@lfdr.de>; Thu, 17 Oct 2024 11:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC08FB21AFA
	for <lists+linux-mips@lfdr.de>; Thu, 17 Oct 2024 09:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4C11D88BE;
	Thu, 17 Oct 2024 09:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdUDBaVK"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D671D86E8;
	Thu, 17 Oct 2024 09:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729156175; cv=none; b=oFbRZf8CD4PhycNpfMlAzwkn6EgxDjWrcb98ya9d5N78zNcZgR9WFkTMwoiD5uVzWVI5btY1EmQGvcuI9TTLWr/YigiGw1BZJlal/x4RrlovXhD1EPtpnkMbVdmF0P+vpULupYonlvfysK2QKPFuPfku5fnTJeUyGVeys0pNlgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729156175; c=relaxed/simple;
	bh=ldl/RasFNZQ5YgMaPydcZJ7Hh2zw0fKAUiljrsCNmIM=;
	h=Date:From:To:Cc:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AR64sqrYu8LLKjqE07m7z+THpfcwYucCs51zfZfSXMNf4u5cDQTiKmD5HCxGUKY6syRBnwIFlU2CdLtKIBW2kKj5qFtxPql5N3PYJfygydqrEeT1+ySiuZIOAP3mDw19SQo+lo+xMGHamoEl1QFp8y7+Oyjmvv1HFCEnMgLedZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdUDBaVK; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20caea61132so5979475ad.2;
        Thu, 17 Oct 2024 02:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729156173; x=1729760973; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Eec8yX5jqfYde1qdt4gI/3nfvka4Nd12GR0NrSVq1CM=;
        b=UdUDBaVKQg0DjCIMpe+MIHh+XwsnHaazpzgyMlALYr9BQoe5uUKc75j+sNz1UEsZbL
         WSCWKV2N9H/uEXGXT/xg1pNHi24EiFT3YxnGN9f+9LJDzMcOCb/L6ld1fgHI2klztN9f
         tEGFQg+USWTasrbh2cVtvx8MPue4qi3by1cAx28kTbAap4m2nw8PxAJmqBky/rmDrQKF
         uBwd0/Y+zm3EKkyhFITNtmQXfOTO0PWAP1sCJmz1TFU0h/4/8g9K97MEfuVaXuxutho0
         ryD+8aElFuWC+PttTcNEo/AJFEWEGjXLsYMjjQMY5i6rsVK9SCmvRLd5dTx4BA9v51cm
         1QgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729156173; x=1729760973;
        h=content-disposition:mime-version:message-id:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eec8yX5jqfYde1qdt4gI/3nfvka4Nd12GR0NrSVq1CM=;
        b=JbYOFtx+GF8u7knVl+0Ir+BaCyGYa+OhTjJpLdmTyoFLADmWxisiML7HDM7ML+mpn+
         Sz+vHg1YmrcmnIXxpaR6kxZoiUaA5XYiP/4WHbVtD0vQm6J2Fq6Xe4dhOU5VhxSbC8n4
         4I8xHptdcOArv3gqleMaS2IUItVquY++ZxsqXwfWnd3JMb5uklUIic/K+03kdSg8ow15
         ORATpXgLep8plEP0Fjqj07zbir80/B2+5zGVnIZUV8uScPwWWsWGC1BeRAkV2ClT+rg4
         479z50V7rm67kCELPS1O2CdhgURVtzSNrjuIN58ij9XsZKczUQgu9ls8Gdo8sIbvLSmy
         ZPRg==
X-Forwarded-Encrypted: i=1; AJvYcCWjB/YqO53ga0gAUkgekKQgFHOwgyJnErwhjMyDLHZBTFTTnEpz6zaU+09ahw8VEvnSZIBqzu5pEfMbVA==@vger.kernel.org, AJvYcCXv+JurJaf073eFDQvrOgn/8F0sMmcvYm7khiKsfSbLM77LWbO3Jyvk9cT5qdd2mLguqIIZCrFRtKKGnUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwhEcgFR5ZH2CRRiy2GILoVQnKZBzBT1+TbwWdfnDBDD6++FbW
	k/Cs/kOZtGrQNLkcrPVUVzGRZw0SQ2QvknfHtC0QzID7wFCsbxlZ
X-Google-Smtp-Source: AGHT+IH3Jhdv3glHCRRvbBvlYsZdxfZbuyZWOzbA4+Isb5CGThsdSgWKt0/AQrp1fPRugJt4x1AbkQ==
X-Received: by 2002:a05:6a21:99a1:b0:1d8:ff5e:7fa5 with SMTP id adf61e73a8af0-1d8ff5e7ffamr11993163637.28.1729156172995;
        Thu, 17 Oct 2024 02:09:32 -0700 (PDT)
Received: from mail.google.com (125-239-144-11-fibre.sparkbb.co.nz. [125.239.144.11])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea9c6ba2a8sm4570341a12.6.2024.10.17.02.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 02:09:32 -0700 (PDT)
Date: Thu, 17 Oct 2024 22:09:26 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: tsbogend@alpha.franken.de, bvanassche@acm.org,
	gregkh@linuxfoundation.org, ricardo@marliere.net,
	zhanggenjian@kylinos.cn, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: paulo.miguel.almeida.rodenas@gmail.com
Message-ID: <ZxDURnNKjNOgvPtJ@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

linux-hardening@vger.kernel.org
Bcc: 
Subject: [PATCH v2][next] mips: sgi-ip22: Replace "s[n]?printf" with
 sysfs_emit in sysfs callbacks
Reply-To: 

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


