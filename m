Return-Path: <linux-mips+bounces-7764-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E93A35ACC
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2025 10:49:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98FDB16B9CD
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2025 09:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2D2245029;
	Fri, 14 Feb 2025 09:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="VGWfD1X2"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2EE253B46;
	Fri, 14 Feb 2025 09:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739526536; cv=none; b=O078vjHXt4KxtpSmphS2xeFC5aNtWF038FVlrUjb9VkzCu3ng5vSeMMVrrZcTOcyjsvhQwA2H6uLpt+l8O+yMy0XJK+vizDaUeJzUPa6GbjIk1u8KJKPrTYFrNo5Lm/u/K2k3resgI3EuUioEk+DLti7JXKQ6Ikb0nDC9g2enCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739526536; c=relaxed/simple;
	bh=O/8DIOSl5f/Y31KM1037Yj7JP2uqjIWVBVFxogazJiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RrUqcPxMncwjJycLAnV8kLCvW6WNoDYw7xXRT+uvuwRabWGwMJ/wQ8DwHZryc53qGfNQjXuDAj4D52gHUQummLKFIQIqj9t8vDJfkZiPeN8bbHXrwzIt22QM4L0I3Mlmnc7VWuE38YJe+RiXn+IbQelqrny+QfexX7pc0K4AWRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=VGWfD1X2; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739526496;
	bh=NAnqMvpz3CgMXnHWGFEBjzdavwVkEzeTJ0xJecoflYw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=VGWfD1X2NFjRTxsb3x5d2n94r2fkvs1BY9rvVS8O+9ASPXtQVkVH51//ZKVlV9OD8
	 bX0L+I7uho62jqadSSrWvVkXWv62+KERXT0JLqU9Z93cGXQEHr3uMUcUrNT7lGyL/o
	 d9+ENqqOPcJDKAOMPWGYwtxTuY+UG5ZXhYorv4NA=
X-QQ-mid: bizesmtpip2t1739526484tw7hc1n
X-QQ-Originating-IP: hzoQEaX1BdaUZ8Hg3TePiaMBVM3pnsJ+6yBRy4x28Y8=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 14 Feb 2025 17:48:02 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14775040142801817448
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
Subject: [PATCH v2 0/2] MIPS: dec: Only check -msym32 when need compiler
Date: Fri, 14 Feb 2025 17:47:58 +0800
Message-ID: <F49F5EE9975F29EA+20250214094758.172055-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N3iD438OGJ7hGK0NaeWMxyTtblKV6UJcTJWX9vlLcuuX1tsrenCVk5Vu
	gzgUk3pHxm96e5H+kbqXU6MTEoq0TwV/UMyENawIVovmIWaZdfOXxAw+O6h26SxQ0LeJlsD
	63bvwzuziNd0rjhAsrK84uelaiELd9qeLQ5Y3l5AVpGJyNNhZnGVU2BVPkybhLxgqffraoQ
	NAWJ4kgKgYo5BBdHXceJH8QazgkZcW7lUY6LBxK81VCRRPwWhE8qpM/hyVTz2hoBj+BeeRa
	ANN/AhYikjiZap8h0MzhAch8yV1lUZfZLDKLvqJgK7YEpBwuT3lEMlDqJhzU2hIG1asrUuU
	k31A97N845cS2gu8WtM/DxqKDmAnjfitAirBMYVxFL05QRY03/t96Wbd7AZeT5FrlXZ3kfe
	2uaUO9jyHiyj+SbYlbbCuj3i2MkPK15ttQPiVZdQwbWmLsSo/Q6+aa+ezblqqvg832gCsRn
	H3bQtYm5o6NjxEQ7N5tMv/LjLut2NMXG3yCAEn+XR2U2Dy8fDGz+N+xWfbkUatbC/wZrhi4
	X6IeZ2VS9ekO+Do3qNgXS8eBQyPHZzCpTs56bJg3B8YtNXqFYTSiBg4nlOW+2qDNyPE1pwj
	VMXALEru0clfuvGzSfJG1vmi4XQzmUudJz+bzUmHS5OUGe2FvNKY/Iohtk0dbqLzeZ/Vxzz
	ZyKMsRrTc1KEjoc+niSFAZLLy2msdsyMeZK3+Ilw1FabSm7pQwc1ePxLuytcEV4qU5lyEmh
	66xu/5nha3n+xy5XC+OiQtx9zxzo4vcUSvns5kPOg6LroKBlmmZYvQu8kmIAFcl97jCVAyN
	T/aQ/jCLwUcvMmNd34K/UemEcywZ/CcgChatxLOHCifEvpgi2zPjpqXDd2GggtbMzfMBq1s
	VHANzq/WNtvGhgaNsulhTkBorUjptBiwIbOSkM3ur6H+IIBx7imE0zv6gNp8o6LrwS127Ru
	mwHHg1lpylAYVBJnfPN6zRcxgozQ96TOSV4YSVS+hJUAYx7QoMfUAvkyYKGPyhamZSWxrzu
	MnvCJ/pOXwcY64fH5aVd29NEgiu8KXdiDMLab3J7JmCjis3RsCQ2EbA7eHPNA=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

During make modules_install, the need-compiler variable becomes null,
so Makefile.compiler isn't included.
    
This results in call cc-option-yn returning nothing.
    
To get rid of spurious "CONFIG_CPU_DADDI_WORKAROUNDS unsupported
without -msym32" error, just wrap it into `ifdef need-compiler'.

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

WangYuli (2):
  MIPS: dec: Only check -msym32 when need compiler
  MIPS: Eliminate Redundant KBUILD_SYM32 Checks

 arch/mips/Makefile | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
---
Changelog:
 *v1->v2:
    1). Correct semantic errors.
    2). Adopted a revised fix: Using a check for need-compiler
in place of KBUILD_SYM32 check.
    3). Swap the order of the changes in v1.

-- 
2.47.2


