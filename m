Return-Path: <linux-mips+bounces-12022-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1202CC30166
	for <lists+linux-mips@lfdr.de>; Tue, 04 Nov 2025 09:57:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BA54F4F711A
	for <lists+linux-mips@lfdr.de>; Tue,  4 Nov 2025 08:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F21124290D;
	Tue,  4 Nov 2025 08:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B8C3XyMb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48BD277011
	for <linux-mips@vger.kernel.org>; Tue,  4 Nov 2025 08:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762246170; cv=none; b=umpjEBmAFlV551XHUtR0dNfkxqxnFb5nF9adh7m/mezFUReO9lMsQVLA8FlsJSRqaw4dk2wJwZ2cmR5Mm5HhD+0Ro62g6ph7F5c+1FGa5ArkSkVDFZJXa2e2DR8MlLA41ubgRe7+o1DYQNf5qCFJF/qmEpqRzcz5aPmIgTzq+8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762246170; c=relaxed/simple;
	bh=bwGYumF3/kIIW+zzveEhCKzNJ0ATBCRDR2j8OQO/23Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DhzmW261LiFxhVQSeLd0zPFg4In+cc88Ld0Mv1j3A4aw73zpXzwBI07lr/Aie8ctQqIjn70ovsWnb5BpVpvRB1UBniOO2y9gNcADrS51SQS8YqSnNBTWD1F5u+LYf+O/PJo/lkFQYuR/nlsZ7WWSiEExdx5EzogGLVgAnVHdEM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B8C3XyMb; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b994baabfcfso1252662a12.3
        for <linux-mips@vger.kernel.org>; Tue, 04 Nov 2025 00:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762246168; x=1762850968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZzjlCCT3j9j2Nd7pQrTgnxvKhulGcz35Gruny6M5Bw=;
        b=B8C3XyMb9sztvNGcLQuH6oELUi82MwvYPXNmWWwVZIXfJq8n/xMbwV71TvTKuLCkJZ
         xhN1jiesHsMzW3f5vJ5e/b/BdlT36STvsi2Pz9VXlkWjzW28wHdkMaGfdW4prBvnhyDS
         MnBB0MWpzyg0WAbTKOcRL0HEqKKGGILWd1tYLmmM9mltkl2NNjAMKWQQu+5GQ4dZkI/v
         LFfZUOu3NcG6JQhKzcrj4R1hnhUnY1lN9PJLWHKdhJY97SOZQKbSJg/lRiPjkrecRkot
         Uqpm7EI7EdWWIfftAaBZjndccgCh+JhKr1Zy6PsTyIwKgLM4nLR67MZ8H00wsYwfKZIe
         Jqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762246168; x=1762850968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZzjlCCT3j9j2Nd7pQrTgnxvKhulGcz35Gruny6M5Bw=;
        b=d6ncGEALMmHKc0JX3ZfNkYJ/po8Npqbe2zug00TsrocbKA1rr3CSzPJcJRjjjio8L4
         l6NcaRe+H2E36T9mhyh0LpgcLnAO0rpQzuLievfyDKpTXUzfakbTg/sJVu9sNnUn5i2e
         mlRZMWDwAQ8/DBZ7iWcHGJ91fjROPZ4v3gJoC+EYyVHqjqrO/5cLD8B6iUqKi9k/wk+j
         mL6778rrwwu3d1izC7/TyLKL54pQHLBxPN5CNpY4OwOZkqa1qSztC9xaLNjSrcLRXKp1
         aXrANeSDMsRvOld2Tu70bgZL5/Qlm2Jqcv2AZgPZL2POgmUJ4giXPTYIJQZl6Awg3s0I
         O+ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSSMQV7Xt1DKkES1SSlkV5W+oFlNzeAhbcYto4ood6ErgoBnpDRiFblCAWlUrgyd+LdBUuKsWp6Gzc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0IQEQ8ip93ucX9rfQ5OWkRbKdoc/Eyl4lmmHmG9q1wDufCjgL
	PhdmZSCy9crvZL6RyUQW//+g75AI0EM+ZJLuB82s5t4W19kRY91Zoqpe
X-Gm-Gg: ASbGncva1PrQAkbpQd7LiCxvgr8ffm4oiZLEI8n80FJHZ7PABvZYEOQFXCs2QJV1ZmX
	jVbpZ7h2/O5hbx2yboBkL5CvHDTmzGtd8m/LJyXwVyP30lGUw6UTgq3TXKmufFhTU0O/x5dcMjP
	09HiNK8Vef3yNyF3ygZpCFGjNIFNckZH2xaODZkg/cJ+ZRo4ilJnzgOImNCr4SamxysweifwmTO
	vfQssjmfA5MvK+pl0KX3MzwhY4iEwkfS929tbYkdiys6TueH1bss0PvGsgsCdfWprHDuMo44YZf
	fMqqSDAMS0cyRh0X8mPBY+gq2ndCXAcGR7J10BtqLScwCOucbTTFjk+quS17vaTjsMkPBbVcWu1
	KV/d1g0rzX+snPvBtTSRaXFMYLaGU6tMIBDDuQLaOjlM7punnFI/kMgZ411L/eyVVoBD6M/kFeo
	nE0sqGgW5naXPryf5079nJQA==
X-Google-Smtp-Source: AGHT+IEjMIiSe0x3JjyWJftYAjRTnLk4yj1+5guJH64mFdGd5LprT3gQcg1E9FYpKQf1UnNjUVPGcA==
X-Received: by 2002:a17:902:e801:b0:295:7f3f:b943 with SMTP id d9443c01a7336-2957f3fd4d1mr114855785ad.28.1762246167913;
        Tue, 04 Nov 2025 00:49:27 -0800 (PST)
Received: from iku.. ([2401:4900:1c06:600d:d663:3d9f:b9aa:53e6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415c8b5cc1sm3692393a91.18.2025.11.04.00.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 00:49:27 -0800 (PST)
From: Lad Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: thomas.weissschuh@linutronix.de
Cc: Jason@zx2c4.com,
	agordeev@linux.ibm.com,
	andreas@gaisler.com,
	arnd@arndb.de,
	borntraeger@linux.ibm.com,
	catalin.marinas@arm.com,
	chenhuacai@kernel.org,
	christophe.leroy@csgroup.eu,
	davem@davemloft.net,
	glaubitz@physik.fu-berlin.de,
	gor@linux.ibm.com,
	hca@linux.ibm.com,
	jstultz@google.com,
	kernel@xen0n.name,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux@armlinux.org.uk,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	luto@kernel.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	nagarathnam.muthusamy@oracle.com,
	nick.alcock@oracle.com,
	npiggin@gmail.com,
	sboyd@kernel.org,
	shuah@kernel.org,
	sln@onemain.com,
	sparclinux@vger.kernel.org,
	svens@linux.ibm.com,
	tglx@linutronix.de,
	tsbogend@alpha.franken.de,
	tytso@mit.edu,
	vincenzo.frascino@arm.com,
	will@kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [tip: timers/vdso] vdso/datastore: Allocate data pages dynamically
Date: Tue,  4 Nov 2025 08:49:11 +0000
Message-ID: <20251104084911.6961-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014-vdso-sparc64-generic-2-v4-24-e0607bf49dea@linutronix.de>
References: <20251014-vdso-sparc64-generic-2-v4-24-e0607bf49dea@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit breaks boot on Renesas arm64 RZ/V2H and RZ/V2N platforms.

The boot process doesn't complete anymore with no obvious error logs to
indicate the cause of the failure.

Reverting the following two commits fixes the boot issue:
  10d91dac2ea5 ("vdso/datastore: Allocate data pages dynamically")
  6a011a228293 ("vdso/datastore: Map pages through struct page")

Cheers,
Prabhakar

