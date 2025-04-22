Return-Path: <linux-mips+bounces-8690-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0CCA965B2
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 12:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B82DD1730D0
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 10:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC151F130B;
	Tue, 22 Apr 2025 10:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Rx9J7IKl"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9348020B806;
	Tue, 22 Apr 2025 10:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317211; cv=none; b=JBz+VC26HuZ0NFagbyA/c8T9RZnDz8EreUChETiU1dkRxM8M8Frt3gfUCVszp70WAEzhrlKbft5GXZms4B+1o6sYRyzj3YSi63DIHDaMdRFXu+kYkdrHJT+tBXWppmZH7tJDtzmAWN9tW7c2LoK7iyd8OfLoU9AbdsUNk7qQr5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317211; c=relaxed/simple;
	bh=RVXbQFP/k6BTYPhBACJCbgHwwamun7Utb91ekU6Oprw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BkHw1Od9dDd8kpSalOSr5BLpHUrmjvu+2/s3lsKoqSg3nxJk9fRUX4/w5RE4Sen/GfRDnkTe38ibJjngymxKaxqskiqk3MTgLZoqQfCe59Cxg4XOcHd/NWsIuNOXCXS74GAcZ2x7bSY/8uKPeP8S2nLwSuoH8kSr2ufFlwTLRNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Rx9J7IKl; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1745317187;
	bh=c4z1sB6OeKlyJmA+PFzyJ68O5M5fppZkHmyXCAllGaY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Rx9J7IKlI6ysRhonm3BRa9dEI421V7qJGwpCmU+iMqyE/uaoxpM41hFBFnM6FymBZ
	 dN/3zVOefKeU+AKomn+I94kga0L8Dh8Sc74/BLRs+qwXIJH14zyxi2j8qdgNpUh+iW
	 6DbeV++J/cm+fzpChXIOcKczfu3tl2BCpPrmJhFI=
X-QQ-mid: zesmtpip3t1745317146t25d683aa
X-QQ-Originating-IP: cPdLxHsjcwUj+B/L9//t5P69bxfZ2goFPnBcw7Ee+XQ=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 22 Apr 2025 18:19:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2928040559611630836
EX-QQ-RecipientCnt: 8
From: WangYuli <wangyuli@uniontech.com>
To: tsbogend@alpha.franken.de,
	macro@orcam.me.uk
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH v2 0/6] MIPS: Resolve build problems on decstation_64
Date: Tue, 22 Apr 2025 18:18:55 +0800
Message-ID: <24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OFSY/93ODYnHRpIjh5XlspOd9KxnWNGQ811MH+Vbvl0dBs7q+jUkvmDM
	7b8QXMURysVJibB230gIfg/uBwNezcMacKf7FdPk8ZoP/hXl2OzdppPPX4myB7ukRGMpWO2
	A87HKc5aKN/IuL9+6+jP48p/jmFG5eVZAvsnj/CH5N61XhHpXBlIGtbxZi6Y5tz4jOmFeG3
	MFeK55sSKu7kracjzQm9PKa6CcAm18U/el+wdND20AvcsdeCgHFxLxfWCYC0n3aCOejN4Hi
	KELHtGvT7df2gOJWxgoHwlXtWDzp+q/++vZvdNoTR+mW1keBV7aCBuO9qqyN+1CV/F93a7r
	J9e7xpBqVA2iscZG5p0331UUFfxNjhNgFnpYtjBC9OLNU/fCbL0ZxjsiDNdJ8/RyNr9MF85
	6N0XG5jE9Q/q/iLelGTvGlJg9DeImU1BQ09U8nC/l93WKpXRTGfJA+FIioFE07ZRTiLasrJ
	aZUhpK7oogr5XVWY54thbakOASL/+fLEVUuHu/P9gKmfwwGaWlgxFTQrOdv0qocJuxn535/
	POJ+dKESuza/sUWy4RXTVGta9+UjiWk1mzaw8SAF0Xlvat0R8aLPiSW6piRloWco+KDAo71
	1VD4xPfyvGMJpTgGeHbjMdAj2RmdboxoQFWTlp8E2BxeCnS4wrrvOZ3iaA7LvJiliTr5RC5
	4tF2JxBHjoC8mLVjo1jhDMHTKaP/1tmkCsmHCMsPJE9DZ0uXc7SYQoN1+jcfdTMl3RW/z7G
	C/I9AbdVN/HUIUmJ1mP+RpQaHG/XY7DPFzjDv+PIu3u6r1K2Yz8HGq2SCDXYZMfy03tstlE
	p47mvHvyYaPPKSfoIH90X1CKDmPV90L+QwJD/1C4v0qzgLXp8ricUd47wdG9j0xxtOa2Bot
	Ch9HwvAoSUuZf0MgIl0l/wyRBITY/T73g05s1r7hDkiO6+rqPJsnwt9fRIFnOIbh5aWs/pj
	UOTo2bavHItbZ/O4X3R4YF2pf67YSmkf196sk753RFFtg0TIyJKan2m/nU7Ev0n+juBEJIn
	him1PfpwIYcGsS/Zcr9xFVxJrxPggdcfmG7rK6Qck0xNbExcSd
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

[ Part 1 ]: MIPS: dec: Only check -msym32 when need compiler

During 'make modules_install', the need-compiler variable becomes
null, so Makefile.compiler isn't included.
    
This results in call cc-option-yn returning nothing.
    
For more technical details on why need-compiler is null during
'make modules_install' and why no compiler invocation is actually
needed at this point, please refer to commit 4fe4a6374c4d ("MIPS:
Only fiddle with CHECKFLAGS if need-compiler") and commit
805b2e1d427a ("kbuild: include Makefile.compiler only when compiler
is needed").
    
Commit a79a404e6c22 ("MIPS: Fix CONFIG_CPU_DADDI_WORKAROUNDS
`modules_install' regression") tried to fix the same issue but it
caused a compile error on clang compiler because it doesn't support
'-msym32'. Then, commit 18ca63a2e23c ("MIPS: Probe toolchain support
of -msym32") fixed it but reintroduced the CONFIG_CPU_DADDI_WORKAROUNDS
`modules_install' regression.

Wrapping this entire code block with #ifdef need-compiler to avoid
all issues is the best solution for now.
    
To get rid of spurious "CONFIG_CPU_DADDI_WORKAROUNDS unsupported
without -msym32" error.

Moreover, I also identified an unnecessary check for KBUILD_SYM32
in this Makefile section. Eliminate it for code simplification.

NOTE:

It is particularly important to note that this code fix does not
imply that we have resolved the problem entirely.

In fact, the entire application of cc-option and its auxiliary
commands within the kernel codebase currently carries significant
risk.

When we execute make modules_install, the Makefile for the
corresponding architecture under arch/subarches/Makefile is
invariably included. Within these files, there are numerous
usages of cc-option and its auxiliary commands, all of which will
return empty strings. The reason other architectures can
successfully complete compilation under these circumstances is
purely because they do not, unlike MIPS, check the return values
of cc-option and its auxiliary commands within their Makefiles
and halt the compilation process when the expected results are
not received.

A feasible approach to remediation might be to encapsulate all
usages of cc-option and its auxiliary commands within conditional
statements across all architecture Makefiles, preventing their
execution entirely during make modules_install.

However, this would lead to a massive number of inelegant
modifications, and these broader implications may require
deliberation by Masahiro Yamada.

Regardless, this does not preclude us from addressing the
issue on MIPS first.

Link: https://lore.kernel.org/all/41107E6D3A125047+20250211135616.1807966-1-wangyuli@uniontech.com/
Link: https://lore.kernel.org/all/F49F5EE9975F29EA+20250214094758.172055-1-wangyuli@uniontech.com/
Link: https://lore.kernel.org/all/8ABBF323414AEF93+20250217142541.48149-1-wangyuli@uniontech.com/


[ Part 2 ]: MIPS: decstation_64_defconfig: Compile the kernel with warnings as errors

Patch ("MIPS: dec: Only check -msym32 when need compiler") allows
us to compile kernel image packages with decstation_64_defconfig.

However, compilation warnings remain during the build.

Address these warnings and enable CONFIG_WERROR for decstation_64_defconfig.

Link: https://lore.kernel.org/all/487CE8AA937621E2+20250218125101.663980-1-wangyuli@uniontech.com/
Link: https://lore.kernel.org/all/EA0AFB15DDCF65C1+20250227141949.1129536-1-wangyuli@uniontech.com/
Link: https://lore.kernel.org/all/303EFD6BFBDAC7C8+20250305033436.31214-1-wangyuli@uniontech.com/


[ Changelog: ]

 *v1->v2: Add Philippe Mathieu-Daudé's "Reviewed-by" tag in patch3.
Link: https://lore.kernel.org/all/11740B01E659CAFF+20250407073158.493183-1-wangyuli@uniontech.com/
Link: https://lore.kernel.org/all/8dcb5c6d-be4f-4891-a999-137d53edfc05@linaro.org/

WangYuli (6):
  MIPS: dec: Only check -msym32 when need compiler
  MIPS: Eliminate Redundant KBUILD_SYM32 Checks
  MIPS: dec: Create reset.h
  MIPS: dec: Remove dec_irq_dispatch()
  MIPS: decstation_64_defconfig: Update configs dependencies
  MIPS: decstation_64_defconfig: Compile the kernel with warnings as
    errors

 arch/mips/Makefile                        |  6 ++--
 arch/mips/configs/decstation_64_defconfig | 43 +++++++++--------------
 arch/mips/dec/int-handler.S               |  2 +-
 arch/mips/dec/prom/init.c                 |  3 +-
 arch/mips/dec/reset.c                     |  2 ++
 arch/mips/dec/setup.c                     | 15 ++------
 arch/mips/include/asm/dec/reset.h         | 20 +++++++++++
 7 files changed, 47 insertions(+), 44 deletions(-)
 create mode 100644 arch/mips/include/asm/dec/reset.h

-- 
2.49.0


