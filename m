Return-Path: <linux-mips+bounces-13718-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HAeABEduWm+qwEAu9opvQ
	(envelope-from <linux-mips+bounces-13718-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 10:21:21 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E682A68AA
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 10:21:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 201F5304372A
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 09:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CFE39F16E;
	Tue, 17 Mar 2026 09:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H1I3ECya"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129543382FA;
	Tue, 17 Mar 2026 09:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739059; cv=none; b=NOnC+P2m6dPI4Yk/5xqF5NPk2Z6GIeQSZKCjwdtxLZMvjCj7BMYGPWZ8Z3wS1NPSbYbay93wDRo49Dn97qCp8bu0vylokx8tNIt0BYo9nIiTkpFWnIBo2RUvKpgEzQE6bUvvfBy32Ahl2d9j793n+WZ1j9bvawuM/0gNfXOA3g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739059; c=relaxed/simple;
	bh=6y8Kwkh/OaXUAUrCp7sWLG87zBC+NAUQTwYE5Ak5GSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jm/dKrDrwmkfUZWtMRzu2CK+yBo9d3kHMXDGBwT8dT4YED20KGyqPTnHQ6Wy6XjTcO6QdInQaAmk+JxOmdvtTNy5XZZhE7hcgPCHHiklzZqwI1C7/O+3+ieEv6t8hpsln/gfm8zg/yeM5WY4sHgpjvt5LHK1G04bAIsSFpk5fFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H1I3ECya; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65A00C19425;
	Tue, 17 Mar 2026 09:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773739058;
	bh=6y8Kwkh/OaXUAUrCp7sWLG87zBC+NAUQTwYE5Ak5GSk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H1I3ECyaVjAv8V07VjWoO7K3OMvYB22GI6ioEMAE14Wyqr4QC8SGYtafcvejqr4tN
	 qkx09x1luYXw8AvU+giJ+A7A4+asAI6nN1a1tTkMTXa5crQz2UlxrwaynyHw6Xg5iS
	 ndnhrVrDu/Daj2vNgsuAeUI7tdajy/rGJsr/PW2pkui/ixmfWQvZ89O4lzr4NWwqRl
	 W25J76tfRi7iGQd4MxwKw+Duwb+cAfZScCi/jM2WeSlEQlMAEKbjlqshOzHiUiEAXA
	 yI3Yv5R4+kKjT4h5ZT+11yWuT/6kGkEA/4gLqjKkv8UAaQwPVa/Fvpmy3aJBxuYs8L
	 vYjjCxUe6vaHg==
From: "Vincent Mailhol (Arm)" <mailhol@kernel.org>
Date: Tue, 17 Mar 2026 10:13:43 +0100
Subject: [PATCH 7/9] arm64: defconfig: remove incorrect assignment to
 IPQ_APSS_5018
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-arm_defconf_cleanup-v1-7-8eecb7fdd24d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=709; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=6y8Kwkh/OaXUAUrCp7sWLG87zBC+NAUQTwYE5Ak5GSk=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDJk7pfv+h06fUW+wxn1x9lH+P27C01ptVGM+Ga740GTrJ
 v7U9dWJjlIWBjEuBlkxRZZl5ZzcCh2F3mGH/lrCzGFlAhnCwMUpABPZsZSR4brMbJ/EW5ziP5d7
 r+t6Me136Islt3+dvjLx2rIGM61v6y4x/GI+sbVb4fQH233qzxrtQj9dOamXqLWOT8bzoa3QZJf
 7//gB
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13718-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,armlinux.org.uk,iki.fi,kemnade.info,baylibre.com,atomide.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,users.sourceforge.jp,libc.org,physik.fu-berlin.de,redhat.com,alien8.de,linux.intel.com,zytor.com,linutronix.de,goodmis.org,netfilter.org,samsung.com,nxp.com,pengutronix.de,mleia.com,timesys.com,arm.com,glider.be,mobileye.com,bootlin.com,HansenPartnership.com,gmx.de,gmx.net,zankel.net,suse.de,arndb.de,sntech.de,renesas.com,quicinc.com,roeck-us.net,oss.qualcomm.com,linuxfoundation.org,oracle.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[98];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailhol@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 07E682A68AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CONFIG_IPQ_APSS_5018 does not exist and never existed. Remove it.

Fixes: 7f0c87348fb5 ("arm64: defconfig: Enable IPQ5018 SoC base configs")
Signed-off-by: Vincent Mailhol (Arm) <mailhol@kernel.org>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 0b307e2ab384..1fda77bca432 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1456,7 +1456,6 @@ CONFIG_QCOM_CLK_APCC_MSM8996=y
 CONFIG_QCOM_CLK_SMD_RPM=y
 CONFIG_QCOM_CLK_RPMH=y
 CONFIG_IPQ_APSS_6018=y
-CONFIG_IPQ_APSS_5018=y
 CONFIG_IPQ_CMN_PLL=m
 CONFIG_IPQ_GCC_5018=y
 CONFIG_IPQ_GCC_5332=y

-- 
2.43.0


