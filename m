Return-Path: <linux-mips+bounces-4861-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C71294EDE8
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2024 15:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07CE4284641
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2024 13:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493E717BB3D;
	Mon, 12 Aug 2024 13:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfAl9I03"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6321D699;
	Mon, 12 Aug 2024 13:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723468691; cv=none; b=ouqxeIKctetKeFpy/6E5R+Fy71hwEmkPVWscnLzcUP6sbzJWFjLJNxLhMWNTHOnhx8o3fVHRNAR285QPkDO3MlqP62gUFQ75qBFDBUpNIb+5TWnIEBgY/H+/TUaO/uqhKyCPhpmi8deOq8siTikWLgagU3N9VH4SYoqf8NO1hgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723468691; c=relaxed/simple;
	bh=oJ0FefYQB0MLkhNlnCHt667L2YrGC8KMT0QTTxS1fA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hp9VOV6SCPIXCodfrkOU1NiqzPHS57qlNl5nHUpxBfiZqIVmuhqhxx+fSitv6Q9+B1hfufkVjJBUg/ALCY70SNb2eVulFvvN7bX/tFGq3bGGEaa0yL5Mts32s7Mp+NjzRIPIGa6Pgb41Az7/Tm0am/immLU1uJsO2/ImtXnVwbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfAl9I03; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4266f3e0df8so30523845e9.2;
        Mon, 12 Aug 2024 06:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723468688; x=1724073488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oJ0FefYQB0MLkhNlnCHt667L2YrGC8KMT0QTTxS1fA4=;
        b=SfAl9I03+BxxEHojSJf64VRRECFt/yjqO+Q2D+VlMS7czE6LOuAX8Mq1aKMW/gHBby
         UhiSkjQffzHh+g4tNcKCLRr4XQsOvEzICnSMrO45dXuonOQxhgEAL4mz/iHpajtzqQNp
         n49ad7PvUmewB4G7gxDAut2OubBZfptingPKWPtnuBvEdUA3yMIPUlgC4vZfG5WFvoah
         BOFBJYi+HD/SV46FzFphIioacjXccNetow7f8aTZysHqfezEq3w8bbQN0YuNH1XZL2ig
         J6L+d03Kzj1pu2eh0aVFiNIzHM6YbSj4BEssX3WudMYLncaYcK4H8rALlGsR/lzU0Nyj
         W+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723468688; x=1724073488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJ0FefYQB0MLkhNlnCHt667L2YrGC8KMT0QTTxS1fA4=;
        b=rUHWQMHA7WM95kKyNqZtCSz5qMJIlptUt80AcAoTbokKTWwSQUh6dwDnYUG1d5HekD
         hCLiUr+FQ7OxikOhX4XAN9W/jF/Os2C72TK69xnK4O5r4gP+vXTvPPy2w+tBujOpdkq7
         X1okNoqBn+1OCWu76uLwgc3VRs6JusHcoSpuzNAIEl47nQz3aJAKcUZJ3lpqwkWAYgDI
         iK//oLL6b5lBzijBIK+PFcS62M8OIRrrvYP45KZ2zqh376LOvkT2Z253r6eAgKRKQ5Cg
         Cxslt8nGasGGJPgaxgf8cz62ddjoHlNRehAWn9D6nGdDU0V5cuuA8KClgTcFJFvbDuj7
         kEig==
X-Forwarded-Encrypted: i=1; AJvYcCUsEvmpwlDz6mk5rc+y+ijQiNf5y74CerWs1PFRFhA9I6pMY2JIXLD7ikcPe1HZaiN1iO+02wMoR7IVTUOCqpq9p2f1Uh5f81tl05fZ
X-Gm-Message-State: AOJu0Yy9L8sxq82WJnMbcEFOHhVcbpKaFGy/OOnb8wCme1ysE8/WIM25
	My9DHJQvI/LbScp9UPdMu4YSm8ClPDa+ORm0PZHDTPy1O72w+CjM
X-Google-Smtp-Source: AGHT+IGcON3sqGDUy4t9EcHtnVFiL7AsjevMHGxrxFTo/pcv7Wz1ZHVeTC/sFw+tHamLjzcJb4poww==
X-Received: by 2002:a05:600c:5108:b0:426:61e8:fb35 with SMTP id 5b1f17b1804b1-429d4818b81mr3367775e9.4.1723468687769;
        Mon, 12 Aug 2024 06:18:07 -0700 (PDT)
Received: from ryzen.lan (82-65-243-93.subs.proxad.net. [82.65.243.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c7bc8c3sm191105975e9.47.2024.08.12.06.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 06:18:07 -0700 (PDT)
From: Vincent Legoll <vincent.legoll@gmail.com>
To: John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] MIPS: ralink: Fix missing prototypes warnings
Date: Mon, 12 Aug 2024 15:17:41 +0200
Message-ID: <20240812131803.16475-1-vincent.legoll@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


While building a current kernel for GnuBee PC1 hardware, I got some
warnings about missing function prototypes.

The following patches fix the warnings.
Is that the proper way to fix them ?

BTW, this is only compile-tested.

