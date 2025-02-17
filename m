Return-Path: <linux-mips+bounces-7794-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CAEA3864E
	for <lists+linux-mips@lfdr.de>; Mon, 17 Feb 2025 15:28:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92318188345D
	for <lists+linux-mips@lfdr.de>; Mon, 17 Feb 2025 14:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9AB921CA00;
	Mon, 17 Feb 2025 14:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="K1XeG3K3"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87452179BC;
	Mon, 17 Feb 2025 14:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739802410; cv=none; b=Vx/xzJ4/WzjEdQrWzdypuPAWY0dqhE/U0RKV3O57fjCZvtTNf9CIUs0AgIhhZzPexHVaO5wQUlQuRY4+tiw1oSBb+YNCwtEGNx3iFZlC3QSZOUZCI5WzO94OvQG5PNFFWJ2/rmc75/A496k/qiN9Gatie3SHSQre4hoCfClxwdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739802410; c=relaxed/simple;
	bh=0jdRWZfMjJ9o8HTfWfu0CRWnmYJnx9HUXqf4MGIEdWc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dD79UknHRWu7JMJUTdG1r614i4Gqo4tJfrvVMqdeuPmI6jV1atjpMGc7x53K2EbSQZSAQOI6q/n3mks6E3qFgHcXi42FfRO0B90J7/hoQ8zekgNTqh5u+/Qzq9spQy+WBckl9wuXWb+pHLgXlF4h0Yg0XnoUUaZyxPHtP2uU/iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=K1XeG3K3; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739802362;
	bh=REnARYrxDOSngSpHfdUz6sHKkiOENalg0HoRWGPAq30=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=K1XeG3K3M8cEQUpM6KKE986yGrUNr0yTrWCO67Xpl0e7JWcK/NZXXotKmyi1B1hEI
	 uBR3swb6Y5e5mWkQTIm6khFDlL6cnevkPZzSAI9c7A65sidQE7A7j05abnT9nFzq12
	 DkQgoJ5hwRtllmwmVMSLC2DSC5UUGy0gJSoMgHSI=
X-QQ-mid: bizesmtpip3t1739802349t4jlhfn
X-QQ-Originating-IP: Yt8/2h18GrwIvBBQY5sSejJFu2ZDkKpWNCGtPkOOMRQ=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 17 Feb 2025 22:25:47 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3477360017264247857
From: WangYuli <wangyuli@uniontech.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	macro@orcam.me.uk,
	masahiroy@kernel.org,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com,
	chenlinxuan@uniontech.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH v3 0/2] MIPS: dec: Only check -msym32 when need compiler
Date: Mon, 17 Feb 2025 22:25:41 +0800
Message-ID: <8ABBF323414AEF93+20250217142541.48149-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
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
X-QQ-XMAILINFO: OAj1qrjhA85AAjmwes1HF7KTeM0EW5wviUUuyH+0qhTat01X+S5+zQQ9
	6iSV7PUu3SGLaCq0pVsAiBINjbLJ5RuVmsBjXI+wzlriTzwn9fBU/VNWeeHdRJF21KdI81x
	sKHfWecBjl3LTEkNEgctcs+UsmQmX21J0UCeYpW2NecOpzwLkrtCRA5TRarnDNgsqIxmFek
	+kHS9fMkwHrTVncyUadtK/kt73KngNyhfs0EEvp7AHVyuulzLn1dr0FWfvNmGGAPqvqRoOJ
	UURTVNzq5ta7GHfqKUtsoh/rGYCXn2d+sAtiA2wz2dEBX2T3kKpU2+aNc2x4ug6mjjvXHep
	/qK3wQuje9irjOstBmw6rP2FX2nZE4NiDgYm9I6/S0AO35Wj3qwW+8wyhvrtRXdpn5CXA9j
	y8N9lRNpfpAHGXVW1YTkJS7oQGs3D4JkXS6Zd2P5ScZ005trdb4Uh24Erv3BWM79i2qlC6O
	u/busKD+TyYnhcp2LWWC9s1+0iVMP9Ue+WkeQBnaN0y1PjZ7lXh/U4vycFvwIqB9nodR8RQ
	KabAwsLxhkflSN3nBGvzQ8vTLkvhc2BsPrzvHY7burux8EUIDLRvkuYIY59TRcBLqaVvmeA
	1NB4IyN8A4CJqQqKeL9gw0rvHlKCXEAhQ3jRO50UPtiSi0a/ILH4M1SeoNIxN9XKViNVH5m
	FP8YJGg4wRpmVpGJ0a6WlNprusp40nIU/p/CiAUXAasZu3S+6L43yaj1e7t6f2T+cyeHk3w
	JGnDXruRlUdFPXwtZEWcJKRU7GdJuT659ot25o7x6TB2U8nyVKCZicbqehEIajsEVUmQKuB
	mdc7Ogm+5miFNmaXo40j9byiXorpV3zK2DnqJelXLlPLO2NfgBBi8BDb6Y2BGm0lJeepY3Q
	xiilM7aaPplNnLIRvJjRkbVJN7/5br/3Ge39erXIUXGotLiQf84vISs/4IV1lRib0hM8KSE
	ndyaD+v3Yryur6qtlet5JChQY6ILeyVZmcPu3wluQ/jt6Hb+iDJLvWRmZisoVRUWM9Y6gHs
	yG9ygAy+ZjVyqN8eBulDSw2/KOADAH7AB5qafsfgs9lvYASUrhnOxcVDkXoC8=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

During 'make modules_install', the need-compiler variable becomes
null, so Makefile.compiler isn't included.
    
This results in call cc-option-yn returning nothing.
    
For more technical details on why need-compiler is null during
‘make modules_install’ and why no compiler invocation is actually
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

WangYuli (2):
  MIPS: dec: Only check -msym32 when need compiler
  MIPS: Eliminate Redundant KBUILD_SYM32 Checks

 arch/mips/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
---
Changelog:
 *v1->v2:
    1). Correct semantic errors.
    2). Adopted a revised fix: Using a check for need-compiler
in place of KBUILD_SYM32 check.
    3). Swap the order of the changes in v1.
  v2->v3:
    Per Maciej's suggestion, expanded the commit message with
more information and removed the code comment.

-- 
2.47.2


