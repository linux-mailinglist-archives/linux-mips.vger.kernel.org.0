Return-Path: <linux-mips+bounces-1212-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4126584438D
	for <lists+linux-mips@lfdr.de>; Wed, 31 Jan 2024 17:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0602B289BE3
	for <lists+linux-mips@lfdr.de>; Wed, 31 Jan 2024 16:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7464484A37;
	Wed, 31 Jan 2024 16:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="qRe/M9ly"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B790A63C7
	for <linux-mips@vger.kernel.org>; Wed, 31 Jan 2024 16:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706716837; cv=none; b=Ks8sAjOe1+Efl4YLytw9/SzEa0+JX2CJ3ys4r+J495q0+KccAVu9uOb3YVV8S4xMmmQ8rHelC1J3y1YMsljCMjZUX7XJk3nw4AOq1hlnEslzotz4t8Bc8UTh8san8R+3e8i1+x59gectJ0lBznhSn+cdB2iRwLQ10+MgzJoKiIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706716837; c=relaxed/simple;
	bh=nSwfX/I4NKy222TEBcW2+p2OJa9bkp/fM57ofciF4KU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IfsJRI/J1sYrIOOJhTRFWw7WkISqnDGmBLUa3TXZzHaUIeI+b8QCYwZ6fUHcB9mABfFV7+gMf+7QHLw5hWLdTDVTKU6Vj5G0yxMB/i0KSlp769L4ivDiD7Hj0z68UNh2t48ULygTtNrZwq86FwKDix3ObLF1AcUQSaP0M6+il2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=qRe/M9ly; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33aed096cb3so2655718f8f.1
        for <linux-mips@vger.kernel.org>; Wed, 31 Jan 2024 08:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706716834; x=1707321634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+Qkjn6hBpgJiZ+fG8bZMEzxCOTIiddvh/UVG/MhUw0=;
        b=qRe/M9lyL9TEurl6SK/dcol5VR7SkE7LbiAuLQmNDtxImrLPBHBmgC6k44wqBjAohu
         kUQ7OzDQSWL3PRypkFw2PI7rQ1oRUND5mJi8s6aFD2MMrPFyFCNtAFZYCpSZ7QLIvrjX
         vUlbzHFy6HzyVB/5XEYdfoGgnp9wQA2T63xeLazfZBgLlGU1ZxAT/U3nkK2+XlwQtwYF
         4Cpe4Wp4j4Bm9DScWYSRmPJZvCUn9yHEpQzNq25inrqxdX+bMemDEleL+SGPCDaWzaL8
         Agm+xPMoIKI5a+hKq3WQiTdH1Lo3KFTXK6CgrA/SQuKjza9yBgnTctwXUIxqSFOn2net
         NYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706716834; x=1707321634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+Qkjn6hBpgJiZ+fG8bZMEzxCOTIiddvh/UVG/MhUw0=;
        b=QkuBe6KbE/Z3tY6cnGNp8okJ6kNyGYD1wh3c0YQs+go3kTOFMls78TrN7NidEZ2NI7
         h/Ng9bUsBdv7GAmMEtdwK6R/BdFzdpDFfHqDaSU3myQa41OZlH1i4GhirdVam+eCnW5u
         +QiKbTHDWAu5vHw3mud6mPK3PQpj9NR+beTdcot2f5+kXsJxDdyagrsWNVmVY0bLtL2u
         zGcpVapmMENTAuUB0fukqBePx/JdaC/jp70bhonV0BWjWYKH0nqqEmqgPiyv1MleF1ut
         ntx7VkRNDDTnqwKOw59W3DBBoOxnJAoZbfSrJ5X8JIfPSZlOQ9V+yhfLVkwV7r6LEWBM
         zU4w==
X-Gm-Message-State: AOJu0YxAeN2ww451L6UowNmRsa/JjLqMQJYnD0jbOeomg+GKRRucSGTW
	Z9jYOAT3WQjzSIk7lesJCJjE2vhowkabUuG4DJHYALy5w3PB1IgNdHIoAX1cxNg=
X-Google-Smtp-Source: AGHT+IFOSxR0VWlTtt7aglVFKjETqM8YWHF0sImDLgGpk3Msu3yazxT2zwUbsrkmDtaiclYuoSVVQQ==
X-Received: by 2002:a5d:5917:0:b0:33b:d2b:58f3 with SMTP id v23-20020a5d5917000000b0033b0d2b58f3mr558876wrd.19.1706716834000;
        Wed, 31 Jan 2024 08:00:34 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUn1b13ZNRzCy283eTAlYXQTLMwRwVlajpW6U17NkyZK4wk2yBhhQ7T7nAGYIIbO3fJ1ARDkhMYCymd0vjQMM0mrJ0m/2m5lqBZyglATKjW6Zzxk/B6IJxznkuZmxZ1TJ3cH/Jp7BwBza6guGnEdasuQE0GewfiE3ubxHmLjvIs78DGDJSzfU/27VEF5pveogS4Vow/bhAbdFMdW/IYDGaAnF3nYumVGAKKCQ9nOgSKC2eBOC9xOLx9JnZoKZ9Ho2yCI5z7MSseFIDdPa/XkBHE54iCbRdQndKCDPy8bxiyotgwxiZcx3+SuuiPofERe0MckS2S/6E/kyrL0HaRaM6pU0woqZankCuKbNH8VnYSPLkzkZXNl1AoJEPO2fnXvrc8+TnmO3oeiqwbluhwV/1QlsQj8h5rpppgqTJEQ3xcqtL5sWlt6z665n7oC4bUikHUEWzai7vZXm1fcPUkYFOER3XwNdulkf/usUZHT/OjBrDM0lxJa6CFYX9RdHrjmrlArydX8NPIXD5OMrv4c+E2pFpdAAT5fFO4s3946JLh8K6iNGoyV/fVL/yo3WohQ0Ry8fKH1EPmF4vZRA5gJKtC5ux/QZPWhUJlSKGm0HRLl5zV1RXt+xleNrI19UU+2m9Tgg+hmovoV0hevg==
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id v8-20020a5d59c8000000b0033af2a91b47sm7494000wry.70.2024.01.31.08.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 08:00:33 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Matt Evans <mev@rivosinc.com>,
	Dylan Jhong <dylan@andestech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH RFC/RFT v2 1/4] riscv: Add ISA extension parsing for Svvptc
Date: Wed, 31 Jan 2024 16:59:26 +0100
Message-Id: <20240131155929.169961-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131155929.169961-1-alexghiti@rivosinc.com>
References: <20240131155929.169961-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support to parse the Svvptc string in the riscv,isa string.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 5340f818746b..2e15192135fb 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -80,6 +80,7 @@
 #define RISCV_ISA_EXT_ZFA		71
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZACAS		73
+#define RISCV_ISA_EXT_SVVPTC		74
 
 #define RISCV_ISA_EXT_MAX		128
 #define RISCV_ISA_EXT_INVALID		U32_MAX
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 89920f84d0a3..4a8f14bfa0f2 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -307,6 +307,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
+	__RISCV_ISA_EXT_DATA(svvptc, RISCV_ISA_EXT_SVVPTC),
 };
 
 const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
-- 
2.39.2


