Return-Path: <linux-mips+bounces-9932-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E757BB14CF4
	for <lists+linux-mips@lfdr.de>; Tue, 29 Jul 2025 13:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 163F0546244
	for <lists+linux-mips@lfdr.de>; Tue, 29 Jul 2025 11:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D68A228C2D1;
	Tue, 29 Jul 2025 11:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHIWqRNt"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5EC287244;
	Tue, 29 Jul 2025 11:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753788141; cv=none; b=puvIkGyllqc4wvkh0BzAEfQwSWpqbbEOuHXelHuGEd2SASXv/aKTfKPHeeAYoKNsWCfFxh4zA9iWSS+yoHXvqiGrSz4RfXuGYcyAat/HaeZNc99uCdO5ygZwwh8qcJY7EmtteMJ7HQb88LVX0ITgMH1CHPdCmOo7cqJsUxZu7EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753788141; c=relaxed/simple;
	bh=ETWABwZPKFTxPB2jUDWABbHxWBXST8dOhq35U7qveV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j7wLMxJ69dbEuKjbAu7bKqXZSoIZuppizc4FN4fxzSygajmor6DitHinqMNwF1F3rJe1pKvN5cMzl1s6Xc3OtWLCt06FunaGLLFygcgyqAgbjDHD4BaKZTntvcWdObco2g5sDd1IHrsF9LbI5xpK1WSn02XkTFIJfJ4dRe+9D6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHIWqRNt; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b792b0b829so324226f8f.3;
        Tue, 29 Jul 2025 04:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753788136; x=1754392936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mRhGn5hDYxClsYuz4YXSiUquXvIRn/M5Xg9R/3PUOEI=;
        b=iHIWqRNtm+/TLbmlY8TOLxWuiYODBX4DNuPNqJwjVKN3SDHltHq0jRXL6q725marL2
         EPmOwPpcmw458spzQaos6GJ9ogAfzUR8vyrPIWZ4QgQ0a8ZgaQGejwufi1BF8FN0zYmN
         Jr0TsCtU5xFWMcgLiz1ZySJrF2rhSf1OVahq6DATNof6MHvQ0hT3O+i0a5NFAOA2ml3f
         d1B3TqMua9G41IZFTYmbfFNLzXHbmxwFZ+0BbQHDbW1hPlBUBS3A57Dufb4NarUJ0k2U
         akVKeOocQ5vtcZALxtiEz/Zzh0P5vWkxhafWJJjUoaBCW18RQ8NG0JxaR8S1lBjx6jBn
         mmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753788136; x=1754392936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRhGn5hDYxClsYuz4YXSiUquXvIRn/M5Xg9R/3PUOEI=;
        b=YTCWzt8oM9WrENctLCl7U2Fv6y6Dj/cJ2qC/iYjOmOLjOnbd2IZPvY1XOQwZ57+f/X
         Ud6FESSQXcHzHn3YI1piZlvuhmaVUelCuZxW2VaK1VwNkTV1srPwNDY91XYzdOrliKiV
         LH9zxyUqu8DoJuWw/97/rOpGcPV6ssU3+o0Lescj4C3Hx/L00tJeVftWhEHj7EvPL+ek
         eGUriHAp9RcEjvTLMVJMAxCE7jTQ8S9x36Ac4hTz9hdlMLXwF4CZGb0QkDWgPb/utmq6
         jdlr9Aol0hE6SdgeAOu1Ojr8Otdha11tFp93DPmtYUQw5KPHgsR6R/4KiWNlPAsMe0VH
         mQfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwbYbBHgIiTope4TfAnYsTrJbMpzs4ODuQndtsK8bAFOTj5JqsHnsxCc1LAMtYk5hq9kd1VG6v2Ku080c=@vger.kernel.org, AJvYcCVPMr6aCJS2hCX3ZmAOCaCaXD3CDfuD0wRE/VRESh+p1qR8EcwXoWGvxJjdH3gcHwdOs9jb0rt6+fDpJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIvytZRWBNDjoW1aE7Xzxvz6Vt6SAK1Gt4Umb7MwiS8G6puJfT
	V7IVtaq2Oh8RHnBrnra0AVrTAdfW/iultFqWB+jEwCYENvgoFghgaYaw
X-Gm-Gg: ASbGncvwktVk8FnZFULhCAZe50v+MfGcKrxbMnqcWNatRUQLjTUVgIPO0KmUb6mY3MM
	nKlgbClpAuSORx+zRstO07+sUI13E88zLc4r1sadKoQGFjQfbMNd681yQagLPS7zlY96aTyynlk
	pxPeEvxEGGGtyI1pWJmWJGovLcfZ8FrLuFXWFKxcMMsIm5sYqQkEukiKZtxme2HbPRy7J2/aRaz
	Zzlg/UbveK5XEYAKWrwOoY1tLsvBa3JZ2X+xjwQW5pqyXJyXcbv7QPIpJ4f+ojrwa4iTnU+mYd0
	CmczbTQzz3/oQ/Zpq09yhTbRSK9PlS4AoFJdYBFio3jqWTFotX7QC/hb5UP1mn7yWqrFzBNO/go
	7jAz30oDknt7JO806imJcgumLEgFf3zc=
X-Google-Smtp-Source: AGHT+IHg5Ykmb9OI8TVQEOdcut1VncLuIC+TBfNQ0EWFFIJMQXIDal6E7TwIRH+gmIF/v1F2SEcBng==
X-Received: by 2002:a05:6000:2287:b0:3b7:8d3f:6669 with SMTP id ffacd0b85a97d-3b78d3f6aeemr2830893f8f.32.1753788136206;
        Tue, 29 Jul 2025 04:22:16 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b793519ee5sm1006268f8f.62.2025.07.29.04.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 04:22:15 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mips/octeon/smp: Remove space before newline
Date: Tue, 29 Jul 2025 12:21:41 +0100
Message-ID: <20250729112141.1924206-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is an extraneous space before a newline in a pr_info message.
Remove it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 arch/mips/cavium-octeon/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/cavium-octeon/smp.c b/arch/mips/cavium-octeon/smp.c
index 08ea2cde1eb5..054e331b3202 100644
--- a/arch/mips/cavium-octeon/smp.c
+++ b/arch/mips/cavium-octeon/smp.c
@@ -334,7 +334,7 @@ static void octeon_cpu_die(unsigned int cpu)
 		new_mask = *p;
 	}
 
-	pr_info("Reset core %d. Available Coremask = 0x%x \n", coreid, new_mask);
+	pr_info("Reset core %d. Available Coremask = 0x%x\n", coreid, new_mask);
 	mb();
 	cvmx_write_csr(CVMX_CIU_PP_RST, 1 << coreid);
 	cvmx_write_csr(CVMX_CIU_PP_RST, 0);
-- 
2.50.0


