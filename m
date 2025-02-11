Return-Path: <linux-mips+bounces-7723-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D338A30D73
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2025 14:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C91C718892B4
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2025 13:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93A424C663;
	Tue, 11 Feb 2025 13:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="WtM57xM+"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CA323099C;
	Tue, 11 Feb 2025 13:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282260; cv=none; b=BK7OH9cKR3u3gKMgiT0OvxlPSssI3uBRl0Wg/6u3zE7jExBxLPqxHDv+BACj7o9LC2uae/BmdTH/fBe+AsaKIPVE37FqtFk+ef7lHMbnXW4PuQRTBRPFHrlcgt6xdUWigpWogDXoh/olfhqyKbTD9sYX0h3TLYtob05fA6bN7SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282260; c=relaxed/simple;
	bh=XnACgguGEi7l2F/dWtns8iHU9CdKd5Rbri/Os+TWzuE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rmALtIR0MWRns5Z4uYfHXBSln7C7dgIgPXblW+T90O4QrEd0MH7RxYsarfM6VJgnucCAdPdZtFPYZySpafQx02lcEU1GztQy6y/wo57Z1Ux0GWUUUYDYGV/DSFMgw6EkJTHXHaVYbAUnUBq9ohiVM46dMAeKzGJQsLEWaZghT+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=WtM57xM+; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739282194;
	bh=MOQCraMni4cLE1auXuOnn748f2GO/MU4imVh9/6YM1A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=WtM57xM+S873o5QSDorJ4alNrM8tMSW1tFzPZSyVQuFYzWYIarJX+a5nN6VpnrBDo
	 dkAbwjk+sycF2N4Id5aKIHbnMomtVsAgUfY66IgiirlL+BLjq5QJ8DGaYqbw2LfBr5
	 iUqQPeyrQtM4lamEXm2YBSa4Njk+qFkPgFjzSMS8=
X-QQ-mid: bizesmtpip2t1739282184t243xhs
X-QQ-Originating-IP: npKmLwuEa8p5dg5WWLccJs9AiidgISrmzEcpd0HuIow=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 11 Feb 2025 21:56:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15678477366880975103
From: WangYuli <wangyuli@uniontech.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	macro@orcam.me.uk,
	masahiroy@kernel.org,
	jiaxun.yang@flygoat.com,
	zhanjun@uniontech.com,
	guanwentao@uniontech.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH 0/2] MIPS: Explicitly check KBUILD_SYM32=n
Date: Tue, 11 Feb 2025 21:56:16 +0800
Message-ID: <41107E6D3A125047+20250211135616.1807966-1-wangyuli@uniontech.com>
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
X-QQ-XMAILINFO: MABkn+BX1UZ4G3K0qeU6agR7N6YNCQFxFCQmfLXDozDQwWlVwnZBXNre
	brH5Z3/Gxmkxz7d5sUMfOHtYSR/XRv7oT85z0CtDfUUJ8PFshzkh36MfCYHuV9rLRiNNXCI
	GWDhgemMqTzbGq0hW69qZQkpZtBoOqVkzlpKZECOsjXJhDRI7K2tQQVcRKv3YKC80kv+grh
	X3TlUXG/pgMBJp4b0NGbrO6QyfvYAsjZs4+hxmohTNdzv6EnMAH89881PQjOrpuwB8Juqr7
	Nxf0Mp48oWzrNjOoBGc8BCTSpAgImzSEZulMBIZ7LC4B61FrPYz1c9/DK0MObhpNSIAVp9B
	miotA3ZNnusRWLoYWU0zslW/pjWvKfEr/TEHy41Kcx+UBibATpSCfH0bcRwGxs9FxeNRAdb
	Misti0kkLEUj4Esl4dN+OXpUXjcOgXyHGcdm91mTbYYo6hTwWM5EZplsZbFIeGAvt6C0o35
	IGC6+mhnWDYwGeFrqiksIL1IQpeMZu5Ey3lOAQdEnp/IBAXGY17yVNUpUZbJ+s67uuFFKUd
	g1mWDWQeXSOiGmMYobo/x1oBrHd2NQhy761ufPD778OkqeCx+yvqmazGxhQ0gCUgkKNZaTn
	f8OsXC7CFgX3DZZC3REXZ2gChKQGg/Ka68yjPKeyasytlthh06p+kjbCnoLBFHXaQjA5zNY
	W2GnoCl29jFEUb8DCd8XD3zwbsGnJmrgGJO3/SiWylLBHO5bdeEaiu5XEXnqLG57sfL+YVb
	qr9hJy//+y3OuaT8crTjclc6/upPzSnOiEJbEDP38AVRIRg7Dk4HYH2NSM186Et5iPbGPD0
	VmMjLM9j3HfpacOYWdbKXhJ6A+rqEXaOIKRKeFkK0idtFjGT+0ZZWhNztdSIJQVhvoDQw2X
	ADYTNU7vCTqHmO2caPvDYZt4JOW8Rid9K69DlnNHFWSv8ht/wYy/jFt6dykZNA9p7ORtnSL
	GfkzDLSlDVIjFjO6v1JPi9Q4nyVmJMXuS5qvmFaOjXX+jfnXSEgTGMFHC
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

During make module_install, the need_compiler variable becomes 0,
so Makefile.compiler isn't included.
    
This results in call cc-option-yn returning nothing.
    
Add a check for KBUILD_SYM32=n to avoid the
"CONFIG_CPU_DADDI_WORKAROUNDS unsupported without -msym32" error
when KBUILD_SYM32 is unset (meaning it's not 'y' or 'n').

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

WangYuli (2):
  MIPS: Eliminate Redundant KBUILD_SYM32 Checks
  MIPS: Explicitly check KBUILD_SYM32=n

 arch/mips/Makefile | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.47.2


