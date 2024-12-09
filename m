Return-Path: <linux-mips+bounces-6901-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B23EC9E9AB1
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2024 16:38:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F33F188505A
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2024 15:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3A81C5CAA;
	Mon,  9 Dec 2024 15:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="G9SZiWJQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EE51B423A;
	Mon,  9 Dec 2024 15:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733758734; cv=none; b=FWJgpc5HKnBd7N9WvlstaK22O9BX6Rr417jwaZyoosyDLSduopsUIPy1HRPWadD0KMwC8QcEUYq52XaMbQUsy+ZJtqcsFHca+BKRxYgK+gE/XErMbjpLqCvgwMoAyCZWwgXNac8vJknY0Bs479eNYiyRbtkAn24N9V9Vgeyv4KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733758734; c=relaxed/simple;
	bh=2fBphBX0TIcxS5iblaNI0FgWUtDA5yJMmXfTTZieBRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kJXG/WtgMyJ7U2UDucjYHQTZdLYl/UKdX3YYuiZkxkmsx47YrNWEOT48PVpNUCWxwY8bZR/wBwtVetxCwXTImJofzdluyeaSG5uFnIo63ZTBzSKlWukixY0clwo+p8ZcHKP4rk/MBCrF00ecj/VM6iFoE/+Kvcaots5B/ujsiz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=G9SZiWJQ; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1733758722;
	bh=iAOAkMiO4SRacaa2x+Nj6OP1bJtTb5Hn1Km48pUkT7E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=G9SZiWJQSn0/jMJZ8NaV9MP/o0uZPM3cXDXROn/4IhD/9CwF3YocS8MakbshIGRzX
	 eEflr/J6uvNMKBRi60sKRg7MElmAlx9nFtMl+uQelhy5ICIeeq0FLe2dE+j5PLR1eN
	 aQ7lIQrPCJn4p11gusg0ycL90IOsd3Uin+Qh2NL4=
X-QQ-mid: bizesmtpip4t1733758689teobikr
X-QQ-Originating-IP: gyn7voqvIKIcZ1WypjoRdeOxF75stvQWjBdsUS2ifvU=
Received: from avenger-OMEN-by-HP-Gaming-Lapto ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 09 Dec 2024 23:38:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15283495430922043025
From: WangYuli <wangyuli@uniontech.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	tsbogend@alpha.franken.de
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	xzhong86@163.com,
	wuzhangjin@gmail.com,
	srostedt@redhat.com,
	linux-mips@linux-mips.org,
	ralf@duck.linux-mips.net,
	jeffbai@aosc.io,
	zhanjun@uniontech.com,
	guanwentao@uniontech.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH] MIPS: ftrace: Declare ftrace_get_parent_ra_addr() as static
Date: Mon,  9 Dec 2024 23:37:58 +0800
Message-ID: <6BF18D3A13FA470E+20241209153758.118977-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MDqtQ4jGWXAGrekepqUwqDTXYkoXWUmg5a/e6oB79Rb/HbIhPXab8JE2
	cQpN9YuUUU4ELSre1kVtsqPKpvDXBm9FAKyV046xZeRONZQbFIqp/sKyMCSY+OEr/aF+Th4
	f5xDGfPr7dmYyqvi1BLyJ/kh5/xDUBnlJR9G+XoJ694xdmH58c9kxsXNQeoc1V+tePEG/My
	LZoLe17pm0QXOOuZVV820qoIsm0P0SLjSboo/E63G249OhKxpPnMzTqCKefKeYJZ0Dsu9+m
	PRgTGDdF3yST8Xfge3IXywtI72Q464DYX8M5QWz/axpLzSLOHYOFE+J5doakeyUKGYye3cB
	ctQ6neVYiRqPkCh+DFj0wSUYiwDvDwmG3IIcrQEpLM6hMZ5ilZx0DnrS8Hryl9lCYdvqSkk
	3YGfAzYrNDWxDa73jm7Vjmi6SzMBR9Ooy171/mwfX4lojvpBpWFPQuQc0/HIQbgFHZFXunH
	q2gA1EsF9UUrJSjz17SZ+yXcJhX51pZS/tSGp4MrK/205f6um+V1kQ+pQnNvGjvBjfH14nu
	1cpDRe5Wx0vlcDzI5zFMz1CKeToRMd7pMYvIf2JyV/HAQOmz9u2kBK8qIAXiWHnu8BG8sao
	rnvMZ0v3iAILKF6gkCiTBMGeVTXrItNH7DgYAqyej2aF/vmliewcX5A2B/Ic3DSfRgcN6aF
	4CUFlWWCyt7oJghPGC9WiYEKINKup9cCgndq3gbBMVkV7kiBX8Rf55vWm13vAssWK9yqR9z
	FRfq50D2neVyCPqRZ69oJ57u3D6I2EadXnM/IW+Y/Zl59ifLJ9BxP6miSS33OQxK3d+Ukpf
	zgPVFrjfILEWjjSLIWAA9guxyS6Z2384LffCNhAFrHmeW/tIZIR4AGmrNaM9ySQsclYiJte
	ZjuRXw8HrUBA+wQrcH1Uv1p4S+TL+ZGil7VSfY1VCczlUqJuJI/HEoIGqk1WA/xuN0hpup+
	1weaKRkWDTwYf5iBLb3WVRXP4s/S4jNIPHePKWdCI68pt+8HUh/8++duCbNH8mFyHPzg=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

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
2.45.2


