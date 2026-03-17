Return-Path: <linux-mips+bounces-13713-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MQmDwAcuWm+qwEAu9opvQ
	(envelope-from <linux-mips+bounces-13713-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 10:16:48 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E60542A65FA
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 10:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B27003059343
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 09:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918C834104B;
	Tue, 17 Mar 2026 09:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TCwv6vfJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFD2355F47;
	Tue, 17 Mar 2026 09:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773738959; cv=none; b=EQoIaA/TAX57dIRQ4mlhlDECk2nWltDa3OzUuG7jJA0UBqLH5SeJfxugn5G+VXY4otNupLLGiaFomRiSfy4y7jJIDQ7SYwhizy5wEstO9mXMIu7R4VwpWFs+n3dJifIhPCT20ifzacCsIR+mNQ2F50gRvY/TRJHbg9L2nuQ6kyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773738959; c=relaxed/simple;
	bh=07JET9rDvfnU+/i61LnceZPyuXw39TROA6JesTMuLAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uwst4N5oExyM8OxQCamczGNYMyK991QqePcAujUavD4xQTizznRtC7ZLGuPIHKhC96vx9b5bQVQ/bSn8J/ELFtznBQaoIQzHnOfMq98Hf9v3pDSoAh3Kj373pSw74pFE/kh1AqW4WKsgccRyyh6EBLjlY7DdAtzQpS3AIgiRz9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TCwv6vfJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83613C2BC9E;
	Tue, 17 Mar 2026 09:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773738958;
	bh=07JET9rDvfnU+/i61LnceZPyuXw39TROA6JesTMuLAk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TCwv6vfJ5JS47faYH3SAjihxrQe+gA+FuNBzonEM050qisSRzEm2ntCnI9fSw0cK/
	 RU2c8wDCbQR0DTnUEnf4RIuLL4/xn3ty0rn3L9cNS1xUhYiybrsKQbhsRFEj6XBdi8
	 Vbs6hoLelse62DO6QoMNgsOy/aClDfsqv5Qv+UEoGIDvwWi9rEl6KsTN4TWRH/rOHh
	 9t27tgZFyfJ7U1L+BZ3r1mBFFv6uPNx0h4q2VyvkpbHKIkaHoeaLWowopDoaw4dmg1
	 ysC8NTprysVUlJTcTVF6NcjFNRgmDznCQc7RzTFyDriT5OU70a4HI4aN48vH4qJVQ2
	 3uUVmZeMW30fw==
From: "Vincent Mailhol (Arm)" <mailhol@kernel.org>
Date: Tue, 17 Mar 2026 10:13:38 +0100
Subject: [PATCH 2/9] configs: remove orphan dependencies of
 NETFILTER_XTABLES_LEGACY
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-arm_defconf_cleanup-v1-2-8eecb7fdd24d@kernel.org>
References: <20260317-arm_defconf_cleanup-v1-0-8eecb7fdd24d@kernel.org>
In-Reply-To: <20260317-arm_defconf_cleanup-v1-0-8eecb7fdd24d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=22417; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=07JET9rDvfnU+/i61LnceZPyuXw39TROA6JesTMuLAk=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDJk7pfuEPj0ressqrlrx5L215+7/als727NvdD/zmDSJV
 efktMyCjlIWBjEuBlkxRZZl5ZzcCh2F3mGH/lrCzGFlAhnCwMUpABO5XsfwzyikqvKTZOluU/Pt
 K5corK0ymNbSK3heOm257t2MgkDj34wMqwXDOHI/VbcvcGtkLimKlp/euYnxw/UffUtUHyev9PV
 iBgA=
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13713-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,armlinux.org.uk,iki.fi,kemnade.info,baylibre.com,atomide.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,users.sourceforge.jp,libc.org,physik.fu-berlin.de,redhat.com,alien8.de,linux.intel.com,zytor.com,linutronix.de,goodmis.org,netfilter.org,samsung.com,nxp.com,pengutronix.de,mleia.com,timesys.com,arm.com,glider.be,mobileye.com,bootlin.com,HansenPartnership.com,gmx.de,gmx.net,zankel.net,suse.de,arndb.de,sntech.de,renesas.com,quicinc.com,roeck-us.net,oss.qualcomm.com,linuxfoundation.org,oracle.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[98];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailhol@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E60542A65FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since its introduction in commit 9fce66583f06 ("netfilter: Exclude
LEGACY TABLES on PREEMPT_RT."), the configurations below all depend,
either directly or indirectly, on CONFIG_NETFILTER_XTABLES_LEGACY:

  - CONFIG_NETFILTER_XT_TARGET_CHECKSUM
  - CONFIG_IP_NF_FILTER
  - CONFIG_IP_NF_TARGET_REJECT
  - CONFIG_IP_NF_NAT
  - CONFIG_IP_NF_TARGET_MASQUERADE
  - CONFIG_IP_NF_MANGLE
  - CONFIG_IP6_NF_FILTER
  - CONFIG_IP6_NF_TARGET_REJECT
  - CONFIG_IP6_NF_MANGLE
  - CONFIG_IP6_NF_NAT
  - CONFIG_IP6_NF_TARGET_MASQUERADE

This new dependency caused many symbols to become orphaned, meaning
their dependencies are no longer satisfied and Kconfig drops them from
the final configuration.

Note that CONFIG_NFT_COMPAT is another parent dependency, so the
above-listed symbols would not become orphaned as long as NFT_COMPAT
is present.

Considering that these are legacy options and that nobody complained
in recent kernel releases when these options were already missing, it
is safe to assume they can be removed.

Suppress all these configuration symbols in all the defconfig files
that have neither CONFIG_NETFILTER_XTABLES_LEGACY nor
CONFIG_NFT_COMPAT set.

FYI, the suppressions were done using:

  git grep -z -L -E '^CONFIG_(NETFILTER_XTABLES_LEGACY|NFT_COMPAT)=(y|m)$' -- 'arch/*/configs/*defconfig' |\
    xargs -0 sed -i -E '/^CONFIG_(NETFILTER_XT_TARGET_CHECKSUM|IP_NF_FILTER|IP_NF_TARGET_REJECT|IP_NF_NAT|IP_NF_TARGET_MASQUERADE|IP_NF_MANGLE|IP6_NF_FILTER|IP6_NF_TARGET_REJECT|IP6_NF_MANGLE|IP6_NF_NAT|IP6_NF_TARGET_MASQUERADE)=(y|m)$/d'

Fixes: 9fce66583f06 ("netfilter: Exclude LEGACY TABLES on PREEMPT_RT.")
Signed-off-by: Vincent Mailhol (Arm) <mailhol@kernel.org>
---
One alternative is obviously to set NF_TABLES and NFT_COMPAT to give
back to those orphaned symbols a parent configuration.

The removal seemed a better alternative, mostly because no one
complained so far, but if someone has a strong belief that those
symbols should not be removed, I can prepare a v2 to un-orphaned them
instead of removing them.
---
 arch/alpha/configs/defconfig                |  1 -
 arch/arm/configs/ixp4xx_defconfig           |  3 ---
 arch/arm/configs/keystone_defconfig         |  3 ---
 arch/arm/configs/spitz_defconfig            |  4 ----
 arch/arm64/configs/defconfig                | 11 -----------
 arch/mips/configs/bmips_stb_defconfig       |  1 -
 arch/mips/configs/fuloong2e_defconfig       |  3 ---
 arch/mips/configs/gpr_defconfig             |  3 ---
 arch/mips/configs/ip22_defconfig            |  6 ------
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
 arch/powerpc/configs/85xx/stx_gp3_defconfig |  1 -
 arch/powerpc/configs/cell_defconfig         |  3 ---
 arch/powerpc/configs/linkstation_defconfig  |  3 ---
 arch/powerpc/configs/mvme5100_defconfig     |  3 ---
 arch/powerpc/configs/pmac32_defconfig       |  3 ---
 arch/powerpc/configs/ppc6xx_defconfig       |  6 ------
 arch/riscv/configs/defconfig                |  8 --------
 arch/sh/configs/titan_defconfig             |  6 ------
 arch/x86/configs/i386_defconfig             |  7 -------
 arch/x86/configs/x86_64_defconfig           |  7 -------
 29 files changed, 135 deletions(-)

diff --git a/arch/alpha/configs/defconfig b/arch/alpha/configs/defconfig
index 3280bd9e6578..82a225b5eba4 100644
--- a/arch/alpha/configs/defconfig
+++ b/arch/alpha/configs/defconfig
@@ -19,7 +19,6 @@ CONFIG_INET_ESP=m
 # CONFIG_IPV6 is not set
 CONFIG_NETFILTER=y
 CONFIG_IP_NF_IPTABLES=m
-CONFIG_IP_NF_FILTER=m
 CONFIG_VLAN_8021Q=m
 CONFIG_PNP=y
 CONFIG_ISAPNP=y
diff --git a/arch/arm/configs/ixp4xx_defconfig b/arch/arm/configs/ixp4xx_defconfig
index 81199dddcde7..0a8a472e3ce1 100644
--- a/arch/arm/configs/ixp4xx_defconfig
+++ b/arch/arm/configs/ixp4xx_defconfig
@@ -46,9 +46,6 @@ CONFIG_IP_VS_DH=m
 CONFIG_IP_VS_SH=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_TTL=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_MANGLE=m
 CONFIG_IP_NF_ARPTABLES=m
 CONFIG_IP_NF_ARPFILTER=m
 CONFIG_ATM=y
diff --git a/arch/arm/configs/keystone_defconfig b/arch/arm/configs/keystone_defconfig
index b0cadd878152..9e7d839d2ea3 100644
--- a/arch/arm/configs/keystone_defconfig
+++ b/arch/arm/configs/keystone_defconfig
@@ -95,9 +95,6 @@ CONFIG_IP_NF_IPTABLES=y
 CONFIG_IP_NF_MATCH_AH=y
 CONFIG_IP_NF_MATCH_ECN=y
 CONFIG_IP_NF_MATCH_TTL=y
-CONFIG_IP_NF_FILTER=y
-CONFIG_IP_NF_TARGET_REJECT=y
-CONFIG_IP_NF_MANGLE=y
 CONFIG_IP_NF_TARGET_ECN=y
 CONFIG_IP_NF_TARGET_TTL=y
 CONFIG_IP_NF_RAW=y
diff --git a/arch/arm/configs/spitz_defconfig b/arch/arm/configs/spitz_defconfig
index c130af6d44d4..8d19274578cb 100644
--- a/arch/arm/configs/spitz_defconfig
+++ b/arch/arm/configs/spitz_defconfig
@@ -32,9 +32,7 @@ CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_ADDRTYPE=m
 CONFIG_IP_NF_MATCH_ECN=m
 CONFIG_IP_NF_MATCH_TTL=m
-CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_TARGET_LOG=m
-CONFIG_IP_NF_MANGLE=m
 CONFIG_IP_NF_RAW=m
 CONFIG_IP_NF_ARPTABLES=m
 CONFIG_IP_NF_ARPFILTER=m
@@ -46,8 +44,6 @@ CONFIG_IP6_NF_MATCH_OPTS=m
 CONFIG_IP6_NF_MATCH_HL=m
 CONFIG_IP6_NF_MATCH_IPV6HEADER=m
 CONFIG_IP6_NF_MATCH_RT=m
-CONFIG_IP6_NF_FILTER=m
-CONFIG_IP6_NF_MANGLE=m
 CONFIG_IP6_NF_RAW=m
 CONFIG_BT=m
 CONFIG_BT_RFCOMM=m
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..cfedcb61cc55 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -146,24 +146,13 @@ CONFIG_BRIDGE_NETFILTER=m
 CONFIG_NF_CONNTRACK=m
 CONFIG_NF_CONNTRACK_EVENTS=y
 CONFIG_NETFILTER_XT_MARK=m
-CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
 CONFIG_NETFILTER_XT_TARGET_LOG=m
 CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
 CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
 CONFIG_NETFILTER_XT_MATCH_IPVS=m
 CONFIG_IP_VS=m
 CONFIG_IP_NF_IPTABLES=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_NAT=m
-CONFIG_IP_NF_TARGET_MASQUERADE=m
-CONFIG_IP_NF_MANGLE=m
 CONFIG_IP6_NF_IPTABLES=m
-CONFIG_IP6_NF_FILTER=m
-CONFIG_IP6_NF_TARGET_REJECT=m
-CONFIG_IP6_NF_MANGLE=m
-CONFIG_IP6_NF_NAT=m
-CONFIG_IP6_NF_TARGET_MASQUERADE=m
 CONFIG_BRIDGE=m
 CONFIG_BRIDGE_VLAN_FILTERING=y
 CONFIG_NET_DSA=m
diff --git a/arch/mips/configs/bmips_stb_defconfig b/arch/mips/configs/bmips_stb_defconfig
index ecfa7f777efa..4be4e8b0d6a1 100644
--- a/arch/mips/configs/bmips_stb_defconfig
+++ b/arch/mips/configs/bmips_stb_defconfig
@@ -69,7 +69,6 @@ CONFIG_TCP_CONG_BIC=y
 # CONFIG_TCP_CONG_HTCP is not set
 # CONFIG_IPV6 is not set
 CONFIG_IP_NF_IPTABLES=y
-CONFIG_IP_NF_FILTER=y
 CONFIG_NETFILTER=y
 CONFIG_NETFILTER_XTABLES=y
 CONFIG_BRIDGE=y
diff --git a/arch/mips/configs/fuloong2e_defconfig b/arch/mips/configs/fuloong2e_defconfig
index b6fe3c962464..a0c4ce45277c 100644
--- a/arch/mips/configs/fuloong2e_defconfig
+++ b/arch/mips/configs/fuloong2e_defconfig
@@ -67,9 +67,6 @@ CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
 CONFIG_IP_NF_MATCH_TTL=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_MANGLE=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
diff --git a/arch/mips/configs/gpr_defconfig b/arch/mips/configs/gpr_defconfig
index 437ef6dc0b4c..c201fc6923c6 100644
--- a/arch/mips/configs/gpr_defconfig
+++ b/arch/mips/configs/gpr_defconfig
@@ -56,9 +56,6 @@ CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
 CONFIG_IP_NF_MATCH_TTL=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_MANGLE=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
diff --git a/arch/mips/configs/ip22_defconfig b/arch/mips/configs/ip22_defconfig
index e123848f94ab..3ee644a5b5fa 100644
--- a/arch/mips/configs/ip22_defconfig
+++ b/arch/mips/configs/ip22_defconfig
@@ -123,9 +123,6 @@ CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
 CONFIG_IP_NF_MATCH_TTL=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_MANGLE=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
@@ -141,9 +138,6 @@ CONFIG_IP6_NF_MATCH_IPV6HEADER=m
 CONFIG_IP6_NF_MATCH_MH=m
 CONFIG_IP6_NF_MATCH_RT=m
 CONFIG_IP6_NF_TARGET_HL=m
-CONFIG_IP6_NF_FILTER=m
-CONFIG_IP6_NF_TARGET_REJECT=m
-CONFIG_IP6_NF_MANGLE=m
 CONFIG_IP6_NF_RAW=m
 CONFIG_PHONET=m
 CONFIG_NET_SCHED=y
diff --git a/arch/mips/configs/loongson2k_defconfig b/arch/mips/configs/loongson2k_defconfig
index a5c50b63d478..c09336e7647e 100644
--- a/arch/mips/configs/loongson2k_defconfig
+++ b/arch/mips/configs/loongson2k_defconfig
@@ -69,9 +69,6 @@ CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
 CONFIG_IP_NF_MATCH_TTL=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_MANGLE=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 575aaf242361..fac430dfb4e9 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -66,7 +66,6 @@ CONFIG_NF_CONNTRACK_SNMP=m
 CONFIG_NF_TABLES=m
 CONFIG_NFT_CT=m
 CONFIG_NFT_NAT=m
-CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
 CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
 CONFIG_NETFILTER_XT_TARGET_MARK=m
 CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
@@ -93,11 +92,6 @@ CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
 CONFIG_IP_NF_MATCH_RPFILTER=m
 CONFIG_IP_NF_MATCH_TTL=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_NAT=m
-CONFIG_IP_NF_TARGET_MASQUERADE=m
-CONFIG_IP_NF_MANGLE=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
@@ -107,13 +101,8 @@ CONFIG_IP_NF_ARP_MANGLE=m
 CONFIG_NF_TABLES_IPV6=y
 CONFIG_IP6_NF_IPTABLES=m
 CONFIG_IP6_NF_MATCH_RPFILTER=m
-CONFIG_IP6_NF_FILTER=m
-CONFIG_IP6_NF_TARGET_REJECT=m
-CONFIG_IP6_NF_MANGLE=m
 CONFIG_IP6_NF_RAW=m
 CONFIG_IP6_NF_SECURITY=m
-CONFIG_IP6_NF_NAT=m
-CONFIG_IP6_NF_TARGET_MASQUERADE=m
 CONFIG_NF_TABLES_BRIDGE=m
 CONFIG_BRIDGE_NF_EBTABLES=m
 CONFIG_BRIDGE_EBT_T_FILTER=m
diff --git a/arch/mips/configs/malta_defconfig b/arch/mips/configs/malta_defconfig
index 81704ec67f09..0d69dd1ae7fa 100644
--- a/arch/mips/configs/malta_defconfig
+++ b/arch/mips/configs/malta_defconfig
@@ -123,9 +123,6 @@ CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
 CONFIG_IP_NF_MATCH_TTL=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_MANGLE=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
@@ -141,9 +138,6 @@ CONFIG_IP6_NF_MATCH_IPV6HEADER=m
 CONFIG_IP6_NF_MATCH_MH=m
 CONFIG_IP6_NF_MATCH_RT=m
 CONFIG_IP6_NF_TARGET_HL=m
-CONFIG_IP6_NF_FILTER=m
-CONFIG_IP6_NF_TARGET_REJECT=m
-CONFIG_IP6_NF_MANGLE=m
 CONFIG_IP6_NF_RAW=m
 CONFIG_BRIDGE_NF_EBTABLES=m
 CONFIG_BRIDGE_EBT_BROUTE=m
diff --git a/arch/mips/configs/malta_kvm_defconfig b/arch/mips/configs/malta_kvm_defconfig
index 82a97f58bce1..c4e2941d1b37 100644
--- a/arch/mips/configs/malta_kvm_defconfig
+++ b/arch/mips/configs/malta_kvm_defconfig
@@ -127,9 +127,6 @@ CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
 CONFIG_IP_NF_MATCH_TTL=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_MANGLE=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
@@ -145,9 +142,6 @@ CONFIG_IP6_NF_MATCH_IPV6HEADER=m
 CONFIG_IP6_NF_MATCH_MH=m
 CONFIG_IP6_NF_MATCH_RT=m
 CONFIG_IP6_NF_TARGET_HL=m
-CONFIG_IP6_NF_FILTER=m
-CONFIG_IP6_NF_TARGET_REJECT=m
-CONFIG_IP6_NF_MANGLE=m
 CONFIG_IP6_NF_RAW=m
 CONFIG_BRIDGE_NF_EBTABLES=m
 CONFIG_BRIDGE_EBT_BROUTE=m
diff --git a/arch/mips/configs/maltaup_xpa_defconfig b/arch/mips/configs/maltaup_xpa_defconfig
index 0f9ef20744f9..244c39b722ef 100644
--- a/arch/mips/configs/maltaup_xpa_defconfig
+++ b/arch/mips/configs/maltaup_xpa_defconfig
@@ -124,9 +124,6 @@ CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
 CONFIG_IP_NF_MATCH_TTL=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_MANGLE=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
@@ -142,9 +139,6 @@ CONFIG_IP6_NF_MATCH_IPV6HEADER=m
 CONFIG_IP6_NF_MATCH_MH=m
 CONFIG_IP6_NF_MATCH_RT=m
 CONFIG_IP6_NF_TARGET_HL=m
-CONFIG_IP6_NF_FILTER=m
-CONFIG_IP6_NF_TARGET_REJECT=m
-CONFIG_IP6_NF_MANGLE=m
 CONFIG_IP6_NF_RAW=m
 CONFIG_BRIDGE_NF_EBTABLES=m
 CONFIG_BRIDGE_EBT_BROUTE=m
diff --git a/arch/mips/configs/mtx1_defconfig b/arch/mips/configs/mtx1_defconfig
index 77050ae3945f..39d2feb57f38 100644
--- a/arch/mips/configs/mtx1_defconfig
+++ b/arch/mips/configs/mtx1_defconfig
@@ -89,9 +89,6 @@ CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
 CONFIG_IP_NF_MATCH_TTL=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_MANGLE=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
@@ -107,9 +104,6 @@ CONFIG_IP6_NF_MATCH_HL=m
 CONFIG_IP6_NF_MATCH_IPV6HEADER=m
 CONFIG_IP6_NF_MATCH_RT=m
 CONFIG_IP6_NF_TARGET_HL=m
-CONFIG_IP6_NF_FILTER=m
-CONFIG_IP6_NF_TARGET_REJECT=m
-CONFIG_IP6_NF_MANGLE=m
 CONFIG_IP6_NF_RAW=m
 CONFIG_BRIDGE_NF_EBTABLES=m
 CONFIG_BRIDGE_EBT_BROUTE=m
diff --git a/arch/mips/configs/rb532_defconfig b/arch/mips/configs/rb532_defconfig
index 30d18b084cda..c03099a7af0d 100644
--- a/arch/mips/configs/rb532_defconfig
+++ b/arch/mips/configs/rb532_defconfig
@@ -64,9 +64,6 @@ CONFIG_NETFILTER_XT_MATCH_SCTP=m
 CONFIG_NETFILTER_XT_MATCH_STATE=y
 CONFIG_NETFILTER_XT_MATCH_U32=m
 CONFIG_IP_NF_IPTABLES=y
-CONFIG_IP_NF_FILTER=y
-CONFIG_IP_NF_TARGET_REJECT=y
-CONFIG_IP_NF_MANGLE=y
 CONFIG_IP_NF_RAW=m
 CONFIG_BRIDGE=y
 CONFIG_VLAN_8021Q=y
diff --git a/arch/mips/configs/rm200_defconfig b/arch/mips/configs/rm200_defconfig
index b507dc4dddd4..9dd2d9d9e6f7 100644
--- a/arch/mips/configs/rm200_defconfig
+++ b/arch/mips/configs/rm200_defconfig
@@ -86,9 +86,6 @@ CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
 CONFIG_IP_NF_MATCH_TTL=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_MANGLE=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
@@ -105,9 +102,6 @@ CONFIG_IP6_NF_MATCH_IPV6HEADER=m
 CONFIG_IP6_NF_MATCH_MH=m
 CONFIG_IP6_NF_MATCH_RT=m
 CONFIG_IP6_NF_TARGET_HL=m
-CONFIG_IP6_NF_FILTER=m
-CONFIG_IP6_NF_TARGET_REJECT=m
-CONFIG_IP6_NF_MANGLE=m
 CONFIG_IP6_NF_RAW=m
 CONFIG_BRIDGE_NF_EBTABLES=m
 CONFIG_BRIDGE_EBT_BROUTE=m
diff --git a/arch/mips/configs/rt305x_defconfig b/arch/mips/configs/rt305x_defconfig
index 8f9701efef19..fc6e5ef9da53 100644
--- a/arch/mips/configs/rt305x_defconfig
+++ b/arch/mips/configs/rt305x_defconfig
@@ -56,9 +56,6 @@ CONFIG_NETFILTER_XT_MATCH_MAC=m
 CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
 CONFIG_NETFILTER_XT_MATCH_STATE=m
 CONFIG_IP_NF_IPTABLES=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_MANGLE=m
 CONFIG_IP_NF_RAW=m
 CONFIG_BRIDGE=y
 # CONFIG_BRIDGE_IGMP_SNOOPING is not set
diff --git a/arch/mips/configs/xway_defconfig b/arch/mips/configs/xway_defconfig
index aae8497b6872..c48e4f323204 100644
--- a/arch/mips/configs/xway_defconfig
+++ b/arch/mips/configs/xway_defconfig
@@ -58,9 +58,6 @@ CONFIG_NETFILTER_XT_MATCH_MAC=m
 CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
 CONFIG_NETFILTER_XT_MATCH_STATE=m
 CONFIG_IP_NF_IPTABLES=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_MANGLE=m
 CONFIG_IP_NF_RAW=m
 CONFIG_BRIDGE=y
 # CONFIG_BRIDGE_IGMP_SNOOPING is not set
diff --git a/arch/powerpc/configs/85xx/stx_gp3_defconfig b/arch/powerpc/configs/85xx/stx_gp3_defconfig
index 0a42072fa23c..7441ec38a4f6 100644
--- a/arch/powerpc/configs/85xx/stx_gp3_defconfig
+++ b/arch/powerpc/configs/85xx/stx_gp3_defconfig
@@ -20,7 +20,6 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_IPV6 is not set
 CONFIG_NETFILTER=y
 CONFIG_IP_NF_IPTABLES=m
-CONFIG_IP_NF_FILTER=m
 CONFIG_NET_PKTGEN=y
 # CONFIG_FW_LOADER is not set
 CONFIG_PARPORT=m
diff --git a/arch/powerpc/configs/cell_defconfig b/arch/powerpc/configs/cell_defconfig
index 7a31b52e92e1..0ae6df50c38b 100644
--- a/arch/powerpc/configs/cell_defconfig
+++ b/arch/powerpc/configs/cell_defconfig
@@ -87,9 +87,6 @@ CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
 CONFIG_IP_NF_MATCH_TTL=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_MANGLE=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
diff --git a/arch/powerpc/configs/linkstation_defconfig b/arch/powerpc/configs/linkstation_defconfig
index b564f9e33a0d..05d74cbb337a 100644
--- a/arch/powerpc/configs/linkstation_defconfig
+++ b/arch/powerpc/configs/linkstation_defconfig
@@ -38,9 +38,6 @@ CONFIG_NETFILTER_XT_MATCH_MAC=m
 CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
 CONFIG_NETFILTER_XT_MATCH_STATE=m
 CONFIG_IP_NF_IPTABLES=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_MANGLE=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
diff --git a/arch/powerpc/configs/mvme5100_defconfig b/arch/powerpc/configs/mvme5100_defconfig
index fa2b3b9c5945..0b550473123c 100644
--- a/arch/powerpc/configs/mvme5100_defconfig
+++ b/arch/powerpc/configs/mvme5100_defconfig
@@ -46,9 +46,6 @@ CONFIG_NETFILTER_XT_MATCH_MAC=m
 CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
 CONFIG_NETFILTER_XT_MATCH_STATE=m
 CONFIG_IP_NF_IPTABLES=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_MANGLE=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
index ae45f70b29f0..7e94a9946fd6 100644
--- a/arch/powerpc/configs/pmac32_defconfig
+++ b/arch/powerpc/configs/pmac32_defconfig
@@ -78,9 +78,6 @@ CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
 CONFIG_IP_NF_MATCH_TTL=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_MANGLE=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 3c08f46f3d41..dfc4c6fab94f 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -179,9 +179,6 @@ CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
 CONFIG_IP_NF_MATCH_TTL=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_MANGLE=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
@@ -199,9 +196,6 @@ CONFIG_IP6_NF_MATCH_IPV6HEADER=m
 CONFIG_IP6_NF_MATCH_MH=m
 CONFIG_IP6_NF_MATCH_RT=m
 CONFIG_IP6_NF_TARGET_HL=m
-CONFIG_IP6_NF_FILTER=m
-CONFIG_IP6_NF_TARGET_REJECT=m
-CONFIG_IP6_NF_MANGLE=m
 CONFIG_IP6_NF_RAW=m
 CONFIG_IP6_NF_SECURITY=m
 CONFIG_BRIDGE_NF_EBTABLES=m
diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index c2c37327b987..a9b7d476ac7a 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -78,18 +78,10 @@ CONFIG_IP_VS_NFCT=y
 CONFIG_NF_LOG_ARP=m
 CONFIG_NF_LOG_IPV4=m
 CONFIG_IP_NF_IPTABLES=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_NAT=m
-CONFIG_IP_NF_TARGET_MASQUERADE=m
 CONFIG_IP_NF_TARGET_REDIRECT=m
-CONFIG_IP_NF_MANGLE=m
 CONFIG_NF_LOG_IPV6=m
 CONFIG_IP6_NF_IPTABLES=m
 CONFIG_IP6_NF_MATCH_IPV6HEADER=m
-CONFIG_IP6_NF_FILTER=m
-CONFIG_IP6_NF_TARGET_REJECT=m
-CONFIG_IP6_NF_MANGLE=m
 CONFIG_BRIDGE=m
 CONFIG_BRIDGE_VLAN_FILTERING=y
 CONFIG_VLAN_8021Q=m
diff --git a/arch/sh/configs/titan_defconfig b/arch/sh/configs/titan_defconfig
index 896e980d04e1..88a5dfb4901b 100644
--- a/arch/sh/configs/titan_defconfig
+++ b/arch/sh/configs/titan_defconfig
@@ -79,10 +79,7 @@ CONFIG_IP_NF_MATCH_ADDRTYPE=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
 CONFIG_IP_NF_MATCH_TTL=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_TARGET_LOG=m
-CONFIG_IP_NF_MANGLE=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
@@ -98,9 +95,6 @@ CONFIG_IP6_NF_MATCH_HL=m
 CONFIG_IP6_NF_MATCH_IPV6HEADER=m
 CONFIG_IP6_NF_MATCH_RT=m
 CONFIG_IP6_NF_TARGET_HL=m
-CONFIG_IP6_NF_FILTER=m
-CONFIG_IP6_NF_TARGET_REJECT=m
-CONFIG_IP6_NF_MANGLE=m
 CONFIG_IP6_NF_RAW=m
 CONFIG_BRIDGE=y
 CONFIG_VLAN_8021Q=y
diff --git a/arch/x86/configs/i386_defconfig b/arch/x86/configs/i386_defconfig
index 79fa38ca954d..12fa6aa0d2a5 100644
--- a/arch/x86/configs/i386_defconfig
+++ b/arch/x86/configs/i386_defconfig
@@ -100,15 +100,8 @@ CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y
 CONFIG_NETFILTER_XT_MATCH_POLICY=y
 CONFIG_NETFILTER_XT_MATCH_STATE=y
 CONFIG_IP_NF_IPTABLES=y
-CONFIG_IP_NF_FILTER=y
-CONFIG_IP_NF_TARGET_REJECT=y
-CONFIG_IP_NF_TARGET_MASQUERADE=m
-CONFIG_IP_NF_MANGLE=y
 CONFIG_IP6_NF_IPTABLES=y
 CONFIG_IP6_NF_MATCH_IPV6HEADER=y
-CONFIG_IP6_NF_FILTER=y
-CONFIG_IP6_NF_TARGET_REJECT=y
-CONFIG_IP6_NF_MANGLE=y
 CONFIG_NET_SCHED=y
 CONFIG_NET_CLS_CGROUP=y
 CONFIG_NET_EMATCH=y
diff --git a/arch/x86/configs/x86_64_defconfig b/arch/x86/configs/x86_64_defconfig
index 7d7310cdf8b0..49f8d3ee5b68 100644
--- a/arch/x86/configs/x86_64_defconfig
+++ b/arch/x86/configs/x86_64_defconfig
@@ -101,15 +101,8 @@ CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y
 CONFIG_NETFILTER_XT_MATCH_POLICY=y
 CONFIG_NETFILTER_XT_MATCH_STATE=y
 CONFIG_IP_NF_IPTABLES=y
-CONFIG_IP_NF_FILTER=y
-CONFIG_IP_NF_TARGET_REJECT=y
-CONFIG_IP_NF_TARGET_MASQUERADE=m
-CONFIG_IP_NF_MANGLE=y
 CONFIG_IP6_NF_IPTABLES=y
 CONFIG_IP6_NF_MATCH_IPV6HEADER=y
-CONFIG_IP6_NF_FILTER=y
-CONFIG_IP6_NF_TARGET_REJECT=y
-CONFIG_IP6_NF_MANGLE=y
 CONFIG_NET_SCHED=y
 CONFIG_NET_CLS_CGROUP=y
 CONFIG_NET_EMATCH=y

-- 
2.43.0


