Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFA7138109
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2020 12:07:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729386AbgAKLHy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 11 Jan 2020 06:07:54 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:32947 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729302AbgAKLHy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 11 Jan 2020 06:07:54 -0500
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34] helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1iqEcB-0000Ef-0n; Sat, 11 Jan 2020 12:07:35 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id 45B3D100C52; Sat, 11 Jan 2020 12:07:34 +0100 (CET)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Christophe Leroy <christophe.leroy@c-s.fr>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, arnd@arndb.de,
        vincenzo.frascino@arm.com, luto@kernel.org
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org
Subject: Re: [RFC PATCH v2 07/10] lib: vdso: don't use READ_ONCE() in __c_kernel_time()
In-Reply-To: <a995445f-9b00-ca13-d23a-1aea3b345718@c-s.fr>
References: <cover.1577111363.git.christophe.leroy@c-s.fr> <fc1ff722c7cbe63a63ae02ade3a714d2049d54a5.1577111367.git.christophe.leroy@c-s.fr> <87lfqfrp7d.fsf@nanos.tec.linutronix.de> <a995445f-9b00-ca13-d23a-1aea3b345718@c-s.fr>
Date:   Sat, 11 Jan 2020 12:07:34 +0100
Message-ID: <878smes13d.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Christophe Leroy <christophe.leroy@c-s.fr> writes:
>
> With READ_ONCE() the 64 bits are being read:
>
> Without the READ_ONCE() only 32 bits are read. That's the most optimal.
>
> Without READ_ONCE() but with a barrier() after the read, we should get 
> the same result but GCC (GCC 8.1) does less good:
>
> Assuming both part of the 64 bits data will fall into a single 
> cacheline, the second read is in the noise.

They definitely are in the same cacheline.

> So agreed to drop this change.

We could be smart about this and force the compiler to issue a 32bit
read for 32bit builds. See below. Not sure whether it's worth it, but
OTOH it will take quite a while until the 32bit time interfaces die
completely.

Thanks,

        tglx

8<------------
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -21,6 +21,18 @@
 #define CS_RAW		1
 #define CS_BASES	(CS_RAW + 1)
 
+#ifdef __LITTLE_ENDIAN
+struct sec_hl {
+	u32	sec_l;
+	u32	sec_h;
+};
+#else
+struct sec_hl {
+	u32	sec_h;
+	u32	sec_l;
+};
+#endif
+
 /**
  * struct vdso_timestamp - basetime per clock_id
  * @sec:	seconds
@@ -35,7 +47,10 @@
  * vdso_data.cs[x].shift.
  */
 struct vdso_timestamp {
-	u64	sec;
+	union {
+		u64		sec;
+		struct sec_hl	sec_hl;
+	};
 	u64	nsec;
 };
 
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -165,8 +165,13 @@ static __maybe_unused int
 static __maybe_unused __kernel_old_time_t __cvdso_time(__kernel_old_time_t *time)
 {
 	const struct vdso_data *vd = __arch_get_vdso_data();
-	__kernel_old_time_t t = READ_ONCE(vd[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec);
+	__kernel_old_time_t t;
 
+#if BITS_PER_LONG == 32
+	t = READ_ONCE(vd[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec_hl.sec_l);
+#else
+	t = READ_ONCE(vd[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec);
+#endif
 	if (time)
 		*time = t;
 
