Return-Path: <linux-mips+bounces-7828-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F6AA3A4BD
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 18:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F7C31889B4D
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 17:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9795270EB8;
	Tue, 18 Feb 2025 17:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkZAoCLh"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5A426F45A;
	Tue, 18 Feb 2025 17:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739901480; cv=none; b=ZrdPs9kJXDOL7+OhO40My2/diAegpV+rDGd5EB8qS2pPZK4WzS3bh9FzBIpE+eh2CYcZRDtrvhmuMEkfRH7vwEDtDAdq//qI4oL2o/1Y/omhWu9qF3iG0EOe/W/2Tj55gSyxskxVJXv6sOwWlsjUDPWk9guPs+wtoxUxHnZPXNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739901480; c=relaxed/simple;
	bh=SKnjvoPaAHGikEYH0U8N6QZO8ST6XHXeB5oJXKQXdvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MrjOb4KgG1Iu4uifbOc6fP1nTzfBtGljrd+hKDkrxcDKite04zUlAo25SGBVWKreAi1QdAYv1v+6G0ezeHL0wazYUWG4MGvMPqC+8rb3bo0ETSwhQe9zZ0cp116jV6kkXEaNXbCpl3ZDpfwbmg9rA4bStiQPV4BIQZcW9nbgUeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkZAoCLh; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54622e97753so39364e87.0;
        Tue, 18 Feb 2025 09:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739901476; x=1740506276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oFRKePU7thBon8tfL6vskAhYenxo2fl21vHaxPHsJUc=;
        b=KkZAoCLhrm5O6bQUr81CniOBnrdW53L/TerG5ciIQ5wNtt5TaT2U05C99h9zLUgaBU
         W3Fj/rqzATzC/XWfUCQtaIeMafcMbclEhQcpmpHmqnauoCkdv2jwQJER6Or2vMEsZvfE
         2mrgGk3vYlGn9ugS6dq/6OSZF/WaMgneHLuxdmUgUPciVDBy0AsL10XIy0tbPGXEeNMs
         sKaprurWeA7TA6MRWcyQnP072SNe6s5mUCQESszarGiuA0DjfZIDUg4nMG3iXOr3byM8
         2+MATmOFWa9Rq7kMtol/xPzUmYOTm95xvmGFrqzYX5SMS4diaTJGzroZNO2onrQ50ARc
         P/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739901476; x=1740506276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFRKePU7thBon8tfL6vskAhYenxo2fl21vHaxPHsJUc=;
        b=mY+H2kLCuvJ73XvFbh0FZdTLp4480zFIOO+t6Ej30c5UYcZBamDoZ8iHqHZ9+XEiPA
         nnkD72SVYATZFL0oU3q31zJhU+rayFe8tnry9KyRjf5mbzhhOz2P/soMSjN577V3qV+R
         J9m4lvYVSNfWrYtIAJtED62TO6dQaJI0l2Uht1aMw8TzP9iDO0JGcS/ETgMfBzr5wD/1
         naSXPCz37QjzY00BoQFm91GLcOF6f3Y+tE8JZTyDWRwxSYAEfdFhmt5EDEbM9G7R3Ogg
         O0/Aa0Fa70C4uDnAA9KiizVCRZ3bSC030YmsJR4myPe2g1geT4EPH5Di5CNXzRHPrr3O
         J8Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVdKWHVS3zrvzEktmVFyFftq/k1sKEwzPD+ExFXf10TIPs2QLVs8kPCjy6ECLUslucrF3G8JO5e5D6ZyQ==@vger.kernel.org, AJvYcCVzNTKneHU0oJTutpRTtv3UdQ1ISPEB7yKtuwKLsoXwoMojnhdGioYSwfBKmepaI/jbTGwMsYqYHBw=@vger.kernel.org, AJvYcCWk3UfcbfBpBbc+M3n6+a0EAcAOd4GRqH0Xe3AGZSgU8XBU3VRtuFHG/xU9oF8WCAHmSrTWmhdbbe6LNQ==@vger.kernel.org, AJvYcCX/oeRNgz2HUw/q4j6e4UiW82oqNWwAOpRiy+x+GJcrTSlv85oyJL+enSnyjH8d1SxSBgUfix6zYm0M0cOo@vger.kernel.org, AJvYcCXEykKMD1lCzMw7NTnpdlgJX1kGsjbOe15CR/ErAYin+ipoQ+MjsYXzGx9DrnYqIb+QC6Fg0dRUQxIlYw==@vger.kernel.org, AJvYcCXJzZkuCfT1tSchGr3zMNPjK1h0zcNGfDVuH94VQkMAc98xo2ya4WF084pNGoWz9mU4SXtEl/5LFyEV77zSEg==@vger.kernel.org, AJvYcCXOWddQkTIRcteU/BkY2rbbMrcMcaNxVwmhVm5YAKdMpmWEDwS6UECcICu2VNC8+/jK5Q2PVwcl3y9N3w==@vger.kernel.org, AJvYcCXYN4rFz/S1o2yjLzgo5WfvTvH7HwoKjdOD9/8wiv7asy4WD6O1rsXyfe9XeKTWURb8fbol0YpXGJQkiEch@vger.kernel.org, AJvYcCXhyq7f5kVXZ2MpMYXktNZCF6ES8+gRZd12/Z22g8FbHfyYunw24xE6q3dfy8rsqQSKc3z0ZLLVQ0P3Dw==@vger.kernel.org, AJvYcCXtkDcPmCya
 irr3AHu5lsC5ssMLDd/7TvX7WUVR5T8yonz11t/PpUAapaPFeRRCIVc5Ckg0I7wezbp0Lbzyf/o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yztj9TZtxCcIPUTIsEKT1M6i5GOATtuHjFWtd/6qExWrX7Y1tap
	exQad1BGHpNn3qdWzmCNgkXQbSqWVhleMS0Qb7odH/EclE5KDTRi
X-Gm-Gg: ASbGncuWA88tXk259mTUe1rNTRYMhNzo435I3uirlMlYU9SNqcha3Oml9gkQ5/dHiNj
	8CsYXpuTNYk4xo9E94Iz1CQGrMM7so05UIRO6cnKjQIU6d4Viv+Q2XuCGJeIxDOnLtqyDIW6fH1
	s2Rt4I9aUkgsibD0aEE/RK+7wkgEcx8wIaX7VoXOxfT/ez/EHrbFrV8DUfpGYiHuZkRuJA+QNdo
	vOBibeAMNDdDlA09cGB2DHEhUfPoC8cvb+pJvUKm8V8uSi47PYCRlEexrO1DY3iThdZ5tjbfxfX
	5IfWqLGGx7ApjNrt9Mrl96s9hbWyxibqVvCBV3eSmykOI0pwt6cfP9aOu+NICw==
X-Google-Smtp-Source: AGHT+IGfFBi/u9SniGtV33nIqkglJaUtkaaAX/KBzbUXSrhxIdAk38ItpiS7x3PdO+hl8rMx2A+8sQ==
X-Received: by 2002:a05:6512:3b23:b0:545:550:83e6 with SMTP id 2adb3069b0e04-5462eaa1f1amr241343e87.5.1739901475583;
        Tue, 18 Feb 2025 09:57:55 -0800 (PST)
Received: from es40.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545254f7072sm1709286e87.127.2025.02.18.09.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 09:57:54 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: linmag7@gmail.com,
	richard.henderson@linaro.org,
	mattst88@gmail.com,
	glaubitz@physik.fu-berlin.de,
	ink@unseen.parts,
	kees@kernel.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: chris@zankel.net,
	dinguyen@kernel.org,
	jcmvbkbc@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	loongarch@lists.linux.dev,
	monstr@monstr.eu,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 0/1] mm: pgtable: fix pte_swp_exclusive
Date: Tue, 18 Feb 2025 18:55:13 +0100
Message-ID: <20250218175735.19882-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first version of this patch intended to fix issues with swap memory on
alpha, when swapoff fails to writeback exclusive swap pages and gets stuck
in an infinite loop trying to do so. This problem appeared after commit
a172d5128706028ac07b8db709728379ecc72f6e and as far as I know only
affected the alpha architecure.

Changes in v2:
As suggested by Al Viro, rather than doing a bit-shift alpha-only fix this
version of the patch makes pte_swp_exclusive return bool instead of int.
As Al pointed out, this will also better reflect how pte_swp_exclusive
is actually used in the code.

Best regards
Magnus Lindholm linmag7@gmail.com

 arch/alpha/include/asm/pgtable.h             | 2 +-
 arch/arc/include/asm/pgtable-bits-arcv2.h    | 2 +-
 arch/arm/include/asm/pgtable.h               | 2 +-
 arch/arm64/include/asm/pgtable.h             | 2 +-
 arch/csky/include/asm/pgtable.h              | 2 +-
 arch/hexagon/include/asm/pgtable.h           | 2 +-
 arch/loongarch/include/asm/pgtable.h         | 2 +-
 arch/m68k/include/asm/mcf_pgtable.h          | 2 +-
 arch/m68k/include/asm/motorola_pgtable.h     | 2 +-
 arch/m68k/include/asm/sun3_pgtable.h         | 2 +-
 arch/microblaze/include/asm/pgtable.h        | 2 +-
 arch/mips/include/asm/pgtable.h              | 4 ++--
 arch/nios2/include/asm/pgtable.h             | 2 +-
 arch/openrisc/include/asm/pgtable.h          | 2 +-
 arch/parisc/include/asm/pgtable.h            | 2 +-
 arch/powerpc/include/asm/book3s/32/pgtable.h | 2 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 2 +-
 arch/powerpc/include/asm/nohash/pgtable.h    | 2 +-
 arch/riscv/include/asm/pgtable.h             | 2 +-
 arch/s390/include/asm/pgtable.h              | 2 +-
 arch/sh/include/asm/pgtable_32.h             | 2 +-
 arch/sparc/include/asm/pgtable_32.h          | 2 +-
 arch/sparc/include/asm/pgtable_64.h          | 2 +-
 arch/um/include/asm/pgtable.h                | 2 +-
 arch/x86/include/asm/pgtable.h               | 2 +-
 arch/xtensa/include/asm/pgtable.h            | 2 +-
 26 files changed, 27 insertions(+), 27 deletions(-)

