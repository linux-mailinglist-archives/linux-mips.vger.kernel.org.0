Return-Path: <linux-mips+bounces-10879-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD792B3E574
	for <lists+linux-mips@lfdr.de>; Mon,  1 Sep 2025 15:40:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB640202B95
	for <lists+linux-mips@lfdr.de>; Mon,  1 Sep 2025 13:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742EE334723;
	Mon,  1 Sep 2025 13:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/BehhqO"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D519D2EF64D;
	Mon,  1 Sep 2025 13:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756733967; cv=none; b=ImaY2bIO7DfmcV6cWUGeZvBWm+D66EOeEOJMkCFl+TcVRLCUVsHYpsr5yxGUFMfhYRldCx/asQ3khEW1uf5ztp5fueHqtzUH0viataQ8Bemo6QNNDtX9wHPmx040nX6VE2DuB899ipP4Xgw24oGlW7uqnSWFrY3uvF9WzzWt7nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756733967; c=relaxed/simple;
	bh=kZvZVXfI8nV2LUxXWCSiR8ImHQgWp3sLc1tfCKO4Pgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iTaztl8waKeJy3WsyUgPMhwHeHZAT6ZPJZUPBhA2m94QBT1dJRgdbZxgtW5UCpWowaDc/bGAhPOJHTc7dZ7Z5pM0Wr0ppdQuhqDw4YiylT4JplIXgZeMU5rUB7xA1bvbxlbDgH/rKJSnAyg7njCkvyOn9ix2nk15LGsjvK0YSbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/BehhqO; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b0439098469so105776666b.1;
        Mon, 01 Sep 2025 06:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756733964; x=1757338764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oezRjeVlpiOhX/6H1ghN5S+KlZ8QH098jFik0ZIS5+0=;
        b=A/BehhqOZcBhJy2p8Ycg/hhX6wBrnFuEnL6CPRtqaJNCkdPVj9JTL1i/ZZ72RVAP7Z
         tBxF2bUI9VweX2iNTMXCLTmbtEj/6ch8nd6jme9LIkQ2cH+lgeclmJlmhy2c/UdIqb89
         EMEHCdmSnm/khw6fpFi2PNQ7thUYShYUu7KfUQgwXsiIoMUW300LsQu1MEt/+NirvqDd
         pFyZivyiJrDGuoxJL8M9skpxc06p4Eg/Tsoqd7QBPLO9V4gHQqnV+NrOyqoD9w+lLRQY
         3UgnKJLlUvBfnYtMxTHVr31N6OKWYof/i0eFMpBJ+oTUs+o40jJJ58ue7LzpBZaD6p8V
         NnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756733964; x=1757338764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oezRjeVlpiOhX/6H1ghN5S+KlZ8QH098jFik0ZIS5+0=;
        b=lJbmQUWeI17vHqz5OVWUGCVGdLDbXSy+8wvrGga5Cn/Ad8rH9RFBCn4HrtX5/bDojE
         jZyyHyl5bduTYYp87duuet0kr9wdwF1Zxdb7tMU5JCBuDauEEET4PUbnpVSaWVZhDqhq
         tARn0M4yiJFJ7kHignlxnzWnmpLhGEkrpKVCZGx9GWgqjH8x5pcd1HV31RGN9Swosbu8
         LvoSdivkEGL/tSpR7tlZrAn/L26Kiph2i49uwn3Re62EhxJ5J4yToLyvFdDJQobLeGut
         VSlA8gEtwWDMR5lX+nrWfpPDNcqRUJHpR9IB9P3Hz96TOxFV8VaPnZjeD0QRhhOsqDkN
         9XdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM/jVDPrYhs0krU51vGL5dryrgTtD1ArC0msU2HDGgCYOLNbWFof4Zelq8TS7nWu/4iQs+O0rqv0Y2lso=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3Ohp6UifkWJlF7yM+VCFq2FADjb17i2Y3Fvf6lBnQwozLKeOI
	P8Mqh7dDCfiYtrlAXabvf/jojXk7ltwlfRIS3UYlg0uHULzDUyRerHHJ
X-Gm-Gg: ASbGncsAYiuNNJrq4oeO1Lp83rNaranIl8t+sqlt/kt1jk+1og/9kI6exMMjNJShT+q
	OYuuR96OFbQw6Qi52z4sJ+QnuxlMloxsykj4tDSr8HPszkS5EKbdRpKDN9BrkjWQx2ae9WVS3cG
	bQN7eOynILhIWBcx4Wyv/T1E8NPs9BQSRW9E6EZYBwtNPlcCk0AWRawOy5GyGWdAxb+ryu6WAAM
	gX1IAe91HvapJA3M8GMyjqsQRfjtpDR9pzIZoTibaok/UkoWG9aZyI0/qW73H7piHoUm3jPAoG1
	bIDT+prg/NPmi1SBXIC/UWa+nBZunOlzzSMR/B+c9HDa1gFwaLc4wEByEbdUlncpvhuEInI/tYI
	1sn9vpUudRny3LKwfY5h2nvF/HvqxgA6hlH2aZ5y8830d/nE4Yvjik8JR+x/zAuzQPG+0uHSwc6
	nu1MMszhgthoAdN9M=
X-Google-Smtp-Source: AGHT+IEtR+bizTb2fz8JzPlu/4pLkE0+BVT3CiVxS9GQOwl7ljj/uTTYYR2pRBvGrmp2cOtcQg/JpA==
X-Received: by 2002:a17:907:97c7:b0:b00:9af2:a2b6 with SMTP id a640c23a62f3a-b01d8a2fd6fmr669329666b.9.1756733963969;
        Mon, 01 Sep 2025 06:39:23 -0700 (PDT)
Received: from XPS.. ([2a02:908:1b0:afe0:811a:e584:2f56:9910])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff0d9b1b53sm746171166b.96.2025.09.01.06.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 06:39:23 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] mips: math-emu: replace deprecated strcpy() in me-debugfs
Date: Mon,  1 Sep 2025 15:39:19 +0200
Message-ID: <20250901133920.94022-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

use strscpy() instead of deprecated strcpy().

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 arch/mips/math-emu/me-debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/math-emu/me-debugfs.c b/arch/mips/math-emu/me-debugfs.c
index d5ad76b2bb67..94667cbe18e7 100644
--- a/arch/mips/math-emu/me-debugfs.c
+++ b/arch/mips/math-emu/me-debugfs.c
@@ -41,7 +41,7 @@ static void adjust_instruction_counter_name(char *out_name, char *in_name)
 {
 	int i = 0;
 
-	strcpy(out_name, in_name);
+	strscpy(out_name, in_name, sizeof(out_name));
 	while (in_name[i] != '\0') {
 		if (out_name[i] == '_')
 			out_name[i] = '.';
-- 
2.43.0


