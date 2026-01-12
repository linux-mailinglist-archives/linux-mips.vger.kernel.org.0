Return-Path: <linux-mips+bounces-12870-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD94D159FB
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 23:49:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CA783062B28
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 22:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 789AC29D294;
	Mon, 12 Jan 2026 22:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GPEVEtOa";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fWIu6sVh"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8BF28EA72
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 22:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768258136; cv=none; b=kU86Evyw/VBfQmswxDgQ2rr2yyO3roHg9cAqzx62bewPHvGJgPagw4UKp6VKlNSJLSJ0WpdRtrMB6IvPig8f+W8uI3A1GjazebXpwecxn36tRHlFrwkCQardzyvCAfOBnEFGW6R0VwO3bh8ZeDrWcv6Cmw5f4wruqphhqI1PtnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768258136; c=relaxed/simple;
	bh=t6MUno6/S9KBiNskoV4wrYVpyaq4ARAc97+NjYwwR0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CB8wHOKnPnEiIM0oT/ti74klRzPeuNS/gJuXPyAOC2pL3AkFseOYZvlmvtx8z02c+yZ62RAytCAvFO9+KBfjrDR9LZC6ag1Gh4oY6PH/zhsYLfhqFQCgoD8c+TXEtBOvc71IZFHoryWmuWliQVgnnuyrwuNSBYzp9MDHPliCTLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GPEVEtOa; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fWIu6sVh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768258131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZPUdCWMakc9k2umHqRo1kWIPyjDcLybUP8jorXN8jzs=;
	b=GPEVEtOaBzfEY3wOI9nYONqKcyRy46GE2vdOuaVsA6u0N8Ks9Mtx7WAB8gz4LpcxF/+zae
	TjrLCRrLBbG96V1ehZjf8JoyII8wlo5cBrpGkvBTaP9TTPo6Y1ghx9PPnqVC2S3Qx6k9ar
	Wfny7Y09Cf1VTwgTlZVyMYlfSmn11DA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-zjh_pzanM8a1nnramngZhw-1; Mon, 12 Jan 2026 17:48:50 -0500
X-MC-Unique: zjh_pzanM8a1nnramngZhw-1
X-Mimecast-MFC-AGG-ID: zjh_pzanM8a1nnramngZhw_1768258130
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb9f029f31so1889441785a.2
        for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 14:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768258130; x=1768862930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZPUdCWMakc9k2umHqRo1kWIPyjDcLybUP8jorXN8jzs=;
        b=fWIu6sVhvgbLvZ1OXc219dT5kwGORUd/yVM/mGRFtBlxOLvKvDM0oJDICXwYGw4UFk
         2soCZsBy5/CtAIjuAONIz3qKrB7ei6+uMnUVWoiUmXvUlA0xHDHWBKbP/hEcRdZFmjMo
         KV5bUYbfXxRdb692RSw3JmO+6umO8WfE/wRBBFbT22AmYNfYz42WmtAH/0Fl+WkXL1aQ
         AR4F3qSjyHWBSFu80JTLpo6oscSXzL/wVT8kiZaushGDuhEU3wGhjqPvoxf05M1hj3Li
         +v1trUcKp//ipxd4MlMJoME5BUqXFOeU51t5WiS0FJWlWRv6Kp2Ud29peTMtTf4OHoQF
         ZIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768258130; x=1768862930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZPUdCWMakc9k2umHqRo1kWIPyjDcLybUP8jorXN8jzs=;
        b=PEtQtC/vbVCJa1UFtXOwPImCqzl/WlKD9mgEeeVZo/bqB6/3vngTGW5/K4yoXFX9ek
         iwqdaTMPe8ud0WbCInqI3p7F/1RvKcRaVcMaN2YGDTFxg8Ux42MPz5poUKeOlCh2htZf
         HoH46J1zAdYzbDKnNQ6LNoabNOjHCvSmIunDl1luBsGoM3Om2W3Fg6RPVInxlTdL1Ka3
         qgptuwWVxbDXrCL0wivHJ30hDbT2uHZpMstjFORpN1R3+8g5G9iKvpOk7YYiFWebEIG0
         l3NPFMl/JdO+69ItY2GyI/zKroM3KuDijiUk0UUkTjriDwARlSDizlCVeQ/WVtPuLExZ
         ONgQ==
X-Gm-Message-State: AOJu0YyJApNxnv/wvksbsxkyy2KZe7pMi79fNn0bt0EP/isMB47Nnw7S
	vx/0QkxzGK1YZgjWjUcobwGcTrZTsHqSKgvjh29VSQh9hb5Z80yTackNjrUiPDoJd2fP05rqtCU
	R6b73UM0oFaWu2kCug51pSubQZr+TUOB022L1zs5D875KHIp+E4trwPhrT0L6Uis=
X-Gm-Gg: AY/fxX4GJqsF+pI1FePpoTD4K25NBzBQCW6AuetWoAdbLbduOcDhEeBTb0AY8CD35SZ
	VSo7u57W+GIq3NENVXMQqc/e1WtxXkFl7K+A7O+yN2fUG884SdqiExg4hd3nH0h+zxWiCCxwF2e
	+1+wnyovbB5SXnkd0c41YxAovE5curLEDnxJFajl70FCrWkOFPGnF7BJABs35kfdj8ZQElp2+tc
	MOs2GgquMTsajPjpyBVMoB3C309bzWkGho7mDvVyVTVfMneH3w9fUlzWhurkxEvPLZQxaALycss
	4srrs6RSb6i04M7H+WpBIuTrDdShdisey+fP4sOR2nwVPFd/iglQn7+2TWtfV86Dm428CrJ4vMq
	2IQpumeD6ykH7jQVqb/MeAJls7M7Rm9DhXVCJxOB0LuSK07EKtg==
X-Received: by 2002:a05:620a:410c:b0:891:bcdf:83dc with SMTP id af79cd13be357-8c3893840a9mr2818290085a.34.1768258130056;
        Mon, 12 Jan 2026 14:48:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/0Vva4PlN4pGfc55q5tIYaB/tUJVU9qVnAtzAF6uyhVqxB2oml4258dNqRpsnUBLzUAY21w==
X-Received: by 2002:a05:620a:410c:b0:891:bcdf:83dc with SMTP id af79cd13be357-8c3893840a9mr2818288785a.34.1768258129718;
        Mon, 12 Jan 2026 14:48:49 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6145sm1580930385a.5.2026.01.12.14.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:48:49 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 12 Jan 2026 17:47:56 -0500
Subject: [PATCH v2 02/16] MIPS: pic32: include linux/types.h on pic32.h
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-mips-pic32-header-move-v2-2-927d516b1ff9@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
In-Reply-To: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=957; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=t6MUno6/S9KBiNskoV4wrYVpyaq4ARAc97+NjYwwR0s=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJTq7xk1CfJbPBt/quY2juRifX89u2GdyfbebJPf6i+T
 u/r0RvfO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjIgjWMDHcufBDame5+VVN8
 RvgZY8Gj+fOFvj61UMw1qktPLXucls7wv2Dyf0OtyX1/FrpGnZ3exn85unGFr1GK2tHdU3LP8Mp
 /YwEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The pic32.h header file currently includes linux/io.h, however that
header is not actually used. The only header that's needed by this
C file is linux/types.h. Let's include it so that linux/io.h can be
dropped.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/mips/include/asm/mach-pic32/pic32.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/include/asm/mach-pic32/pic32.h b/arch/mips/include/asm/mach-pic32/pic32.h
index 53918a671a4c39dba2a22121187cdd73e1935b24..e71c92a7bfde1342be6ea89a4bdf1389aa463b38 100644
--- a/arch/mips/include/asm/mach-pic32/pic32.h
+++ b/arch/mips/include/asm/mach-pic32/pic32.h
@@ -7,6 +7,7 @@
 #define _ASM_MACH_PIC32_H
 
 #include <linux/io.h>
+#include <linux/types.h>
 
 /*
  * PIC32 register offsets for SET/CLR/INV where supported.

-- 
2.52.0


