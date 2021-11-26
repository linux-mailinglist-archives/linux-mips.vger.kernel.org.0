Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52C1B45F3AA
	for <lists+linux-mips@lfdr.de>; Fri, 26 Nov 2021 19:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239003AbhKZSYr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 26 Nov 2021 13:24:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239008AbhKZSWp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 26 Nov 2021 13:22:45 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86466C061757;
        Fri, 26 Nov 2021 10:01:51 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id z8so20234707ljz.9;
        Fri, 26 Nov 2021 10:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yZvlQF7jemGNKuxK9mzF5Z4xr/dnsXa5rLAqs5Ol3X8=;
        b=Ed82JEObwjUcFpk7miNmCf04LkcGcLm/RlBewmnkusWrEy5/nqS3O+0w0eISPh4Aso
         aBkMxDeUbWHPyXUv4atXu25kZtbexzsVvnJH9E6vyURjSI6deD6F0TbqH/7+HfxF12o0
         X3vj9tEXqYwU3oJ6qfxcp+IxBq3g6jjWZacInNpp5YMyTAuOsjqTpzTJYXVd3VrfvNdu
         PaHVIfiPoeVnU2nOs9nUhBDhZvXFXEUW6qI5Ij+ETQOM4SImHXEDcUtqsEnZ+zMbB/UP
         Vb4UFAjGCcwPzOXiEcSB9psaFDi5qACBbyEL0pCzZY2OFahwTbJKwvpnUlR1RBt4FhLB
         wmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yZvlQF7jemGNKuxK9mzF5Z4xr/dnsXa5rLAqs5Ol3X8=;
        b=n5tIf6gveMM5Vqidxzhci9iOcbG5iuNOsO1gEcXSrHzBR17RV8l12gBZ4VYsxpwsTe
         czi+G6f3ccNafB6Mh4JpVTY3Akeu+UjbnI2mtzAtrgG7CyFBbRPMxEwpp1EBfv1fDbGi
         9uWQXKP6I+2aF7zICGYRMlr3rBVNDrXsF04Fmr/q9WDRGxaF1FZHSTUkJkOL7qJuTYPH
         v5w/UYanGmsOZCwC76AGCZrViGrxieY7HDLkMWR9k8DoFVNCefdanOP4ITqEepQhaQ5e
         ANu9SYv50qQd8yCqKBc7p/iBa82zG6T4p/2zL81rMsRBBRBR71pXgb+CEqiH6YVykutK
         iuEQ==
X-Gm-Message-State: AOAM531YH36IyIssXQ9928gOAHz50l3EldeTBN4GsBE3Y5gOyCo64AOs
        Ross+2L+ZljLV5ZzENGCzvvYaV/rnPI=
X-Google-Smtp-Source: ABdhPJyUSCxf/+NOJZdoDZc8h3Vb/twk3Q7Gp7LgynrSk8F6dcdudijW4UqggVYffkqsltKi8Bb6Vg==
X-Received: by 2002:a05:651c:1204:: with SMTP id i4mr32981935lja.437.1637949709729;
        Fri, 26 Nov 2021 10:01:49 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 10:01:49 -0800 (PST)
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
        "K . C . Kuen-Chern Lin" <kclin@andestech.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v4 00/25] Introduce power-off+restart call chain API
Date:   Fri, 26 Nov 2021 21:00:36 +0300
Message-Id: <20211126180101.27818-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Problem
-------

SoC devices require power-off call chaining functionality from kernel.
We have a widely used restart chaining provided by restart notifier API,
but nothing for power-off.

Solution
--------

Introduce new API that provides both restart and power-off call chains.

Why combine restart with power-off? Because drivers often do both.
More practical to have API that provides both under the same roof.

The new API is designed with simplicity and extensibility in mind.
It's built upon the existing restart and reboot APIs. The simplicity
is in new helper functions that are convenient for drivers. The
extensibility is in the design that doesn't hardcode callback
arguments, making easy to add new parameters and remove old.

This is a third attempt to introduce the new API. First was made by
Guenter Roeck back in 2014, second was made by Thierry Reding in 2017.
In fact the work didn't stop and recently arm_pm_restart() was removed
from v5.14 kernel, which was a part of preparatory work started by
Guenter Roeck. I took into account experience and ideas from the
previous attempts, extended and polished them.

Adoption plan
-------------

This patchset introduces the new API. It also converts multiple drivers
and arch code to the new API to demonstrate how it all looks in practice.

The plan is:

1. Merge new API (patches 1-8). This API will co-exist with the old APIs.

2. Convert arch code to do_kernel_power_off() (patches 9-21).

3. Convert drivers and platform code to the new API.

4. Remove obsolete pm_power_off and pm_power_off_prepare variables.

5. Make restart-notifier API private to kernel/reboot.c once no users left.

It's fully implemented here:

[1] https://github.com/grate-driver/linux/commits/sys-off-handler

For now I'm sending only the first 25 base patches out of ~180. It's
preferable to squash 1-2, partially 3 and 4 points of the plan into a
single patchset to ease and speed up applying of the rest of the patches.
Majority of drivers and platform patches depend on the base, hence they
will come later (and per subsystem), once base will land.

All [1] patches are compile-tested. Tegra and x86 ACPI patches are tested
on hardware. The remaining should be covered by unit tests (unpublished).

Results
-------

1. Devices can be powered off properly.

2. Global variables are removed from drivers.

3. Global pm_power_off and pm_power_off_prepare callback variables are
removed once all users are converted to the new API. The latter callback
is removed by patch #25 of this series.

4. Ambiguous call chain ordering is prohibited. See patch #5 which adds
verification of restart handlers priorities, ensuring that they are unique.

Changelog:

v4: - Made a very minor improvement to doc comments, clarifying couple
      default values.

    - Corrected list of emails recipient by adding Linus, Sebastian,
      Philipp and more NDS people. Removed bouncing emails.

    - Added acks that were given to v3.

v3: - Renamed power_handler to sys_off_handler as was suggested by
      Rafael Wysocki.

    - Improved doc-comments as was suggested by Rafael Wysocki. Added more
      doc-comments.

    - Implemented full set of 180 patches which convert whole kernel in
      accordance to the plan, see link [1] above. Slightly adjusted API to
      better suit for the remaining converted drivers.

      * Added unregister_sys_off_handler() that is handy for a couple old
        platform drivers.

      * Dropped devm_register_trivial_restart_handler(), 'simple' variant
        is enough to have.

    - Improved "Add atomic/blocking_notifier_has_unique_priority()" patch,
      as was suggested by Andy Shevchenko. Also replaced down_write() with
      down_read() and factored out common notifier_has_unique_priority().

    - Added stop_chain field to struct restart_data and reboot_prep_data
      after discovering couple drivers wanting that feature.

    - Added acks that were given to v2.

v2: - Replaced standalone power-off call chain demo-API with the combined
      power-off+restart API because this is what drivers want. It's a more
      comprehensive solution.

    - Converted multiple drivers and arch code to the new API. Suggested by
      Andy Shevchenko. I skimmed through the rest of drivers, verifying that
      new API suits them. The rest of the drivers will be converted once we
      will settle on the new API, otherwise will be too many patches here.

    - v2 API doesn't expose notifier to users and require handlers to
      have unique priority. Suggested by Guenter Roeck.

    - v2 API has power-off chaining disabled by default and require
      drivers to explicitly opt-in to the chaining. This preserves old
      behaviour for existing drivers once they are converted to the new
      API.

Dmitry Osipenko (25):
  notifier: Remove extern annotation from function prototypes
  notifier: Add blocking_notifier_call_chain_is_empty()
  notifier: Add atomic/blocking_notifier_has_unique_priority()
  reboot: Correct typo in a comment
  reboot: Warn if restart handler has duplicated priority
  reboot: Warn if unregister_restart_handler() fails
  reboot: Remove extern annotation from function prototypes
  kernel: Add combined power-off+restart handler call chain API
  ARM: Use do_kernel_power_off()
  csky: Use do_kernel_power_off()
  riscv: Use do_kernel_power_off()
  arm64: Use do_kernel_power_off()
  parisc: Use do_kernel_power_off()
  xen/x86: Use do_kernel_power_off()
  powerpc: Use do_kernel_power_off()
  m68k: Switch to new sys-off handler API
  sh: Use do_kernel_power_off()
  x86: Use do_kernel_power_off()
  ia64: Use do_kernel_power_off()
  mips: Use do_kernel_power_off()
  nds32: Use do_kernel_power_off()
  memory: emif: Use kernel_can_power_off()
  ACPI: power: Switch to sys-off handler API
  regulator: pfuze100: Use devm_register_sys_off_handler()
  reboot: Remove pm_power_off_prepare()

 arch/arm/kernel/reboot.c               |   4 +-
 arch/arm64/kernel/process.c            |   3 +-
 arch/csky/kernel/power.c               |   6 +-
 arch/ia64/kernel/process.c             |   4 +-
 arch/m68k/emu/natfeat.c                |   3 +-
 arch/m68k/include/asm/machdep.h        |   1 -
 arch/m68k/kernel/process.c             |   5 +-
 arch/m68k/kernel/setup_mm.c            |   1 -
 arch/m68k/kernel/setup_no.c            |   1 -
 arch/m68k/mac/config.c                 |   4 +-
 arch/mips/kernel/reset.c               |   3 +-
 arch/nds32/kernel/process.c            |   3 +-
 arch/parisc/kernel/process.c           |   4 +-
 arch/powerpc/kernel/setup-common.c     |   4 +-
 arch/powerpc/xmon/xmon.c               |   3 +-
 arch/riscv/kernel/reset.c              |  12 +-
 arch/sh/kernel/reboot.c                |   3 +-
 arch/x86/kernel/reboot.c               |   4 +-
 arch/x86/xen/enlighten_pv.c            |   4 +-
 drivers/acpi/sleep.c                   |  25 +-
 drivers/memory/emif.c                  |   2 +-
 drivers/regulator/pfuze100-regulator.c |  38 +-
 include/linux/notifier.h               |  37 +-
 include/linux/pm.h                     |   1 -
 include/linux/reboot.h                 | 305 ++++++++++++--
 kernel/notifier.c                      |  83 ++++
 kernel/power/hibernate.c               |   2 +-
 kernel/reboot.c                        | 556 ++++++++++++++++++++++++-
 28 files changed, 985 insertions(+), 136 deletions(-)

-- 
2.33.1

