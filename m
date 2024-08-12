Return-Path: <linux-mips+bounces-4863-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA6D94EDEC
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2024 15:18:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43E451F226ED
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2024 13:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70EE217C7CB;
	Mon, 12 Aug 2024 13:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0xwqkTU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C663917C211;
	Mon, 12 Aug 2024 13:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723468693; cv=none; b=ACmFAMcoVMgkCkfcuG4kiH5nFj6hlQK/TfHXHSe6EfWxMWcnf3y+cAdIti0j1TNa6A+zEXXspr/nKtGn1UPjfns7RO6HPihMjrK7FznFzu6PPQs4xoeLVEav70AElKpdEuDehLXiZaHckd2YLlvJViLMn9Vqlc6urh9S2InsFPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723468693; c=relaxed/simple;
	bh=87yztn4D1KIhhST1W56YLq4a+J6Ax5vSB9B/WnFsHuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UiTOEpT9Crupp8FQHwrqcp5y1BfhAwjsXVOAKqDReLDiRcduY2zj0YLJlKDMaL4TL5AQ2lRC/+Bvpvicv8bV0741Z9TH2ksAwf76mCaKlUaSpFCFVZ6Uq3RcPTEiTP+aFgdjPHwvlu1gooV3i5skejqmHf2vX4UzgPGHlq6IqfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0xwqkTU; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3684407b2deso2372325f8f.1;
        Mon, 12 Aug 2024 06:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723468690; x=1724073490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gO5OeEBjL0muHiUOKED6KPQ9bnjlNdkaKaqLWi0q2X4=;
        b=Y0xwqkTU2bqytbVBIQghpS7VzE7/ZjHFqyQCoBi6Nq6HrpUPkA6YrYcH8/PUQoXl1Q
         t8gJB8gmBu7h2rwY7szTcRVtBFo/RgEeZ4CreJCKIgta6V5sfSC59jZDSP7j8Wr25Bcr
         6PyWRe5w9mdI/bVVrDXLUw0rth7rYmsNe61j+9WMXqjPJS/HO76f3ig8LWVp9Nu9zgFd
         KHBtuFVVSqq5basudEfuvm+pG0gCZPSQsZjSaMUS7s+BlUEPSonucyoZNipd+/PbQh5l
         cUCqEAyJOdeoG94AaydBdn9lma0+z1uTJQv389xvnXRQmlwxvN19mco5Fnq8IdytXRyN
         tMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723468690; x=1724073490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gO5OeEBjL0muHiUOKED6KPQ9bnjlNdkaKaqLWi0q2X4=;
        b=XjfH6RfM/YYwovUoyZBkIkdPtDx8QcN0S3MRZmLFFtaSK7D3DMfeufD/DWIUTxWU8b
         Uz6v2BDMpBvvVrutGGveXoZ0zIaJOiwIsp7tvcANbY2se6UqXqjdz7g+82+pbU7V2Fka
         PtS3Jm8nKjUGX+gakwmPaoyILHE7vMBmsLPGHU77nPrWpGnYp5ZVBKHUN+Qjj7kAhLci
         qY/ASmRD+dPLFkv2GuaJcerjWikhEpEP+WYYfM5Z7a6UtHcffixJvRKH0rKPCQ0jNEiI
         y3U2wST6RCSNH67LFsnA34+D6n6xiEQGQ9u3cM39Oylagc6Zyx8frvsCRBPvAIzD5/Vm
         xoKA==
X-Forwarded-Encrypted: i=1; AJvYcCWSRcztpUxHJfjDELd8kWBtVe8/qc8kHDmilZFitQs1MrVcg9wV91K38sog4tNWuIbEUOZEzr7NCAceh1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYSvBoouX2KOpTbAtbCLxwjLfwvub5NRoZmUQ8K9sFqIAoe+11
	o/ff+XVcYAxGD3pSk3e1z+ds4E5QB0ewv12uu0oZdLKZj6fou91H
X-Google-Smtp-Source: AGHT+IE2w+Q7APZQVvTo0NOu9QmMtNISobLlKyPKAWkTbhNsMI7kKnTrddCPopOlyYQ3wrdDabSOJw==
X-Received: by 2002:adf:e2c6:0:b0:368:7f4f:9ead with SMTP id ffacd0b85a97d-3716ccd6e7cmr222600f8f.7.1723468689607;
        Mon, 12 Aug 2024 06:18:09 -0700 (PDT)
Received: from ryzen.lan (82-65-243-93.subs.proxad.net. [82.65.243.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c7bc8c3sm191105975e9.47.2024.08.12.06.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 06:18:09 -0700 (PDT)
From: Vincent Legoll <vincent.legoll@gmail.com>
To: John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vincent Legoll <vincent.legoll@gmail.com>
Subject: [PATCH 2/2] MIPS: ralink: Fix missing `get_c0_perfcount_int` prototype
Date: Mon, 12 Aug 2024 15:17:43 +0200
Message-ID: <20240812131803.16475-3-vincent.legoll@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240812131803.16475-1-vincent.legoll@gmail.com>
References: <20240812131803.16475-1-vincent.legoll@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following warning:

  CC      arch/mips/ralink/irq-gic.o
arch/mips/ralink/irq-gic.c:15:5: warning: no previous prototype for 'get_c0_perfcount_int' [-Wmissing-prototypes]
   15 | int get_c0_perfcount_int(void)
      |     ^~~~~~~~~~~~~~~~~~~~

Signed-off-by: Vincent Legoll <vincent.legoll@gmail.com>
---
 arch/mips/ralink/irq-gic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/ralink/irq-gic.c b/arch/mips/ralink/irq-gic.c
index 3bab51a5fb4c..8bc566ea00e5 100644
--- a/arch/mips/ralink/irq-gic.c
+++ b/arch/mips/ralink/irq-gic.c
@@ -10,6 +10,7 @@
 #include <linux/of.h>
 #include <linux/irqchip.h>
 #include <asm/mips-cps.h>
+#include <asm/time.h>
 
 int get_c0_perfcount_int(void)
 {
-- 
2.46.0


