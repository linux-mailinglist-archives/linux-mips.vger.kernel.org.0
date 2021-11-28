Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C4F460383
	for <lists+linux-mips@lfdr.de>; Sun, 28 Nov 2021 05:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349261AbhK1ECd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Nov 2021 23:02:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbhK1EAa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Nov 2021 23:00:30 -0500
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EDD9C06175D;
        Sat, 27 Nov 2021 19:57:15 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id 8so12913312qtx.5;
        Sat, 27 Nov 2021 19:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=H+0/mMWVLBc0wFNpOhji1TJiaceI6QMtcr7R9Q6dM20=;
        b=lVAvJuseRVdeHTOo2Y7mk5xddpnWMThQC/FDqaOqWEil7NGqGvuTT2vTtc8JApB1On
         rwTrnsliJwpLmiyQSM9OqqWa6EPw1ymcYojog7rfeiVURqwEdf9hS6xTZe8oDGGwHdny
         aK1w2tg5Ekqv9iv81kAt7Npug+iyEUgf4o3nEvYzrRlhZteFt02vrviCT9i+8phbPXRu
         JJqg4OHU+ohLAbgYCuyVHyXqucl7jQ4rcAejOtbHfC4KnrOUVWH2RMVL4Idjxyc1kFhq
         oY2cTtJH+fz+Xupw9BJ2IoO73mMs9A7hwVo8/Z5tWCtaVDaOzAvUblIFixjHUSHPMB1Y
         bM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H+0/mMWVLBc0wFNpOhji1TJiaceI6QMtcr7R9Q6dM20=;
        b=U4OPSt5kEzxVVPn+X8rvGID3E3XQlGg3xiTUPQ9xPwgiGU4bsEBJNq1bT2mDTQyg3L
         BZEbW6RRlHSUVVc7qCy3VVmQkQ8jg9mimZoOJc08Um+it3HGccSLChWd9+nBNYMSbXRV
         EYQvA7W4JNgvQPcnxdR5gtxNV025g5/rZaOVGbZrRHb/LCIWxqVNjl4M4QJjEshwqWx2
         YRLRbH7K8CRM0DMtlxhH5a6XcKDUu76JsPkDEPc/459gVXZi+1yI1INbmYfDe9tEm3Bu
         o9PD0Hk5XGpZMwwx8gU3u5ei+aQRswqSZ3veyJ9etT8LhW31JHYaEYT5KW1gEAz6+XxY
         iA/Q==
X-Gm-Message-State: AOAM53223mPI3Tj/+V9XLGsMiEQPe/kMCtJqER5U2mwD3UHvgNwtLo/6
        WAG8y1Lg5+7y9I84Lg6lMkHKjOOyRjrQzA==
X-Google-Smtp-Source: ABdhPJxea4LJk1eDxEaoDG1iOBHCw77pMtCYgY6uosHDHNbSmvvINm1RPpOzdzJJ2JvIQWTjjfP3Ig==
X-Received: by 2002:ac8:5f0a:: with SMTP id x10mr27737478qta.607.1638071834003;
        Sat, 27 Nov 2021 19:57:14 -0800 (PST)
Received: from localhost ([66.216.211.25])
        by smtp.gmail.com with ESMTPSA id s2sm6331534qtw.22.2021.11.27.19.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 19:57:13 -0800 (PST)
From:   Yury Norov <yury.norov@gmail.com>
To:     linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Alexey Klimov <aklimov@redhat.com>,
        Amitkumar Karwar <amitkarwar@gmail.com>,
        Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Gross <agross@kernel.org>,
        Andy Lutomirski <luto@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Anup Patel <anup.patel@wdc.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        Christoph Lameter <cl@linux.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        David Laight <David.Laight@ACULAB.COM>,
        Dennis Zhou <dennis@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Geetha sowjanya <gakula@marvell.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guo Ren <guoren@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Ian Rogers <irogers@google.com>,
        Ingo Molnar <mingo@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jason Wessel <jason.wessel@windriver.com>,
        Jens Axboe <axboe@fb.com>, Jiri Olsa <jolsa@redhat.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        Kees Cook <keescook@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lee Jones <lee.jones@linaro.org>,
        Marc Zyngier <maz@kernel.org>, Marcin Wojtas <mw@semihalf.com>,
        Mark Gross <markgross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Petr Mladek <pmladek@suse.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Roy Pledge <Roy.Pledge@nxp.com>,
        Russell King <linux@armlinux.org.uk>,
        Saeed Mahameed <saeedm@nvidia.com>,
        Sagi Grimberg <sagi@grimberg.me>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Solomon Peachy <pizza@shaftnet.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Steven Rostedt <rostedt@goodmis.org>,
        Subbaraya Sundeep <sbhatta@marvell.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Sunil Goutham <sgoutham@marvell.com>,
        Tariq Toukan <tariqt@nvidia.com>, Tejun Heo <tj@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Vineet Gupta <vgupta@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com, kvm@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-csky@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-perf-users@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/9] tools: sync bitmap_weight() usage with the kernel
Date:   Sat, 27 Nov 2021 19:56:59 -0800
Message-Id: <20211128035704.270739-5-yury.norov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211128035704.270739-1-yury.norov@gmail.com>
References: <20211128035704.270739-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

bitmap_weight() counts all set bits in the bitmap unconditionally.
However in some cases we can traverse a part of bitmap when we
only need to check if number of set bits is greater, less or equal
to some number.

This patch adds bitmap_weight_{eq,gt,le}, reimplements bitmap_{empty,full}
and replace bitmap_weight() where appropriate.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 tools/include/linux/bitmap.h | 42 +++++++++++++++++++------
 tools/lib/bitmap.c           | 60 ++++++++++++++++++++++++++++++++++++
 tools/perf/builtin-c2c.c     |  4 +--
 tools/perf/util/pmu.c        |  2 +-
 4 files changed, 96 insertions(+), 12 deletions(-)

diff --git a/tools/include/linux/bitmap.h b/tools/include/linux/bitmap.h
index ea97804d04d4..eb2831f7e5a7 100644
--- a/tools/include/linux/bitmap.h
+++ b/tools/include/linux/bitmap.h
@@ -12,6 +12,9 @@
 	unsigned long name[BITS_TO_LONGS(bits)]
 
 int __bitmap_weight(const unsigned long *bitmap, int bits);
+bool __bitmap_weight_eq(const unsigned long *bitmap, unsigned int nbits, unsigned int num);
+bool __bitmap_weight_gt(const unsigned long *bitmap, unsigned int nbits, unsigned int num);
+bool __bitmap_weight_le(const unsigned long *bitmap, unsigned int nbits, unsigned int num);
 void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
 		 const unsigned long *bitmap2, int bits);
 int __bitmap_and(unsigned long *dst, const unsigned long *bitmap1,
@@ -45,27 +48,48 @@ static inline void bitmap_fill(unsigned long *dst, unsigned int nbits)
 	dst[nlongs - 1] = BITMAP_LAST_WORD_MASK(nbits);
 }
 
-static inline int bitmap_empty(const unsigned long *src, unsigned nbits)
+static inline int bitmap_weight(const unsigned long *src, unsigned int nbits)
 {
 	if (small_const_nbits(nbits))
-		return ! (*src & BITMAP_LAST_WORD_MASK(nbits));
+		return hweight_long(*src & BITMAP_LAST_WORD_MASK(nbits));
+	return __bitmap_weight(src, nbits);
+}
 
-	return find_first_bit(src, nbits) == nbits;
+static __always_inline bool bitmap_weight_eq(const unsigned long *src,
+			unsigned int nbits, unsigned int num)
+{
+	if (small_const_nbits(nbits))
+		return hweight_long(*src & BITMAP_LAST_WORD_MASK(nbits)) == num;
+
+	return __bitmap_weight_eq(src, nbits, num);
 }
 
-static inline int bitmap_full(const unsigned long *src, unsigned int nbits)
+static __always_inline bool bitmap_weight_gt(const unsigned long *src,
+			unsigned int nbits, unsigned int num)
 {
 	if (small_const_nbits(nbits))
-		return ! (~(*src) & BITMAP_LAST_WORD_MASK(nbits));
+		return hweight_long(*src & BITMAP_LAST_WORD_MASK(nbits)) > num;
 
-	return find_first_zero_bit(src, nbits) == nbits;
+	return __bitmap_weight_gt(src, nbits, num);
 }
 
-static inline int bitmap_weight(const unsigned long *src, unsigned int nbits)
+static __always_inline bool bitmap_weight_le(const unsigned long *src,
+			unsigned int nbits, unsigned int num)
 {
 	if (small_const_nbits(nbits))
-		return hweight_long(*src & BITMAP_LAST_WORD_MASK(nbits));
-	return __bitmap_weight(src, nbits);
+		return hweight_long(*src & BITMAP_LAST_WORD_MASK(nbits)) < num;
+
+	return __bitmap_weight_le(src, nbits, num);
+}
+
+static __always_inline bool bitmap_empty(const unsigned long *src, unsigned int nbits)
+{
+	return bitmap_weight_eq(src, nbits, 0);
+}
+
+static __always_inline bool bitmap_full(const unsigned long *src, unsigned int nbits)
+{
+	return bitmap_weight_eq(src, nbits, nbits);
 }
 
 static inline void bitmap_or(unsigned long *dst, const unsigned long *src1,
diff --git a/tools/lib/bitmap.c b/tools/lib/bitmap.c
index db466ef7be9d..3aaf1767d237 100644
--- a/tools/lib/bitmap.c
+++ b/tools/lib/bitmap.c
@@ -18,6 +18,66 @@ int __bitmap_weight(const unsigned long *bitmap, int bits)
 	return w;
 }
 
+bool __bitmap_weight_eq(const unsigned long *bitmap, unsigned int bits, unsigned int num)
+{
+	unsigned int k, w, lim = bits / BITS_PER_LONG;
+
+	for (k = 0, w = 0; k < lim; k++) {
+		if (w + bits - k * BITS_PER_LONG < num)
+			return false;
+
+		w += hweight_long(bitmap[k]);
+
+		if (w > num)
+			return false;
+	}
+
+	if (bits % BITS_PER_LONG)
+		w += hweight_long(bitmap[k] & BITMAP_LAST_WORD_MASK(bits));
+
+	return w == num;
+}
+
+bool __bitmap_weight_gt(const unsigned long *bitmap, unsigned int bits, unsigned int num)
+{
+	unsigned int k, w, lim = bits / BITS_PER_LONG;
+
+	for (k = 0, w = 0; k < lim; k++) {
+		if (w + bits - k * BITS_PER_LONG <= num)
+			return false;
+
+		w += hweight_long(bitmap[k]);
+
+		if (w > num)
+			return true;
+	}
+
+	if (bits % BITS_PER_LONG)
+		w += hweight_long(bitmap[k] & BITMAP_LAST_WORD_MASK(bits));
+
+	return w > num;
+}
+
+bool __bitmap_weight_le(const unsigned long *bitmap, unsigned int bits, unsigned int num)
+{
+	unsigned int k, w, lim = bits / BITS_PER_LONG;
+
+	for (k = 0, w = 0; k < lim; k++) {
+		if (w + bits - k * BITS_PER_LONG < num)
+			return true;
+
+		w += hweight_long(bitmap[k]);
+
+		if (w >= num)
+			return false;
+	}
+
+	if (bits % BITS_PER_LONG)
+		w += hweight_long(bitmap[k] & BITMAP_LAST_WORD_MASK(bits));
+
+	return w < num;
+}
+
 void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
 		 const unsigned long *bitmap2, int bits)
 {
diff --git a/tools/perf/builtin-c2c.c b/tools/perf/builtin-c2c.c
index b5c67ef73862..51997386fb31 100644
--- a/tools/perf/builtin-c2c.c
+++ b/tools/perf/builtin-c2c.c
@@ -1080,7 +1080,7 @@ node_entry(struct perf_hpp_fmt *fmt __maybe_unused, struct perf_hpp *hpp,
 		bitmap_zero(set, c2c.cpus_cnt);
 		bitmap_and(set, c2c_he->cpuset, c2c.nodes[node], c2c.cpus_cnt);
 
-		if (!bitmap_weight(set, c2c.cpus_cnt)) {
+		if (bitmap_empty(set, c2c.cpus_cnt)) {
 			if (c2c.node_info == 1) {
 				ret = scnprintf(hpp->buf, hpp->size, "%21s", " ");
 				advance_hpp(hpp, ret);
@@ -1944,7 +1944,7 @@ static int set_nodestr(struct c2c_hist_entry *c2c_he)
 	if (c2c_he->nodestr)
 		return 0;
 
-	if (bitmap_weight(c2c_he->nodeset, c2c.nodes_cnt)) {
+	if (!bitmap_empty(c2c_he->nodeset, c2c.nodes_cnt)) {
 		len = bitmap_scnprintf(c2c_he->nodeset, c2c.nodes_cnt,
 				      buf, sizeof(buf));
 	} else {
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 6ae58406f4fc..015ee1321c7c 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -1314,7 +1314,7 @@ static int pmu_config_term(const char *pmu_name,
 	 */
 	if (term->type_val == PARSE_EVENTS__TERM_TYPE_NUM) {
 		if (term->no_value &&
-		    bitmap_weight(format->bits, PERF_PMU_FORMAT_BITS) > 1) {
+		    bitmap_weight_gt(format->bits, PERF_PMU_FORMAT_BITS, 1)) {
 			if (err) {
 				parse_events_error__handle(err, term->err_val,
 					   strdup("no value assigned for term"),
-- 
2.25.1

