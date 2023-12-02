Return-Path: <linux-mips+bounces-469-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB94801C62
	for <lists+linux-mips@lfdr.de>; Sat,  2 Dec 2023 12:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A56B1F211A3
	for <lists+linux-mips@lfdr.de>; Sat,  2 Dec 2023 11:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F5D7493;
	Sat,  2 Dec 2023 11:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+V5pyiV"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AECF1B3;
	Sat,  2 Dec 2023 03:14:54 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50be9e6427dso262008e87.1;
        Sat, 02 Dec 2023 03:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701515693; x=1702120493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygdtXD6vQmhTkyIIFbEZLW4cEgmK3nTQybwd/aOy/dw=;
        b=H+V5pyiVslE0Vdy0IxLksla4ZkUfMHpLREjrSgY0+IoU7vWZInF6iAEa6hmnT4frdH
         3i/HG4vhM5WiKTy8E2HWfCWEvc5v4ZiIIRkH/sZNN5c3v2QGXW5HQTZxLM+ac0xI08zd
         s9q0TyKqzM9mhh4Z6lVCaVnJnyYJV12VUOd/tDO6XQnl2rcPRjWXONC0Xt3Rw9eFXi6F
         vmKB11P3wvb53KJ5iFubeyCWl7CAz5pznJJ9ObMpPRQk14uaBlW3AV81OvZSKexfXNTv
         95J0nX28HD6hjKc9z8rnPfgydHA4cH+oRgrQyOecW1Dc0cg9SbJmVCgA8BIuVNT0dhU7
         p3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701515693; x=1702120493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ygdtXD6vQmhTkyIIFbEZLW4cEgmK3nTQybwd/aOy/dw=;
        b=xUMnzUFZkwBjZp1O9/o3/DDwuFWDvsxdu/d5nWtjqXJUF7yXl6Plv103syXL7LRTcR
         aBCp5LqoAAIk+Dxygn9tpUAUL3uCKQUHqyCDsGlbgLkYCFVG1fqTDaajEtrNkzLY/oIK
         QLVj9/K16CtM20bQMU46x9agPav3Rvp/wfYzWJ6+N/pseUYj6QkhLlDgTr+YN3VrvVaC
         KANvc4Lg5uHDxBGB1/RagUaylW9Wjfo8ifLaRbSyeaxvySAm3rk1IemHsdg/dZgbTBux
         O1f267VDXVYNz81WuMLnFmLAzqvJqz1OSJHbMKmIBlh9YtsfrGZJb2QMHKNtT0Rk/qKF
         g0dw==
X-Gm-Message-State: AOJu0Yy/nVYkWIeGGOA0xxyDwIGBEISVFGwasQ9ycdsH+4lgQgevV1sJ
	IgzuMXD3XMnzovcM1hMOiIQ=
X-Google-Smtp-Source: AGHT+IFScOFSCgDmnBrEbGs2UJA5K5JEy5fdtO2oKyTDCGHtKc+hpIQHzB67DbaHrlLa/RzVHh6mJA==
X-Received: by 2002:ac2:44cf:0:b0:50b:df82:3137 with SMTP id d15-20020ac244cf000000b0050bdf823137mr805626lfm.43.1701515692770;
        Sat, 02 Dec 2023 03:14:52 -0800 (PST)
Received: from localhost ([95.79.203.166])
        by smtp.gmail.com with ESMTPSA id o8-20020ac24bc8000000b0050bde3d7ed4sm309731lfq.147.2023.12.02.03.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 03:14:52 -0800 (PST)
From: Serge Semin <fancer.lancer@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Serge Semin <fancer.lancer@gmail.com>,
	Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
	Arnd Bergmann <arnd@arndb.de>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Baoquan He <bhe@redhat.com>,
	Chao-ying Fu <cfu@wavecomp.com>,
	Yinglu Yang <yangyinglu@loongson.cn>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Mike Rapoport <rppt@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Zyngier <maz@kernel.org>,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] mips: Set dump-stack arch description
Date: Sat,  2 Dec 2023 14:14:23 +0300
Message-ID: <20231202111430.18059-7-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231202111430.18059-1-fancer.lancer@gmail.com>
References: <20231202111430.18059-1-fancer.lancer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the framework of the MIPS architecture the mips_set_machine_name()
method is defined to set the machine name. The name currently is only used
in the /proc/cpuinfo file content generation. Let's have it utilized to
mach-personalize the dump-stack data too in a way it's done on ARM, ARM64,
RISC-V, etc.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 arch/mips/kernel/prom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/kernel/prom.c b/arch/mips/kernel/prom.c
index f88ce78e13e3..6062e6fa589a 100644
--- a/arch/mips/kernel/prom.c
+++ b/arch/mips/kernel/prom.c
@@ -28,6 +28,8 @@ __init void mips_set_machine_name(const char *name)
 
 	strscpy(mips_machine_name, name, sizeof(mips_machine_name));
 	pr_info("MIPS: machine is %s\n", mips_get_machine_name());
+
+	dump_stack_set_arch_desc(name);
 }
 
 char *mips_get_machine_name(void)
-- 
2.42.1


