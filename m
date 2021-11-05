Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D995D44665D
	for <lists+linux-mips@lfdr.de>; Fri,  5 Nov 2021 16:47:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233634AbhKEPu0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Nov 2021 11:50:26 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:42302
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230400AbhKEPuZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Nov 2021 11:50:25 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6F0E73F1D8
        for <linux-mips@vger.kernel.org>; Fri,  5 Nov 2021 15:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636127265;
        bh=BQNpoEejJgdqfTjT6uEW5F1j+u2r6UT1ueKsgaIRjOY=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=MjTTo71CHhJ1cKM+yRt59kfXecnW6C+o4ZdcvkWRrVeu0qio5WMa6m+Tlv0ARc149
         cwiBPC66RZlOzOBRqgi5fNnX++yhMMSD1EmzFoMJvKhZW5BybulVx7NlGtzC8w8Q6M
         9Y/quMsv1/KrdZiPXDdMIocpDfYxR2M95V5W/CROllWk0w6sPJSYA1P+XxIdX0sO7w
         qedy76kPSGYR4FdNljNVJBZJGOK2RO6fE/awkrwZdmDPW0TLbPbvz/SMxd/mL/gTsg
         B0VKXJj/YDIINr3qk6sJYQ/CjtLLEf7kAi9VN7OTjd2VSDzGgIQTVdTe2vzRjj9AeO
         Cj0XoVsgAVOug==
Received: by mail-wm1-f70.google.com with SMTP id o18-20020a05600c511200b00332fa17a02eso3376739wms.5
        for <linux-mips@vger.kernel.org>; Fri, 05 Nov 2021 08:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BQNpoEejJgdqfTjT6uEW5F1j+u2r6UT1ueKsgaIRjOY=;
        b=VWpXbSrOmUWwjBJdi1JkmONj5TQL33+EwQ5mfuZ1qTPokllyAcAWVyyYjnmsvbwSc0
         ZV8gGH9Lv59ERVjFJfemh0+GfxaqDnAAHN23riNTyhECUfKdggQIedchbqy0v7hLJTSS
         m22DsWkAf26Q/Dzad1X42aD7RjqPesRzjVQpPwKfO5krLpLEs92LUnBGz7EeklHblClD
         4ef5phIaP65U07Xoqt7hNGMpjhU3bLwsfYDNTq1Mm6+VkH+79mVR1YFYIr8Xs57OmCOm
         lT7EE3xHEY90G6EJGSAgWel3BNGHf0YN3ORfnynPC5oEfoT78wyUvTbRveVaXI40Mwng
         9snw==
X-Gm-Message-State: AOAM533625nY5fauEoZhfy9wZfu8kc1gIbMAQLMXtgZ6E/LaNyXhuGyX
        3p3Rjho3T3ukTSsMGfM85b+LOuJ9u5rp0u3YtIeTpf8HLwxDQhl4Z4DMT2RQPSXYws/ZdiHVoZL
        re9Zycf929rr+LzyUtMWcowM5hQgaAzORX1HQawU=
X-Received: by 2002:a05:600c:430c:: with SMTP id p12mr32522648wme.127.1636127265139;
        Fri, 05 Nov 2021 08:47:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqsDazjeBLc3GzOdhywA22fmz71ZuD2zXBh7/jcJh3Kp1/GITAo9FHVASySm/M442PUPtjWg==
X-Received: by 2002:a05:600c:430c:: with SMTP id p12mr32522621wme.127.1636127264973;
        Fri, 05 Nov 2021 08:47:44 -0700 (PDT)
Received: from localhost.localdomain (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr. [2.7.60.249])
        by smtp.gmail.com with ESMTPSA id o8sm8452479wrm.67.2021.11.05.08.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 08:47:44 -0700 (PDT)
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
Subject: [PATCH 4/7] arch: Remove leftovers from mandatory file locking
Date:   Fri,  5 Nov 2021 16:43:31 +0100
Message-Id: <20211105154334.1841927-5-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
References: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This config was removed so remove all references to it.

Fixes: f7e33bdbd6d1 ("fs: remove mandatory file locking support")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/mips/configs/decstation_64_defconfig  | 1 -
 arch/mips/configs/decstation_defconfig     | 1 -
 arch/mips/configs/decstation_r4k_defconfig | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/mips/configs/decstation_64_defconfig b/arch/mips/configs/decstation_64_defconfig
index 85f1955b4b00..e2ed105f8c97 100644
--- a/arch/mips/configs/decstation_64_defconfig
+++ b/arch/mips/configs/decstation_64_defconfig
@@ -144,7 +144,6 @@ CONFIG_EXT2_FS_SECURITY=y
 CONFIG_EXT3_FS=y
 CONFIG_EXT3_FS_POSIX_ACL=y
 CONFIG_EXT3_FS_SECURITY=y
-# CONFIG_MANDATORY_FILE_LOCKING is not set
 CONFIG_ISO9660_FS=y
 CONFIG_JOLIET=y
 CONFIG_PROC_KCORE=y
diff --git a/arch/mips/configs/decstation_defconfig b/arch/mips/configs/decstation_defconfig
index 30a6eafdb1d0..7e987d6f5e34 100644
--- a/arch/mips/configs/decstation_defconfig
+++ b/arch/mips/configs/decstation_defconfig
@@ -140,7 +140,6 @@ CONFIG_EXT2_FS_SECURITY=y
 CONFIG_EXT3_FS=y
 CONFIG_EXT3_FS_POSIX_ACL=y
 CONFIG_EXT3_FS_SECURITY=y
-# CONFIG_MANDATORY_FILE_LOCKING is not set
 CONFIG_ISO9660_FS=y
 CONFIG_JOLIET=y
 CONFIG_PROC_KCORE=y
diff --git a/arch/mips/configs/decstation_r4k_defconfig b/arch/mips/configs/decstation_r4k_defconfig
index e2b58dbf4aa9..6df5f6f2ac8e 100644
--- a/arch/mips/configs/decstation_r4k_defconfig
+++ b/arch/mips/configs/decstation_r4k_defconfig
@@ -140,7 +140,6 @@ CONFIG_EXT2_FS_SECURITY=y
 CONFIG_EXT3_FS=y
 CONFIG_EXT3_FS_POSIX_ACL=y
 CONFIG_EXT3_FS_SECURITY=y
-# CONFIG_MANDATORY_FILE_LOCKING is not set
 CONFIG_ISO9660_FS=y
 CONFIG_JOLIET=y
 CONFIG_PROC_KCORE=y
-- 
2.32.0

