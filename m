Return-Path: <linux-mips+bounces-7250-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E6DA0155F
	for <lists+linux-mips@lfdr.de>; Sat,  4 Jan 2025 15:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFB781636A2
	for <lists+linux-mips@lfdr.de>; Sat,  4 Jan 2025 14:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D5C1C2443;
	Sat,  4 Jan 2025 14:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="EPh59IeQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE331BD9F5;
	Sat,  4 Jan 2025 14:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736002181; cv=none; b=LCT5zNHHrdVBgRABHtX+zrcWrIfX7Ranha8mZPlO1VVkweTFCXWNBsCMs0N9CsNsqfK8fucsSIEnrKvfyMlsHoQQgdlSai/x0HRdN03EJpWVqcQrHtFwPr6NQFmQ82RCEGlnE2MEBsv15H2ejymJ2uRtMIqKXTZgF1r+oiaOVmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736002181; c=relaxed/simple;
	bh=2fBphBX0TIcxS5iblaNI0FgWUtDA5yJMmXfTTZieBRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VcCiwLHFzo1nxwyDWtN5SWzqMTS4cKSPQcpLJ+x0ySagno8P9WxLAjtOsTEtAbEds9hqevI5mXyF9CYAA0C1mhnpkHoY6wyla3S/cj5xWGh8jxxtDWwwGTrhA5vdrZhVILx3RZzZp8cBK8DOnkBwSCmNwuRQCxka8EzOh1zefT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=EPh59IeQ; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1736002086;
	bh=iAOAkMiO4SRacaa2x+Nj6OP1bJtTb5Hn1Km48pUkT7E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=EPh59IeQSyYLtI9/Cab4spzy/T3MXoKLpgtmWOwtCLVyrrLClrpPTlyeZRpymQH3W
	 YGAT5HJ7kWZ7injuVkurbp7lFtPM89ffrRng3A56H2WAWKfc5h630IFvb7Ez44pGao
	 vzICa3DnWzvaYGCAf9J/4t+H7x1RZLxHDEB7QDjo=
X-QQ-mid: bizesmtpip4t1736002077t8namh8
X-QQ-Originating-IP: KLKi+9qElgNN2QO7jYq/UrvZTI9vm93xFZXgkXN4SU4=
Received: from avenger-OMEN-by-HP-Gaming-Lapto ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 04 Jan 2025 22:47:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15018661501707165866
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
	jiaxun.yang@flygoat.com,
	gregory.clement@bootlin.com,
	philmd@linaro.org,
	tglx@linutronix.de,
	rppt@kernel.org,
	WangYuli <wangyuli@uniontech.com>
Subject: [RESEND PATCH] MIPS: ftrace: Declare ftrace_get_parent_ra_addr() as static
Date: Sat,  4 Jan 2025 22:47:08 +0800
Message-ID: <527F9AFF0430AB45+20250104144708.18438-1-wangyuli@uniontech.com>
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
X-QQ-XMAILINFO: NIwSWoOzd4nQFYjYaQ51jiGPyQJ2HLPkwFRys4swC/x3eAQ5CiODiZxi
	ZXUJq8Rp5PpothGTkRyrTVq70KJLTzZWwX3QY81PgcXiZ6IDGny2gGsgu/j+p0pOErRMoMI
	iEo8BbYsWehq5nLnER9g9iK8rG4mqO8rFU999x2FOyAVvoUrChVBDv/8S3feD/TAA+7xoxU
	w4krtFAj8WHf8+C8bvjV5Vmuy5k9GOyXiDiMBogJ0XIJtt34PkbGyn+0GWSqDqoy4h+PHYn
	ZLjO7AyINAURod2G+OZY7hlW2bfh5TosRt9mB1yVsyeIou5q/QXQTt6J1lsGgbPFoNwEIme
	Q+08FA+t8l7q05+yr+Gcuo5p+RxXFUzM+Wp8hScX0rKvlNYMSVz8VJJDJkDl4NKeHDpknvv
	Rwue8ZRDO11r94JpRcOgeId8yifHbT9GMNBo8C+NCIUgyL5DqYogKnf9QjBlGMQjk4URXuG
	782VGnf1Eis7N7xKeS/f0U6f9oioKPDWnGgRDKY7l18v52JnBVlfFzsmkgulMwxDox79TiW
	h4lK5veJscJRMAM/njGE7rGZ5IHnagFmWpXtN+y68ukviRXrPNql+a/WnkC9tZdXIEYHw6U
	v0BjLzsDfQxfyAUEu5Hhl4ElFGw4JlpFnJPOHGNtufJW0KjaLynWMX+KMD6YM1yne/xzhCD
	PVYsPjFGZdfy2R11c5mCgmrN0x/VwMLhuuS+pwZWf+gLygha/lhGxNH27QeIjk1PRG2jnQ9
	bqC+lfA6U3v0H5puCX8FkqXbvd9/f5cfJ6aPcEgO0gJHGUPQeuTaa5GV45twXtWQcDpe/6s
	qZl+lRzg/NFirbGW3oc+KjI7jTjw0sk2D05KTSvJvKpxd1Ze/mZ9H6tC+6USDFC4kR7W0M0
	+m9ITECKXH7+SwmiqajMo6cUo+ZBXRyHbQsmbTPg0L2i2ON+uoD1SNddj0hV7gaDyrVpbbU
	3H1x+bhl9gpMQypqnCQ3h++BdkPgKwgHxj3qVWXE5E8+g+1gkXloPkrVzW+0Fa7lQX7qQi0
	/Uwzy1exKeKiqzZDZPtk3ktSDEIvUMvVCpI+xxrg==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
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


