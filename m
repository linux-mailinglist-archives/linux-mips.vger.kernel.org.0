Return-Path: <linux-mips+bounces-8502-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8665A7D63A
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 09:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5EC5173793
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 07:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E245229B38;
	Mon,  7 Apr 2025 07:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Qw8UL5/v"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DEC22578F;
	Mon,  7 Apr 2025 07:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744011194; cv=none; b=dUQjrcyA7yFHQti1T6XGyfh+FM+46EWRHhdP5/KmKaPXr6/4a5GLe/NQfBnA7stSu14DN/vcWC05qYCmtlqz5GnGtC+9tK9vl5WuIMOAH1Bqc7Ef7YtTiq2J4Wjrjt42q9lqMAkig7xyAhvmmGQ1fV2ubyX2xOSIQ7o8Yuj8ofA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744011194; c=relaxed/simple;
	bh=fCY1+la4eQvFvDRvh93ct8JfkxtSVtpRbuKhVwoB5xg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HxsErbjYteGo/Wqzmll8hh3k6fc3swDG3wpEaPp2AbJ+SU89AQqhQ/8Q+qapj8wZ3qWLKq0ReI1h0QRsQ4rMmYeqUd3oJSoqKHml44CoIYV0ZrVpaXV3XW8KmqUD2W4rL4G2slY/V74G/XuJ7hae2Yu0YATMm4zroARh7nhKEW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Qw8UL5/v; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744011168;
	bh=ujXS0FgueD86zddeDAdyWMT2cBug04ILGQlsCY9hmYg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Qw8UL5/vxBrC/IlmlpF0suld3kCwm7DCUWT2BR6/nem9JeXZFQb+B8Yl7v4ZTemRe
	 rYQvGFbPy7hwzJpZe3KafQoDbjetnpsAwFh7MzmNGz0pfCUkIp2wKBLG8kROLfQXYi
	 r8HCvYEAHXCBkcS4v0S5blW57pHosPHYHzKA0vYo=
X-QQ-mid: bizesmtpip2t1744011126ti91xe0
X-QQ-Originating-IP: MZU5Kp0oUCxzzZmM9WIay6KjBEOsm/+aTXBPuVZzFOI=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Apr 2025 15:32:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13693046250538745828
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
Subject: [PATCH 0/6] MIPS: Resolve build problems on decstation_64
Date: Mon,  7 Apr 2025 15:31:58 +0800
Message-ID: <11740B01E659CAFF+20250407073158.493183-1-wangyuli@uniontech.com>
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
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OMHTpzRlrft8NzrkuFzwtWj3efd/j67oudXDFU5oPVc8RmR1GN5Fq0mx
	N3+OjBRJ9DXcnh3KtS6/O0Da2agC//oCBANnRAmyZNx7q4+AxlclPDzBwibkfPp8rm+jADI
	DnmltuLBgA5GVm3DUerLbt83TM8G/DkYhWsXA0C/EQz9TreAo9IjAdnvjY4UK+6iXwulCf1
	e2Nd3dRoo8Tpe/bAvQ+pQ8PH8aJd6GmYXiaie5VRUoau95Oey3Cn9PKq2hCvlkj861CWUqY
	gl4cCpowz24oPjAL2Qo2IPmBOmV9ba47SJcuDd8cWCNP+tP50PqkDeFXlNq0ESe1IuFYaGs
	Vf11jM7J4A95pCEM5QWlCPPpUmI/+7CT7qJMLK6Du2k6ncvT9A5xnXTI++Le4QZNvaqU9EN
	S+J58zCBYhS/5yGbKKv0fS1hG/tRSG4cvjSx8HgWQu+eN4kgm8901V/6cDE8qXr27lKb9QI
	VugLC+vdDixrJTSh62TwUPB7rlAyOJMqqoxwJt9c1r93XWirOOe/6vv3ffoD6PKtKJBNAxU
	yWmOuNXP9BLcQ5MjIhGoUYa+Hhl/UrLZeyR6R5RoByyyiHtOsTuF1VTZ8jPQUS8J1LSKVmr
	heDuxlAOperDxqalbECmdwF6WDOPIobQKfe/u5hgvdWOcaoscVmt3TuvohH1HN5qSRrb0CL
	qZDTUzQeXlGGSKSnUVsRe7+SJTMbh8dNQ4h8ia/N9boVD+BnmBFpqvIZo1qp/KxVFSxbpfU
	1Nu03CXj2A4hlmZjxswXO9TgQyOKlk+e4P/K99BKXD1L6pIejbje11IP3QXdobBSwpaOlmq
	tEdg6N2+iIGIyz8GGHftS2OutZaOBlnYMWfJNHQJdyVYgt6glQPBckM/xkeYCREaBYEBi4l
	kiGsV3nOoskg5WPkfSLkiqD5tUKvOLTlVux6gRKUTobpAJ16FpDagGSSZrlxrSx7JTAURrh
	Y4Fn2YviYAJuHJsD++Oe8HBtfh0/xjSERgmIsMoM54JiS2ZQvcqWVKjGsXLLXPl7CHrE=
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


