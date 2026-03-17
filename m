Return-Path: <linux-mips+bounces-13711-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAGNOKcbuWm+qwEAu9opvQ
	(envelope-from <linux-mips+bounces-13711-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 10:15:19 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1432A650D
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 10:15:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 488843009019
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 09:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BAA314A9E;
	Tue, 17 Mar 2026 09:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQ4BnuZz"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A355634EF15;
	Tue, 17 Mar 2026 09:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773738916; cv=none; b=f36ZJ9aj1HsqhMolci/y12iyjlXDmDQvPxe8s7kFswCIJo7HSTW/dMGE4BZWOkvXr7S+Og9ea5062Ox9tLUKgFRhgPf3dTm8TMb58sN6SH4jtEkGCycoch5spBlsiuZjfTUg2j9z3uhscVU6HlZ09B950eLruWuNo2ur18ohhV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773738916; c=relaxed/simple;
	bh=QU6cedlzf40aFEFMHAi3oFEJtwf/R3OvK72FIzwtc/c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Lx2GxE/IDBl+fpvhZauRfxkGC1U4RI41XJ7mt0ni7DBk5HwWupdCBh6qXsIO7uFNeN8G9NnP88sDs/LepIwted9MYl+JwtLwueeUl75Ql7AUHtsX5seh23kqU0kXE+VV/3akvz1T/MTZT8jkfaIT0qgNgd1Sxc3R8ou7ixgBR5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQ4BnuZz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19933C19425;
	Tue, 17 Mar 2026 09:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773738916;
	bh=QU6cedlzf40aFEFMHAi3oFEJtwf/R3OvK72FIzwtc/c=;
	h=From:Subject:Date:To:Cc:From;
	b=VQ4BnuZzjGlyHuYCbl/mEKd7zh11jNZHM6YOmeZHshjwK7wAidut5bW59fUtAEXsF
	 LPrDV/0BkMPGm+OJixWV70wz76CjI7ChsKDFhgNC2W34z47FQe0lHP3u0iv7QCx6TM
	 h+pw5pDiAHiX9uP7B2DDiXpzrT6KYsbPR7UCv0w1HuTX65DzWGjkfmOONp++HBzeoI
	 W35XeW99LW6pqjsde/3KUhI6qN9+5JT/76M2rqzs0qozQfuchLSotd/EnU+b43RHXh
	 QYMfZORHioe+ZjSW10OOkakkBEnXg9s7kH9nnBEvUCCjLwnJvrcNHqItv+HuXbE3Da
	 wb4xOWrkkkXlg==
From: "Vincent Mailhol (Arm)" <mailhol@kernel.org>
Subject: [PATCH 0/9] configs: cleanup obsolete or incorrect assignments
Date: Tue, 17 Mar 2026 10:13:36 +0100
Message-Id: <20260317-arm_defconf_cleanup-v1-0-8eecb7fdd24d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEAbuWkC/x3MTQqAIBBA4avErBPUor+rRIjpWANloRSBdPek5
 bd4L0HEQBhhKBIEvCnS4TNEWYBZtV+Qkc0GyWXDKyGZDruy6MzhnTIban+dzFjRunrWfddbyOU
 Z0NHzX8fpfT8esQDDZQAAAA==
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Mikko Rapeli <mikko.rapeli@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Pablo Neira Ayuso <pablo@netfilter.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Mark Brown <broonie@kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
 Ard Biesheuvel <ardb@kernel.org>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Anna Schumaker <anna.schumaker@oracle.com>
Cc: Alexandre Gonzalo <alexandre.gonzalo@arm.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-parisc@vger.kernel.org, 
 openbmc@lists.ozlabs.org, "Vincent Mailhol (Arm)" <mailhol@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8431; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=QU6cedlzf40aFEFMHAi3oFEJtwf/R3OvK72FIzwtc/c=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDJk7pVvaF++b0PNYl09G4rhpZ5/F95IzPF8ENlalen5lX
 tdxvoyno5SFQYyLQVZMkWVZOSe3Qkehd9ihv5Ywc1iZQIYwcHEKwEQOCDMyvJL+9Nvo+385B4nm
 Cy6lJuYqus3+jtGCa5OqhZc35J5iZGToaOwWd/8w895elfePn0w9IhU3K2dRZcenlrOWTzyUps3
 jAQA=
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13711-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,armlinux.org.uk,iki.fi,kemnade.info,baylibre.com,atomide.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,users.sourceforge.jp,libc.org,physik.fu-berlin.de,redhat.com,alien8.de,linux.intel.com,zytor.com,linutronix.de,goodmis.org,netfilter.org,samsung.com,nxp.com,pengutronix.de,mleia.com,timesys.com,arm.com,glider.be,mobileye.com,bootlin.com,HansenPartnership.com,gmx.de,gmx.net,zankel.net,suse.de,arndb.de,sntech.de,renesas.com,quicinc.com,roeck-us.net,oss.qualcomm.com,linuxfoundation.org,oracle.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[98];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailhol@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[merge_config.sh:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5D1432A650D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The arm64 defconfig contains several inconsistencies, as shown by the
following merge_config warnings:

  $ ARCH=arm64 ./scripts/kconfig/merge_config.sh arch/arm64/configs/defconfig
  Using arch/arm64/configs/defconfig as base
  #
  # configuration written to .config
  #
  WARNING: Value requested for CONFIG_NETFILTER_XT_TARGET_CHECKSUM not in final .config
  Requested value: CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
  Actual value:
  WARNING: Value requested for CONFIG_IP_NF_FILTER not in final .config
  Requested value: CONFIG_IP_NF_FILTER=m
  Actual value:
  WARNING: Value requested for CONFIG_IP_NF_TARGET_REJECT not in final .config
  Requested value: CONFIG_IP_NF_TARGET_REJECT=m
  Actual value:
  WARNING: Value requested for CONFIG_IP_NF_NAT not in final .config
  Requested value: CONFIG_IP_NF_NAT=m
  Actual value:
  WARNING: Value requested for CONFIG_IP_NF_TARGET_MASQUERADE not in final .config
  Requested value: CONFIG_IP_NF_TARGET_MASQUERADE=m
  Actual value:
  WARNING: Value requested for CONFIG_IP_NF_MANGLE not in final .config
  Requested value: CONFIG_IP_NF_MANGLE=m
  Actual value:
  WARNING: Value requested for CONFIG_IP6_NF_FILTER not in final .config
  Requested value: CONFIG_IP6_NF_FILTER=m
  Actual value:
  WARNING: Value requested for CONFIG_IP6_NF_TARGET_REJECT not in final .config
  Requested value: CONFIG_IP6_NF_TARGET_REJECT=m
  Actual value:
  WARNING: Value requested for CONFIG_IP6_NF_MANGLE not in final .config
  Requested value: CONFIG_IP6_NF_MANGLE=m
  Actual value:
  WARNING: Value requested for CONFIG_IP6_NF_NAT not in final .config
  Requested value: CONFIG_IP6_NF_NAT=m
  Actual value:
  WARNING: Value requested for CONFIG_IP6_NF_TARGET_MASQUERADE not in final .config
  Requested value: CONFIG_IP6_NF_TARGET_MASQUERADE=m
  Actual value:
  WARNING: Value requested for CONFIG_SENSORS_SA67MCU not in final .config
  Requested value: CONFIG_SENSORS_SA67MCU=m
  Actual value:
  WARNING: Value requested for CONFIG_FB_MODE_HELPERS not in final .config
  Requested value: CONFIG_FB_MODE_HELPERS=y
  Actual value:
  WARNING: Value requested for CONFIG_SND_SOC_ROCKCHIP not in final .config
  Requested value: CONFIG_SND_SOC_ROCKCHIP=m
  Actual value:
  WARNING: Value requested for CONFIG_IPQ_APSS_5018 not in final .config
  Requested value: CONFIG_IPQ_APSS_5018=y
  Actual value:
  WARNING: Value requested for CONFIG_SLIM_QCOM_CTRL not in final .config
  Requested value: CONFIG_SLIM_QCOM_CTRL=m
  Actual value:
  WARNING: Value requested for CONFIG_NFS_V4_1 not in final .config
  Requested value: CONFIG_NFS_V4_1=y
  Actual value:
  WARNING: CONFIG_CRYPTO_SHA3 differs:
  Requested value: CONFIG_CRYPTO_SHA3=m
  Actual value:    CONFIG_CRYPTO_SHA3=y
  ./scripts/kconfig/merge_config.sh: 384: [: false: unexpected operator

The issues fall into several categories:

  - assignments to removed or renamed configuration symbols.

  - assignments to symbols that became hidden or internal.

  - assignments that are requested as module (=m) but which have a
    built-in parent dependency (=y).

This series cleans up all those issues. While the focus is the arm64
defconfig, fixes that apply more broadly are extended treewide.

After applying this series, merge_config.sh runs without warnings on
the arm64 defconfig. Below script was used to confirm that no symbols
got inadvertently removed:

  #!/bin/sh

  DIR=$(mktemp -d)

  # Generate conf before this series
  git checkout $(git merge-base HEAD @{upstream})
  for arch in arch/*/; do
      for conf in "$arch"configs/*defconfig; do
        ARCH=$(basename $arch) \
        KCONFIG_CONFIG="$DIR/$(basename $arch)_$(basename $conf)_before" \
            ./scripts/kconfig/merge_config.sh $conf
      done
  done

  # Generate conf after this series
  git checkout -
  for arch in arch/*/; do
      for conf in "$arch"configs/*defconfig; do
        ARCH=$(basename $arch) \
        KCONFIG_CONFIG="$DIR/$(basename $arch)_$(basename $conf)_after" \
            ./scripts/kconfig/merge_config.sh $conf
      done
  done

  # Compare
  for arch in arch/*/; do
      for conf in "$arch"configs/*defconfig; do
        if diff --unified \
                "$DIR/$(basename $arch)_$(basename $conf)_before" \
                "$DIR/$(basename $arch)_$(basename $conf)_after"; then
            echo "$conf: OK"
        else
            echo "$conf: configuration changed"
        fi
      done
  done

Signed-off-by: Vincent Mailhol (Arm) <mailhol@kernel.org>
---
Vincent Mailhol (Arm) (9):
      scripts: kconfig: merge_config.sh: use POSIX '=' in test
      configs: remove orphan dependencies of NETFILTER_XTABLES_LEGACY
      configs: remove obsolete assignments to CONFIG_NFS_V4_1
      configs: remove implicit assignments to FB_MODE_HELPERS
      arm: configs: remove obsolete assignments to SND_SOC_ROCKCHIP
      arm64: defconfig: remove implicit assignment to CRYPTO_SHA3
      arm64: defconfig: remove incorrect assignment to IPQ_APSS_5018
      arm64: defconfig: remove obsolete assignment to SENSORS_SA67MCU
      arm64: defconfig: remove obsolete assignment to SLIM_QCOM_CTRL

 arch/alpha/configs/defconfig                |  1 -
 arch/arm/configs/am200epdkit_defconfig      |  1 -
 arch/arm/configs/collie_defconfig           |  1 -
 arch/arm/configs/ep93xx_defconfig           |  1 -
 arch/arm/configs/exynos_defconfig           |  1 -
 arch/arm/configs/imx_v6_v7_defconfig        |  2 --
 arch/arm/configs/ixp4xx_defconfig           |  3 ---
 arch/arm/configs/keystone_defconfig         |  3 ---
 arch/arm/configs/lpc18xx_defconfig          |  1 -
 arch/arm/configs/lpc32xx_defconfig          |  2 --
 arch/arm/configs/mps2_defconfig             |  1 -
 arch/arm/configs/multi_v7_defconfig         |  2 --
 arch/arm/configs/mxs_defconfig              |  1 -
 arch/arm/configs/omap1_defconfig            |  1 -
 arch/arm/configs/omap2plus_defconfig        |  1 -
 arch/arm/configs/shmobile_defconfig         |  1 -
 arch/arm/configs/spitz_defconfig            |  4 ----
 arch/arm/configs/wpcm450_defconfig          |  1 -
 arch/arm64/configs/defconfig                | 18 ------------------
 arch/loongarch/configs/loongson32_defconfig |  1 -
 arch/loongarch/configs/loongson64_defconfig |  1 -
 arch/mips/configs/bmips_stb_defconfig       |  2 --
 arch/mips/configs/cavium_octeon_defconfig   |  1 -
 arch/mips/configs/db1xxx_defconfig          |  1 -
 arch/mips/configs/eyeq5_defconfig           |  1 -
 arch/mips/configs/eyeq6_defconfig           |  1 -
 arch/mips/configs/fuloong2e_defconfig       |  3 ---
 arch/mips/configs/generic_defconfig         |  1 -
 arch/mips/configs/gpr_defconfig             |  3 ---
 arch/mips/configs/ip22_defconfig            |  6 ------
 arch/mips/configs/lemote2f_defconfig        |  1 -
 arch/mips/configs/loongson2k_defconfig      |  3 ---
 arch/mips/configs/loongson3_defconfig       | 11 -----------
 arch/mips/configs/malta_defconfig           |  6 ------
 arch/mips/configs/malta_kvm_defconfig       |  6 ------
 arch/mips/configs/maltaup_xpa_defconfig     |  6 ------
 arch/mips/configs/mtx1_defconfig            |  6 ------
 arch/mips/configs/rb532_defconfig           |  3 ---
 arch/mips/configs/rm200_defconfig           |  6 ------
 arch/mips/configs/rt305x_defconfig          |  3 ---
 arch/mips/configs/xway_defconfig            |  3 ---
 arch/parisc/configs/generic-64bit_defconfig |  1 -
 arch/powerpc/configs/85xx/stx_gp3_defconfig |  1 -
 arch/powerpc/configs/cell_defconfig         |  3 ---
 arch/powerpc/configs/linkstation_defconfig  |  3 ---
 arch/powerpc/configs/mvme5100_defconfig     |  3 ---
 arch/powerpc/configs/pmac32_defconfig       |  3 ---
 arch/powerpc/configs/ppc6xx_defconfig       |  6 ------
 arch/riscv/configs/defconfig                |  9 ---------
 arch/sh/configs/titan_defconfig             |  6 ------
 arch/x86/configs/i386_defconfig             |  7 -------
 arch/x86/configs/x86_64_defconfig           |  7 -------
 arch/xtensa/configs/virt_defconfig          |  1 -
 scripts/kconfig/merge_config.sh             |  2 +-
 54 files changed, 1 insertion(+), 172 deletions(-)
---
base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
change-id: 20260312-arm_defconf_cleanup-cd17f4ba989d

Best regards,
-- 
Vincent Mailhol (Arm) <mailhol@kernel.org>


