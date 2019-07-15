Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A054686E8
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jul 2019 12:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729627AbfGOKPw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Jul 2019 06:15:52 -0400
Received: from ozlabs.org ([203.11.71.1]:42583 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729591AbfGOKPv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 15 Jul 2019 06:15:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 45nKDM6h0xz9sNy;
        Mon, 15 Jul 2019 20:15:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1563185749;
        bh=jsWNP/KQzccDDDLR5oNKr0dnsNeu8nGq7K7jrvJpn2c=;
        h=Date:From:To:Cc:Subject:From;
        b=N+v3iZfz3Z3sIjJn76r2EucYfJc3BUn9wQa/iH/stkhzk4HDQyqFapUvk7e3PNNu4
         B7vKTbso21HAjPNstYXhjs2vvypSJPkCseTZJR5sYcUgK+D6vaTUyWWNtGJDlAp4wO
         nOZguZZcs6Wzj8byWYBViOgj4KVI8GEE3F8XHMyDXlsBRW4GOUUYQ0Q6q8nR08y9bj
         P4mZGTRKO/y2hWz8l1/zKNn9BpEukko61F3lPHZgfOqn51B97+aE+GFSqlOwtsUgdZ
         NdPADPAG7CyHsi385gOVX8NQQQopbhnrFmntxlmkVT6smPmEAeBJUejAteNEAYjnq2
         ApaC694bG3IdA==
Date:   Mon, 15 Jul 2019 20:15:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kees Cook <keescook@chromium.org>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: perf events: handle switch statement falling through
 warnings
Message-ID: <20190715201540.1e4bb96a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/oJPxDdAJbbb=sRcigzwe5Q7"; protocol="application/pgp-signature"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

--Sig_/oJPxDdAJbbb=sRcigzwe5Q7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Now that we build with -Wimplicit-fallthrough=3D3, some warnings are
produced in the arch/mips perf events code that are promoted to errors:

 arch/mips/kernel/perf_event_mipsxx.c:792:3: error: this statement may fall=
 through [-Werror=3Dimplicit-fallthrough=3D]
 arch/mips/kernel/perf_event_mipsxx.c:795:3: error: this statement may fall=
 through [-Werror=3Dimplicit-fallthrough=3D]
 arch/mips/kernel/perf_event_mipsxx.c:798:3: error: this statement may fall=
 through [-Werror=3Dimplicit-fallthrough=3D]
 arch/mips/kernel/perf_event_mipsxx.c:1407:6: error: this statement may fal=
l through [-Werror=3Dimplicit-fallthrough=3D]

Assume the fall throughs are deliberate amd annotate/eliminate them.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Jiri Olsa <jolsa@redhat.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Gustavo A. R. Silva <gustavo@embeddedor.com>
Cc: Kees Cook <keescook@chromium.org>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/mips/kernel/perf_event_mipsxx.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

I haven't even build tested this, sorry, but will add it to linux-next
tomorrow.  It should be no worse than the current state :-)

diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_e=
vent_mipsxx.c
index e0ebaa0a333e..40106731e97e 100644
--- a/arch/mips/kernel/perf_event_mipsxx.c
+++ b/arch/mips/kernel/perf_event_mipsxx.c
@@ -790,15 +790,19 @@ static void reset_counters(void *arg)
 	case 4:
 		mipsxx_pmu_write_control(3, 0);
 		mipspmu.write_counter(3, 0);
+		/* fall through */
 	case 3:
 		mipsxx_pmu_write_control(2, 0);
 		mipspmu.write_counter(2, 0);
+		/* fall through */
 	case 2:
 		mipsxx_pmu_write_control(1, 0);
 		mipspmu.write_counter(1, 0);
+		/* fall through */
 	case 1:
 		mipsxx_pmu_write_control(0, 0);
 		mipspmu.write_counter(0, 0);
+		/* fall through */
 	}
 }
=20
@@ -1379,7 +1383,7 @@ static int mipsxx_pmu_handle_shared_irq(void)
 	struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
 	struct perf_sample_data data;
 	unsigned int counters =3D mipspmu.num_counters;
-	u64 counter;
+	unsigned int n;
 	int handled =3D IRQ_NONE;
 	struct pt_regs *regs;
=20
@@ -1401,20 +1405,16 @@ static int mipsxx_pmu_handle_shared_irq(void)
=20
 	perf_sample_data_init(&data, 0, 0);
=20
-	switch (counters) {
-#define HANDLE_COUNTER(n)						\
-	case n + 1:							\
-		if (test_bit(n, cpuc->used_mask)) {			\
-			counter =3D mipspmu.read_counter(n);		\
-			if (counter & mipspmu.overflow) {		\
-				handle_associated_event(cpuc, n, &data, regs); \
-				handled =3D IRQ_HANDLED;			\
-			}						\
+	for (n =3D (counters > 4) ? 3 : (counters - 1); n >=3D 0; n--) {
+		u64 counter;
+
+		if (test_bit(n, cpuc->used_mask)) {
+			counter =3D mipspmu.read_counter(n);
+			if (counter & mipspmu.overflow) {
+				handle_associated_event(cpuc, n, &data, regs);
+				handled =3D IRQ_HANDLED;
+			}
 		}
-	HANDLE_COUNTER(3)
-	HANDLE_COUNTER(2)
-	HANDLE_COUNTER(1)
-	HANDLE_COUNTER(0)
 	}
=20
 #ifdef CONFIG_MIPS_PERF_SHARED_TC_COUNTERS
--=20
2.22.0

--=20
Cheers,
Stephen Rothwell

--Sig_/oJPxDdAJbbb=sRcigzwe5Q7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0sUkwACgkQAVBC80lX
0GwDUwgAh2SIHjC/h//i4BX8AOnHj4bNibfhzoI/HVKv5V92vJZXU3hqUnjdF/5W
ebzV+Ql37tu4vxdKRz1dMxKVnnG5jPZPy9RO0Ypk6yaDFD2fB2VE+J1JiBGUJx6l
dFYtnVC4caMp76esSyVHTL1wnby1DBJEmCR63+SplYTRFsOP6Q9ZvBjvDSXoe7Qk
LF2+4edvibne51hb8jMXWFKfaZiNmEyQtv7zAVN0izYpPW7CaqzOpfI7Qk8yjWtP
DwkYvEukwjCUJuJ/TyqcbSXFzLdV99kEridDRs2s94vriT2JRwHdYSnrhD38PBNR
xm/7mtII8pjQQuD9EI5X1pSQdRH+Zw==
=V54a
-----END PGP SIGNATURE-----

--Sig_/oJPxDdAJbbb=sRcigzwe5Q7--
