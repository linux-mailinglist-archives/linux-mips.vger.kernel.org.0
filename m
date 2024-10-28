Return-Path: <linux-mips+bounces-6536-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E389B3BF4
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 21:37:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 307911C21F09
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 20:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043AA1DFDB2;
	Mon, 28 Oct 2024 20:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/6ke94/"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C496A1DF991;
	Mon, 28 Oct 2024 20:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730147809; cv=none; b=udmZHmSY0qZDM8CnZoCpFgKIoSZOFbu+VYXyhs0DdSww8j486PrBfb9Xl1jQcQO5dyqll63ZFQnxIRU1cmddGOXVSTzOgf6f/x3DHX7bsOaplKZzT+4Ohvm0ehCr9vRCoGbDljCbrb0S58CN9JTUQMzZTlgUjz09BXGOmaxGBZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730147809; c=relaxed/simple;
	bh=/0ZziypMkejXVrOV1oWolzVvaP0shbjtNwxvb6N18nc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l5PI3Ufd6fq5YgfQe3ya3uxdBuYwkzuX3JjKf+zhTxerGzz4HTc+XV6nV/OhaVb8pR/7ptV3KaWO4haMNKY9HbDxjESoPQygX35zUcXuxhH1f9E8W3XZjD7PL8D6JfvlU1kG7sNX3XFd+SEEPMvcT9GbmYuYDq0aKGdFo6NsZ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/6ke94/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so48611325e9.3;
        Mon, 28 Oct 2024 13:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730147805; x=1730752605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4XT7nTR4Ss/MtFv3hK9JOEKBRh7pnAer6RunUVibx/c=;
        b=a/6ke94/LsQKVb01KGGPkL1PMm0k/+o8JrPUi/Gt82fqZ6Np1eBbqode2l3MOTqRQ3
         QvI3MAcF5ufceSOCkpVtY3xEcMNWefk/u52xis2teKRjb1QUGy6uzR9HdQ00VVf2NzYQ
         QI7UWtvgm3hn7v/suuIsuQFt9UEamvYmOm9NdjMIh5qCtz0DMxrOEw65tBohmqqkJ6ai
         V3GdD/P8u3VMXN4onfyjxE3avS9bR2B9LQXHyxfrVBY3cGXXmJpEO1XPyPwtt/KHNA7A
         dCQb7TzElIHFBnmgKSgA+0YJR+hVmN3gm6ksfUHEs61ub7Tfb7Q16Hd6oMJm9bzh0hCx
         Fvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730147805; x=1730752605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XT7nTR4Ss/MtFv3hK9JOEKBRh7pnAer6RunUVibx/c=;
        b=Ztp3MZAZ7uMim+nb9+p1j9ZUzWP2iJJzOfwx/CCAQdLa0uW8vbFSPX/c39NbWPJobP
         CARdGcEagzSqHtsU0bKoKVFuQZR4NGg8hrGMgrryIDc62Yj8b0EFmUAYIJ/RYsh8+R9w
         0VNv2Zb3k2ytmkW1K2P7CasDi0dYlITwNNdPK4a3iJlKEMfedGUecKpJQBTs/z4Fy7JG
         qaNq7XiS8auC2fdxzDe2cf2FdUPsEB3ih2MeY563A3IcY+T7Lgpl8JQHTRvGhT2EpFNs
         BQG8GEb1KJwwJFrtwn6osHLyHDj3tyXctB2q8K6g03j3xhs+8AzpbDLqW5z2cVJBOrsh
         EjaA==
X-Forwarded-Encrypted: i=1; AJvYcCWMb0kt8hvycMki7CvUKfnT4A5xYpRAwAxXB9v2q6QRhOssigW6hITJlqo8XVMRJCd2GrtkcyuG207G6+0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv4sb5vXioRQrpbpFWHnBsHVm4puk1e60ohmIAS0ueJeGBiHcT
	OalDODCX3Sno+yCJGfUMKgyJC6TNi7Hrd6fCJbti4EZxyHHm59HN9ovRuQ==
X-Google-Smtp-Source: AGHT+IH+OD7VosUWzVnQK+R9D3nud0J5Sa0YJXixouWcTc6DadFrN7vE79t6RALtRs/ZFoUQkbh6DA==
X-Received: by 2002:a05:600c:468b:b0:42c:af06:703 with SMTP id 5b1f17b1804b1-4319ad34be1mr73088955e9.31.1730147805224;
        Mon, 28 Oct 2024 13:36:45 -0700 (PDT)
Received: from localhost.localdomain (158.red-88-11-182.dynamicip.rima-tde.net. [88.11.182.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43193573d47sm123144845e9.3.2024.10.28.13.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 13:36:44 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-mips@vger.kernel.org
Cc: daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	tsbogend@alpha.franken.de,
	john@phrozen.org,
	linux-kernel@vger.kernel.org,
	yangshiji66@outlook.com
Subject: [PATCH v2 0/1] clocksource: move System Tick Counter from 'arch/mips/ralink'
Date: Mon, 28 Oct 2024 21:36:42 +0100
Message-Id: <20241028203643.191268-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Daniel,

System Tick Counter is present in RT3352 and MT7620 Ralink SoCs. This driver has 
been in 'arch/mips/ralink' from the beggining and can be easily moved into a more
accurate place in 'drivers/clocksource' folder. This makes easier to enable it
for compile test targets as well as reduce LOC in architecture specific folders.
Bindings are already mainlined and can be located here [0].

Thanks in advance for your time.

Best regards,
   Sergio Paracuellos

[0]: https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/timer/ralink,cevt-systick.yaml

Changes in v2:
- Address requested changes from Daniel's review in v1:
    - Squash two previous patches in one to perform a git mv.
    - Change Kconfig option into more accurate RALINK_TIMER.
    - Avoid 'default' option in RALINK_TIMER option.

Sergio Paracuellos (1):
  clocksource: Add Ralink System Tick Counter driver

 arch/mips/ralink/Kconfig                              |  7 -------
 arch/mips/ralink/Makefile                             |  2 --
 drivers/clocksource/Kconfig                           |  9 +++++++++
 drivers/clocksource/Makefile                          |  1 +
 .../clocksource/timer-ralink.c                        | 11 ++++-------
 5 files changed, 14 insertions(+), 16 deletions(-)
 rename arch/mips/ralink/cevt-rt3352.c => drivers/clocksource/timer-ralink.c (91%)

-- 
2.25.1


