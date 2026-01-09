Return-Path: <linux-mips+bounces-12794-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA666D0B559
	for <lists+linux-mips@lfdr.de>; Fri, 09 Jan 2026 17:44:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 59FAF3066DE8
	for <lists+linux-mips@lfdr.de>; Fri,  9 Jan 2026 16:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B08364E8C;
	Fri,  9 Jan 2026 16:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mum70IXL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="o5a8q6zG"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ECC3644D4
	for <linux-mips@vger.kernel.org>; Fri,  9 Jan 2026 16:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976924; cv=none; b=kwUHMvViHkZ9N1MjSuV+9LB205ClxjqXJKxDwaavP9IU1h+NUdIRMajvqNWKgyi3TXsTPxOMpkMAoGxu6eaDcYYIB6RM0lfxczIqRAhzy/VRyAncBZL8JgSPkTOT5GCTBo4qY/QNhvBse+dEamReeuw/fw/pkWTiLiiKTGvmOSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976924; c=relaxed/simple;
	bh=bp7kgvXwR/z2HTYh9L+d2gqJ42hxPb2LIWMCj3tGJL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l43tHfSRi2B7F93fjmhmmmi8YM4aYAuqH3q7XvjSXXOPUaKl6l/EL1pmT3QA5lco1Kd01TkkNhA0pEDPa4ddkrRGmTL+hgkvEtA3iaeY6VtpF9YfpvbgYz35qQcJj9kIcVyW0Zm/7P52/W98nHTOEzBJAWsjR6TAf94KEYNDKNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mum70IXL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=o5a8q6zG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767976919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WFK7CWWCcElHpWdcqTdYEyForqsKKnCdXysGYmeirHY=;
	b=Mum70IXLozGIqreryAiUtzPwGjTYvGR7p/7fPlUt9vzBse33GtqbqhwDqekfjcyFvOrV76
	gfboeuLWNkhxlZb4/0YE6tpKirEstNMdnQB93ofeDkfh/nA2/XB6YZrLwVXOuVZe8My1bk
	O4PTYIo+N6E4g0OsjVDuHe2/slo8of0=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-Mh8yhiuBMNKNqhr2XDOeVg-1; Fri, 09 Jan 2026 11:41:58 -0500
X-MC-Unique: Mh8yhiuBMNKNqhr2XDOeVg-1
X-Mimecast-MFC-AGG-ID: Mh8yhiuBMNKNqhr2XDOeVg_1767976917
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56344627228so1891415e0c.2
        for <linux-mips@vger.kernel.org>; Fri, 09 Jan 2026 08:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767976917; x=1768581717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WFK7CWWCcElHpWdcqTdYEyForqsKKnCdXysGYmeirHY=;
        b=o5a8q6zGH5BR2/Pp7jVFJ8FTz4W/vzRF2jnB8WZiISRGpI3F1xCgIJJ0ff/mVcyYR1
         s0gA+9mLSDjJHJ31516S/kqekPA7ILVUjRfUQ2VXD9CERnvt3hFXXeD7cgcsWojcSZ+g
         h0XED4IqXSwqhM6KhoD2iW5BCjUqI+ZKScFNF5AsL9HQTecJu1H3C20t2N8+GcxtY/B1
         iCySimHWSx7DRnWm9k638vy+0WOjP1TRIZAhFxYYeFl6dtJ470EstJPtFzthx+sVNg2i
         vUJanW+2Vp/EUU/DMwAf0vuMizEjEJHmakVZc+Xg4cS6r9T0g8ZXy3eWV/JgekfxzFNL
         GYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976917; x=1768581717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WFK7CWWCcElHpWdcqTdYEyForqsKKnCdXysGYmeirHY=;
        b=uFXUL9IQfm6vPvE7agRFDWvldLYIt/uccMplD6dpkTxMomkm0ChAXdVWEBYHPZtx/E
         8qYfUK9Y3/9a4T7pNo999UfWgZjG70a1bCRqjQfX4br6OjSZAP4LAK7NHxozxw6dyB+5
         dTPQdaPcsW64Zb4yXGo1d6kTOc8KM2pbN8XWVIgqfQ2GLo2H9H290FgbjSZzVvjgE0AF
         Ghp1gFT4Uzu2c7ZhFTTVIoMjOGtlmpfuRLSEZq5E27+utOjcSWU+Xfp+KUlgZhLWFU1m
         ntU83xCJiY8W/6SEwEwiYvnJa1HatvZJhZr5CtsEGzbaG+Ato7G5KFqBM31aDtCp9pzT
         9e2g==
X-Gm-Message-State: AOJu0YxxfwYcitB4/N8Czrwn16MAaS6/Vve2YV26x51UJ7CdgLyqFH1d
	Ymq1vSCs066uRRNLc7YZSIl/LC+GX2IaD4zkOxIv0/wrIJLIJ0KSGPiFY9kX7emiE2QBCR4Tlcd
	PcSiNNvmNxTZFY2GFkUMfMDHQdPyqav8FwbUygbVg72FWG3PYesW/3li961sWOMA=
X-Gm-Gg: AY/fxX7K94zEyCQ9AwKfMduZBHOQNKonYsMLKIylcAcbCmZNnKdfgUOnWFpAKvBnnzd
	GgBv+zXyTVN8qKRvGKxCZiwTpXQ4ENWoQevNVPaSSPIz52+oBq+2alrvBPAk+r9bpSfnsWMOx3x
	xK3rezOiuKEKQYD+0EiKsn0GpZt47THj9qUyfSQfBJml/rCeCtsGw599vs5rsSgZnSUe6b6qTYq
	pWhvJkWXCsYAiBjoDmGlBOI3JGI7kLtQej1uDbAioTJ6OiX+bBlS48UGRryCSV3XYP7ljB5mREw
	onCucayj5j8gXeameuhJO/SJ9BCB2xuNIkol2FM/HafSxTknBpQZangpmC4QGSqvXLruFUjcm4s
	9HS6Pt7QEc6fqlGTksecmsS3xxHF25/uxC1yLrfAwHODEibYs
X-Received: by 2002:a05:6122:9003:b0:54c:da0:f711 with SMTP id 71dfb90a1353d-56347d6e767mr3473234e0c.7.1767976917531;
        Fri, 09 Jan 2026 08:41:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEi6TFgw8r6LUjLRM/LZl1zMYR/ZLjNK64W6SmBGJBd3Qa7pB8w69WsFwitOPSmRTdcrRzbkg==
X-Received: by 2002:a05:6122:9003:b0:54c:da0:f711 with SMTP id 71dfb90a1353d-56347d6e767mr3473222e0c.7.1767976916385;
        Fri, 09 Jan 2026 08:41:56 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5636c753392sm1267752e0c.6.2026.01.09.08.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:41:55 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 09 Jan 2026 11:41:15 -0500
Subject: [PATCH 02/13] MAINTAINERS: add include/linux/platform_data/pic32.h
 to MIPS entry
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-mips-pic32-header-move-v1-2-99859c55783d@redhat.com>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
In-Reply-To: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=669; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=bp7kgvXwR/z2HTYh9L+d2gqJ42hxPb2LIWMCj3tGJL4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT9Y/EP3o67WYhx4qD5pt8ObVutnCX12yUkeGSK5JRN
 a8t0rXtKGVhEONikBVTZFmSa1QQkbrK9t4dTRaYOaxMIEMYuDgFYCKRWgz/k0TUxQyebl8vvmqO
 wzG5yH1LBN5y25+Z9jPu/oLNi3gnJDL8lTqh3rJ6TenyNLc4hhtK34WYHPTVZZU2xMzfnMi95H8
 HOwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Add the file include/linux/platform_data/pic32.h to the MIPS maintainer
entry.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
Cc: linux-kernel@vger.kernel.org
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ecae8a5e33cce6f2cb883c1b14b7908e71dbfb5d..bc864e1d263ba8d347e6364477c51f70270467fe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17545,6 +17545,7 @@ F:	Documentation/arch/mips/
 F:	arch/mips/
 F:	drivers/platform/mips/
 F:	include/dt-bindings/mips/
+F:	include/linux/platform_data/pic32.h
 
 MIPS BOSTON DEVELOPMENT BOARD
 M:	Paul Burton <paulburton@kernel.org>

-- 
2.52.0


