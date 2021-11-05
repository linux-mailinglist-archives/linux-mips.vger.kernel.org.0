Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4050C446611
	for <lists+linux-mips@lfdr.de>; Fri,  5 Nov 2021 16:43:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232145AbhKEPqV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Nov 2021 11:46:21 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:41918
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231645AbhKEPqU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Nov 2021 11:46:20 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 90AD03F1E1
        for <linux-mips@vger.kernel.org>; Fri,  5 Nov 2021 15:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636127019;
        bh=Kma2r6Cjt1RWiEDiySihOnGrp1HFvlTplV2HdiifHKA=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=Pv2s9dMT5q38F9GPg01SpNA4Yyt4qClouRXUzF5/gxS8l5bcAQXllxbIaASR8LV36
         09z4TY4JVhcAX1yDfM4MVTml5JOAtaW8AuwNn0Ck7c7kbCrAiMDdkFvHTweXSTh/e9
         m4cGsOPWKJjXEi7dXp/EJUCf7wa2gkWJPheJbeOoJsrJbJWY0dL0O+rcvTweNGE4cg
         9UxD7SDNKwXX0ZubTKs2GpzBYDzC751U+d7FJ0qHl3e57i3oZ5dzsBGAhynwQqExEq
         BZA4ut6pIT2iTutRL192dcNAxDJf5aqmgcqGcYZEmAVRGbIyMldA+XRee/9cuw+vHE
         M1l/uJPQgJWZw==
Received: by mail-wm1-f71.google.com with SMTP id o22-20020a1c7516000000b0030d6f9c7f5fso3442656wmc.1
        for <linux-mips@vger.kernel.org>; Fri, 05 Nov 2021 08:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kma2r6Cjt1RWiEDiySihOnGrp1HFvlTplV2HdiifHKA=;
        b=2khusuL47Iyhqa8aRmr+z8F54CQdfSrO671XYeBkqfbM98WPvxDK/v3LqulJbBRDL/
         Fi30QWIRloTuHPifAPk1PWM2uMMt1A5jpYBhQOr9FQq7W3J2+xh0TD2riy6t/u5X9irf
         6hl1vaNOCp2Q6XqEd7Gh/ZpmGs5lOH/pJQWLeApk97a4BuILIFh1OpTXttfc4af3mqQV
         hlBxSyaAbJm+r9v8UvDLck7FSqw/TT37dfBpwLb1KxNLYf1Cm2Q1FdTiGfHYavsVRKOg
         O49O3rkIVLPCmhqUFBeWTIjJbcy0qaKSLeX9Ywk6CFboxnkHvpPkAgGC9ZAsIK+YFrZ6
         77rQ==
X-Gm-Message-State: AOAM532Dtze34npPXLfCeH+3oD9OLpslAvwRfQVhDrTfoClIjCFsr5RW
        kUFpE5WvyUxr6wk9Mp2TIIzh1ewiOWoFtIsumrUWh7aQG7YSniF3NJ495E2MiAJbwPsj1Lzd3xF
        uiE1/D89HRV+N4OBdJ1Ojc/Sz7wWfjxZyd6NUfqo=
X-Received: by 2002:a1c:f601:: with SMTP id w1mr30738300wmc.112.1636127019053;
        Fri, 05 Nov 2021 08:43:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoyh8Lr4yX65exQreiyo/watjC1Mfw4IA67+fs0m2xRDqQJ5/nM+wMDOQKHo1Bn9rMO/Br/w==
X-Received: by 2002:a1c:f601:: with SMTP id w1mr30738272wmc.112.1636127018901;
        Fri, 05 Nov 2021 08:43:38 -0700 (PDT)
Received: from localhost.localdomain (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr. [2.7.60.249])
        by smtp.gmail.com with ESMTPSA id m2sm11245691wml.15.2021.11.05.08.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 08:43:38 -0700 (PDT)
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
Subject: [PATCH 0/7] Cleanup after removal of configs
Date:   Fri,  5 Nov 2021 16:43:27 +0100
Message-Id: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

While bumping from 5.13 to 5.15, I found that a few deleted configs had
left some pieces here and there: this patchset cleans that.

Alexandre Ghiti (7):
  Documentation, arch: Remove leftovers from fscache/cachefiles
    histograms
  Documentation, arch: Remove leftovers from raw device
  Documentation, arch: Remove leftovers from CIFS_WEAK_PW_HASH
  arch: Remove leftovers from mandatory file locking
  Documentation, arch, fs: Remove leftovers from fscache object list
  include: mfd: Remove leftovers from bd70528 watchdog
  arch: Remove leftovers from prism54 wireless driver

 Documentation/admin-guide/cifs/usage.rst      |   7 +-
 Documentation/admin-guide/devices.txt         |   8 +-
 .../filesystems/caching/cachefiles.rst        |  34 -----
 Documentation/filesystems/caching/fscache.rst | 123 +-----------------
 arch/arm/configs/axm55xx_defconfig            |   3 -
 arch/arm/configs/cm_x300_defconfig            |   1 -
 arch/arm/configs/ezx_defconfig                |   1 -
 arch/arm/configs/imote2_defconfig             |   1 -
 arch/arm/configs/nhk8815_defconfig            |   1 -
 arch/arm/configs/pxa_defconfig                |   1 -
 arch/arm/configs/spear13xx_defconfig          |   1 -
 arch/arm/configs/spear3xx_defconfig           |   1 -
 arch/arm/configs/spear6xx_defconfig           |   1 -
 arch/mips/configs/decstation_64_defconfig     |   1 -
 arch/mips/configs/decstation_defconfig        |   1 -
 arch/mips/configs/decstation_r4k_defconfig    |   1 -
 arch/mips/configs/fuloong2e_defconfig         |   1 -
 arch/mips/configs/ip27_defconfig              |   1 -
 arch/mips/configs/malta_defconfig             |   1 -
 arch/mips/configs/malta_kvm_defconfig         |   1 -
 arch/mips/configs/malta_qemu_32r6_defconfig   |   1 -
 arch/mips/configs/maltaaprp_defconfig         |   1 -
 arch/mips/configs/maltasmvp_defconfig         |   1 -
 arch/mips/configs/maltasmvp_eva_defconfig     |   1 -
 arch/mips/configs/maltaup_defconfig           |   1 -
 arch/mips/configs/maltaup_xpa_defconfig       |   1 -
 arch/mips/configs/nlm_xlp_defconfig           |   2 -
 arch/mips/configs/nlm_xlr_defconfig           |   2 -
 arch/powerpc/configs/pmac32_defconfig         |   1 -
 arch/powerpc/configs/ppc6xx_defconfig         |   1 -
 arch/powerpc/configs/pseries_defconfig        |   1 -
 arch/sh/configs/titan_defconfig               |   1 -
 fs/fscache/object.c                           |   3 -
 fs/fscache/proc.c                             |  12 --
 include/linux/mfd/rohm-bd70528.h              |  24 ----
 35 files changed, 6 insertions(+), 237 deletions(-)

-- 
2.32.0

