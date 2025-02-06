Return-Path: <linux-mips+bounces-7705-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1EBA2A5C6
	for <lists+linux-mips@lfdr.de>; Thu,  6 Feb 2025 11:27:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02B013A67A7
	for <lists+linux-mips@lfdr.de>; Thu,  6 Feb 2025 10:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0C4226881;
	Thu,  6 Feb 2025 10:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="dmumk0CX"
X-Original-To: linux-mips@vger.kernel.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.65.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ABF226553;
	Thu,  6 Feb 2025 10:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.65.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738837645; cv=none; b=Ok3rQiepy+YWPfcxVQCLbxkCk0GUkRfr6ZLmWOIPF6JwoUAThpHTPxdNbMIsOCuE3BVR10KcFgNNEO1XaRskdQhojaA+/ITbWtJ1XO4OEY8GtxNhAspq2c1esFBZDFa5pjLZIS/TPLmYziIrch4+AJx0unlh6Evl2tajS4t07xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738837645; c=relaxed/simple;
	bh=ty4Eujbi3JXutVV8JchgtpSnzXyS57fNPP7x8fwv3Cc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Elccwfj5ewuui8SUHiXhvwUYUCJBW5rJ/JWA890MSOvKgC/F3IkLXBV6xEYUogWI7LHbKua2mj6kA+J9rZ2lyuZxZCweFOCPVRKEFfg8J+mFwX7gKWsmjKZS4B9P+mlZpDWxO82YPqUJJETBTuT9o+O8I1TbNKni1ZjA2Hk3seM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=dmumk0CX; arc=none smtp.client-ip=114.132.65.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1738837566;
	bh=flV33qDbCktrhjYaUTG2DPPSAd2dWkCXdepsMeSnBJ8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=dmumk0CX8WGpa/Z82vdJ4IRu6Bf7eY4i+16r2YCJBPPqdHz1KUOPLZ6THwMWcWKfY
	 oH34pGfYJAaJNC7xXJXIdhROnHnwvlDTn1iCL3vf+y1Fd3J/ngG/wQX+U918uuD9rO
	 xuZfXNBYRvnegedfhl08AkhXr86RkexYGqzET4SM=
X-QQ-mid: bizesmtpip4t1738837559tgprquo
X-QQ-Originating-IP: YmVy3874EstnoparGauVHa6MhyYnp0d0n3DAgaqWRRQ=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 06 Feb 2025 18:25:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5688250677626398646
From: WangYuli <wangyuli@uniontech.com>
To: gregkh@linuxfoundation.org,
	sashal@kernel.org,
	stable@vger.kernel.org
Cc: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	tsbogend@alpha.franken.de,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	WangYuli <wangyuli@uniontech.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5.4~6.13] MIPS: ftrace: Declare ftrace_get_parent_ra_addr() as static
Date: Thu,  6 Feb 2025 18:25:48 +0800
Message-ID: <6832B20AFE3B7328+20250206102548.95302-1-wangyuli@uniontech.com>
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
X-QQ-XMAILINFO: M135ko5REW2alb6372CGYhiZ+aMCzPVWw0sIl38J0eO6ryeBc6Ks962c
	0j2G+sdqngN6dk/kIK+VYDL0hE737vMoAwUC2TGPKF28HN0ZRzBcfbBeuoIo1vjHJkQVT1h
	ckRfpkFEV1s/Q7YSJKan95K+MpbjGv14ldicVHVv6kCy+gmqKYBbUeNX/vHL8lge0OQGfL/
	eeIVG5dXGx8VkKoOTOFbaZvRPvz2g9IGH36jyGwxs6oFDtRKWT91zPVbhom+c1ro4TggioN
	zzsn6/Hpm1Oc0LTW93MQ4f+iWQaAbagtE4erK1pYClcN99TFZswge9mSTKLYbWlZcHiYIIP
	Asp0TPl6450JJgK16aFAUdogcrt8Awsq68Tagz/gjQL003dSkfw4qhJv+b9rGtK3MDhtbsc
	VYuoruhLA7OHRjdVy9mtGEjr2GWGXa9JNsXtYV/bpEE/K/cjA7mWKA4PJAwBy614IzE6mtT
	RRJE1a22a92e9dChwO+UaXJOTDk214L5BhGPRt9ijlZ6urypd6Aqm3m+9SAL5rTnrIviEP6
	ejCw5wPE8UoHXOC8bunnN5jN+cUFzCTxQhqMMBvjiv64BEt9DA1uul+1zKz6uGefvmGysFS
	Yhkexjloyj7OWXIft06NlctVwtVqqg7nkLQk2acpO5Xi0P3Xfc2fukPGJg0AJTrmzPOYSng
	9Iy5iYQkKPJzUx2+jh0rR3j38Gr+n7Y66F0xxn4838QMk3OOCtKpS+j1IN4ocZx+LOQ6Hmp
	1F43Iup9vyzeJRYj9vEjCrvH0NaUlB4f2RHKk1S+dOoanKA58GLrIGhBrCqANOi02s2RH/7
	3Cv1e3MMeq0r/UYPwL07NAa8dC0FJFhk70mLSMFdtegU0Ia493oLHUBFBKIqOjqwEeIRaSV
	crV5yWGeUEj+LSzgqs6nuE3VM9eHGnyTZmwaCt/sQ1WOrFTvsk3/N+mPom4BmJnXWYQditU
	Dn2yYcUIMQh3FhwQFc8jQ3ca6w8u1eBhBDZcfbfQrDk4OzA5dV0F1HlPYDdV+3wJvkKspI6
	z/syDtYQ==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

commit ddd068d81445b17ac0bed084dfeb9e58b4df3ddd upstream.

Declare ftrace_get_parent_ra_addr() as static to suppress clang
compiler warning that 'no previous prototype'. This function is
not intended to be called from other parts.

Fix follow error with clang-19:

arch/mips/kernel/ftrace.c:251:15: error: no previous prototype for function 'ftrace_get_parent_ra_addr' [-Werror,-Wmissing-prototypes]
  251 | unsigned long ftrace_get_parent_ra_addr(unsigned long self_ra, unsigned long
      |               ^
arch/mips/kernel/ftrace.c:251:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
  251 | unsigned long ftrace_get_parent_ra_addr(unsigned long self_ra, unsigned long
      | ^
      | static
1 error generated.

Signed-off-by: WangYuli <wangyuli@uniontech.com>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/kernel/ftrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/ftrace.c b/arch/mips/kernel/ftrace.c
index 8c401e42301c..f39e85fd58fa 100644
--- a/arch/mips/kernel/ftrace.c
+++ b/arch/mips/kernel/ftrace.c
@@ -248,7 +248,7 @@ int ftrace_disable_ftrace_graph_caller(void)
 #define S_R_SP	(0xafb0 << 16)	/* s{d,w} R, offset(sp) */
 #define OFFSET_MASK	0xffff	/* stack offset range: 0 ~ PT_SIZE */
 
-unsigned long ftrace_get_parent_ra_addr(unsigned long self_ra, unsigned long
+static unsigned long ftrace_get_parent_ra_addr(unsigned long self_ra, unsigned long
 		old_parent_ra, unsigned long parent_ra_addr, unsigned long fp)
 {
 	unsigned long sp, ip, tmp;
-- 
2.47.2


