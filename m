Return-Path: <linux-mips+bounces-15213-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aq2qEBBrPmoCFwkAu9opvQ
	(envelope-from <linux-mips+bounces-15213-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 14:05:36 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C7C6CCC7D
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 14:05:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15213-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15213-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 87E323063F9D
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 11:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56EB3F44CA;
	Fri, 26 Jun 2026 11:57:00 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CDB3F210A;
	Fri, 26 Jun 2026 11:56:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782475020; cv=none; b=hoOUjUe6GT8/PY+ZMpugkkZ67ljF9/lq+auK0bdvqebfm4RaI+zIrswK2CkEHhoHmqku3DX8F3EcUnWKS4V1fkRIvkmAusJAYvyJWGobvigKCexqMfoHf6/fdHbdA4uCYXeC75iOyf95ScM7cvz9kqdz2HUY7E5EAK8GD4Gn7lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782475020; c=relaxed/simple;
	bh=Z96Ba0wqRtrYIjh8bYu2gYtWrIIAUb1M9JX4wiGp52s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pTF0vAQCXdj9WFtaxQe0LXyIPxVIhV4iXk2F5woWJXKpsbCn3WMHgr+bkd7Ul2zWB7iDH6a9GEGRuB92s8r1kCiMf35VF4hGTB7tAJiK0qRFgX5euDgP6rDtJMG3D0uU0lzj8dUMTuShttpW8lVvyIgxm+S8jIwqxC9aOuyjCjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Received: from localhost.localdomain (unknown [117.182.75.66])
	by APP-05 (Coremail) with SMTP id zQCowABHntEBaT5qs+JmFQ--.42353S2;
	Fri, 26 Jun 2026 19:56:50 +0800 (CST)
From: WenTao Liang <vulab@iscas.ac.cn>
To: paul@crapouillou.net,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: bmasney@redhat.com,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WenTao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] fix: clk/ingenic: ingenic_register_clock: clk_register_clkdev failure   leaks registered clock
Date: Fri, 26 Jun 2026 19:56:44 +0800
Message-Id: <20260626115644.33779-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABHntEBaT5qs+JmFQ--.42353S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XrWUuw4kWr45Zw4xZw4UXFb_yoWDZFX_Kr
	W0qryIgFn8Kr4a9w1UAF1Fv3sYkFnrur1fWFWUtasxA34UZrs5uryjv3Z7AryUWFWF9a4q
	qryUWr4kur17ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_Jw0_
	GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoWlkDUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwwKA2o+TTtTMgAAsB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15213-lists,linux-mips=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[vulab@iscas.ac.cn,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:paul@crapouillou.net,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-mips@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vulab@iscas.ac.cn,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vulab@iscas.ac.cn,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,iscas.ac.cn:email,iscas.ac.cn:mid,iscas.ac.cn:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32C7C6CCC7D

clk_register() succeeds but clk_register_clkdev() fails, and the error
  path jumps to out without calling clk_unregister or clk_put to release
  the registered clock. This leaks the clock object within the common clock
  framework, contrasting with the CGU_CLK_EXT type path which correctly
  calls clk_put on error.

Cc: stable@vger.kernel.org
Fixes: b066303fb3e7 ("clk: ingenic: add driver for Ingenic SoC CGU clocks")
Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>
---
 drivers/clk/ingenic/cgu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index 41e4c69131bd..b59b24d0e3cf 100644
--- a/drivers/clk/ingenic/cgu.c
+++ b/drivers/clk/ingenic/cgu.c
@@ -774,8 +774,10 @@ static int ingenic_register_clock(struct ingenic_cgu *cgu, unsigned idx)
 	}
 
 	err = clk_register_clkdev(clk, clk_info->name, NULL);
-	if (err)
+	if (err) {
+		clk_unregister(clk);
 		goto out;
+	}
 
 	cgu->clocks.clks[idx] = clk;
 out:
-- 
2.39.5 (Apple Git-154)


