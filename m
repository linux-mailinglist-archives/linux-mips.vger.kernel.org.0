Return-Path: <linux-mips+bounces-3247-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9D48C36A6
	for <lists+linux-mips@lfdr.de>; Sun, 12 May 2024 15:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DEC41C20DFA
	for <lists+linux-mips@lfdr.de>; Sun, 12 May 2024 13:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E2F224F6;
	Sun, 12 May 2024 13:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BONgc8tQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FD0BA53;
	Sun, 12 May 2024 13:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715520327; cv=none; b=OJT6R2qYaVm+q85CydKyPQfTc5tvyAOzWt+s6Zp+k56lTLHZczlXD3OzzTaeTk6rY73Yulgvd7gt6DD+oBuGzK4S0sivxyubk6nqFJpLRG4Et19CLi7aOKxB2Y2CpmJ+r/y1XUkPLGb5noQHp0vISEq2LDtNb+jpd1Akz7Un+8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715520327; c=relaxed/simple;
	bh=1H8xGaJ65PM8HyUnZQrD+eYZ9YGfrZ7gD7RtSvE67Hw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tg10sAjAwA9ECf0Z5ESRNzB9mGDXgUVvUoBy9NUkp1befb+9uVGSr2ToArazkKekuyOnYNbwT8id/kg/YuW9DfaXkI6dJOrhCMOwzA5iaTQCYYLnEV650+ktH+wo17uUcAVFHaYvP0yfsIfdVkIn4cN09SXJ2lnm6mRj0yJwfrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BONgc8tQ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51f1bf83f06so4211210e87.1;
        Sun, 12 May 2024 06:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715520324; x=1716125124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LCS3612N6Y6sdjAmNgdlUrZt5y0g0cl0vekU/uzKFS8=;
        b=BONgc8tQ39v15jGbRq3UxrTaIsKvPZhw4Om0vj+rXMHkzkVHD64YDh5ZtmPIKRbv6l
         jH3Puehr24hzZU+GBaZnyMXWfco6p7O/lR4uRpKOVZU3PPYY8h4yRObm4Sd1InT6AQvB
         j0b3zhCEMqDAY72nshmMWSOdfL84fbGWPwRzceJe2gxcBmUxchT9djRZwp3/JAbb5ksT
         MPHjvBp+6eT0NrfqRvvZ5b8GcBzDp8LpkfFyl2uJVosdAvFlm2V4D+FeqG9DNvva5poH
         cedNGIt+Fr/c+cIB/pjk0/1faZSP848JZAnX7Ps1hXdk2rO2Dd0SeKmRWfeaD7pFI8/+
         9uTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715520324; x=1716125124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LCS3612N6Y6sdjAmNgdlUrZt5y0g0cl0vekU/uzKFS8=;
        b=aVVb39uETKuuT8Cd2h8rxdhWJRSQCODlcHBBpxEDYLsE08pBSAht1DEtjtfA6sm0H2
         V+FHVbTSuYR2J+4GtrqG3Dh+fgWKtGiBItME2XwHjah4hK0pfmDZ+GpPuEoyYKQtpPP9
         RK1+y/nL2X149Fv2MV/NiER47yJJmVAiqzUCHLzYBKpwmYVrWST8mtUT+gMokdKWM+jr
         DDsYHKyUWPHkNiEJBgwfQC0Md5B1FoXygSx1V0XrkKijv7SoNKwzTKMhmHwdGs9SUTRT
         81h8yQo+F/IzmMR+eu8EG78Q5SPdaiVokXdI57YRgVvjK9gt/jfPc1EMBYD60u2WiZ3K
         ThQw==
X-Forwarded-Encrypted: i=1; AJvYcCX8Qyi9qSmKiprxY/bEfKXoS7qZ7jHfceAq7EcYs+MVWBayWjQIoNSUbX9XpEdyafjFv3BEpO8A3r+5xPU+GitB8am3CenMlubrhj7SPy4SZYuXkeYlfYCvE84T7wGLZS6oKPE/GOkJ4vvle+MB3tuxNR6ft4K0qGfKDpAsQ1s8ld4qQqY=
X-Gm-Message-State: AOJu0YyHPkCUWuLPEhUFij5SoroQZnGBZF9SVB8bZDMr/Zly5GiFjjNw
	GJDCQc93gFfZm69DKd4yb//vLsbY3QQv18DU6tFMxLwpWKb5UWOU
X-Google-Smtp-Source: AGHT+IFLKdFwJikHo0qpbkYuEhY0OIUSviZnuUx4EpJgHN2ELU+A/9Jp3gAX2p7QBkeNdUdksGBReg==
X-Received: by 2002:ac2:44d8:0:b0:518:b144:9020 with SMTP id 2adb3069b0e04-522102729a0mr4617394e87.61.1715520323645;
        Sun, 12 May 2024 06:25:23 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3502b79bd09sm8822468f8f.14.2024.05.12.06.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 May 2024 06:25:23 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Saravana Kannan <saravanak@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Helge Deller <deller@gmx.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Baoquan He <bhe@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	David Bauer <mail@david-bauer.net>,
	Liviu Dudau <liviu@dudau.co.uk>,
	Serge Semin <fancer.lancer@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 0/4] of: bootargs handling improvement
Date: Sun, 12 May 2024 15:25:07 +0200
Message-ID: <20240512132513.2831-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a very simple series that try to solve a very simple problem.

Many emebedded devices have very hacked (by OEMS) bootloader that do all
kind of modification and makes the kernel unbootable with the very first
small modification. And also many times these broken bootloader have
hardcoded values that can't be modified and would require risky
procedure that can brick the device.

One of the common modification done is hardcoding bootargs in the
appended kernel DT trashing the bootargs set in the /chosen.

The main usage of this is to have dynamic stuff to support dual
partition scheme and make the kernel load a dedicated rootfs. But the
other usage of this is to effectively lockup the device and cause kernel
panic on modification like using squashfs instead of legacy jffs2.

The simple solution to this is to let the bootloader override the
bootargs in /chosen and make the kernel parse a different property.

From long time on OpenWRT we use bootargs-override as the alternative
property for this task fixing the problem of overridden bootargs.

The second feature is bootargs-append. This is self-explanatory,
sometimes bootargs from bootloader might be good but lack of some
crucial things that needs to be appended, like rootfstype or rootfs
path.

This feature is different than hardcoding the CMDLINE since that is
usable only with some specific case and is really problematic if the
same kernel is used for multiple devices that share a common kernel and
.dtsi

Christian Marangi (3):
  docs: dt: Document new bootargs chosen property
  of: add support for bootargs-override chosen property
  of: add support for bootargs-append chosen property

David Bauer (1):
  MIPS: add bootargs-override property

 Documentation/devicetree/usage-model.rst |  9 +++++++++
 arch/mips/kernel/setup.c                 | 14 +++++++++++++-
 drivers/of/fdt.c                         | 15 +++++++++++++--
 3 files changed, 35 insertions(+), 3 deletions(-)

-- 
2.43.0


