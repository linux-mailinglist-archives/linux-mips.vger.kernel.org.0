Return-Path: <linux-mips+bounces-7081-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 211F49F6ACA
	for <lists+linux-mips@lfdr.de>; Wed, 18 Dec 2024 17:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F300C1891E45
	for <lists+linux-mips@lfdr.de>; Wed, 18 Dec 2024 16:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD21149E16;
	Wed, 18 Dec 2024 16:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYMWoojU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C687E130499
	for <linux-mips@vger.kernel.org>; Wed, 18 Dec 2024 16:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734538316; cv=none; b=aXszpkZJa4RpoQCfflh0QtTVr40mdhQGWKrk0UcBWwCE/9iCkOX+di/kCuI8dlQewK78x2edLvkyVXnbUg3TCLO0pEpEQ6oN4QzAs4fZ/QvbiywCBLuBDcxxvFzdutHuMcJYVSDntNagINav7VQzNrbEqQWFQ0Sn+pBKkVe39dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734538316; c=relaxed/simple;
	bh=/bvKDB/kLVBNpoPpF0T6OswjGtsHNx7DLRYfjeWkwkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=CAVqe/GpsqOTClNwRrsfgNADSJ6pyBY6ie+Oegjb1xywPIJpRgsvo7xDvfnaAWpqa34S7NjL+r1dvdVKDFP5oCKF+GRlE8dwG3eCnBku18mTZDWeXJBJY31mq5REH/5qanLMyNaRtUp3NLyRP5H8rIf3W+ChP9/aEDd3Vi9lwzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYMWoojU; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso10998781a12.0
        for <linux-mips@vger.kernel.org>; Wed, 18 Dec 2024 08:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734538313; x=1735143113; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=37CAKQo+hCBaKGXrWvZUOLSd99eTOAsLmOGmu8Lvy6A=;
        b=jYMWoojUcSRKRskwkxR5Ljr49WeMScalLivRu++hY9rcVILpNz3JHmDvN+y7XNiWZB
         BQBRrX+py/78k9BewA/47SqN6IfeqmkfNrqMHTiQxNqKhEYQPxaqaoFXjCpe2ebpdMJe
         TxsrTsFHjUcAL09clUr5SrTtqOCcj/RCwPrc+8Ss6/Wriyq1emL6CzYkjNd3V3Ip6Ovv
         nJjpMxGSL48AeVPgEGP+WA7Q431r5dvYhhXketi3GUXPIcCB9p4M1Is0VC8CgUzDwgcN
         1bqmm7O6Pm1Orwh/oaSS4H1kwBcnjw/3uad8LkCuBd7XUp/OvAOa4h0qSTwFLZ/w24Wt
         KZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734538313; x=1735143113;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=37CAKQo+hCBaKGXrWvZUOLSd99eTOAsLmOGmu8Lvy6A=;
        b=OrK26KtNAmSfxSbgVv/QKKgq+/e/6qsAFSY82FdoK1eOt4YBe48hx89E1YH1v7SjZd
         6VdoN+QI/nRZ9Rhgj+8Eq3FdKdzhJszqjGmWzxGvZRfBZvsRp3U3tYVvM3wiTzcVFWr/
         0/gFi0TVd9Nbs8Voq1eF4OhwfStZ9hX61zBu23HgQZlPGRrbSK7smOFqxg8A3yIR7pT9
         8ar7tUMxc1KuL68Sw0FAxsdwDB756IBWhgZW6fN4iHrx3v+w/o3nnkn77bRyj23L1ar1
         OQuUbiyHFRvVIr57l3ifB/6TwAr4ZD3SDH4WVE4EP7AWfgZxX0OA8p2j+uZ1UesxbBeV
         MKrg==
X-Gm-Message-State: AOJu0Yy/1uwGNFIFt5GqIAMOJFEtiBVIOeNCDfkP0VWvSLfJxNxGVf9o
	siyeAI5PuCPUjvSUsmBxPGHzYJckNJYsp0oD44kkmJ3lclLN/kSMnBYwFtHgWA4DpyxYv6JUvEy
	vKzUUSdSVF84j/VpW9h9VDks5/VE78Me2
X-Gm-Gg: ASbGncs4rMX61eN0ECg0GqDD+teCvJj8iGu96sWCnKDxZtj2F7qkhcbQq0RBAoyR7jj
	gNSPIj59BcQB1l9sN3FtzrUYwuET89ho5sNjK0RmofgL9QkVl6pN9BU7hNWMXSOZf0grkFA==
X-Google-Smtp-Source: AGHT+IEbpIl0ad7JSbCUUXAuazPVsxZqTajoxLSX1J7vDnU1bjo3thOBFd06rftxtK4vBHUhYQu+WsF7QidPwKeod2c=
X-Received: by 2002:a05:6402:13c8:b0:5d0:efaf:fb73 with SMTP id
 4fb4d7f45d1cf-5d7ee3b307bmr2883534a12.15.1734538312781; Wed, 18 Dec 2024
 08:11:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAZ8i80XG5eXSOuL+u23g9qs-vuTBMhjfzdiyeVoQJxkjHLSuA@mail.gmail.com>
 <CAAZ8i80EzZsaOztcm8zUOvHH38D5DWgvUdHar0Yx8FN8k4Nj6w@mail.gmail.com>
In-Reply-To: <CAAZ8i80EzZsaOztcm8zUOvHH38D5DWgvUdHar0Yx8FN8k4Nj6w@mail.gmail.com>
From: DiTBho Down in The Bunny hole <downinthebunnyhole@gmail.com>
Date: Wed, 18 Dec 2024 17:11:41 +0100
Message-ID: <CAAZ8i80hdrZtw64xtLnca4rXR9GmvXDy4zs781UyFum6Qg+uYQ@mail.gmail.com>
Subject: bug, MIPS PCI CFGA_BUS
To: linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

hi
found a typo in a #define, see the char "_" is missing.
It silently causes catastrophic consequences to miniPCI devices such
as uart, crypto accelerators, wifi, ...

I found this bug from kernel 4.4 to kernel 6.12.
I think it should be fixed

D.

--- arch/mips/include/asm/h.original   2024-12-17 19:18:40.199000000 -0000
+++ arch/mips/include/asm/mach-rc32434/pci.h    2024-12-17
19:18:40.189000000 -0000
@@ -167,7 +167,7 @@
 #define PCI_CFGA_DEV           0x0000f800
 #define PCI_CFGA_DEV_INTERN    0
 #define PCI_CFGA_BUS_BIT       16
-#define PCI CFGA_BUS           0x00ff0000
+#define PCI_CFGA_BUS           0x00ff0000
 #define PCI_CFGA_BUS_TYPE0     0
 #define PCI_CFGA_EN            (1 << 31)

ReplyForward
Add reaction

