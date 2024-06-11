Return-Path: <linux-mips+bounces-3572-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C619A903A73
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 13:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BDFA28149F
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 11:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F092717C9E4;
	Tue, 11 Jun 2024 11:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mc9S6Vtr"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F84517C228;
	Tue, 11 Jun 2024 11:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718105761; cv=none; b=ePigo5K71TE5Kw3pe6/c8DnLdbok1JeNSlgYcL0fi5BeeCWjEr5g+zeWQWLYDjxbcROKFycGS6o5qRcHKqKox65ZzDbjS1O6ioN4pQM6g7Z/GyBO7Oyu+zZLF1CS6q37IFIT2d4X0uldfGQrnDNzu+EjJfIgyb7bugdAnR8P/6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718105761; c=relaxed/simple;
	bh=KYM3RpgXB+bRDfX9kBzzB6kmbYZ7NlFFZJ/83yFFCno=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kd0bQw1wm1A3l5bbRP2jZOpVhsEbcsdk7wOuqvjRfQkPJPECsvHbnVL8avkdAc49ESkJQ9WViTzgV1vl5Xvc8HDFDvbYKyajEVQt5WqbbIunSjTEB6D4Nj8pKWtbapsyEuCnxvUf1UyNlsfxMJZi1duAXjzru0FokKYgdV38DvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mc9S6Vtr; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70436ac8882so880027b3a.2;
        Tue, 11 Jun 2024 04:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718105760; x=1718710560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=clrALCvP0Lnnrc9ChxXlKIuUYraQmBIpiwyzFSMJ4E0=;
        b=mc9S6VtrDphZhvkHJOgiYj4CWHwDb3Y3IM0nnFJxCDaeie3RwLNTZMULiORuHQMBuq
         p6xb0StMQuy9gcwmH/xZm0+rkZSWtgBgW/M/VY+vDPoArZbgkDZ3V7oDyOkBajn65T3O
         H/qPFEJOXMvTIaN9hasQBZ1YmLsrqnnvEkE/0MpQnarH3FvxkLPw4MT5ZoBpgu9aVcvh
         JstlA771ZCpwna7vNp53TWUMSzZO7TrcVzx5+w1pkvveumASLClF4/EL1vPVhxl6eG61
         v+ObjDNWWe49t9Tec2KHwnpQ1ARc80KGmSghNs7/btBuXJmEurT8UZmQNKbS3uIfFCud
         4sEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718105760; x=1718710560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clrALCvP0Lnnrc9ChxXlKIuUYraQmBIpiwyzFSMJ4E0=;
        b=lKiYQBPSJuSJi8Om791zys2rzQs2CRSXHLQztWy5WN9eSDriXD+Fe5ensbiJZlN+zN
         HxTRnPI/nhzjk8mE7pkmuiNPOlLsH7r+qsyoDTmv17GID/1GdvvYASR1YDsLgg5NTco7
         1GOtq5mzOWFYzUqfGDZSkSVPy87maUXDnKgR3MT41mJ++Wi8gpV5zT9UYNdMKK708XYM
         8KR+gWA1yTFaNkSjL6r7ZFjz4+EJbBJB2T7jcfiev1EpyHocs0PX5VBjzNcH0ODRuLkk
         yve8zJan2NDXgwiYhEnR6uvykMrEky3eZu1qdSmCJjZYdbSbgy1EYpoY5Gyho87MTLo1
         sweA==
X-Forwarded-Encrypted: i=1; AJvYcCVsMdJ43Z+YGMDQC11cNECqoR6//1QL3N3cgtzHQDNbxN7LpazObasyOR6nYKMBxNtZaqzsC3BpJZnTh7qyUj5UG6cdSziqXrl8sd5ywZetL9xIYKJjHWx84cWmfqtT2gvoODX3v6LKnropKVBkBcpHXZ/ob7O5yB+60V+Qb5ptNAcmI3s=
X-Gm-Message-State: AOJu0YwC+2vbKi01+Ng6ang6ViVOMkKY5FX/ydEVJruyepCss0x8kq1w
	dGAMsEdmCV747htJT4s3dVCqUHZF0JelSJH01Tqpsdgt7TtXFd2KR3u8uw==
X-Google-Smtp-Source: AGHT+IFS7qqa5BjwWxrUZHcauoz6IUBA6J0UALV/0YdBX2gXADkms4Nrp989ino9yjbn+rkYr7kMhA==
X-Received: by 2002:a05:6a20:9151:b0:1b5:fd58:30e8 with SMTP id adf61e73a8af0-1b5fd586289mr7258770637.18.1718105759749;
        Tue, 11 Jun 2024 04:35:59 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2c2dd785762sm6705086a91.37.2024.06.11.04.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 04:35:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	=?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/5] mips: bmips: BCM6358: make sure CBR is correctly set
Date: Tue, 11 Jun 2024 13:35:33 +0200
Message-ID: <20240611113538.9004-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611113538.9004-1-ansuelsmth@gmail.com>
References: <20240611113538.9004-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was discovered that some device have CBR address set to 0 causing
kernel panic when arch_sync_dma_for_cpu_all is called.

This was notice in situation where the system is booted from TP1 and
BMIPS_GET_CBR() returns 0 instead of a valid address and
!!(read_c0_brcm_cmt_local() & (1 << 31)); not failing.

The current check whether RAC flush should be disabled or not are not
enough hence lets check if CBR is a valid address or not.

Fixes: ab327f8acdf8 ("mips: bmips: BCM6358: disable RAC flush for TP1")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/mips/bmips/setup.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
index ec180ab92eaa..66a8ba19c287 100644
--- a/arch/mips/bmips/setup.c
+++ b/arch/mips/bmips/setup.c
@@ -110,7 +110,8 @@ static void bcm6358_quirks(void)
 	 * RAC flush causes kernel panics on BCM6358 when booting from TP1
 	 * because the bootloader is not initializing it properly.
 	 */
-	bmips_rac_flush_disable = !!(read_c0_brcm_cmt_local() & (1 << 31));
+	bmips_rac_flush_disable = !!(read_c0_brcm_cmt_local() & (1 << 31)) ||
+				  !!BMIPS_GET_CBR();
 }
 
 static void bcm6368_quirks(void)
-- 
2.43.0


