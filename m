Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FED3471DC0
	for <lists+linux-mips@lfdr.de>; Sun, 12 Dec 2021 22:22:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbhLLVWD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Dec 2021 16:22:03 -0500
Received: from mail-lf1-f50.google.com ([209.85.167.50]:39824 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbhLLVWA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 12 Dec 2021 16:22:00 -0500
Received: by mail-lf1-f50.google.com with SMTP id d10so27503266lfg.6;
        Sun, 12 Dec 2021 13:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CYB4TkQOzA3vf/K7WR0AkGT34Ge0Y+0VoaElZGGGZzU=;
        b=YPGRWatSQET2pz+NVqu4ADHfYgaxmP/wWxna6m/lloO4toehydZkLAQeVKfAZnur3U
         ytUl8qCGBZdPLRC2UzNM4AW78JtCd6wM5cGhTywvum741iPm3RcFk7tkhkZidnvbCnJl
         R/4YWy2Kn2XQsZfcdS0OqacDfDDCQ28GjMnqHQTevEBhyfW+vOkmPPci2FrLZRzsEI3D
         rIODFz6+YMOOUk7HX9YcjikZPgA6Qmy3MY8VgfLlwgexSKQyGvZ0zOYmPyq4U9vsPiW2
         gzi0gfD7OcJAbuwERD0Pe26Rs8F2W7VMl8LrFpshwRBhPegOZQws/YUiLfZf5um9S4nw
         C5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CYB4TkQOzA3vf/K7WR0AkGT34Ge0Y+0VoaElZGGGZzU=;
        b=cq6Tx6aKc2aijXuwl3InVPOV0DNiI8VsblqB5RHMk0P+BwbVbJbV/tZtqqif3A+du3
         kEYK178Djfl5QQCiijiD1i0q+PHRPhZQbDl4T3x9hKKZRXwjygMShXhIYQj+/MmkK19+
         iuZUCOXmjZwerJFq+Fc9gEMKThFpwZUsEVyVgDjlagXdhPoU1BQrs1MeK3U4/yCn3c2c
         1FyyxNcvSE9VBOvnBY3zc32zuY+HdNwhCIojtO14UM1gP2IKcQzIDbl3vNn3FHhgxaNc
         oj3Y9k+5+bQ+JEiIpvab9IsUbHiikohpS/151kvmxwilWOklI+U33RbCNgwL9EaGdAtZ
         18Lg==
X-Gm-Message-State: AOAM532xJviTeQIgvqVI+jKlBrJjhGexTBa4g+zWEJvB5fTX2oo/AkVH
        Tq68pOJthQosR619Cf/RZKyuq07frEE=
X-Google-Smtp-Source: ABdhPJzJGi8tVTi5bdKFCxEOnO/KtQERR8PihOgq6tSrXYkNCawTEu3K38hiwfey531aaHgxOHQg5Q==
X-Received: by 2002:a2e:874b:: with SMTP id q11mr26014054ljj.194.1639343018442;
        Sun, 12 Dec 2021 13:03:38 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.gmail.com with ESMTPSA id y4sm1197172ljp.16.2021.12.12.13.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 13:03:38 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sebastian Reichel <sre@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee.jones@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, alankao@andestech.com,
        "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v5 02/21] notifier: Add atomic/blocking_notifier_chain_register_unique_prio()
Date:   Mon, 13 Dec 2021 00:02:50 +0300
Message-Id: <20211212210309.9851-3-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211212210309.9851-1-digetx@gmail.com>
References: <20211212210309.9851-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add variant of atomic/blocking_notifier_chain_register() functions that
doesn't allow to register notifier using a duplicated priority. The -EBUSY
error code is returned in this case by the new API functions.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/notifier.h |  5 +++
 kernel/notifier.c        | 87 +++++++++++++++++++++++++++++++---------
 2 files changed, 73 insertions(+), 19 deletions(-)

diff --git a/include/linux/notifier.h b/include/linux/notifier.h
index d4717bc0ab85..ccce26197dd2 100644
--- a/include/linux/notifier.h
+++ b/include/linux/notifier.h
@@ -150,6 +150,11 @@ extern int raw_notifier_chain_register(struct raw_notifier_head *nh,
 extern int srcu_notifier_chain_register(struct srcu_notifier_head *nh,
 		struct notifier_block *nb);
 
+extern int atomic_notifier_chain_register_unique_prio(
+		struct atomic_notifier_head *nh, struct notifier_block *nb);
+extern int blocking_notifier_chain_register_unique_prio(
+		struct blocking_notifier_head *nh, struct notifier_block *nb);
+
 extern int atomic_notifier_chain_unregister(struct atomic_notifier_head *nh,
 		struct notifier_block *nb);
 extern int blocking_notifier_chain_unregister(struct blocking_notifier_head *nh,
diff --git a/kernel/notifier.c b/kernel/notifier.c
index e30d24ee88e9..77e5112ff05b 100644
--- a/kernel/notifier.c
+++ b/kernel/notifier.c
@@ -20,7 +20,7 @@ BLOCKING_NOTIFIER_HEAD(reboot_notifier_list);
  */
 
 static int notifier_chain_register(struct notifier_block **nl,
-		struct notifier_block *n)
+		struct notifier_block *n, bool unique_priority)
 {
 	while ((*nl) != NULL) {
 		if (unlikely((*nl) == n)) {
@@ -29,6 +29,8 @@ static int notifier_chain_register(struct notifier_block **nl,
 		}
 		if (n->priority > (*nl)->priority)
 			break;
+		if (n->priority == (*nl)->priority && unique_priority)
+			return -EBUSY;
 		nl = &((*nl)->next);
 	}
 	n->next = *nl;
@@ -143,12 +145,35 @@ int atomic_notifier_chain_register(struct atomic_notifier_head *nh,
 	int ret;
 
 	spin_lock_irqsave(&nh->lock, flags);
-	ret = notifier_chain_register(&nh->head, n);
+	ret = notifier_chain_register(&nh->head, n, false);
 	spin_unlock_irqrestore(&nh->lock, flags);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(atomic_notifier_chain_register);
 
+/**
+ *	atomic_notifier_chain_register_unique_prio - Add notifier to an atomic notifier chain
+ *	@nh: Pointer to head of the atomic notifier chain
+ *	@n: New entry in notifier chain
+ *
+ *	Adds a notifier to an atomic notifier chain if there is no other
+ *	notifier registered using the same priority.
+ *
+ *	Returns zero on success, -EBUSY otherwise.
+ */
+int atomic_notifier_chain_register_unique_prio(struct atomic_notifier_head *nh,
+					       struct notifier_block *n)
+{
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&nh->lock, flags);
+	ret = notifier_chain_register(&nh->head, n, true);
+	spin_unlock_irqrestore(&nh->lock, flags);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(atomic_notifier_chain_register_unique_prio);
+
 /**
  *	atomic_notifier_chain_unregister - Remove notifier from an atomic notifier chain
  *	@nh: Pointer to head of the atomic notifier chain
@@ -208,18 +233,9 @@ NOKPROBE_SYMBOL(atomic_notifier_call_chain);
  *	synchronized by an rwsem.
  */
 
-/**
- *	blocking_notifier_chain_register - Add notifier to a blocking notifier chain
- *	@nh: Pointer to head of the blocking notifier chain
- *	@n: New entry in notifier chain
- *
- *	Adds a notifier to a blocking notifier chain.
- *	Must be called in process context.
- *
- *	Currently always returns zero.
- */
-int blocking_notifier_chain_register(struct blocking_notifier_head *nh,
-		struct notifier_block *n)
+static int __blocking_notifier_chain_register(struct blocking_notifier_head *nh,
+					      struct notifier_block *n,
+					      bool unique_priority)
 {
 	int ret;
 
@@ -229,15 +245,48 @@ int blocking_notifier_chain_register(struct blocking_notifier_head *nh,
 	 * such times we must not call down_write().
 	 */
 	if (unlikely(system_state == SYSTEM_BOOTING))
-		return notifier_chain_register(&nh->head, n);
+		return notifier_chain_register(&nh->head, n, unique_priority);
 
 	down_write(&nh->rwsem);
-	ret = notifier_chain_register(&nh->head, n);
+	ret = notifier_chain_register(&nh->head, n, unique_priority);
 	up_write(&nh->rwsem);
 	return ret;
 }
+
+/**
+ *	blocking_notifier_chain_register - Add notifier to a blocking notifier chain
+ *	@nh: Pointer to head of the blocking notifier chain
+ *	@n: New entry in notifier chain
+ *
+ *	Adds a notifier to a blocking notifier chain.
+ *	Must be called in process context.
+ *
+ *	Currently always returns zero.
+ */
+int blocking_notifier_chain_register(struct blocking_notifier_head *nh,
+		struct notifier_block *n)
+{
+	return __blocking_notifier_chain_register(nh, n, false);
+}
 EXPORT_SYMBOL_GPL(blocking_notifier_chain_register);
 
+/**
+ *	blocking_notifier_chain_register_unique_prio - Add notifier to a blocking notifier chain
+ *	@nh: Pointer to head of the blocking notifier chain
+ *	@n: New entry in notifier chain
+ *
+ *	Adds a notifier to an blocking notifier chain if there is no other
+ *	notifier registered using the same priority.
+ *
+ *	Returns zero on success, -EBUSY otherwise.
+ */
+int blocking_notifier_chain_register_unique_prio(struct blocking_notifier_head *nh,
+						 struct notifier_block *n)
+{
+	return __blocking_notifier_chain_register(nh, n, true);
+}
+EXPORT_SYMBOL_GPL(blocking_notifier_chain_register_unique_prio);
+
 /**
  *	blocking_notifier_chain_unregister - Remove notifier from a blocking notifier chain
  *	@nh: Pointer to head of the blocking notifier chain
@@ -353,7 +402,7 @@ bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh)
 int raw_notifier_chain_register(struct raw_notifier_head *nh,
 		struct notifier_block *n)
 {
-	return notifier_chain_register(&nh->head, n);
+	return notifier_chain_register(&nh->head, n, false);
 }
 EXPORT_SYMBOL_GPL(raw_notifier_chain_register);
 
@@ -432,10 +481,10 @@ int srcu_notifier_chain_register(struct srcu_notifier_head *nh,
 	 * such times we must not call mutex_lock().
 	 */
 	if (unlikely(system_state == SYSTEM_BOOTING))
-		return notifier_chain_register(&nh->head, n);
+		return notifier_chain_register(&nh->head, n, false);
 
 	mutex_lock(&nh->mutex);
-	ret = notifier_chain_register(&nh->head, n);
+	ret = notifier_chain_register(&nh->head, n, false);
 	mutex_unlock(&nh->mutex);
 	return ret;
 }
-- 
2.33.1

