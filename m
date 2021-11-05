Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6B244666B
	for <lists+linux-mips@lfdr.de>; Fri,  5 Nov 2021 16:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233671AbhKEPvk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Nov 2021 11:51:40 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:55716
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232774AbhKEPvb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Nov 2021 11:51:31 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 554E03FFE2
        for <linux-mips@vger.kernel.org>; Fri,  5 Nov 2021 15:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636127331;
        bh=VvrTEBN91O2dIdKWAGceL3rqJ3wgEjcVLOB7L5ab2dw=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Hjr3/dfo9SafRhqwbaYCz5bHN9t6Tf4gOcNYtHm2on0V/ZxaYrZaq3Ipy5m/jUU88
         bhzUi0uAxMoHynbRLP8xppVMEJZVlm1lXcRXsD/toeH0CwDk9UXrsTnPmllrvq3Oyx
         ftp7Qlhx/6JMX9wlWGmBohygb6HcsGbQswa0Hu36/Kg5T4ei7mOlDlqXyOk0QArxkb
         Ps+zxcLboR12HmjVOEvUL+IBk99hpb4H4Al7GlnJJqBo47yJ4zMRjq2UVxw53pbQio
         IRtjxZCasIUm4el0GeeBhbLz0Ib74JLshVlkazSArkJePac5W0Y2z7NxiR0ozFiy+h
         uPgFjFM8pqPiw==
Received: by mail-wm1-f71.google.com with SMTP id o10-20020a05600c4fca00b0033312e1ed8bso697320wmq.2
        for <linux-mips@vger.kernel.org>; Fri, 05 Nov 2021 08:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VvrTEBN91O2dIdKWAGceL3rqJ3wgEjcVLOB7L5ab2dw=;
        b=KV1pI9LQnUQQD1nHhXAz64i77q33EkwfXPo77n9844VZF+wXDsMfypneEiZQyjgXYh
         F0HYLNT+WTHoQT9MBFApWewSLZhy8KN2eb1UJIMpVjZQAqKpjkM65LU3geBMls+2C1//
         HEEWL7fAVSk5CMYnbSqX03KadIjqLCJroymhBb85g35wmZjdgPd8yAxYusMtGA46pIJv
         GSFyW4B+QN1Ro4G8RasR6JwdrqbDkmrnOsThz1plfHlUvuTyYUnjW9BO9NxeAP66afTo
         wdXlPLHuZxjsPFAaF7N9vlP6UC/6+3doRRuuKeBqsFlpASV5lYEZjFHXAOOTj9bWpBox
         IymA==
X-Gm-Message-State: AOAM533q0Uua2XgdvnvJ7B/RwStL/knXbrv/VHpesYDABvc1UHZ/qJUn
        WxSh+/dRPybtBQgKpQLQNQve2kKiXLo87AtqZ8ALyvEWXKEKevMLv7KxxzEgYlGfwDKNAR/eeWl
        tzqfa1Jt4q2/8XOqrKNHRwC0PFY3gkZxzORLrazA=
X-Received: by 2002:a7b:c744:: with SMTP id w4mr26583294wmk.50.1636127328823;
        Fri, 05 Nov 2021 08:48:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+H1awp9nsQzNh5Wa1+qoWuVasIamkPSOv3I+AMuKf6XD4rHQ8kTYnVztdPUzEDBiWN15Kfw==
X-Received: by 2002:a7b:c744:: with SMTP id w4mr26583038wmk.50.1636127326558;
        Fri, 05 Nov 2021 08:48:46 -0700 (PDT)
Received: from localhost.localdomain (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr. [2.7.60.249])
        by smtp.gmail.com with ESMTPSA id m17sm931418wrz.22.2021.11.05.08.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 08:48:46 -0700 (PDT)
From:   Alexandre Ghiti <alexandre.ghiti@canonical.com>
To:     Steve French <sfrench@samba.org>, Jonathan Corbet <corbet@lwn.net>,
        David Howells <dhowells@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Lee Jones <lee.jones@linaro.org>,
        Jeff Layton <jlayton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Ronnie Sahlberg <lsahlber@redhat.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>, linux-cifs@vger.kernel.org,
        samba-technical@lists.samba.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
        linux-power@fi.rohmeurope.com
Cc:     Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH 5/7] Documentation, arch, fs: Remove leftovers from fscache object list
Date:   Fri,  5 Nov 2021 16:43:32 +0100
Message-Id: <20211105154334.1841927-6-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
References: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

A few references to the fscache object list were left in the
Documentation, some arch defconfigs and in fs: remove them since this
config does not exists anymore.

Fixes: 58f386a73f16 ("fscache: Remove the object list procfile")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 Documentation/filesystems/caching/fscache.rst | 89 -------------------
 arch/arm/configs/axm55xx_defconfig            |  1 -
 fs/fscache/object.c                           |  3 -
 fs/fscache/proc.c                             | 12 ---
 4 files changed, 105 deletions(-)

diff --git a/Documentation/filesystems/caching/fscache.rst b/Documentation/filesystems/caching/fscache.rst
index 66e31a6d1070..7cedab444947 100644
--- a/Documentation/filesystems/caching/fscache.rst
+++ b/Documentation/filesystems/caching/fscache.rst
@@ -411,95 +411,6 @@ proc file.
 +--------------+-------+-------------------------------------------------------+
 
 
-
-Object List
-===========
-
-If CONFIG_FSCACHE_OBJECT_LIST is enabled, the FS-Cache facility will maintain a
-list of all the objects currently allocated and allow them to be viewed
-through::
-
-	/proc/fs/fscache/objects
-
-This will look something like::
-
-	[root@andromeda ~]# head /proc/fs/fscache/objects
-	OBJECT   PARENT   STAT CHLDN OPS OOP IPR EX READS EM EV F S | NETFS_COOKIE_DEF TY FL NETFS_DATA       OBJECT_KEY, AUX_DATA
-	======== ======== ==== ===== === === === == ===== == == = = | ================ == == ================ ================
-	   17e4b        2 ACTV     0   0   0   0  0     0 7b  4 0 0 | NFS.fh           DT  0 ffff88001dd82820 010006017edcf8bbc93b43298fdfbe71e50b57b13a172c0117f38472, e567634700000000000000000000000063f2404a000000000000000000000000c9030000000000000000000063f2404a
-	   1693a        2 ACTV     0   0   0   0  0     0 7b  4 0 0 | NFS.fh           DT  0 ffff88002db23380 010006017edcf8bbc93b43298fdfbe71e50b57b1e0162c01a2df0ea6, 420ebc4a000000000000000000000000420ebc4a0000000000000000000000000e1801000000000000000000420ebc4a
-
-where the first set of columns before the '|' describe the object:
-
-	=======	===============================================================
-	COLUMN	DESCRIPTION
-	=======	===============================================================
-	OBJECT	Object debugging ID (appears as OBJ%x in some debug messages)
-	PARENT	Debugging ID of parent object
-	STAT	Object state
-	CHLDN	Number of child objects of this object
-	OPS	Number of outstanding operations on this object
-	OOP	Number of outstanding child object management operations
-	IPR
-	EX	Number of outstanding exclusive operations
-	READS	Number of outstanding read operations
-	EM	Object's event mask
-	EV	Events raised on this object
-	F	Object flags
-	S	Object work item busy state mask (1:pending 2:running)
-	=======	===============================================================
-
-and the second set of columns describe the object's cookie, if present:
-
-	================ ======================================================
-	COLUMN		 DESCRIPTION
-	================ ======================================================
-	NETFS_COOKIE_DEF Name of netfs cookie definition
-	TY		 Cookie type (IX - index, DT - data, hex - special)
-	FL		 Cookie flags
-	NETFS_DATA	 Netfs private data stored in the cookie
-	OBJECT_KEY	 Object key } 1 column, with separating comma
-	AUX_DATA	 Object aux data } presence may be configured
-	================ ======================================================
-
-The data shown may be filtered by attaching the a key to an appropriate keyring
-before viewing the file.  Something like::
-
-		keyctl add user fscache:objlist <restrictions> @s
-
-where <restrictions> are a selection of the following letters:
-
-	==	=========================================================
-	K	Show hexdump of object key (don't show if not given)
-	A	Show hexdump of object aux data (don't show if not given)
-	==	=========================================================
-
-and the following paired letters:
-
-	==	=========================================================
-	C	Show objects that have a cookie
-	c	Show objects that don't have a cookie
-	B	Show objects that are busy
-	b	Show objects that aren't busy
-	W	Show objects that have pending writes
-	w	Show objects that don't have pending writes
-	R	Show objects that have outstanding reads
-	r	Show objects that don't have outstanding reads
-	S	Show objects that have work queued
-	s	Show objects that don't have work queued
-	==	=========================================================
-
-If neither side of a letter pair is given, then both are implied.  For example:
-
-	keyctl add user fscache:objlist KB @s
-
-shows objects that are busy, and lists their object keys, but does not dump
-their auxiliary data.  It also implies "CcWwRrSs", but as 'B' is given, 'b' is
-not implied.
-
-By default all objects and all fields will be shown.
-
-
 Debugging
 =========
 
diff --git a/arch/arm/configs/axm55xx_defconfig b/arch/arm/configs/axm55xx_defconfig
index b36e0b347d1f..c0ea326d4c5e 100644
--- a/arch/arm/configs/axm55xx_defconfig
+++ b/arch/arm/configs/axm55xx_defconfig
@@ -205,7 +205,6 @@ CONFIG_CUSE=y
 CONFIG_FSCACHE=y
 CONFIG_FSCACHE_STATS=y
 CONFIG_FSCACHE_DEBUG=y
-CONFIG_FSCACHE_OBJECT_LIST=y
 CONFIG_CACHEFILES=y
 CONFIG_ISO9660_FS=y
 CONFIG_UDF_FS=y
diff --git a/fs/fscache/object.c b/fs/fscache/object.c
index 6a675652129b..f31257a74f35 100644
--- a/fs/fscache/object.c
+++ b/fs/fscache/object.c
@@ -321,9 +321,6 @@ void fscache_object_init(struct fscache_object *object,
 	object->cookie = cookie;
 	fscache_cookie_get(cookie, fscache_cookie_get_attach_object);
 	object->parent = NULL;
-#ifdef CONFIG_FSCACHE_OBJECT_LIST
-	RB_CLEAR_NODE(&object->objlist_link);
-#endif
 
 	object->oob_event_mask = 0;
 	for (t = object->oob_table; t->events; t++)
diff --git a/fs/fscache/proc.c b/fs/fscache/proc.c
index 061df8f61ffc..4c327aeed91b 100644
--- a/fs/fscache/proc.c
+++ b/fs/fscache/proc.c
@@ -31,18 +31,9 @@ int __init fscache_proc_init(void)
 		goto error_stats;
 #endif
 
-#ifdef CONFIG_FSCACHE_OBJECT_LIST
-	if (!proc_create("fs/fscache/objects", S_IFREG | 0444, NULL,
-			 &fscache_objlist_proc_ops))
-		goto error_objects;
-#endif
-
 	_leave(" = 0");
 	return 0;
 
-#ifdef CONFIG_FSCACHE_OBJECT_LIST
-error_objects:
-#endif
 #ifdef CONFIG_FSCACHE_STATS
 	remove_proc_entry("fs/fscache/stats", NULL);
 error_stats:
@@ -60,9 +51,6 @@ int __init fscache_proc_init(void)
  */
 void fscache_proc_cleanup(void)
 {
-#ifdef CONFIG_FSCACHE_OBJECT_LIST
-	remove_proc_entry("fs/fscache/objects", NULL);
-#endif
 #ifdef CONFIG_FSCACHE_STATS
 	remove_proc_entry("fs/fscache/stats", NULL);
 #endif
-- 
2.32.0

