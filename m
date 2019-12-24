Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F5BA12A1DC
	for <lists+linux-mips@lfdr.de>; Tue, 24 Dec 2019 14:54:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbfLXNyY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Dec 2019 08:54:24 -0500
Received: from frisell.zx2c4.com ([192.95.5.64]:49767 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726128AbfLXNyY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 24 Dec 2019 08:54:24 -0500
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 11d3a6a0;
        Tue, 24 Dec 2019 12:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=from:to:cc
        :subject:date:message-id:in-reply-to:references:mime-version
        :content-transfer-encoding; s=mail; bh=Fnu30Ss4zETonkqHhFwCH8mCP
        64=; b=wBmMCxAe75Gl3JJPomHlNcrXdyrCuOT6cHJLPKMBFD/+a1dtUo5+rZvgS
        PCS9bREFGTKBvUyCcJzQmgPLrqD77tDrvpf0L/86kx2Efx98ZYsWZqp9R3dtsur0
        GmWHCGZ/JvM3XwofOzzK2GCk3kEEctTR5NTl9PIQ89rKcW0pFSZ6/IqrMT0t7etP
        zhsMemIMXbtgOWgnCWmtRqAAiaJsAc2nXmJRUtr2kXNrs7xbFb1DlUPo65BipSfa
        HV+IrIC/ZPuJ5H3BhBTpmV0YDAX9ws5IG7KZJCPnf4CZWCkLNYSCJm5uUL85yVkZ
        wKfOf0250eRAsS+RkBZRRqChs7i9A==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 374cbd65 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
        Tue, 24 Dec 2019 12:57:01 +0000 (UTC)
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Paul Burton <paulburton@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Christian Brauner <christian.brauner@canonical.com>
Subject: [PATCH] mips: vdso: conditionalize 32-bit time functions on COMPAT_32BIT_TIME
Date:   Tue, 24 Dec 2019 14:54:04 +0100
Message-Id: <20191224135404.389039-1-Jason@zx2c4.com>
In-Reply-To: <20191223130834.GA102399@zx2c4.com>
References: <20191223130834.GA102399@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When the VDSO falls back to 32-bit time functions on kernels with
COMPAT_32BIT_TIME=n, userspace becomes corrupted and appears to crash
shortly after, with something like:

[    0.359617] do_page_fault(): sending SIGSEGV to init for invalid read access from 000000007ff790d0
[    0.359843] epc = 0000000077e45df4 in libc.so[77da6000+de000]
[    0.360319] ra  = 0000000010000c50 in init[10000000+2000]
[    0.364456] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

This can be reproduced with simply calling `clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &ts)`,
since `CLOCK_PROCESS_CPUTIME_ID` is not exported to the VDSO, invoking
the syscall callback branch. This crash was observed with musl 1.20's
clock_gettime implementation:

int __clock_gettime(clockid_t clk, struct timespec *ts)
{
  int r;

  int (*f)(clockid_t, struct timespec *) =
    (int (*)(clockid_t, struct timespec *))vdso_func;
  if (f) {
    r = f(clk, ts);
    if (!r) {
      return r;
    }
    if (r == -EINVAL)
      return __syscall_ret(r);
  }
  r = __syscall(SYS_clock_gettime, clk, ts); // <-- CRASH
  if (r == -ENOSYS) {
    if (clk == CLOCK_REALTIME) {
      __syscall(SYS_gettimeofday, ts, 0);
      ts->tv_nsec = (int)ts->tv_nsec * 1000;
      return 0;
    }
    r = -EINVAL;
  }
  return __syscall_ret(r);
}

The particular kernel and libc are built as part of the MIPS64 CI on
build.wireguard.com which generally uses as minimal configurations as
possible.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christian Brauner <christian.brauner@canonical.com>
Fixes: 942437c97fd9 ("y2038: allow disabling time32 system calls")
---
 arch/mips/include/asm/vdso/gettimeofday.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/include/asm/vdso/gettimeofday.h
index b08825531e9f..7f1aa610e68e 100644
--- a/arch/mips/include/asm/vdso/gettimeofday.h
+++ b/arch/mips/include/asm/vdso/gettimeofday.h
@@ -107,7 +107,7 @@ static __always_inline int clock_getres_fallback(
 	return error ? -ret : ret;
 }
 
-#if _MIPS_SIM != _MIPS_SIM_ABI64
+#if _MIPS_SIM != _MIPS_SIM_ABI64 && defined(CONFIG_COMPAT_32BIT_TIME)
 
 #define VDSO_HAS_32BIT_FALLBACK	1
 
-- 
2.24.1

