Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E245A476E08
	for <lists+linux-mips@lfdr.de>; Thu, 16 Dec 2021 10:47:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233360AbhLPJrh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Dec 2021 04:47:37 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:51094
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235832AbhLPJrI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Dec 2021 04:47:08 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 618323F1F2
        for <linux-mips@vger.kernel.org>; Thu, 16 Dec 2021 09:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639648027;
        bh=vikRa1nxzcY4uLugL2Q09RF+hmHrdpmpkJ7AXRwjM28=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Eoa7WMZIXL/+Ayz9kWm018L9/IfrON2BUgeJwlGEnpaUPb1pPuFH7acdhTGZMqJL7
         oI15oMayEuUxhCxZ8B0+kyEj3kcPVYu8nilc0dKR3RpRzwOhFy3K2Y+6nnFWZbi+J9
         0s5V1+pjibgYqWgXbHjlD29iu3sYA2uoA5jOxKK5tnbO0BrR1wEDfVKBGAH45+93Kc
         OIWwg4IrRjMD4Eo+bDssXzAvdaIld/6sOXyxc9GCkc97RIHJodLzJOdGHevj5nYeIP
         sjSPqkJE8tioG8OF50PyugF9LBImshQBYPJEIKt7gljvThGSVAO1I4iNslWACcifCi
         9NbsZIi5e8kyA==
Received: by mail-ed1-f71.google.com with SMTP id y17-20020a056402271100b003f7ef5ca612so3513855edd.17
        for <linux-mips@vger.kernel.org>; Thu, 16 Dec 2021 01:47:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vikRa1nxzcY4uLugL2Q09RF+hmHrdpmpkJ7AXRwjM28=;
        b=N2oP9TrQk9qid19Riet7F0Y5/R3uP25iQcbc16MgCaVQrqeBdWI6NMxPrCnMNXY0V9
         94hhixJcIKI5x8OOhvXpvu5fQwSZYcduWpejXdUE2yF74MCbN6Y1zvd5VTNZUzd+x8vD
         Oh8mOKjcMRIQ6GvZVASRNbx6FJBis0YjivR1JV4bgZjkpWgkZo6im8R24sFZhH303wEI
         2wRF/6rVIETH+qUhIL0GIUYPNc+aAWGTqTo1l425sB0BMXGgrZmgP9gQEMA71TvoFR9q
         WPmYlzNU+pe6oA0je6ANvWPSpa2NP6Ni97vTLnPGa3qjAWPG7Sxpvocc8+eBJ+L+wexs
         fP3w==
X-Gm-Message-State: AOAM531teeU24erx2ZyTX8Dpax4wqzvNmCxjleADASnoN3ZMpY9y8ThX
        Bsyii9/H/mRTCHcuAUHXqLSgkL7U3OoqEVhbm5QqnhOG7gh1i3iLsfUovvdWVfmN0UYWpnkzIKX
        N8VWKNflQhWaYg2wDOlJO3vAJTxcLvlIGqO6SKU0=
X-Received: by 2002:a5d:5850:: with SMTP id i16mr8192922wrf.410.1639648016610;
        Thu, 16 Dec 2021 01:46:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwA4Cb/78g/Np23rRrFeNNA+mcm6HyKEgF1u2KfoVSUn+c47106OcZ0yzWX4XGZuoK1ZlxQZQ==
X-Received: by 2002:a5d:5850:: with SMTP id i16mr8192881wrf.410.1639648016431;
        Thu, 16 Dec 2021 01:46:56 -0800 (PST)
Received: from alex.home (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr. [90.112.158.1])
        by smtp.gmail.com with ESMTPSA id d15sm5660966wri.50.2021.12.16.01.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 01:46:56 -0800 (PST)
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
Subject: [PATCH v2 2/6] Documentation, arch: Remove leftovers from raw device
Date:   Thu, 16 Dec 2021 10:44:22 +0100
Message-Id: <20211216094426.2083802-3-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211216094426.2083802-1-alexandre.ghiti@canonical.com>
References: <20211216094426.2083802-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Raw device interface was removed so remove all references to configs
related to it.

Fixes: 603e4922f1c8 ("remove the raw driver")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Acked-by: Arnd Bergmann <arnd@arndb.de> [arch/arm/configs]
---
 Documentation/admin-guide/devices.txt  | 8 +-------
 arch/arm/configs/spear13xx_defconfig   | 1 -
 arch/arm/configs/spear3xx_defconfig    | 1 -
 arch/arm/configs/spear6xx_defconfig    | 1 -
 arch/powerpc/configs/pseries_defconfig | 1 -
 5 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/Documentation/admin-guide/devices.txt b/Documentation/admin-guide/devices.txt
index 922c23bb4372..c07dc0ee860e 100644
--- a/Documentation/admin-guide/devices.txt
+++ b/Documentation/admin-guide/devices.txt
@@ -2339,13 +2339,7 @@
 		disks (see major number 3) except that the limit on
 		partitions is 31.
 
- 162 char	Raw block device interface
-		  0 = /dev/rawctl	Raw I/O control device
-		  1 = /dev/raw/raw1	First raw I/O device
-		  2 = /dev/raw/raw2	Second raw I/O device
-		    ...
-		 max minor number of raw device is set by kernel config
-		 MAX_RAW_DEVS or raw module parameter 'max_raw_devs'
+ 162 char	Used for (now removed) raw block device interface
 
  163 char
 
diff --git a/arch/arm/configs/spear13xx_defconfig b/arch/arm/configs/spear13xx_defconfig
index 3b206a31902f..065553326b39 100644
--- a/arch/arm/configs/spear13xx_defconfig
+++ b/arch/arm/configs/spear13xx_defconfig
@@ -61,7 +61,6 @@ CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_RAW_DRIVER=y
-CONFIG_MAX_RAW_DEVS=8192
 CONFIG_I2C=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_SPI=y
diff --git a/arch/arm/configs/spear3xx_defconfig b/arch/arm/configs/spear3xx_defconfig
index fc5f71c765ed..afca722d6605 100644
--- a/arch/arm/configs/spear3xx_defconfig
+++ b/arch/arm/configs/spear3xx_defconfig
@@ -41,7 +41,6 @@ CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_RAW_DRIVER=y
-CONFIG_MAX_RAW_DEVS=8192
 CONFIG_I2C=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_SPI=y
diff --git a/arch/arm/configs/spear6xx_defconfig b/arch/arm/configs/spear6xx_defconfig
index 52a56b8ce6a7..bc32c02cb86b 100644
--- a/arch/arm/configs/spear6xx_defconfig
+++ b/arch/arm/configs/spear6xx_defconfig
@@ -36,7 +36,6 @@ CONFIG_INPUT_FF_MEMLESS=y
 CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_RAW_DRIVER=y
-CONFIG_MAX_RAW_DEVS=8192
 CONFIG_I2C=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_SPI=y
diff --git a/arch/powerpc/configs/pseries_defconfig b/arch/powerpc/configs/pseries_defconfig
index de7641adb899..e64f2242abe1 100644
--- a/arch/powerpc/configs/pseries_defconfig
+++ b/arch/powerpc/configs/pseries_defconfig
@@ -189,7 +189,6 @@ CONFIG_HVCS=m
 CONFIG_VIRTIO_CONSOLE=m
 CONFIG_IBM_BSR=m
 CONFIG_RAW_DRIVER=y
-CONFIG_MAX_RAW_DEVS=1024
 CONFIG_I2C_CHARDEV=y
 CONFIG_FB=y
 CONFIG_FIRMWARE_EDID=y
-- 
2.32.0

