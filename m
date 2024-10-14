Return-Path: <linux-mips+bounces-6048-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EA699D8B3
	for <lists+linux-mips@lfdr.de>; Mon, 14 Oct 2024 23:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07F20282CE2
	for <lists+linux-mips@lfdr.de>; Mon, 14 Oct 2024 21:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF72F1D0796;
	Mon, 14 Oct 2024 20:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alsz2hBX"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5099E4683;
	Mon, 14 Oct 2024 20:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728939599; cv=none; b=dnYalKaDtG9wvvxDi3+FmMAuF5i3nCpcBcpjpO8cBAZtFWvYqYxYWO7HpB3Ee9IG2VL2ty2S/qb1waFzRTGcy8KtmmNihWuvKNoJYfUfV5r1Ic/oZTAn/d2MP2z/scAsgL/UzZK8ZjC6qSF9rxmrTze1Ohkz9d8RIJd3sJ7DuBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728939599; c=relaxed/simple;
	bh=O4DmmGylfXBJYiWsSMC4LbN9Qv8RP/S5E+FZsJP9sjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=usdYM8HQcACstXbzpN0i+M86BjxsVOYBEkjOsE3l2FaZBQ1IanWjb70AlIfU0xWl26AysdahVRldrjKFDkBJ9q6z0TJ5jENsc8F9Ht0lM/pp3SIJLy6nE6nBzLjiHGyj7jUoYfwSbd7yq070AVJAGglrxYYK7ylzq6xWB5tJT0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alsz2hBX; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7ea68af2f62so2097233a12.3;
        Mon, 14 Oct 2024 13:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728939597; x=1729544397; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xx54rz5ibmRnwq2nw0OP3IaKu3j9E7Cgmn6RUjik8Ks=;
        b=alsz2hBXWw6c2zjQj3FUK6RD3ImfHWKCv1WbzWM71i5oQm8Iknq27icgKYx7Qvd7EF
         Mif20xV4yvOoJDBvK53rCiGeH3qoX3lo94pOOiA8DiX3UhWMpbttAEzP/9i5ev5D7gBC
         ljhgBANsnoLsKXXyLtuDgrQjX2ICWmVItqzQ5uh2YD76PkMRFUptwlJQ6MLVaSAOGFRJ
         FWotdYZRPlcay3u6vKLnjI3OOHnAoczRdMZ6zYj9lfakx/AddNlIZPpaviYbwz2NtmNo
         F+9aURNy5U9sjdGbMBEpaAupjk48TyVe6J8TVMTRsfyKeNmMsuY3E02FJfHYgS3PJ+Qo
         Shfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728939597; x=1729544397;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xx54rz5ibmRnwq2nw0OP3IaKu3j9E7Cgmn6RUjik8Ks=;
        b=wcw7u87QPKtAaHM/gQb1BGBqREwgMxBFjKFCbo3sU9naZmqA6hC0oQxDhCG+O0g/Cq
         l4pIqd3ds6x1jJkV0qFM3VffV3sBEcUg/M1kTyTfR0JUxw+tR4Z/ni4flz2x1uTEx35m
         x39Ap6SPIcRxsErfDF5qrt4POhhpbwFmF6bYNMfDSkKngwVe35dwOj1BD0yVxFvkOI+y
         SMAqYjUKavd8iyvNrDhAb+D4wSMDtJH+j6QxnBIzXjk/OMMXmVyfbM29SH6xrDiiDUdI
         eWRr5DF74BJTv/7UL1JMq726xAeIycywSOK6PlbVOYjp2ZrkMeCyuCw8a8mYYwda/US/
         OVWw==
X-Forwarded-Encrypted: i=1; AJvYcCVtSxO7lCAvgSLARshOscjG0Q2/Z3zVc0tw4hD5NiOH9EUuLL6PA/ckLcniiJVfXf2uzPdrVegNeSgLh3NObes=@vger.kernel.org, AJvYcCWPncGse30lBYMTOqYROvN5zvnV5jC/tCvPAAIxgPXKnH4BPYUGqvxWq7mqighJH3XWdnUFY9ufBX7t7olA@vger.kernel.org, AJvYcCWuLxdeRGFlDfg8T01znmTFHmoAVNgMgPxrlq1f437Ix6PCuH6NKw+rDv2Rf5H5Z2SloVrXqIhiWSZhhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPbVnRVkTrAiGcLa8m3wneMM2Y8o1vohXU4KvbAA89tIC6uoIM
	hn7/jHmFgBOIH1ibvVCb0py7w75KXZ3fIF17PUCBstEIdpKS08Zf
X-Google-Smtp-Source: AGHT+IGmHnwvYP8IMc9LpLCn8lOYKQ1Efh7zTS5BhoB84Q9SAPxjG77wgdouUdnz1rvJ2lCDNbih0g==
X-Received: by 2002:a05:6a21:1698:b0:1cf:42e1:f61d with SMTP id adf61e73a8af0-1d8c95d5578mr18474983637.22.1728939597467;
        Mon, 14 Oct 2024 13:59:57 -0700 (PDT)
Received: from mail.google.com (125-239-144-11-fibre.sparkbb.co.nz. [125.239.144.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e5d1d396bsm3502968b3a.33.2024.10.14.13.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 13:59:57 -0700 (PDT)
Date: Tue, 15 Oct 2024 09:59:49 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: tsbogend@alpha.franken.de, gregkh@linuxfoundation.org,
	zhanggenjian@kylinos.cn, ricardo@marliere.net, bvanassche@acm.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: paulo.miguel.almeida.rodenas@gmail.com, linux-hardening@vger.kernel.org
Subject: [PATCH][next] mips: sgi-ip22: Replace "s[n]?printf" with sysfs_emit
 in sysfs callbacks
Message-ID: <Zw2GRQkbx8Z8DlcS@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

snprintf() has the documented, but still rather strange trait of
returning the length of the data that *would have been* written to the
array if space were available, rather than the arguably more useful
length of data *actually* written, it is usually considered wise to use
scnprintf()/vscnprintf() instead. In the case of sysfs call-backs,
new wrappers exist that do just that while also being PAGE_SIZE aware

This patch updates the sysfs .show() callbacks to use the sysfs_emit()
helper instead of snprintf() and sprintf().

Link: https://lwn.net/Articles/69419/
Link: https://github.com/KSPP/linux/issues/105
Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
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


