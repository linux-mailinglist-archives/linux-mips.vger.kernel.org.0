Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA0AC1C3784
	for <lists+linux-mips@lfdr.de>; Mon,  4 May 2020 13:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728401AbgEDLD5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 May 2020 07:03:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27770 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727850AbgEDLD4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 May 2020 07:03:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588590235;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=09losalqRUJ7midVbFAi44IAzVHZ/Wi/7WIU6kwrX9U=;
        b=Px3HqRrxhIQEBqoJODUfdvZOKYEbaPkqTxR1AB8J6KU/wKd/KwHuXZu3S6hj6wPPfR+mgk
        Mzi1HnCUJFKYTI+Xlk0GVmxv1HZ1Pb1ItyZXhjdtHcqtAQLxRj4YVXasAXCX9K2C9Hbvx2
        1XO0wADAYa0t0upc2vA9t7I9Sb7D4h8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-6o5AhZkOPJ-z8mB9Lz5C2g-1; Mon, 04 May 2020 07:03:54 -0400
X-MC-Unique: 6o5AhZkOPJ-z8mB9Lz5C2g-1
Received: by mail-wm1-f69.google.com with SMTP id f17so3296490wmm.5
        for <linux-mips@vger.kernel.org>; Mon, 04 May 2020 04:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=09losalqRUJ7midVbFAi44IAzVHZ/Wi/7WIU6kwrX9U=;
        b=IEVqyN4jk78idLRbABusgPZiHMcvG+CfEj8FjJaf6SyAasRLXInBOrjaeD7nW5DfE7
         2ESoTD3lDoERASE3iEBkgRy4IbbtC9WmFrkHu6h0LhUDQCcJSQpyrI9/s/bsLlUvTer8
         2NdWddmHlfWcfbazo/GAZZKBj81C86cjhy9KtQGOf/S0gK0mGF200CSa2ppqzXuvB2ks
         AzP0AoUBXnFKzoD/otgtKeulgB112l900fRYiC4nifsdMK0FkbFZHmUbv+CH3dWysrSN
         3fFuOnwKGjhjg02QFmYV8/aK+6yfy5bwGRfqqQoMgUPGcF0q9xiYXvPHwor799XvHte3
         vvAw==
X-Gm-Message-State: AGi0PuZb8tWD3fuP53QrQFTjHLjxDE7hoB7sBYhkZhladGzeEmFByWMf
        Y2HF2owrGhdYJ3pObZUNpygnlrEjtqlfo+rL1InVc70s/Iebz40d5G4pxMYy/AqKKoBDCMG3g8N
        SvW/RWzNaxxt6/etOlZ06ww==
X-Received: by 2002:a5d:5261:: with SMTP id l1mr6739137wrc.24.1588590232920;
        Mon, 04 May 2020 04:03:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypJvuRFnJ0VBK5Hu4muwInjRtI3dy4S4pn3siD3o26S579ZPY0C/y2BIROU3uJD8eKGxaBWo7w==
X-Received: by 2002:a5d:5261:: with SMTP id l1mr6739098wrc.24.1588590232648;
        Mon, 04 May 2020 04:03:52 -0700 (PDT)
Received: from localhost.localdomain.com ([194.230.155.213])
        by smtp.gmail.com with ESMTPSA id a13sm10885750wrv.67.2020.05.04.04.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 04:03:52 -0700 (PDT)
From:   Emanuele Giuseppe Esposito <eesposit@redhat.com>
To:     kvm@vger.kernel.org
Cc:     Christian Borntraeger <borntraeger@de.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Jim Mattson <jmattson@google.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v2 1/5] refcount, kref: add dec-and-test wrappers for rw_semaphores
Date:   Mon,  4 May 2020 13:03:40 +0200
Message-Id: <20200504110344.17560-2-eesposit@redhat.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200504110344.17560-1-eesposit@redhat.com>
References: <20200504110344.17560-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Similar to the existing functions that take a mutex or spinlock if and
only if a reference count is decremented to zero, these new function
take an rwsem for writing just before the refcount reaches 0 (and
call a user-provided function in the case of kref_put_rwsem).

These will be used for stats_fs_source data structures, which are
protected by an rw_semaphore to allow concurrent sysfs reads.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/linux/kref.h     | 11 +++++++++++
 include/linux/refcount.h |  2 ++
 lib/refcount.c           | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+)

diff --git a/include/linux/kref.h b/include/linux/kref.h
index d32e21a2538c..2dc935445f45 100644
--- a/include/linux/kref.h
+++ b/include/linux/kref.h
@@ -79,6 +79,17 @@ static inline int kref_put_mutex(struct kref *kref,
 	return 0;
 }
 
+static inline int kref_put_rwsem(struct kref *kref,
+				 void (*release)(struct kref *kref),
+				 struct rw_semaphore *rwsem)
+{
+	if (refcount_dec_and_down_write(&kref->refcount, rwsem)) {
+		release(kref);
+		return 1;
+	}
+	return 0;
+}
+
 static inline int kref_put_lock(struct kref *kref,
 				void (*release)(struct kref *kref),
 				spinlock_t *lock)
diff --git a/include/linux/refcount.h b/include/linux/refcount.h
index 0e3ee25eb156..a9d5038aec9a 100644
--- a/include/linux/refcount.h
+++ b/include/linux/refcount.h
@@ -99,6 +99,7 @@
 #include <linux/spinlock_types.h>
 
 struct mutex;
+struct rw_semaphore;
 
 /**
  * struct refcount_t - variant of atomic_t specialized for reference counts
@@ -313,6 +314,7 @@ static inline void refcount_dec(refcount_t *r)
 extern __must_check bool refcount_dec_if_one(refcount_t *r);
 extern __must_check bool refcount_dec_not_one(refcount_t *r);
 extern __must_check bool refcount_dec_and_mutex_lock(refcount_t *r, struct mutex *lock);
+extern __must_check bool refcount_dec_and_down_write(refcount_t *r, struct rw_semaphore *rwsem);
 extern __must_check bool refcount_dec_and_lock(refcount_t *r, spinlock_t *lock);
 extern __must_check bool refcount_dec_and_lock_irqsave(refcount_t *r,
 						       spinlock_t *lock,
diff --git a/lib/refcount.c b/lib/refcount.c
index ebac8b7d15a7..03e113e1b43a 100644
--- a/lib/refcount.c
+++ b/lib/refcount.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/mutex.h>
+#include <linux/rwsem.h>
 #include <linux/refcount.h>
 #include <linux/spinlock.h>
 #include <linux/bug.h>
@@ -94,6 +95,37 @@ bool refcount_dec_not_one(refcount_t *r)
 }
 EXPORT_SYMBOL(refcount_dec_not_one);
 
+/**
+ * refcount_dec_and_down_write - return holding rwsem for writing if able to decrement
+ *                               refcount to 0
+ * @r: the refcount
+ * @lock: the mutex to be locked
+ *
+ * Similar to atomic_dec_and_mutex_lock(), it will WARN on underflow and fail
+ * to decrement when saturated at REFCOUNT_SATURATED.
+ *
+ * Provides release memory ordering, such that prior loads and stores are done
+ * before, and provides a control dependency such that free() must come after.
+ * See the comment on top.
+ *
+ * Return: true and hold rwsem for writing if able to decrement refcount to 0, false
+ *         otherwise
+ */
+bool refcount_dec_and_down_write(refcount_t *r, struct rw_semaphore *lock)
+{
+	if (refcount_dec_not_one(r))
+		return false;
+
+	down_write(lock);
+	if (!refcount_dec_and_test(r)) {
+		up_write(lock);
+		return false;
+	}
+
+	return true;
+}
+EXPORT_SYMBOL(refcount_dec_and_down_write);
+
 /**
  * refcount_dec_and_mutex_lock - return holding mutex if able to decrement
  *                               refcount to 0
-- 
2.25.2

