Return-Path: <linux-mips+bounces-7264-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1547A02493
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jan 2025 12:53:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30A8F18807DF
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jan 2025 11:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2C178F20;
	Mon,  6 Jan 2025 11:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayJVT6MR"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63619F9D6;
	Mon,  6 Jan 2025 11:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736164424; cv=none; b=Iq7hKm2kNqswxODWVaz8wjLMqb5uV7v8QRvSm82UFxmJuMjsNn80AKzdTgG5YFsZLxoPo4zUOPDmpsr2gNvyN6dxuCsp0yHqdqEEuLhWLGKpuk4rNBKwX4cIQVrDsOUA7UVyHT5GobYLPAWaROQkVYDwdJO58g0CcFm2FHwdUrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736164424; c=relaxed/simple;
	bh=pOw0HcJ4h74riCdLNP+1bhvxBeZJ5pc6wrOgow+R0pk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H1uWACzKnUI9PjIcr4kinTahCxdL7IqjnyUeLx9Xt1nzlGMPnhEAnfX2ygK3aZ50Ch3FPLO43YNGIcUdgHxxyiosq1z02hOuIYrLQcljy/g4J3kCO03RSztwYJKe+NQ09ZIlHDZ0v0gNqgxxcKfyAoz7SaO7IqOFZOxRlZfXfKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ayJVT6MR; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ef72924e53so20598540a91.3;
        Mon, 06 Jan 2025 03:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736164422; x=1736769222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=re1nE3wq6NZN8eHFRMObVfwzLn8EklNDQb7BLCoFssA=;
        b=ayJVT6MR+SK8p65gODlvzPWUoKkYCzSejL7QMjdyGCYEk+1m9D0bVb7nE1PTQMAtQX
         iVethpfD1uLbE2AE8YTUlLnumTQwt2hPPZ4so0nGbC/i0dv3X0KWiJu9iN9wXKrHojVW
         CNV2+XkXHjQVyPqWQcE2ZG7qVE/RKQULK7mUwYSnTTEdY82zWU1c3nip61bruESCWmJP
         Pzun8Ezlq05HRG+m3H+jklwG9szoLY5p6B+yDvcxTxTZ6auLt8keTMHjbFvs4GXBIywF
         QoK8AUGjis5d3K1Es+i7r7FT/J+zEduLA4XLmGcP19pv4zlkZA5kN5pfnWzwZvh+xl5C
         yRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736164422; x=1736769222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=re1nE3wq6NZN8eHFRMObVfwzLn8EklNDQb7BLCoFssA=;
        b=SYpK5jJIK5xEcR/RqX20LjkpOAXWiNnA2t9EgI6df8d+2e7xtwBxrnktBKizvTRQLA
         w4220HxiLFGVdaQR8LSawY8Wz8UYBuStUmgShIe/L8Or0S2lCNxvif9fH0WsdnuZw+By
         HmDXnNt/9i9iYmDmwiXZ+912Yx9UlssLiii2nK9A2w2kZd0OEvPR5yXa/PTPyR/gC0od
         yu5hat/Kadell1D4Rvtp3zq/08APZLv3sCqw4CSPMFmvpZcR7TtNstn7MXLKKXn+eFkZ
         yTR3FAF1LiaqZIhrhkVomPvL1qOdCkrj1bUEhMcPuLofq3WjANL7IM/0ywz/7X8FR6AO
         QSjg==
X-Forwarded-Encrypted: i=1; AJvYcCVPFOWoV66lLx2LQ+YGbhGdhmsmby+04iho4Jp5emiDVOR0ZJiUbge/kjAD2xdFkFt1qieWik58Fj9TezU=@vger.kernel.org, AJvYcCVimZdIAgTbBLIvJVfO+vOkM/vX/8Prvyj26SgcbG8JJ3Xdj6Y50ywcnjBy2skWXcrMxvyJOt3c4zwgOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4E+9TEKrjI4te+m6ejqYzesuqFAZ3JJILE7khjGAQImhPBtfz
	q20Yb6XNIaTRBHdnzTaQ255I0NTL9A+oCv6vhqYoQHlz/Mrlftto
X-Gm-Gg: ASbGncuBkkn2uV2jy+SSYdv6wu2MGze1Ww0Pifcg5QA3BwFj9JC6vbK320KDDe2RbXO
	LdApiQ4mO2ETP+U39njPcuOvayWDi/2y6vHp5yE9P4obdgJ4KGdvrWEmLXePx4kO989mxvzDsr/
	L96GNOrI+Vtjr2K6oVvudAHHMJgGkncEuc02t1ifQ0znvC4nMgfyU/TxNibyCgUYzzQ8BNcDeWf
	RsdVzrTY9ZEjguV2gnxidkqpTbXjznYey7kiThOKvHbGF64AHNEO9/mBu5Q/Np18kY9t5E/+ZOT
	yT2WQigYvMsKaOksyuVK/L40pnbGLc1pFX9WrA==
X-Google-Smtp-Source: AGHT+IEdHWENgDFVp6U4QgdRcd6XjXN6etHeH5n0KDxas93lywOR+U/8U2kILF3r+hgzGKBDwO/4sw==
X-Received: by 2002:a17:90a:f94d:b0:2ea:4a6b:79d1 with SMTP id 98e67ed59e1d1-2f452e149bbmr84844628a91.11.1736164422534;
        Mon, 06 Jan 2025 03:53:42 -0800 (PST)
Received: from ism-manjaro.realtek.com.tw (125-227-180-151.hinet-ip.hinet.net. [125.227.180.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f447883b0csm37250276a91.42.2025.01.06.03.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 03:53:42 -0800 (PST)
From: Ism Hong <ism.hong@gmail.com>
To: 
Cc: Ism Hong <ism.hong@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Jeff Xu <jeffxu@chromium.org>,
	=?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>,
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mips: fix shmctl/semctl/msgctl syscall for o32
Date: Mon,  6 Jan 2025 19:52:27 +0800
Message-Id: <20250106115227.1365643-1-ism.hong@gmail.com>
X-Mailer: git-send-email 2.37.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit 275f22148e87 ("ipc: rename old-style shmctl/semctl/msgctl
syscalls") switched various architectures to use sys_old_*ctl() with
ipc_parse_version, including mips n32/n64. However, for mips o32, commit
0d6040d46817 ("arch: add split IPC system calls where needed") added
separate IPC syscalls without properly using the old-style handlers.

This causes applications using uClibc-ng to fail with -EINVAL when
calling semctl/shmctl/msgctl with IPC_64 flag, as uClibc-ng uses the
syscall numbers from kernel headers to determine whether to use the IPC
multiplexer or split syscalls. In contrast, glibc is unaffected as it
uses a unified feature test macro __ASSUME_DIRECT_SYSVIPC_SYSCALLS
(disabled for mips-o32) to make this decision.

Fix this by switching the o32 ABI entries for semctl, shmctl and msgctl
to use the old-style handlers, matching the behavior of other
architectures and fixing compatibility with uClibc-ng.

Signed-off-by: Ism Hong <ism.hong@gmail.com>
---
 arch/mips/kernel/syscalls/syscall_o32.tbl | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/syscalls/syscall_o32.tbl b/arch/mips/kernel/syscalls/syscall_o32.tbl
index 349b8aad1159..e8a57c206758 100644
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@ -382,15 +382,15 @@
 368	o32	io_pgetevents			sys_io_pgetevents_time32	compat_sys_io_pgetevents
 # room for arch specific calls
 393	o32	semget				sys_semget
-394	o32	semctl				sys_semctl			compat_sys_semctl
+394	o32	semctl				sys_old_semctl		compat_sys_old_semctl
 395	o32	shmget				sys_shmget
-396	o32	shmctl				sys_shmctl			compat_sys_shmctl
+396	o32	shmctl				sys_old_shmctl		compat_sys_old_shmctl
 397	o32	shmat				sys_shmat			compat_sys_shmat
 398	o32	shmdt				sys_shmdt
 399	o32	msgget				sys_msgget
 400	o32	msgsnd				sys_msgsnd			compat_sys_msgsnd
 401	o32	msgrcv				sys_msgrcv			compat_sys_msgrcv
-402	o32	msgctl				sys_msgctl			compat_sys_msgctl
+402	o32	msgctl				sys_old_msgctl		compat_sys_old_msgctl
 403	o32	clock_gettime64			sys_clock_gettime		sys_clock_gettime
 404	o32	clock_settime64			sys_clock_settime		sys_clock_settime
 405	o32	clock_adjtime64			sys_clock_adjtime		sys_clock_adjtime
-- 
2.37.2


